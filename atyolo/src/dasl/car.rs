//! CAR (archive format): https://dasl.ing/car.html

pub use bumpalo::Bump;
use std::{collections::HashSet, io};

pub use super::Result;
use super::{
    cid::{self, CID},
    dcbor42::{self, Value},
    utils::{self, dec_leb128},
    DaslError,
};

pub type Version = u64;

#[derive(Clone, Copy, Debug)]
pub struct Header<'a> {
    pub version: Version,
    pub roots: &'a [&'a CID],
}

/// Each block has a payload, either a raw blob, or a DCBOR42 value.
#[derive(Clone, Copy, Debug)]
pub enum BlockData<'a> {
    Raw(&'a [u8]),
    DCBOR42(Value<'a>),
}

/// Used during encoding
enum BlockDataMaybeEncoded<'a, 'b> {
    Data(&'b BlockData<'a>),
    Encoded(&'b [u8]),
}

/// A block. A CAR is a list of blocks alongside roots.
///
/// Each block describes a node in the global content-addressed DAG.
#[derive(Clone, Copy, Debug)]
pub struct Block<'a> {
    pub cid: &'a CID,
    pub data: BlockData<'a>,
}

#[derive(Clone, Debug)]
pub struct CAR<'a> {
    pub header: Header<'a>,
    pub blocks: &'a [Block<'a>],

    /// Prevent from building from the outside
    _marker: (),
}

macro_rules! fail {
    ($msg:expr) => {
        return Err(DaslError::InvalidCAR($msg))
    };
}

fn decode_header<'a>(alloc: &'a Bump, v: Value<'a>) -> Result<Header<'a>> {
    let Some(map) = v.as_map() else {
        fail!("Header must be a map")
    };

    let Some(version) = map
        .iter()
        .find(|kv| kv.0 == "version")
        .map(|kv| &kv.1)
        .and_then(|v| v.as_positive())
    else {
        fail!("Expected an integer version field")
    };

    if version != 1 {
        fail!("Expected version to be 1");
    }

    let Some(root_values) = map
        .iter()
        .find(|kv| kv.0 == "roots")
        .map(|kv| &kv.1)
        .and_then(|v| v.as_array())
    else {
        fail!("Expected an array of roots")
    };

    // allocate result
    let roots = utils::alloc_slice(alloc, root_values.len(), &cid::DUMMY)?;
    for (i, v) in root_values.iter().enumerate() {
        let Some(cid) = v.as_cid() else {
            fail!("roots must contain CIDs");
        };
        roots[i] = cid
    }

    Ok(Header { version, roots })
}

/// Decode a CAR from a byte slice
pub fn decode_slice<'a>(alloc: &'a Bump, s: &'_ [u8]) -> Result<CAR<'a>> {
    let mut offset: usize = 0;

    // read header
    let header = {
        let len = dec_leb128(s, &mut offset)
            .ok_or_else(|| DaslError::InvalidCAR("Cannot parse header"))?
            as usize;

        let v = dcbor42::decode(alloc, &s[offset..offset + len])?;
        offset = offset + len;
        decode_header(alloc, v)?
    };

    // read blocks
    let mut local_blocks: Vec<Block<'a>> = vec![];
    while offset < s.len() {
        let mut len = dec_leb128(s, &mut offset)
            .ok_or_else(|| DaslError::InvalidCAR("Cannot parse block header"))?
            as usize;

        dbg!(offset, len);
        let (cid, n_bytes) = CID::parse_binary_partial(&s[offset..])?;
        dbg!(&cid, n_bytes);
        if len < n_bytes {
            fail!("Block length is shorter than CID length")
        }
        offset += n_bytes;
        len -= n_bytes;

        // move `cid` to allocator
        let cid: &'a CID = alloc.alloc(cid);

        let data: BlockData<'a> = match cid.codec {
            cid::Codec::Raw => {
                let data = utils::alloc_slice_copy(alloc, &s[offset..offset + len])?;
                BlockData::Raw(data)
            }
            cid::Codec::DCBOR42 => {
                let v = dcbor42::decode(alloc, &s[offset..offset + len])?;
                BlockData::DCBOR42(v)
            }
        };

        local_blocks.push(Block { cid, data });
        offset += len;
    }

    // now allocate the result in `alloc`
    let blocks = utils::alloc_slice_copy(alloc, &local_blocks)?;
    Ok(CAR {
        header,
        blocks,
        _marker: (),
    })
}

pub struct CARWriter<W: io::Write> {
    w: W,
    buf: Vec<u8>,
    header_written: bool,
}

/// write len as LEB128
fn write_len_leb128_<W: io::Write>(w: &mut W, len: usize) -> io::Result<()> {
    let mut len_buf = [0u8; 10];
    let n = utils::enc_leb128(len as u64, &mut len_buf);
    w.write_all(&len_buf[0..n])
}

impl<W: io::Write> CARWriter<W> {
    /// New CAR writer, will output into `w`.
    pub fn new(w: W) -> Self {
        Self {
            w,
            buf: vec![],
            header_written: false,
        }
    }

    /// Write the header. This must be called first, exactly once.
    ///
    /// Blocks cannot be written before this is called. `roots` _should_ be
    /// non-empty.
    pub fn write_header(&mut self, roots: &[&CID]) -> Result<()> {
        assert!(!self.header_written);

        let roots: Vec<_> = roots.iter().map(|cid| Value::CID(cid)).collect();

        let fields = [
            ("version", Value::Positive(1)),
            ("roots", Value::Array(&roots)),
        ];
        let v = Value::Map(&fields);

        self.buf.clear();
        dcbor42::encode(&v, &mut self.buf)?;
        write_len_leb128_(&mut self.w, self.buf.len())?;
        self.w.write_all(&self.buf)?;

        self.header_written = true;
        self.buf.clear();

        Ok(())
    }

    /// Write a raw data block.
    ///
    /// The header must have been written already.
    fn write_block_(&mut self, cid: &CID, data: BlockDataMaybeEncoded) -> Result<()> {
        assert!(self.header_written);
        self.buf.clear();

        let cid_data = cid.encode_to_binary();
        self.buf.extend_from_slice(&cid_data);
        match data {
            BlockDataMaybeEncoded::Data(BlockData::Raw(data)) => self.buf.extend_from_slice(data),
            BlockDataMaybeEncoded::Data(BlockData::DCBOR42(v)) => {
                dcbor42::encode(&v, &mut self.buf)?
            }
            BlockDataMaybeEncoded::Encoded(s) => self.buf.extend_from_slice(s),
        }

        // write length, then CID+data
        write_len_leb128_(&mut self.w, self.buf.len())?;
        self.w.write_all(&self.buf)?;
        self.buf.clear();

        Ok(())
    }

    /// Write a raw data block.
    ///
    /// The header must have been written already.
    pub fn write_block(&mut self, cid: &CID, data: &BlockData) -> Result<()> {
        self.write_block_(cid, BlockDataMaybeEncoded::Data(data))
    }

    /// Write a value, computing its CID first.
    pub fn write_block_value(&mut self, alloc: &Bump, v: &Value) -> Result<()> {
        self.buf.clear();

        dcbor42::encode(v, &mut self.buf)?;
        let data = utils::alloc_slice_copy(alloc, &self.buf)?;
        let cid = CID::new_compute_hash(cid::Codec::DCBOR42, data)?;
        self.buf.clear();

        self.write_block_(&cid, BlockDataMaybeEncoded::Encoded(data))
    }
}

/// Encode into an IO writer.
pub fn write_car<'a, W>(w: W, car: &CAR) -> Result<()>
where
    W: io::Write,
{
    let mut w = CARWriter::new(w);

    debug_assert_eq!(1, car.header.version);
    w.write_header(car.header.roots)?;

    // blocks that have been encoded already
    let mut encoded = HashSet::new();
    for block in car.blocks {
        if encoded.contains(block.cid) {
            continue;
        }
        encoded.insert(block.cid);
        w.write_block(block.cid, &block.data)?
    }

    Ok(())
}

impl<'a> From<&'a [u8]> for BlockData<'a> {
    fn from(value: &'a [u8]) -> Self {
        BlockData::Raw(value)
    }
}

impl<'a> From<Value<'a>> for BlockData<'a> {
    fn from(value: Value<'a>) -> Self {
        BlockData::DCBOR42(value)
    }
}

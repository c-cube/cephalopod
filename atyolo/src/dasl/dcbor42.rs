//! dag-CBOR, or dCBOR42.
//!
//! We use the definition from dasl.ing [1], but it coincides with
//! the ATproto definition [2].
//!
//! [1]: https://dasl.ing/dcbor42.html
//! [2]: https://atproto.com/specs/data-model

use std::alloc::Layout;

use super::{cid::CID, errors::Result, DaslError};
pub use bumpalo::Bump;
use ciborium_ll::{Decoder as CDecoder, Header as CHeader};

/// A dCBOR42 value.
#[derive(Clone, PartialEq, Eq, Debug)]
pub enum Value<'a> {
    Null,
    Bool(bool),
    Positive(u64),
    Negative(u64),
    CID(CID<'a>),
    Text(&'a str),
    Bytes(&'a [u8]),
    Array(&'a [Value<'a>]),
    Map(&'a [(&'a str, Value<'a>)]),
}

const MAX_DEPTH: usize = 24;
const MAX_STRING_SIZE: usize = 256 * 1024;
const MAX_BLOB_SIZE: usize = 256 * 1024;
const MAX_ARRAY_SIZE: usize = 10_000;
const MAX_MAP_SIZE: usize = 10_000;

#[inline(always)]
fn alloc_slice<'a, T>(alloc: &'a Bump, len: usize, fill: T) -> Result<&'a mut [T]>
where
    T: Clone,
{
    use std::ptr;
    let ptr: ptr::NonNull<T> = alloc
        .try_alloc_layout(Layout::array::<T>(len).unwrap())?
        .cast();
    unsafe {
        for i in 0..len {
            ptr::write(ptr.as_ptr().add(i), fill.clone());
        }
        let buf = std::slice::from_raw_parts_mut(ptr.as_ptr(), len);
        Ok(buf)
    }
}

/// Parse a DCBOR42 value from bytes.
pub fn decode<'a>(alloc: &'a Bump, bytes: &[u8]) -> Result<Value<'a>> {
    let mut dec = CDecoder::from(bytes);

    macro_rules! fail {
        ($msg:expr) => {
            return Err(DaslError::InvalidDCBOR42($msg))
        };
    }

    macro_rules! read_segment {
        ($alloc:expr, $len:expr, $segments:expr) => {{
            let mut buf: &mut [u8] = alloc_slice($alloc, $len, 0u8)?;

            match $segments
                .pull()
                .map_err(|_| DaslError::InvalidDCBOR42("Expected text segment"))?
            {
                _ if $len == 0 => (),
                None => fail!("Missing bytes data"),

                Some(mut seg) => {
                    // must be reading in one go
                    let Some(_chunk) = seg
                        .pull(&mut buf)
                        .map_err(|_| DaslError::InvalidDCBOR42("Missing data"))?
                    else {
                        fail!("Missing bytes data")
                    };
                    if _chunk.len() != $len {
                        fail!("dCBOR42 does not support streams")
                    }
                }
            };
            buf
        }};
    }

    // read recursively, with some limits for stack safety.
    fn read_rec<'a>(alloc: &'a Bump, dec: &mut CDecoder<&[u8]>, depth: usize) -> Result<Value<'a>> {
        if depth > MAX_DEPTH {
            fail!("Recursion limit exceeded")
        }
        let v = match dec
            .pull()
            .map_err(|_| DaslError::InvalidDCBOR42("missing value"))?
        {
            CHeader::Positive(i) => Value::Positive(i),
            CHeader::Negative(i) => Value::Negative(i),
            CHeader::Simple(s) => {
                use ciborium_ll::simple::*;
                if s == NULL {
                    Value::Null
                } else if s == TRUE {
                    Value::Bool(true)
                } else if s == FALSE {
                    Value::Bool(false)
                } else {
                    fail!("dCBOR42 does not support simple values")
                }
            }
            CHeader::Float(_) => fail!("dCBOR42 does not support floats"),
            CHeader::Tag(42) => {
                if let Value::Bytes(s) = read_rec(alloc, dec, depth + 1)? {
                    let cid = CID::parse_binary(s)?;
                    Value::CID(cid)
                } else {
                    fail!("Tag 42 must be followed by a binary CID")
                }
            }
            CHeader::Tag(_) => fail!("dCBOR42 does not support simple values"),
            CHeader::Text(None)
            | CHeader::Array(None)
            | CHeader::Map(None)
            | CHeader::Bytes(None)
            | CHeader::Break => fail!("dCBOR42 does not support streams"),
            CHeader::Text(Some(len)) => {
                if len > MAX_STRING_SIZE {
                    fail!("Maximum string size exceeded")
                }

                let mut segments = dec.text(Some(len));
                let buf = read_segment!(alloc, len, segments);
                Value::Text(
                    std::str::from_utf8(buf)
                        .map_err(|_| DaslError::InvalidDCBOR42("Expected actual UTF8"))?,
                )
            }
            CHeader::Bytes(Some(len)) => {
                if len > MAX_BLOB_SIZE {
                    fail!("Maximum blob size exceeded")
                }

                let mut segments = dec.bytes(Some(len));
                let buf = read_segment!(alloc, len, segments);
                Value::Bytes(buf)
            }
            CHeader::Array(Some(len)) => {
                if len > MAX_ARRAY_SIZE {
                    fail!("Maximum array size exceeded")
                }

                let arr = alloc_slice(alloc, len, Value::Null)?;
                for i in 0..len {
                    arr[i] = read_rec(alloc, dec, depth + 1)?
                }
                Value::Array(arr)
            }
            CHeader::Map(Some(len)) => {
                if len > MAX_MAP_SIZE {
                    fail!("Maximum map size exceeded")
                }

                let arr = alloc_slice(alloc, len, ("", Value::Null))?;
                for i in 0..len {
                    let Value::Text(k) = read_rec(alloc, dec, depth + 1)? else {
                        fail!("Map keys must be strings");
                    };
                    let v = read_rec(alloc, dec, depth + 1)?;
                    arr[i] = (k, v)
                }
                Value::Map(arr)
            }
        };
        Ok(v)
    }

    read_rec(alloc, &mut dec, 0)
}

/// Custom encoder that writes into a vec, but only up to a certain size.
struct Enc<'a> {
    v: &'a mut Vec<u8>,
    max_size: usize,
}

impl<'a> ciborium_io::Write for Enc<'a> {
    type Error = DaslError;

    fn write_all(&mut self, data: &[u8]) -> std::result::Result<(), Self::Error> {
        if data.len() + self.v.len() > self.max_size {
            return Err(DaslError::DCBOR42EncodingError("Maximum size exceeded"));
        }

        self.v.reserve(data.len());
        self.v.extend_from_slice(data);
        Ok(())
    }

    fn flush(&mut self) -> std::result::Result<(), Self::Error> {
        Ok(())
    }
}

const MAX_ENCODING_SIZE: usize = 1 * 1024 * 1024;

/// Encode into a vector of bytes.
pub fn encode(v: &Value, into: &mut Vec<u8>) -> Result<()> {
    use ciborium_ll::{simple as csimple, Header as CHeader};
    let myenc = Enc {
        v: into,
        max_size: MAX_ENCODING_SIZE,
    };
    let mut enc = ciborium_ll::Encoder::from(myenc);

    fn encode_rec(enc: &mut ciborium_ll::Encoder<Enc<'_>>, v: &Value, depth: usize) -> Result<()> {
        if depth > MAX_DEPTH {
            return Err(DaslError::DCBOR42EncodingError("Max depth exceeded"));
        }
        match v {
            Value::Null => enc.push(CHeader::Simple(csimple::NULL))?,
            Value::Bool(true) => enc.push(CHeader::Simple(csimple::TRUE))?,
            Value::Bool(false) => enc.push(CHeader::Simple(csimple::FALSE))?,
            Value::Positive(i) => enc.push(CHeader::Positive(*i))?,
            Value::Negative(i) => enc.push(CHeader::Negative(*i))?,
            Value::CID(cid) => {
                enc.push(CHeader::Tag(42))?;
                let cid_bytes = cid.encode_to_binary();
                enc.bytes(&cid_bytes, None)?;
            }
            Value::Text(str) => enc.text(str, None)?,
            Value::Bytes(b) => enc.bytes(b, None)?,
            Value::Array(a) => {
                enc.push(CHeader::Array(Some(a.len())))?;
                for x in *a {
                    encode_rec(enc, x, depth + 1)?
                }
            }
            Value::Map(m) => {
                enc.push(CHeader::Map(Some(m.len())))?;
                for (k, v) in *m {
                    enc.text(k, None)?;
                    encode_rec(enc, v, depth + 1)?
                }
            }
        };
        Ok(())
    }

    encode_rec(&mut enc, v, 0)?;
    Ok(())
}

// TODO: to json, from json

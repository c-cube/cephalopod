use std::io;

use crate::utils;

use super::{
    cid::{self, CID},
    dcbor42,
    errors::Result,
};
pub use bumpalo::Bump;

/// A dCBOR42 value.
#[derive(Clone, Copy, PartialEq, Eq, Debug)]
pub enum Value<'a> {
    Null,
    Bool(bool),
    Positive(u64),
    Negative(u64),
    CID(&'a CID),
    Text(&'a str),
    Bytes(&'a [u8]),
    Array(&'a [Value<'a>]),
    Map(&'a [(&'a str, Value<'a>)]),
}

/// Special kind of map: a blob, representing some media file stored separately.
#[derive(Debug, Clone)]
pub struct Blob<'a> {
    /// The CID of the stored object (codec: raw).
    ref_: CID,
    /// Mime type of the stored object.
    mime_type: &'a str,
    /// Size of data in bytes.
    size: u64,
}

macro_rules! as_case {
    ($name:ident, $cstor:path, $ret:ty) => {
        #[inline(always)]
        pub fn $name(&self) -> Option<$ret> {
            match self {
                $cstor(x) => Some(x),
                _ => None,
            }
        }
    };

    ($name:ident, deref, $cstor:path, $ret:ty) => {
        #[inline(always)]
        pub fn $name(&self) -> Option<$ret> {
            match self {
                $cstor(x) => Some(*x),
                _ => None,
            }
        }
    };
}

impl<'a> Value<'a> {
    as_case!(as_map, Value::Map, &'a [(&'a str, Value<'a>)]);
    as_case!(as_array, Value::Array, &'a [Value<'a>]);
    as_case!(as_cid, Value::CID, &'a CID);
    as_case!(as_text, Value::Text, &'a str);
    as_case!(as_bytes, Value::Bytes, &'a [u8]);
    as_case!(as_positive, deref, Value::Positive, u64);
    as_case!(as_negagive, deref, Value::Negative, u64);
    as_case!(as_bool, deref, Value::Bool, bool);

    /// Read a blob from this value.
    pub fn as_blob(&self) -> Option<Blob<'a>> {
        match self {
            Value::Map(m) => {
                let ref_ = m
                    .iter()
                    .find(|kv| kv.0 == "ref")
                    .and_then(|kv| kv.1.as_cid())?
                    .clone();
                let mime_type = m
                    .iter()
                    .find(|kv| kv.0 == "mimeType")
                    .and_then(|kv| kv.1.as_text())?;
                let size = m
                    .iter()
                    .find(|kv| kv.0 == "size")
                    .and_then(|kv| kv.1.as_positive())?
                    .clone();
                Some(Blob {
                    ref_,
                    mime_type,
                    size,
                })
            }
            _ => None,
        }
    }

    /// Parse a DCBOR42 value from bytes.
    #[inline(always)]
    pub fn decode_dcbor42(alloc: &'a Bump, bytes: &[u8]) -> Result<Value<'a>> {
        dcbor42::decode(alloc, bytes)
    }

    /// Encode into a writer.
    #[inline(always)]
    pub fn encode_dcbor42<W>(&self, w: &mut W) -> Result<()>
    where
        W: io::Write,
    {
        dcbor42::encode(self, w)
    }

    /// Compute the CID. `buf` is used for temporary encoding, and will be cleared.
    pub fn compute_cid<'b>(&'_ self, buf: &mut Vec<u8>) -> Result<CID> {
        buf.clear();
        dcbor42::encode(self, buf)?;
        let cid_res = CID::new_compute_hash(cid::Codec::DCBOR42, &buf);
        buf.clear();
        cid_res
    }

    /// Turn value into JSON.
    ///
    /// See <https://atproto.com/specs/data-model> for more details.
    #[inline(always)]
    pub fn to_json(&self) -> Result<serde_json::Value> {
        dcbor42::to_json_rec(self, 0)
    }

    /// Read value from its JSON encoding.
    ///
    /// **NOTE**: a loss of precision can occur on large numbers
    /// (larger than around 2^53) because JSON represents numbers as floats.
    #[inline(always)]
    pub fn from_json(alloc: &'a Bump, j: &serde_json::Value) -> Result<Value<'a>> {
        dcbor42::from_json_rec(alloc, j, 0)
    }
}

impl<'a> Blob<'a> {
    /// Export to a value.
    pub fn to_value<'res>(&'_ self, alloc: &'res Bump) -> Result<Value<'res>> {
        let mut pairs = vec![];
        pairs.push(("ref", Value::CID(alloc.try_alloc(self.ref_.clone())?)));
        pairs.push((
            "mimeType",
            Value::Text(utils::alloc_str(alloc, self.mime_type)?),
        ));
        pairs.push(("size", Value::Positive(self.size)));
        let map = utils::alloc_slice_copy(alloc, &pairs)?;
        Ok(Value::Map(map))
    }
}

/// Types encodable into our data model
pub trait Encodable<'a>: Sized + 'a {
    /// Encode to data
    fn encode<'res>(&'_ self, alloc: &'res Bump) -> crate::Result<crate::Value<'res>>;

    /// Decode a value.
    fn decode(alloc: &'a Bump, v: &Value) -> crate::Result<Self>;
}

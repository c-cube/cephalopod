use std::io;

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
    pub fn to_json(&self) -> Result<json::JsonValue> {
        dcbor42::to_json_rec(self, 0)
    }

    /// Read value from its JSON encoding.
    ///
    /// **NOTE**: a loss of precision can occur on large numbers
    /// (larger than around 2^53) because JSON represents numbers as floats.
    #[inline(always)]
    pub fn from_json(alloc: &'a Bump, j: &json::JsonValue) -> Result<Value<'a>> {
        dcbor42::from_json_rec(alloc, j, 0)
    }
}

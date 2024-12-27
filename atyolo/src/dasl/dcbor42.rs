//! dag-CBOR, or dCBOR42.
//!
//! We use the definition from dasl.ing [1], but it coincides with
//! the ATproto definition [2].
//!
//! [1]: https://dasl.ing/dcbor42.html
//! [2]: https://atproto.com/specs/data-model

use std::io;

use super::{
    cid::{self, CID},
    errors::Result,
    utils, DaslError,
};
use base64::Engine;
pub use bumpalo::Bump;
use ciborium_ll::{Decoder as CDecoder, Header as CHeader};

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

const MAX_DEPTH: usize = 24;
const MAX_STRING_SIZE: usize = 256 * 1024;
const MAX_BLOB_SIZE: usize = 256 * 1024;
const MAX_ARRAY_SIZE: usize = 10_000;
const MAX_MAP_SIZE: usize = 10_000;

macro_rules! fail {
    ($msg:expr) => {
        return Err(DaslError::InvalidDCBOR42($msg))
    };
}

fn decode<'a>(alloc: &'a Bump, bytes: &[u8]) -> Result<Value<'a>> {
    let mut dec = CDecoder::from(bytes);

    macro_rules! read_segment {
        ($alloc:expr, $len:expr, $segments:expr) => {{
            let mut buf: &mut [u8] = super::utils::alloc_slice($alloc, $len, 0u8)?;

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
                    dbg!(&s);
                    let cid = CID::parse_binary(s)?;
                    Value::CID(alloc.try_alloc(cid)?)
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

                let arr = utils::alloc_slice(alloc, len, Value::Null)?;
                for i in 0..len {
                    arr[i] = read_rec(alloc, dec, depth + 1)?
                }
                Value::Array(arr)
            }
            CHeader::Map(Some(len)) => {
                if len > MAX_MAP_SIZE {
                    fail!("Maximum map size exceeded")
                }

                let arr = utils::alloc_slice(alloc, len, ("", Value::Null))?;
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
struct Enc<'a, W: io::Write> {
    w: &'a mut W,
    written: usize,
    max_size: usize,
}

impl<'a, W: io::Write> ciborium_io::Write for Enc<'a, W> {
    type Error = DaslError;

    fn write_all(&mut self, data: &[u8]) -> std::result::Result<(), Self::Error> {
        if self.written + data.len() > self.max_size {
            return Err(DaslError::DCBOR42EncodingError("Maximum size exceeded"));
        }

        self.w.write_all(data)?;
        self.written += data.len();
        Ok(())
    }

    fn flush(&mut self) -> std::result::Result<(), Self::Error> {
        Ok(())
    }
}

const MAX_ENCODING_SIZE: usize = 1 * 1024 * 1024;

fn encode<W: io::Write>(v: &Value, w: &mut W) -> Result<()> {
    use ciborium_ll::{simple as csimple, Header as CHeader};
    let myenc = Enc {
        w,
        written: 0,
        max_size: MAX_ENCODING_SIZE,
    };
    let mut enc = ciborium_ll::Encoder::from(myenc);

    fn encode_rec<W: io::Write>(
        enc: &mut ciborium_ll::Encoder<Enc<'_, W>>,
        v: &Value,
        depth: usize,
    ) -> Result<()> {
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
    pub fn decode(alloc: &'a Bump, bytes: &[u8]) -> Result<Value<'a>> {
        decode(alloc, bytes)
    }

    /// Encode into a writer.
    #[inline(always)]
    pub fn encode<W>(&self, w: &mut W) -> Result<()>
    where
        W: io::Write,
    {
        encode(self, w)
    }

    /// Compute the CID. `buf` is used for temporary encoding, and will be cleared.
    pub fn compute_cid<'b>(&'_ self, buf: &mut Vec<u8>) -> Result<CID> {
        buf.clear();
        encode(self, buf)?;
        let cid_res = CID::new_compute_hash(cid::Codec::DCBOR42, &buf);
        buf.clear();
        cid_res
    }

    /// Turn value into JSON.
    ///
    /// See <https://atproto.com/specs/data-model> for more details.
    pub fn to_json(&self) -> Result<json::JsonValue> {
        use json::JsonValue as J;

        fn to_json_rec(v: &Value, depth: usize) -> Result<J> {
            if depth > MAX_DEPTH {
                fail!("Maximum depth exceeded")
            }

            let j = match v {
                Value::Null => json::Null,
                Value::Bool(b) => J::from(*b),
                Value::Positive(i) => J::from(*i),
                Value::Negative(i) => J::from(-((*i) as f64)),
                Value::CID(cid) => {
                    let mut j = J::new_object();
                    j.insert("$link", J::from(cid.encode_to_string())).unwrap();
                    j
                }
                Value::Text(str) => J::from(*str),
                Value::Bytes(bytes) => {
                    let bytes_b64 = base64::prelude::BASE64_STANDARD.encode(bytes);
                    let mut j = J::new_object();
                    j.insert("$bytes", J::from(bytes_b64)).unwrap();
                    j
                }
                Value::Array(arr) => {
                    let mut j = J::new_array();
                    for v in arr.iter() {
                        j.push(to_json_rec(v, depth + 1)?).map_err(|_| {
                            DaslError::InvalidDCBOR42("Cannot encode to JSON array")
                        })?;
                    }
                    J::from(j)
                }
                Value::Map(map) => {
                    let mut j = J::new_object();
                    for (k, v) in map.iter() {
                        j.insert(k, to_json_rec(v, depth + 1)?).map_err(|_| {
                            DaslError::InvalidDCBOR42("Cannot encode to JSON object")
                        })?;
                    }
                    J::from(j)
                }
            };
            Ok(j)
        }
        to_json_rec(self, 0)
    }

    pub fn from_json(alloc: &'a Bump, j: &json::JsonValue) -> Result<Value<'a>> {
        use Value as V;

        fn from_json_rec<'a>(
            alloc: &'a Bump,
            j: &json::JsonValue,
            depth: usize,
        ) -> Result<Value<'a>> {
            if depth > MAX_DEPTH {
                fail!("JSON value too deep for DCBOR42")
            }

            let v = match j {
                json::JsonValue::Null => V::Null,
                json::JsonValue::Short(short) => {
                    let str = short.as_str();
                    V::Text(utils::alloc_str(alloc, str)?)
                }
                json::JsonValue::String(str) => V::Text(utils::alloc_str(alloc, str)?),
                json::JsonValue::Number(number) => {
                    let i: f64 = Into::<f64>::into(*number);
                    if i >= 0. {
                        V::Positive(i as u64)
                    } else {
                        V::Negative((-i) as u64)
                    }
                }
                json::JsonValue::Boolean(b) => V::Bool(*b),
                json::JsonValue::Array(arr) => {
                    let slice = utils::alloc_slice(alloc, arr.len(), V::Null)?;
                    for (i, j) in arr.iter().enumerate() {
                        slice[i] = from_json_rec(alloc, j, depth + 1)?
                    }
                    V::Array(slice)
                }
                json::JsonValue::Object(map) => {
                    if let Some(v) = map.get("$link") {
                        let Some(str) = v.as_str() else {
                            fail!("$link must have a CID")
                        };
                        let cid = CID::parse_str(str)?;
                        V::CID(alloc.try_alloc(cid)?)
                    } else if let Some(v) = map.get("$bytes") {
                        let Some(str) = v.as_str() else {
                            fail!("$bytes must have a string")
                        };
                        let data = base64::prelude::BASE64_STANDARD.decode(str).map_err(|_| {
                            DaslError::InvalidDCBOR42(
                                "Expected $bytes to have a base64 string attached",
                            )
                        })?;
                        V::Bytes(utils::alloc_slice_copy(alloc, &data)?)
                    } else {
                        let slice = utils::alloc_slice(alloc, map.len(), ("", V::Null))?;
                        for (i, (k, v)) in map.iter().enumerate() {
                            let k = utils::alloc_str(alloc, k)?;
                            let v = from_json_rec(alloc, v, depth + 1)?;
                            slice[i] = (k, v)
                        }
                        V::Map(slice)
                    }
                }
            };
            Ok(v)
        }

        from_json_rec(alloc, j, 0)
    }
}

// TODO: to json, from json

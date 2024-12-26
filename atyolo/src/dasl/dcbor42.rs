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

const MAX_DEPTH: usize = 16;
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

pub fn parse<'a>(alloc: &'a Bump, bytes: &[u8]) -> Result<Value<'a>> {
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
                None if $len == 0 => (),
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

// TODO: to json, from json

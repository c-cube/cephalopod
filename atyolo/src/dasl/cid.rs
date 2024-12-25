//! https://dasl.ing/cid.html

use super::errors::{DaslError::ParseError, Result};
use std::borrow::Cow;

#[derive(Clone, Copy, Eq, PartialEq, Debug)]
pub enum Codec {
    Raw,
    DCBOR42,
}

/// A CID (content ID).
#[derive(Clone, Debug, Eq, PartialEq)]
pub struct CID<'a> {
    pub codec: Codec,
    pub hash: Cow<'a, [u8]>,
}

/// Decode LEB128, starting at `off`. Returns the result, and modifies `off`.
fn dec_leb128(s: &[u8], off: &mut usize) -> Option<u64> {
    let mut res: u64 = 0;

    loop {
        if *off >= s.len() {
            return None;
        }

        let c = s[*off];
        res = (res << 7) + (c & 0b0111_1111) as u64;

        *off += 1;
        if c & 0b1000_0000 == 0 {
            return Some(res);
        }
    }
}

macro_rules! fail {
    ($msg:expr) => {
        return Err(ParseError($msg))
    };
}

fn parse_binary_<'a>(s: &'a [u8]) -> Result<CID<'a>> {
    if s.len() < 3 {
        fail!("CID too short");
    };

    let version = s[0];
    if version != 1 {
        fail!("Expected version to be 1")
    }
    let codec = s[1];

    let codec = match codec {
        0x55 => Codec::Raw,
        0x71 => Codec::DCBOR42,
        _ => fail!("Invalid codec"),
    };
    let hash_type = s[2];
    if hash_type != 0x12 {
        fail!("Expected hash type to be SHA256");
    }

    let mut offset: usize = 3;
    let len =
        dec_leb128(s, &mut offset).ok_or_else(|| ParseError("Invalid LEB128 length"))? as usize;

    if len != 32 {
        fail!("Expected length to be 32 (for SHA256)")
    }
    if offset + len != s.len() {
        fail!("CID has the wrong length")
    }

    Ok(CID {
        codec,
        hash: Cow::from(&s[offset..offset + len]),
    })
}

/// Parse a binary CID
pub fn parse_binary<'a>(s: &'a [u8]) -> Result<CID<'a>> {
    if s.is_empty() || s[0] != 0 {
        fail!("CID is too short")
    }
    parse_binary_(&s[1..])
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_leb128() {
        {
            let mut off = 0;
            let b: &[u8] = &[17];
            assert_eq!(Some(17), dec_leb128(b, &mut off));
        }

        {
            let mut off = 0;
            let b: &[u8] = &[0x88, 0x85, 0x09];
            assert_eq!(Some((8 << (7 + 7)) + (5 << 7) + 9), dec_leb128(b, &mut off));
        }
    }

    #[test]
    fn test_decode_binary() {
        let fake_cid: &[u8] = &[
            0, 1, 0x55, 0x12, 32, /* fake sha256 */
            1, 1, 1, 1, 1, 1, 1, 1, /* */
            2, 2, 2, 2, 2, 2, 2, 2, /* */
            3, 3, 3, 3, 3, 3, 3, 3, /* */
            4, 4, 4, 4, 4, 4, 4, 4,
        ];

        let cid = parse_binary(fake_cid).unwrap();
        assert_eq!(
            CID {
                codec: Codec::Raw,
                hash: Cow::from(&[
                    1, 1, 1, 1, 1, 1, 1, 1, /* */
                    2, 2, 2, 2, 2, 2, 2, 2, /* */
                    3, 3, 3, 3, 3, 3, 3, 3, /* */
                    4, 4, 4, 4, 4, 4, 4, 4,
                ]),
            },
            cid
        );
    }
}

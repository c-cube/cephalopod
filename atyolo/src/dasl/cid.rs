//! https://dasl.ing/cid.html

use super::{
    errors::{DaslError::ParseError, Result},
    DaslError,
};
use core::str;
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

impl Codec {
    fn to_hex(self) -> u8 {
        match self {
            Codec::Raw => 0x55,
            Codec::DCBOR42 => 0x71,
        }
    }
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

macro_rules! parse_err {
    ($msg:expr) => {
        return Err(ParseError($msg))
    };
}

fn parse_binary_<'a>(s: &'a [u8]) -> Result<CID<'a>> {
    if s.len() < 3 {
        parse_err!("CID too short");
    };

    let version = s[0];
    if version != 1 {
        parse_err!("Expected version to be 1")
    }
    let codec = s[1];

    let codec = match codec {
        0x55 => Codec::Raw,
        0x71 => Codec::DCBOR42,
        _ => parse_err!("Invalid codec"),
    };
    let hash_type = s[2];
    if hash_type != 0x12 {
        parse_err!("Expected hash type to be SHA256");
    }

    let mut offset: usize = 3;
    let len =
        dec_leb128(s, &mut offset).ok_or_else(|| ParseError("Invalid LEB128 length"))? as usize;

    if len != 32 {
        parse_err!("Expected length to be 32 (for SHA256)")
    }
    if offset + len != s.len() {
        parse_err!("CID has the wrong length")
    }

    Ok(CID {
        codec,
        hash: Cow::from(&s[offset..offset + len]),
    })
}

const SIZE: usize = 32 + 4;

fn encode_binary(cid: &'_ CID, res: &mut [u8; SIZE]) {
    res[0] = 1;
    res[1] = cid.codec.to_hex();
    res[2] = 0x12; // hash
    debug_assert_eq!(32, cid.hash.len());
    res[3] = 32; // len=32 in LEB128
    res[4..].copy_from_slice(&cid.hash);
}

impl<'a> CID<'a> {
    pub fn to_owned(self) -> CID<'static> {
        let owned: Vec<u8> = self.hash.into_owned();
        CID {
            codec: self.codec,
            hash: Cow::Owned(owned),
        }
    }
    pub fn encode_to_binary(&'_ self, res: &mut Vec<u8>) {
        res.push(0);
        res.reserve(SIZE);
        let mut slice = [0u8; SIZE];
        encode_binary(self, &mut slice);
        res.extend_from_slice(&slice);
    }

    pub fn encode_to_string(&'a self) -> String {
        let mut res = String::new();
        res.push('b');
        let mut slice = [0u8; SIZE];
        encode_binary(self, &mut slice);
        let b32_res = base32::encode(base32::Alphabet::Rfc4648Lower { padding: false }, &slice);
        res += &b32_res;
        res
    }

    /// Parse a binary CID
    pub fn parse_binary(s: &'a [u8]) -> Result<CID<'a>> {
        if s.is_empty() || s[0] != 0 {
            parse_err!("CID is too short")
        }
        parse_binary_(&s[1..])
    }

    pub fn parse_str(s: &str) -> Result<CID<'static>> {
        let s = s.as_bytes();
        if s[0] != b'b' {
            parse_err!("Expected string CID to start with 'b'")
        }

        // first char is ascii, can just skip 1 byte
        let s_rest: &str = str::from_utf8(&s[1..]).unwrap();

        let bin: Vec<u8> =
            base32::decode(base32::Alphabet::Rfc4648Lower { padding: false }, s_rest)
                .ok_or_else(|| DaslError::ParseError("invalid base32"))?;
        let cid = parse_binary_(&bin)?;
        Ok(cid.to_owned())
    }
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
}

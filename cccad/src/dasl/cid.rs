//! CID: <https://dasl.ing/cid.html>

use sha2::{Digest, Sha256};

use super::{
    errors::{DaslError::CIDParseError, Result},
    utils::dec_leb128,
    DaslError,
};
use core::str;

#[derive(Clone, Copy, Eq, PartialEq, Hash, Debug)]
pub enum Codec {
    Raw,
    DCBOR42,
}

/// Size of SHA256 hashes.
pub const SIZE_HASH: usize = 32;
const SIZE_ENCODED: usize = SIZE_HASH + 4;

/// A CID (content ID).
#[derive(Clone, Eq, PartialEq, Hash)]
pub struct CID {
    pub codec: Codec,
    pub hash: [u8; SIZE_HASH],
}

impl std::fmt::Debug for CID {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("CID")
            .field("codec", &self.codec)
            .field(
                "hash",
                &base32::encode(
                    base32::Alphabet::Rfc4648Lower { padding: false },
                    &self.hash,
                ),
            )
            .finish()
    }
}

impl Codec {
    fn to_hex(self) -> u8 {
        match self {
            Codec::Raw => 0x55,
            Codec::DCBOR42 => 0x71,
        }
    }
}

macro_rules! parse_err {
    ($msg:expr) => {
        return Err(CIDParseError($msg))
    };
}

fn decode_binary_(s: &[u8]) -> Result<CID> {
    if s.len() < SIZE_ENCODED {
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
        dec_leb128(s, &mut offset).ok_or_else(|| CIDParseError("Invalid LEB128 length"))? as usize;

    if len != SIZE_HASH {
        parse_err!("Expected length to be 32 (for SHA256)")
    }

    let hash: [u8; SIZE_HASH] = (&s[offset..offset + len]).try_into().unwrap();
    let cid = CID { codec, hash };
    Ok(cid)
}

fn encode_binary(cid: &'_ CID, res: &mut [u8; SIZE_ENCODED]) {
    res[0] = 1;
    res[1] = cid.codec.to_hex();
    res[2] = 0x12; // hash
    debug_assert_eq!(32, cid.hash.len());
    res[3] = 32; // len=32 in LEB128
    res[4..].copy_from_slice(&cid.hash);
}

/// A constant dummy CID used for tests and allocations.
pub const DUMMY: CID = CID {
    codec: Codec::Raw,
    hash: [
        1, 1, 1, 1, 1, 1, 1, 1, /* */
        2, 2, 2, 2, 2, 2, 2, 2, /* */
        3, 3, 3, 3, 3, 3, 3, 3, /* */
        4, 4, 4, 4, 4, 4, 4, 4,
    ],
};

impl CID {
    /// Compute a CID by hashing the serialized data.
    pub fn new_compute_hash(codec: Codec, data: &[u8]) -> Result<CID> {
        let hash: [u8; SIZE_HASH] = Sha256::digest(data).try_into().unwrap();
        Ok(CID { codec, hash })
    }

    /// Compute a CID for raw data, with the Raw codec.
    pub fn new_from_raw_data(data: &[u8]) -> Result<CID> {
        CID::new_compute_hash(Codec::Raw, data)
    }

    /// Encode to binary, in 36 bytes. No leading zero.
    pub fn encode_to_binary(&'_ self) -> [u8; SIZE_ENCODED] {
        let mut res = [0u8; SIZE_ENCODED];
        encode_binary(self, &mut res);
        res
    }

    pub fn encode_to_binary_with_zero(&'_ self) -> [u8; SIZE_ENCODED + 1] {
        let mut res = [0u8; SIZE_ENCODED + 1];
        res[0] = 0;

        let res_rest: &mut [u8; SIZE_ENCODED] = (&mut res[1..]).try_into().unwrap();
        encode_binary(self, res_rest);
        res
    }

    pub fn encode_to_string(&self) -> String {
        let mut res = String::new();
        res.push('b');
        let mut slice = [0u8; SIZE_ENCODED];
        encode_binary(self, &mut slice);
        let b32_res = base32::encode(base32::Alphabet::Rfc4648Lower { padding: false }, &slice);
        res += &b32_res;
        res
    }

    /// Parse a binary CID  that starts with '0', consuming the whole slice.
    pub fn decode_binary_with_zero(s: &[u8]) -> Result<CID> {
        if s.len() != SIZE_ENCODED + 1 {
            parse_err!("CID has the wrong length")
        }
        if s[0] != 0 {
            parse_err!("CID must start with '0'")
        }
        let cid = decode_binary_(&s[1..])?;
        Ok(cid)
    }

    /// Decode a binary CID, without leading '0'. This consumes 36 bytes
    /// from the slice, starting with '1'. It returns how many bytes were read (36).
    pub fn decode_binary(s: &[u8]) -> Result<(CID, usize)> {
        let cid = decode_binary_(&s)?;
        Ok((cid, SIZE_ENCODED))
    }

    pub fn parse_str(s: &str) -> Result<CID> {
        let s = s.as_bytes();
        if s[0] != b'b' {
            parse_err!("Expected string CID to start with 'b'")
        }

        // first char is ascii, can just skip 1 byte
        let s_rest: &str = str::from_utf8(&s[1..]).unwrap();

        let bin: Vec<u8> =
            base32::decode(base32::Alphabet::Rfc4648Lower { padding: false }, s_rest)
                .ok_or_else(|| DaslError::CIDParseError("invalid base32"))?;
        if bin.len() != SIZE_ENCODED {
            parse_err!("CID has the wrong length")
        }
        let cid = decode_binary_(&bin)?;
        Ok(cid.to_owned())
    }
}

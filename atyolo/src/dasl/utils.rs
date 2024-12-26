/// Decode LEB128, starting at `off`. Returns the result, and modifies `off`.
pub(crate) fn dec_leb128(s: &[u8], off: &mut usize) -> Option<u64> {
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

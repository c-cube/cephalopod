//! Internal utilities.

use bumpalo::Bump;

use super::errors;

/// Decode LEB128, starting at `off`. Returns the result, and modifies `off`.
pub(crate) fn dec_leb128(s: &[u8], off: &mut usize) -> Option<u64> {
    let mut res: u64 = 0;
    let mut shift = 0;

    loop {
        if *off >= s.len() {
            return None;
        }

        let byte = s[*off];
        *off += 1;

        let cur = byte & 0b0111_1111;
        res = res | ((cur as u64) << shift);
        if cur == byte {
            if shift < 63 || cur <= 1 {
                return Some(res);
            } else {
                return None;
            }
        } else {
            shift += 7;
        }
    }
}

/// Decode LEB128 starting at offset 0.
#[allow(dead_code)]
pub(crate) fn dec_leb128_start(s: &[u8]) -> Option<u64> {
    let mut offset = 0;
    dec_leb128(s, &mut offset)
}

/// Encode `n` as LEB128 into `buf`, returns how many bytes were used.
///
/// Requires `buf` to have at least 10 bytes of capacity.
#[allow(dead_code)]
pub(crate) fn enc_leb128(mut n: u64, buf: &mut [u8]) -> usize {
    assert!(buf.len() >= 10);

    let mut count = 0;
    loop {
        let c = (n & 0b0111_1111) as u8;

        if c as u64 == n {
            buf[count] = c;
            count += 1;
            return count;
        } else {
            buf[count] = c | 0b1000_0000;
            count += 1;
            n = n >> 7;
        }
    }
}

/// Helper to allocate a slice from a bumpalo
#[inline(always)]
pub(crate) fn alloc_slice<'a, T>(
    alloc: &'a Bump,
    len: usize,
    fill: T,
) -> errors::Result<&'a mut [T]>
where
    T: Clone,
{
    use std::{alloc::Layout, ptr};

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

pub(crate) fn alloc_slice_copy<'a, T>(alloc: &'a Bump, data: &[T]) -> errors::Result<&'a mut [T]>
where
    T: Copy,
{
    if data.is_empty() {
        return Ok(&mut []);
    }

    let slice = alloc_slice(alloc, data.len(), data[0])?;
    slice.copy_from_slice(data);
    Ok(slice)
}

pub(crate) fn alloc_str<'a>(alloc: &'a Bump, str: &str) -> errors::Result<&'a str> {
    let slice = alloc_slice(alloc, str.as_bytes().len(), b'0')?;
    slice.copy_from_slice(str.as_bytes());
    // SAFETY: we just copied from another (valid) str.
    Ok(unsafe { std::str::from_utf8_unchecked(slice) })
}

#[cfg(test)]
mod tests {
    use super::*;
    use proptest::prelude::*;

    #[test]
    fn test_dec_leb128() {
        {
            let mut off = 0;
            let b: &[u8] = &[17];
            assert_eq!(Some(17), dec_leb128(b, &mut off));
        }

        {
            let mut off = 0;
            let b: &[u8] = &[0x88, 0x85, 0x09];
            assert_eq!(Some((9 << (7 + 7)) + (5 << 7) + 8), dec_leb128(b, &mut off));
        }
    }

    #[test]
    fn test_enc_leb128() {
        let mut buf = [0u8; 16];
        {
            let n = enc_leb128(42, &mut buf);
            assert_eq!(1, n);
            assert_eq!(Some(42), dec_leb128_start(&buf));
        }
        {
            let n = enc_leb128(329282522, &mut buf);
            assert_eq!(5, n);
            assert_eq!(Some(329282522), dec_leb128_start(&buf));
        }
        {
            let n = enc_leb128(u64::MAX, &mut buf);
            assert_eq!(10, n);
            dbg!(&buf);
            assert_eq!(Some(u64::MAX), dec_leb128_start(&buf));
        }
    }

    proptest! {
        #[test]
        fn same_as_leb128_crate(n: u64){
            let mut ours = [0u8; 12];
            let ours_len = enc_leb128(n, &mut ours[..]);

            let mut ref_v = vec![];
            let _ref_len = leb128::write::unsigned( &mut ref_v,n).unwrap();
            assert_eq!(&ref_v, &ours[0..ours_len])
        }

        #[test]
        fn decode_from_leb128_crate(n: u64){
            let mut ref_v = vec![];
            let ref_len = leb128::write::unsigned( &mut ref_v,n).unwrap();

            let mut offset = 0;
            let n2 = dec_leb128(&ref_v, &mut offset).unwrap();
            assert_eq!(n2, n);
            assert_eq!(ref_len, offset)
        }
    }
}

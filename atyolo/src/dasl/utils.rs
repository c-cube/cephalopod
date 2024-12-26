use bumpalo::Bump;

use super::errors;

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

    // we encode backward into a local buffer
    let mut local = [0u8; 10];
    let mut offset = 9;

    let mut mask = 0; // 0b1000_0000 after the first iteration
    let mut count = 0;

    loop {
        dbg!(count, n);
        count += 1;
        let c = ((n & 0b0111_1111) as u8) | mask;
        local[offset] = c;

        n = n >> 7;
        if n == 0 {
            break;
        } else {
            mask = 0b1000_0000;
            offset -= 1;
        }
    }

    buf[0..count].copy_from_slice(&local[offset..]);
    count
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

#[cfg(test)]
mod tests {
    use super::*;

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
            assert_eq!(Some((8 << (7 + 7)) + (5 << 7) + 9), dec_leb128(b, &mut off));
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
}

use std::borrow::Cow;

use atyolo::dasl::{
    cid::{Codec, CID},
    dcbor42,
};
use dcbor42::Value as V;

#[test]
fn test_decode() {
    let bytes = hex::decode("830102623432").unwrap();

    let bump = dcbor42::Bump::new();
    let d = dcbor42::decode(&bump, &bytes).unwrap();
    dbg!(&d);
    assert_eq!(
        V::Array(&[V::Positive(1), V::Positive(2), V::Text("42")]),
        d
    );
}

#[test]
fn test_encode() {
    let expected_bytes = hex::decode("830102623432").unwrap();

    let v = V::Array(&[V::Positive(1), V::Positive(2), V::Text("42")]);
    let mut bytes = vec![];
    dcbor42::encode(&v, &mut bytes).unwrap();

    {
        let bump = bumpalo::Bump::new();
        let v2 = dcbor42::decode(&bump, &bytes).unwrap();
        assert_eq!(&v, &v2);
    }

    assert_eq!(
        &expected_bytes,
        &bytes,
        "expected {}, got {}",
        hex::encode(&expected_bytes),
        hex::encode(&bytes)
    );
}

pub const DUMMY_CID: CID<'static> = CID {
    codec: Codec::Raw,
    hash: Cow::Borrowed(&[0u8; 32]),
};

#[test]
fn test_encode2() {
    let v = V::Array(&[
        V::Positive(1),
        V::Positive(2),
        V::Array(&[V::Bool(true), V::Bool(false)]),
        V::Bytes(&[0, 1, 2, 3]),
        V::Text(""),
        V::Map(&[
            ("hello", V::CID(DUMMY_CID)),
            ("world", V::Null),
            ("neg", V::Negative(121515189)),
        ]),
        V::Bytes(&[]),
        V::Text("42"),
    ]);
    let mut bytes = vec![];
    dcbor42::encode(&v, &mut bytes).unwrap();
    // dbg!(&hex::encode(&bytes));

    let bump = bumpalo::Bump::new();
    let v2 = dcbor42::decode(&bump, &bytes).unwrap();
    assert_eq!(&v, &v2);
}

#[test]
fn test_encode_too_deep() {
    let bump = bumpalo::Bump::new();
    let mut v = V::Text(bump.alloc_str("oh no"));

    // way above our recursion limit
    for _ in 0..1200 {
        v = V::Array(bump.alloc_slice_clone(&[v.clone()]))
    }

    let mut bytes = vec![];
    let res = dcbor42::encode(&v, &mut bytes);
    assert!(res.is_err(), "res: {res:?}");
}

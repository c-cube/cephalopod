use bumpalo::Bump;
use cephalopod_dasl::{
    cid::{self},
    data::Value as V,
    dcbor42,
};

#[test]
fn test_decode() {
    let bytes = hex::decode("830102623432").unwrap();

    let bump = dcbor42::Bump::new();
    let d = V::decode_dcbor42(&bump, &bytes).unwrap();
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
    V::encode_dcbor42(&v, &mut bytes).unwrap();

    {
        let bump = bumpalo::Bump::new();
        let v2 = V::decode_dcbor42(&bump, &bytes).unwrap();
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

const BIG_VALUE: V<'static> = V::Array(&[
    V::Positive(1),
    V::Positive(2),
    V::Array(&[V::Bool(true), V::Bool(false)]),
    V::Bytes(&[0, 1, 2, 3]),
    V::Text(""),
    V::Map(&[
        ("hello", V::CID(&cid::DUMMY)),
        ("world", V::Null),
        ("neg", V::Negative(121515189)),
    ]),
    V::Bytes(&[]),
    V::Text("42"),
]);

#[test]
fn test_encode2() {
    let v = BIG_VALUE;
    let mut bytes = vec![];
    v.encode_dcbor42(&mut bytes).unwrap();
    // dbg!(&hex::encode(&bytes));

    let bump = bumpalo::Bump::new();
    let v2 = V::decode_dcbor42(&bump, &bytes).unwrap();
    assert_eq!(&v, &v2);
}

#[test]
fn test_encode_too_deep() {
    let bump = bumpalo::Bump::new();
    let mut v = V::Text(bump.alloc_str("oh no"));

    // way above our recursion limit
    for _ in 0..1200 {
        v = V::Array(bump.alloc_slice_copy(&[v]))
    }

    let mut bytes = vec![];
    let res = v.encode_dcbor42(&mut bytes);
    assert!(res.is_err(), "res: {res:?}");
}

#[test]
fn test_encode_json() {
    let v = BIG_VALUE;
    let j = v.to_json().unwrap();
    let j_str = format!("{j}");

    const EXPECTED: &'static str =
"[1,2,[true,false],{\"$bytes\":\"AAECAw==\"},\"\",{\"hello\":{\"$link\":\"bafkreiabaeaqcaibaeaqeaqcaibaeaqcambqgaydambqgbaeaqcaibaeaq\"},\"world\":null,\"neg\":-121515189},{\"$bytes\":\"\"},\"42\"]";

    assert_eq!(EXPECTED, j_str);
}

#[test]
fn test_decode_json() {
    let v = BIG_VALUE;
    let j = v.to_json().unwrap();

    let alloc = Bump::new();
    let v2 = V::from_json(&alloc, &j).unwrap();

    assert_eq!(v, v2);
}

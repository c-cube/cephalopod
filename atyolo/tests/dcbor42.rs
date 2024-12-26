use atyolo::dasl::dcbor42;
use dcbor42::Value as V;

#[test]
fn test_read() {
    let bytes = hex::decode("830102623432").unwrap();

    let bump = dcbor42::Bump::new();
    let d = dcbor42::parse(&bump, &bytes).unwrap();
    dbg!(&d);
    assert_eq!(
        V::Array(&[V::Positive(1), V::Positive(2), V::Text("42")]),
        d
    );
}

use bumpalo::Bump;
use cccad::dasl::{car, cid::CID, data::Value, CAR};

const ENCODED_CAR: &str = "hgrgo5tfojzws33oafsxe33porzydwbklasac4isebukqxzylfvtuovpxfzgi33rym6zuvq7yp57bz74il6fxt36543hqlybkujcbokne64zgtj6bcss4uwx3j62x6weqtx6g6stqdxjbchxvtro7tpjnbswy3dpeb3w64tmmsbacalrciqgrkc7hbmwwor2v64xezdpohbt3gswd7b7x4hh7rbpyw6pp3xtm6fcmvtgs4ttotmcuwbeafkreifzjut3te2nhyekklss27nh3k72ysco7y32koao5eei66wof36n5fthgzldn5xgjwbklasacviseak4nt7t2f4f2jct4ufxp3f75a6gk6o3ngvoirfkzxctqpj2u6szolqbkujcafogz7z5c6c5erj6kc3x5s76qpdfphnwtkxeisvm3rjyhu5kpjmxnbxxozdzebwwc5df";

#[test]
fn test_encode_car() {
    let alloc = Bump::new();
    let mut buf: Vec<u8> = vec![];

    let data1 = "hello world".as_bytes();
    let cid1 = CID::new_from_raw_data(data1).unwrap();
    let block1 = car::BlockData::from(data1);

    let data2 = "howdy mate".as_bytes();
    let cid2 = CID::new_from_raw_data(data2).unwrap();
    let block2 = car::BlockData::from(data2);

    let v_map = [("first", Value::CID(&cid1)), ("second", Value::CID(&cid2))];
    let v = Value::Map(&v_map);
    let cid_v = v.compute_cid(&mut buf).unwrap();
    dbg!(&cid_v);

    let mut w = car::CARWriter::new(&mut buf);
    w.write_header(&[&cid_v]).unwrap();
    w.write_block(&cid1, &block1).unwrap();
    w.write_block_value(&alloc, &v).unwrap();
    w.write_block(&cid2, &block2).unwrap();

    let data = base32::encode(base32::Alphabet::Rfc4648Lower { padding: false }, &buf);
    assert!(buf.len() > 0);
    assert_eq!(ENCODED_CAR, data)
}

#[test]
fn test_decode_car() {
    let alloc = Bump::new();
    let data = base32::decode(
        base32::Alphabet::Rfc4648Lower { padding: false },
        ENCODED_CAR,
    )
    .expect("decode base32 data");
    let car = CAR::decode_slice(&alloc, &data).expect("decode CAR");

    dbg!(&car);
    assert_eq!(1, car.header.roots.len());
}

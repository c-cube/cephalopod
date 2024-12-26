use atyolo::dasl::{car, cid::CID, dcbor42::Value};
use bumpalo::Bump;

const ENCODED_CAR: &str = "hkrgo5tfojzws33oafsxe33porzydwbklasqaalrciqkdix6myt52yxzu3b3dnn7k63clzizi3hl3lugaht7whslj2ffsezqaaavkeraxfgspomtju7arjjokll5u7nl7lcij37dpjjyb3uqrd32zyxpzxuwqzlmnrxsa53pojwgjaifaaaxceraugrp4zrh3vrptjwdwg236v5wexsrsrwoxwximaph7mpewtuklej2ezlgnfzhg5gyfjmckaabkujcbokne64zgtj6bcss4uwx3j62x6weqtx6g6stqdxjbchxvtro7tpjmzzwky3pnzsnqksyeuaacviseak4nt7t2f4f2jct4ufxp3f75a6gk6o3ngvoirfkzxctqpj2u6szolyaafkreiavy3h7hulylusfhzilo7wl72b4mv45w2nk4rckvtofha6tvj5fs5ug653epeqg2ylumu";

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
    let car = car::decode_slice(&alloc, &data).expect("decode CAR");

    dbg!(&car);
    assert_eq!(1, car.header.roots.len());
}

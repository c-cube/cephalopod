use bumpalo::Bump;
use cephalopod_core::{car, cid::CID, data::Value, CAR};

const ENCODED_CAR: &str = "hkrgo5tfojzws33oafsxe33porzydwbklasqaalrciqkdix6myt52yxzu3b3dnn7k63clzizi3hl3lugaht7whslj2ffsezpafkreifzjut3te2nhyekklss27nh3k72ysco7y32koao5eei66wof36n5fugk3dmn4qho33snrsiiaiboejcbinc7ztcpxlc7gtmhmnvx5l3mjpfdfdm5pnoqya6p6y6jnhiuwitujswm2lson2nqksyeuaacvisec4u2j5zsngt4cfffzjnpwt5vp5mjbhp4n5fhahoscepplhc57g6szttmvrw63te3avfqjiaafkreiavy3h7hulylusfhzilo7wl72b4mv45w2nk4rckvtofha6tvj5fs4xacviseak4nt7t2f4f2jct4ufxp3f75a6gk6o3ngvoirfkzxctqpj2u6szo2dpo5shsidnmf2gk";

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

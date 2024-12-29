use cephalopod_dasl::cid::*;

// TODO: proptest for CID => binary => CID
// TODO: proptest for CID => string => CID

const REF_CID: CID = CID {
    codec: Codec::Raw,
    hash: [
        1, 1, 1, 1, 1, 1, 1, 1, /* */
        2, 2, 2, 2, 2, 2, 2, 2, /* */
        3, 3, 3, 3, 3, 3, 3, 3, /* */
        4, 4, 4, 4, 4, 4, 4, 4,
    ],
};

#[test]
fn test_decode_binary() {
    let fake_cid: &[u8] = &[
        0, 1, 0x55, 0x12, 32, /* fake sha256 */
        1, 1, 1, 1, 1, 1, 1, 1, /* */
        2, 2, 2, 2, 2, 2, 2, 2, /* */
        3, 3, 3, 3, 3, 3, 3, 3, /* */
        4, 4, 4, 4, 4, 4, 4, 4,
    ];

    let cid = CID::decode_binary_with_zero(fake_cid).unwrap();
    assert_eq!(REF_CID, cid);

    let encoded = cid.encode_to_binary_with_zero();
    assert_eq!(fake_cid, &encoded);
}

#[test]
fn test_decode_str() {
    let cid_str = "bafkreiabaeaqcaibaeaqeaqcaibaeaqcambqgaydambqgbaeaqcaibaeaq";
    let parsed = CID::parse_str(cid_str).unwrap();
    assert_eq!(REF_CID, parsed)
}

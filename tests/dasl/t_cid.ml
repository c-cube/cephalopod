open Cephalopod_common
open Cephalopod_dasl

let fake_hash = [
  1; 1; 1; 1; 1; 1; 1; 1; (* *)
  2; 2; 2; 2; 2; 2; 2; 2; (* *)
  3; 3; 3; 3; 3; 3; 3; 3; (* *)
  4; 4; 4; 4; 4; 4; 4; 4;
]
[@@ocamlformat "disable"]

let fake_cid_str: string = ([
  1; 0x55; 0x12; 32; (* fake sha256 *)
] @ fake_hash) |> List.map Char.chr |> CCString.of_list
[@@ocamlformat "disable"]

let ref_cid : Cid.t =
  {
    codec = Raw;
    hash =
      Sha256.Private_.make @@ CCString.of_list @@ List.map Char.chr fake_hash;
  }

let () =
  let cid =
    match Cid.decode_binary (Byte_slice.unsafe_of_string fake_cid_str) with
    | Ok cid -> cid
    | Error err ->
      failwith (spf "could not decode CID: %s" (Cid.show_error_decode err))
  in

  assert (Cid.equal cid ref_cid);

  let encoded = Cid.encode_binary cid in
  (* Printf.printf "encoded=%S\nref    =%S\n" encoded fake_cid_str; *)
  assert (encoded = fake_cid_str);
  ()

let () =
  let cid_str = "bafkreiabaeaqcaibaeaqeaqcaibaeaqcambqgaydambqgbaeaqcaibaeaq" in
  let parsed =
    match Cid.decode_text cid_str |> Result.map_error Cid.show_error_decode with
    | Ok x -> x
    | Error err -> failwith err
  in
  assert (Cid.equal parsed ref_cid);
  ()

module Q = QCheck2
open Cephalopod_dasl

module U_sha256 = struct
  type t = Sha256.t

  let gen : t Q.Gen.t =
    Q.Gen.(
      let+ s = string_size (return Sha256.size_hash) ~gen:char in
      Sha256.Private_.make s)
end

module U_cid = struct
  type codec = Codec.t =
    | Raw
    | DCBOR42
  [@@deriving qcheck2]

  type t = Cid.t = {
    codec: codec;
    hash: U_sha256.t;
  }
  [@@deriving qcheck2]
end

module U_value = struct
  let gen_key = Q.Gen.(string_size (1 -- 10) ~gen:printable)

  type t = Value.t =
    | Array of t list
    | Bool of bool
    | Bytes of string
    | Int of int64
    | Map of (string * t) list
    | Null
    | Cid of U_cid.t
    | Text of string

  let rec gen_sized n : t Q.Gen.t =
    let open Q.Gen in
    let self = delay @@ fun () -> gen_sized (n / 2) in
    let base =
      [
        1, map (fun gen0 -> Bool gen0) bool;
        1, map (fun gen0 -> Bytes gen0) (string_size (0 -- 28));
        1, map (fun gen0 -> Int gen0) ui64;
        1, pure Null;
        1, map (fun gen0 -> Cid gen0) U_cid.gen;
        1, map (fun gen0 -> Text gen0) (string_size ~gen:printable (0 -- 28));
      ]
    in
    match n with
    | 0 -> frequency base
    | _ ->
      frequency @@ base
      @ [
          1, map (fun gen0 -> Text gen0) (string_size ~gen:printable (0 -- 28));
          1, map (fun gen0 -> Array gen0) (list_size (0 -- 3) self);
          1, map (fun gen0 -> Map gen0) (list_size (0 -- 5) (pair gen_key self));
        ]

  let gen : t Q.Gen.t =
    Q.Gen.(
      let* size = 0 -- 5 in
      gen_sized size)
end

module U_car = struct
  type header = Car.header = {
    version: (int64[@gen Q.Gen.return 1L]);
    roots: U_cid.t list;
  }
  [@@deriving qcheck2]

  type block_data = Car.block_data

  let gen_raw_block_data : block_data Q.Gen.t =
    Q.Gen.(
      let+ data =
        let+ x = string_size (0 -- 10) in
        CCByte_slice.create @@ Bytes.unsafe_of_string x
      in
      Car.Raw data)

  let gen_dcbor42_block_data : block_data Q.Gen.t =
    Q.Gen.(
      let+ v = U_value.gen in
      Car.DCBOR42 v)

  let gen_block_data (cid : Cid.t) : block_data Q.Gen.t =
    match cid.codec with
    | Raw -> gen_raw_block_data
    | DCBOR42 -> gen_dcbor42_block_data

  type block = Car.block = {
    cid: U_cid.t;
    data: block_data;
  }

  let gen_block : block Q.Gen.t =
    Q.Gen.(
      let* cid = U_cid.gen in
      (* make block data compatible with the CID's codec *)
      let+ data = gen_block_data cid in
      { cid; data })

  type t = Car.t = {
    header: header;
    blocks: (block list[@gen Q.Gen.(list_size (1 -- 17) gen_block)]);
  }
  [@@deriving qcheck2]
end

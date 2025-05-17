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

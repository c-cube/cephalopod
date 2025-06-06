(** Tree node *)

open Cephalopod_dasl

type t = {
  l: Cid.t option;  (** left subtree *)
  e: Entry.t list;  (** entries of this node *)
}
[@@deriving show { with_path = false }]

let of_value_exn (v : Value.t) : t =
  let l = Value.Util.(get_key_nullable_exn "l" to_cid v) in
  let e = Value.Util.(get_key_exn "e" (to_array_of Entry.of_value_exn) v) in
  { l; e }

let of_value v : (t, [> Decode_error.t ]) result =
  try Ok (of_value_exn v)
  with Value.Util.Conv_error err -> Error (`Conv_error err)

let to_value (self : t) : Value.t =
  Value.Util.(
    map [ "l", option_of cid self.l; "e", array_of Entry.to_value self.e ])

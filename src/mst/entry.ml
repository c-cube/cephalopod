(** Entry in a tree node.

    Tree nodes are wide and can contain many values. *)

open Cephalopod_dasl

type t = {
  p: int64;  (** prefix len *)
  k: string;  (** key suffix *)
  v: Cid.t;  (** value *)
  t: Cid.t option;  (** Subtree on the right of this node *)
}
[@@deriving show { with_path = false }]

let of_value_exn (v : Value.t) : t =
  let p = Value.Util.(get_key_exn "p" to_int v) in
  let k = Value.Util.(get_key_exn "k" to_bytes v) |> Bytes.unsafe_to_string in
  let t = Value.Util.(get_key_nullable_exn "t" to_cid v) in
  let v = Value.Util.(get_key_exn "v" to_cid v) in
  { p; k; v; t }

let of_value v : (t, [> Decode_error.t ]) result =
  try Ok (of_value_exn v)
  with Value.Util.Conv_error err -> Error (`Conv_error err)

let to_value (self : t) : Value.t =
  Value.Util.(
    map
      [
        "p", int self.p;
        "k", bytes (Bytes.unsafe_of_string self.k);
        "v", cid self.v;
        "t", option_of cid self.t;
      ])

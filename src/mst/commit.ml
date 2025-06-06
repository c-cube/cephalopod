(** Commit object *)

open Cephalopod_dasl

type t = {
  did: string;
  version: int64;
  data: Cid.t;
  rev: string;
  prev: Cid.t option;
  sig_: string; [@printer Common_.pp_str_len]
}
[@@deriving show { with_path = false }]

let of_value_exn (v : Value.t) : t =
  let did = Value.Util.(get_key_exn "did" to_text v) in
  let version = Value.Util.(get_key_exn "version" to_int v) in
  let data = Value.Util.(get_key_exn "data" to_cid v) in
  let rev = Value.Util.(get_key_exn "rev" to_text v) in
  let prev = Value.Util.(get_key_nullable_exn "prev" to_cid v) in
  let sig_ =
    Value.Util.(get_key_exn "sig" to_bytes v) |> Bytes.unsafe_to_string
  in
  { did; version; data; rev; prev; sig_ }

let of_value v : (t, [> Decode_error.t ]) result =
  try Ok (of_value_exn v)
  with Value.Util.Conv_error err -> Error (`Conv_error err)

let to_value (self : t) : Value.t =
  Value.Util.(
    map
      [
        "did", text self.did;
        "version", int self.version;
        "data", cid self.data;
        "rev", text self.rev;
        "prev", option_of cid self.prev;
        "sig", bytes (Bytes.unsafe_of_string self.sig_);
      ])

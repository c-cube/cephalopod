val size_hash : int

type t = {
  codec: Codec.t;
  hash: Sha256.t;
}
[@@deriving eq, show]

type error_decode =
  [ `CidParseError of string
  | Codec.error
  ]
[@@deriving show]

val decode_binary : Byte_slice.t -> (t, [> error_decode ]) result
val encode_binary : t -> string
val dummy : t
val new_compute_hash : Codec.t -> Byte_slice.t -> t
val new_from_raw_data : Byte_slice.t -> t
val new_from_raw_data_str : string -> t

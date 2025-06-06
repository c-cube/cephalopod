val size_hash : int

val size_encoded : int
(** Number of a bytes of a CID encoded in binary *)

type t = {
  codec: Codec.t;
  hash: Sha256.t;
}
[@@deriving eq, show, yojson]

type error_decode =
  [ `CidParseError of string
  | `Base32Error of string
  | Codec.error
  ]
[@@deriving show]

val dummy : t
(** Dummy CID *)

val decode_binary : Byte_slice.t -> (t, [> error_decode ]) result
(** Decode a binary blob *)

val decode_binary_with_zero : Byte_slice.t -> (t, [> error_decode ]) result
(** Decode a 0-prefixed binary blob *)

val decode_binary_str : String.t -> (t, [> error_decode ]) result

val encode_binary_with_zero : t -> string
(** Encode to binary blob, with leading zero *)

val encode_binary : t -> string
(** Encode to binary blob *)

val decode_text : string -> (t, [> error_decode ]) result
(** Decode text format *)

val encode_text : t -> string
(** Encode to text format *)

val new_compute_hash : Codec.t -> Byte_slice.t -> t
val new_from_raw_data : Byte_slice.t -> t
val new_from_raw_data_str : string -> t

module Map : CCMap.S with type key = t
module Set : CCSet.S with type elt = t

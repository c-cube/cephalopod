(** CBOR encoder/decoder, adapted from Containers.

    This is limited to the subset supported by DCBOR42. *)

type token =
  | Null
  | Undefined
  | Bool of bool
  | Int of int64
  | Bytes of Byte_slice.t
  | Text of Byte_slice.t
  | Array of int
  | Map of int
  | Tag of int
[@@deriving show]

module Decoder : sig
  type t

  val of_string : ?off:int -> ?len:int -> string -> t
  val create : Byte_slice.t -> t

  exception EOF

  val offset : t -> int
  val next : t -> token
end

module Encoder : sig
  val push : Byte_buffer.t -> token -> unit
end

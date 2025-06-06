(** SHA256 hash *)

val size_hash : int
(** Size of SHA256 in bytes *)

type t = private string [@@deriving eq, ord, show]
(** len=32 *)

val to_hex : t -> string

val hash_string : string -> t
(** Hash string and return this *)

val hash_slice : Byte_slice.t -> t

(**/**)

module Private_ : sig
  val make : string -> t
end

(**/**)

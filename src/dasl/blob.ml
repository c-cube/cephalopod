type t = {
  ref_: Cid.t;  (** The CID of the stored object (codec: raw). *)
  mime_type: string;  (** Mime type of the stored object. *)
  size: int;  (** Size of data in bytes. *)
}
[@@deriving eq, show { with_path = false }]
(** Special kind of map: a blob, representing some media file stored separately.
*)

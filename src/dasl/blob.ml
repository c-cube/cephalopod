type t = {
  ref_: Cid.t; [@key "ref"]  (** The CID of the stored object (codec: raw). *)
  mime_type: string; [@key "mimeType"]  (** Mime type of the stored object. *)
  size: int64;  (** Size of data in bytes. *)
}
[@@deriving eq, yojson, show { with_path = false }]
(** Special kind of map: a blob, representing some media file stored separately.
*)

let of_value (v : Value.t) : t option =
  try
    let l =
      match v with
      | Map l -> l
      | _ -> raise Exit
    in

    let ref_ =
      match List.assoc "ref" l with
      | Cid c -> c
      | _ -> raise Exit
    and mime_type =
      match List.assoc "mimeType" l with
      | Text s -> s
      | _ -> raise Exit
    and size =
      match List.assoc "size" l with
      | Int i -> i
      | _ -> raise Exit
    in
    Some { ref_; mime_type; size }
  with _ -> None

let to_value (self : t) : Value.t =
  Map
    [
      "ref", Cid self.ref_;
      "mimeType", Text self.mime_type;
      "size", Int self.size;
    ]

(** Data model *)

module CBOR = Containers_cbor

type t =
  [ `Array of t list
  | `Bool of bool
  | `Bytes of string
  | `Int of int64
  | `Map of (string * t) list
  | `Null
  | `Cid of Cid.t
  | `Text of string
  ]
[@@deriving eq, show { with_path = false }]
(** DCBOR42 values, as a well behaved subset of CBOR. *)

type error_of_cbor =
  [ `InvalidDCBOR42 of (CBOR.t[@printer CBOR.pp_diagnostic]) * string
  | `CborParseError of string
  | Cid.error_decode
  ]
[@@deriving show]

let of_cbor (c : CBOR.t) : (t, [> error_of_cbor ]) result =
  let@ ectx = Error.try_with in
  let rec loop (c : CBOR.t) : t =
    match c with
    | (`Bool _ | `Null | `Bytes _ | `Int _ | `Text _) as c -> c
    | `Simple _ -> Error.fail ectx (`InvalidDCBOR42 (c, "Simple not supported"))
    | `Tag (42, `Bytes b) ->
      let cid = Cid.decode_binary_str b |> Error.unwrap ectx in
      `Cid cid
    | `Undefined ->
      Error.fail ectx (`InvalidDCBOR42 (c, "Undefined not supported"))
    | `Float _ -> Error.fail ectx (`InvalidDCBOR42 (c, "Float not supported"))
    | `Tag (t, _) ->
      Error.fail ectx (`InvalidDCBOR42 (c, spf "Tag %d not supported" t))
    | `Array l -> `Array (List.map loop l)
    | `Map l ->
      `Map
        (List.map
           (fun (k, v) ->
             match k with
             | `Text k -> k, loop v
             | _ ->
               Error.fail ectx (`InvalidDCBOR42 (c, "keys must be strings")))
           l)
  in
  loop c

let rec to_cbor (self : t) : CBOR.t =
  match self with
  | (`Bool _ | `Null | `Bytes _ | `Int _ | `Text _) as c -> c
  | `Cid cid ->
    let b = Cid.encode_binary cid in
    `Tag (42, `Bytes b)
  | `Array l -> `Array (List.map to_cbor l)
  | `Map l -> `Map (List.map (fun (k, v) -> `Text k, to_cbor v) l)

(** Parse a CBOR string *)
let parse_cbor_str (str : string) : (t, [> error_of_cbor ]) result =
  let@ ectx = Error.try_with in
  let cbor =
    match CBOR.decode str with
    | Ok c -> c
    | Error msg -> Error.fail ectx (`CborParseError msg)
  in
  of_cbor cbor |> Error.unwrap ectx

let to_cbor_str (self : t) : string =
  let c = to_cbor self in
  CBOR.encode c

(* TODO:  *)
let as_blob (self : t) : Blob.t option = assert false

type error_of_yojson =
  [ `InvalidJson of Yojson.t * string
  | `YojsonParseError of string
  | Cid.error_decode
  ]
[@@deriving show]

let of_yojson (j : Yojson.t) : (t, [> error_of_yojson ]) result =
  let@ ectx = Error.try_with in
  let rec loop (j : Yojson.t) : t =
    match j with
    | (`Null | `Bool _) as c -> c
    | `Int i -> `Int (Int64.of_int i)
    | `Intlit i ->
      (try `Int (Int64.of_string i)
       with _ -> Error.fail ectx (`InvalidJson (j, "Integer literal")))
    | `Tuple l | `List l -> `Array (List.map loop l)
    | `String s -> `Text s
    | `Assoc l ->
      if List.mem_assoc "$link" l then (
        (* cid *)
          match List.assoc "$link" l with
        | `String str ->
          let cid = Cid.decode_text str |> Error.unwrap ectx in
          `Cid cid
        | _ -> Error.fail ectx (`InvalidJson (j, "$link must be a string"))
      ) else
        `Map (List.map (fun (k, v) -> k, loop v) l)
    | `Variant _ | `Float _ | `Stringlit _ | `Floatlit _ ->
      Error.fail ectx (`InvalidJson (j, "Unsupported yojson"))
  in
  loop j

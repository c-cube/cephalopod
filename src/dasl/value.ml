(** Data model *)

open Common_

(** DCBOR42 values, as a well behaved subset of CBOR. *)
type t =
  | Array of t list
  | Bool of bool
  | Bytes of (string[@printer pp_str_len])
  | Int of int64
  | Map of (string * t) list
  | Null
  | Cid of Cid.t
  | Text of string
[@@deriving eq, show { with_path = false }]

type error_of_cbor =
  [ `InvalidDCBOR42 of [ `Offset of int ] * string
  | `CborParseError of string
  | Cid.error_decode
  ]
[@@deriving show]

let of_cbor (c : Cbor.Decoder.t) : (t, [> error_of_cbor ]) result =
  let@ ectx = Error.try_with in
  let module D = Cbor.Decoder in
  let rec loop (c : D.t) : t =
    let off = D.offset c in
    let t = D.next c in
    match t with
    | Bool b -> Bool b
    | Null -> Null
    | Text bs -> Text (Byte_slice.contents bs)
    | Bytes bs -> Bytes (Byte_slice.contents bs)
    | Int i -> Int i
    | Tag 42 ->
      (match D.next c with
      | Bytes bs ->
        let cid = Cid.decode_binary_with_zero bs |> Error.unwrap ectx in
        Cid cid
      | _ ->
        Error.fail ectx (`InvalidDCBOR42 (`Offset off, "Tag 42 must be bytes")))
    | Undefined ->
      Error.fail ectx (`InvalidDCBOR42 (`Offset off, "Undefined not supported"))
    | Tag t ->
      Error.fail ectx
        (`InvalidDCBOR42 (`Offset off, spf "Tag %d not supported" t))
    | Array len ->
      let values = List.init len (fun _ -> loop c) in
      Array values
    | Map len ->
      let pairs =
        List.init len (fun _ ->
            let k =
              match loop c with
              | Text bs -> bs
              | _ ->
                Error.fail ectx
                  (`InvalidDCBOR42 (`Offset off, "keys must be strings"))
            in
            let v = loop c in
            k, v)
      in
      Map pairs
  in
  loop c

let rec to_cbor (buf : Buffer.t) (self : t) : unit =
  let module CE = Cbor.Encoder in
  match self with
  | Bool b -> CE.push buf (Bool b)
  | Null -> CE.push buf Null
  | Bytes str -> CE.push buf (Bytes (Byte_slice.unsafe_of_string str))
  | Text str -> CE.push buf (Text (Byte_slice.unsafe_of_string str))
  | Int i -> CE.push buf (Int i)
  | Cid cid ->
    CE.push buf (Tag 42);
    CE.push buf (Bytes (Byte_slice.unsafe_of_string @@ Cid.encode_binary cid))
  | Array l ->
    CE.push buf (Array (List.length l));
    List.iter (to_cbor buf) l
  | Map l ->
    CE.push buf (Map (List.length l));
    List.iter
      (fun (k, v) ->
        to_cbor buf (Text k);
        to_cbor buf v)
      l

(** Parse a CBOR string *)
let parse_cbor_str ?off ?len (str : string) : (t, [> error_of_cbor ]) result =
  let@ ectx = Error.try_with in
  of_cbor (Cbor.Decoder.of_string ?off ?len str) |> Error.unwrap ectx

let to_cbor_str (self : t) : string =
  let buf = Buffer.create 32 in
  to_cbor buf self;
  Buffer.contents buf

type error_of_yojson =
  [ `InvalidJson of Json.t * string
  | `YojsonParseError of string
  | Cid.error_decode
  ]
[@@deriving show]

let of_yojson' (j : Json.t) : (t, [> error_of_yojson ]) result =
  let@ ectx = Error.try_with in
  let rec loop (j : Json.t) : t =
    match j with
    | `Null -> Null
    | `Bool b -> Bool b
    | `Int i -> Int (Int64.of_int i)
    | `Intlit i ->
      (try Int (Int64.of_string i)
       with _ -> Error.fail ectx (`InvalidJson (j, "Integer literal")))
    | `Tuple l | `List l -> Array (List.map loop l)
    | `String s -> Text s
    | `Assoc l ->
      if List.mem_assoc "$link" l then (
        (* cid *)
          match List.assoc "$link" l with
        | `String str ->
          let cid = Cid.decode_text str |> Error.unwrap ectx in
          Cid cid
        | _ -> Error.fail ectx (`InvalidJson (j, "$link must be a string"))
      ) else
        Map (List.map (fun (k, v) -> k, loop v) l)
    | `Variant _ | `Float _ ->
      Error.fail ectx (`InvalidJson (j, "Unsupported yojson"))
  in
  loop j

let[@inline] of_yojson j : (t, string) result =
  of_yojson' j |> Result.map_error show_error_of_yojson

(** Lexicons

    https://atproto.com/specs/lexicon , also see [vendor/] *)

open struct
  module J = Yojson.Safe
  module JU = J.Util

  [@@@ocaml.warning "-32"]

  let ( let@ ) = ( @@ )
  let spf = Printf.sprintf
  let int = JU.to_int
  let string = JU.to_string
  let object_ = JU.to_assoc
  let list conv j = JU.to_list j |> List.map conv
  let assoc_of conv j = JU.to_assoc j |> List.map (fun (k, v) -> k, conv v)
  let bool = JU.to_bool
  let field str conv (l : _ list) = List.assoc str l |> conv
  let fail = failwith
  let failf msg = Printf.ksprintf fail msg

  let unwrap = function
    | Ok x -> x
    | Error msg -> fail msg

  let try_catch what f =
    try Ok (f ()) with
    | Failure msg | Invalid_argument msg ->
      Error (spf "Expected %s: %s" what msg)
    | exn -> Error (spf "Expected %s: %s" what @@ Printexc.to_string exn)

  let field_opt str conv (l : _ list) =
    match List.assoc_opt str l with
    | None -> None
    | Some v -> Some (conv v)

  let field_opt' str conv (l : _ list) =
    match List.assoc_opt str l with
    | None -> None
    | Some v -> Some (conv v |> unwrap)
end

type ty_expr =
  | String
  | Boolean
  | Integer
  | Bytes
  | Array of { items: ty_expr list }
[@@deriving show { with_path = false }]

type string_format =
  | AtIdentifier [@name "at-identifier"]
  | AtUri [@name "at-uri"]
  | Cid [@name "cid"]
  | Datetime [@name "dateTime"]
  | Did [@name "did"]
  | Handle [@name "handle"]
  | Nsid [@name "nsid"]
  | Tid [@name "tid"]
  | RecordKey [@name "record-key"]
  | Uri [@name "uri"]
  | Language [@name "language"]
[@@deriving show { with_path = false }, of_yojson { strict = false }]

let string_format_of_yojson j =
  let@ () = try_catch "string format" in
  let str = string j in
  match str with
  | "at-identifier" -> AtIdentifier
  | "at-uri" -> AtUri
  | "cid" -> Cid
  | "datetime" -> Datetime
  | "did" -> Did
  | "handle" -> Handle
  | "nsid" -> Nsid
  | "tid" -> Tid
  | "record-key" -> RecordKey
  | "uri" -> Uri
  | "language" -> Language
  | _ -> failf "Expected string format, got %S" str

type accept =
  | Accept1 of string
  | AcceptN of string list
[@@deriving show { with_path = false }]

let accept_of_yojson = function
  | `String s -> Ok (Accept1 s)
  | `List l ->
    let@ () = try_catch "accept" in
    let l = List.map JU.to_string l in
    AcceptN l
  | _ -> Error "invalid accept"

type string_ty = {
  description: string option; [@default None]
  format: string_format option; [@default None]
  minLength: int option; [@default None]
  maxLength: int option; [@default None]
  enum: string list option; [@default None]
  default: string option; [@default None]
  const: string option; [@default None]
  knownValues: string list option; [@default None]
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type ref = {
  raw: string;  (** The raw string ref *)
  name: string;  (** Qualified name, like ["com.atproto.foo"] *)
  fragment: string option;  (** Fragment, ie the ["#yolo"] part *)
}
[@@deriving show { with_path = false }]

let ref_of_string raw =
  let name, fragment =
    match CCString.Split.right ~by:"#" raw with
    | None -> raw, None
    | Some (l, r) -> l, Some r
  in
  { raw; name; fragment }

let ref_of_yojson j =
  let@ () = try_catch "ref" in
  let s = string j in
  ref_of_string s

type union = {
  refs: ref list;
  closed: bool; [@default false]
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type 'a assoc_list = (string * 'a) list [@@deriving show]

let assoc_list_of_yojson getv = function
  | `Assoc l ->
    let@ () = try_catch "JSON object" in
    List.map (fun (k, v) -> k, getv v |> unwrap) l
  | _ -> Error "expected an object"

type 'ty object_poly = {
  required: string list option; [@default None]
  nullable: string list option; [@default None]
  properties: 'ty assoc_list;
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type integer = {
  minimum: int64 option; [@default None]
  maximum: int64 option; [@default None]
  enum: int64 list option; [@default None]
  default: int64 option; [@default None]
  const: int64 option; [@default None]
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type ty = {
  description: string option; [@default None]
  view: ty_view;
}

and ty_view =
  | Null
  | Boolean of { default: bool option }
  | Int of integer
  | String of string_ty
  | Bytes of {
      min_length: int option; [@default None]
      max_length: int option; [@default None]
    }
  | CidLink
  | Array of {
      items: ty;
      minLength: int option; [@default None]
      maxLength: int option; [@default None]
    }
  | Object of ty object_poly
  | Blob of {
      accept: accept option; [@default None]
      maxSize: int option; [@default None]
    }
  | Token
  | Ref of { ref: ref }
  | Union of union
  | Unknown
[@@deriving show { with_path = false }]

let rec ty_of_yojson j =
  let@ () = try_catch "type" in
  let l = object_ j in
  let description = field_opt "description" string l in
  let mk view : ty = { description; view } in
  match List.assoc "type" l |> JU.to_string with
  | "null" -> mk Null
  | "string" -> mk @@ String (string_ty_of_yojson j |> unwrap)
  | "boolean" ->
    let default = field_opt "default" bool l in
    mk @@ Boolean { default }
  | "integer" ->
    let i = integer_of_yojson j |> unwrap in
    mk @@ Int i
  | "bytes" ->
    let min_length = field_opt "minLength" int l in
    let max_length = field_opt "maxLength" int l in
    mk @@ Bytes { min_length; max_length }
  | "object" ->
    let o = object_poly_of_yojson ty_of_yojson j |> unwrap in
    mk @@ Object o
  | "token" -> mk @@ Token
  | "ref" ->
    let ref = field "ref" string l |> ref_of_string in
    mk @@ Ref { ref }
  | "blob" ->
    let accept = field_opt' "accept" accept_of_yojson l in
    let maxSize = field_opt "maxSize" int l in
    mk @@ Blob { accept; maxSize }
  | "array" ->
    let items = field "items" (fun j -> ty_of_yojson j |> unwrap) l in
    let minLength = field_opt "minLength" int l in
    let maxLength = field_opt "maxLength" int l in
    mk @@ Array { items; minLength; maxLength }
  | "union" ->
    let u = union_of_yojson j |> unwrap in
    mk @@ Union u
  | "cid-link" -> mk @@ CidLink
  | "unknown" -> mk @@ Unknown
  | _ty -> failf "Unknown type tag %S" _ty

type object_ = ty object_poly [@@deriving show, of_yojson]

type error = {
  description: string option; [@default None]
  name: string;
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type params = {
  description: string option; [@default None]
  required: string list option; [@default None]
  properties: ty assoc_list;
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type encoding =
  | Json
  | CAR
  | Other of string
[@@deriving show { with_path = false }]

let encoding_of_yojson = function
  | `String "application/json" -> Ok Json
  | `String "application/vnd.ipld.car" -> Ok CAR
  | `String s -> Ok (Other s)
  | _ -> Error "Expected encoding"

let mime_of_encoding = function
  | Json -> "application/json"
  | CAR -> "application/vnd.ipld.car"
  | Other s -> s

type input_or_output = {
  description: string option; [@default None]
  encoding: encoding;
  schema: ty option; [@default None]
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type query = {
  description: string option; [@default None]
  parameters: params option; [@default None]
  output: input_or_output option; [@default None]
  errors: error list option; [@default None]
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type procedure = {
  description: string option; [@default None]
  parameters: params option; [@default None]
  input: input_or_output option; [@default None]
  output: input_or_output option; [@default None]
  errors: error list option; [@default None]
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type message = {
  description: string option; [@default None]
  schema: ty;
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type subscription = {
  description: string option; [@default None]
  parameters: params option; [@default None]
  message: message option; [@default None]
  errors: error list option; [@default None]
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type record = {
  description: string option; [@default None]
  key: string;
  record: object_;
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

type def =
  | Query of query
  | Procedure of procedure
  | Record of record
  | Subscription of subscription
  | Object of object_
  | Type of ty
[@@deriving show { with_path = false }]

let def_of_yojson j : (def, _) result =
  let@ () = try_catch "Def" in
  let l = object_ j in
  match field "type" string l with
  | "query" -> Query (query_of_yojson j |> unwrap)
  | "procedure" -> Procedure (procedure_of_yojson j |> unwrap)
  | "record" -> Record (record_of_yojson j |> unwrap)
  | "subscription" -> Subscription (subscription_of_yojson j |> unwrap)
  | "object" -> Object (object__of_yojson j |> unwrap)
  | _ty ->
    (match ty_of_yojson j with
    | Ok ty -> Type ty
    | _ -> failf "Expected Def, got unknown type %S" _ty)

type lexicon = {
  description: string option; [@default None]
  id: string;
  lexicon: int;
  defs: def assoc_list;
}
[@@deriving show { with_path = false }, of_yojson { strict = false }]

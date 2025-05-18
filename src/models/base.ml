(** Base definitions for queries, subscriptions, etc *)

type error = {
  description: string option;
  name: string;
}

type 'a jsonable = {
  to_yojson: 'a -> Yojson.Safe.t;
  of_yojson: Yojson.Safe.t -> ('a, string) result;
  pp: Format.formatter -> 'a -> unit;
}

type 'a printable = { pp: Format.formatter -> 'a -> unit }

let printable_unit = { pp = CCFormat.unit }

type encoding =
  | Json
  | CAR
  | Other of string
[@@deriving show { with_path = false }]

let encoding_of_mime = function
  | "application/json" -> Json
  | "application/vnd.ipld.car" -> CAR
  | s -> Other s

let encoding_to_mime = function
  | Json -> "application/json"
  | CAR -> "application/vnd.ipld.car"
  | Other s -> s

type 'a params =
  | Params : 'a jsonable -> 'a params
  | No_params : unit params

type 'a errors =
  | Errors : 'e printable -> 'e errors
  | No_errors : unit errors

type 'a message =
  | Message : 'e jsonable -> 'e message
  | No_message : unit message

type 'a input_or_output =
  | IO_jsonable : {
      encoding: encoding;
      json: 'a jsonable;
    }
      -> 'a input_or_output
  | IO_opaque : { encoding: encoding } -> unit input_or_output
  | No_io : unit input_or_output

type ('params, 'o, 'errors) query = {
  parameters: 'params params;
  output: 'o input_or_output;
  errors: 'errors errors;
}
[@@deriving make]
(** Runtime description of a query *)

type ('params, 'i, 'o, 'errors) procedure = {
  parameters: 'params params;
  input: 'i input_or_output;
  output: 'o input_or_output;
  errors: 'errors errors;
}
[@@deriving make]

type ('params, 'msg, 'errors) subscription = {
  parameters: 'params params;
  message: 'msg message;
  errors: 'errors errors;
}
[@@deriving make]

type 'ty record = {
  key: string;
  record: 'ty jsonable;
}
[@@deriving make]

(** Base definitions for queries, subscriptions, etc *)

type error = {
  description: string option;
  name: string;
}

type 'a pp = Format.formatter -> 'a -> unit

type 'a encodable = {
  to_value: 'a -> Cephalopod_dasl.Value.t;
  of_value: Cephalopod_dasl.Value.t -> 'a;
  pp: 'a pp;
}

type 'a printable = { pp: 'a pp }

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
  | Params : 'a encodable -> 'a params
  | No_params : unit params

type 'a errors =
  | Errors : 'e printable -> 'e errors
  | No_errors : unit errors

type 'e message = {
  pp: 'e pp;
  to_value: 'e -> Cephalopod_dasl.Value.t;
  of_value: type_tag:string -> Cephalopod_dasl.Value.t -> 'e;
  nsid_of_fragment: string -> string;
}

type 'a input_or_output =
  | IO_encodable : {
      encoding: encoding;
      encode: 'a encodable;
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
  record: 'ty encodable;
}
[@@deriving make]

module Decode_message = struct
  open Cephalopod_common

  type error =
    [ `Msg of string
    | `Missing_type_tag
    | `Decode_error of Cephalopod_dasl.Value.Util.conv_error
    ]
  [@@deriving show { with_path = false }]

  let decode (msg : 'a message) (ev : Cephalopod_dasl.Stream_event.t) :
      ('a, [> error ]) result =
    let@ ectx = Error.try_with in
    let fragment =
      Cephalopod_dasl.Stream_event.type_tag ev
      |> Error.unwrap_with ectx (fun _ -> `Missing_type_tag)
    in

    let nsid = msg.nsid_of_fragment fragment in
    (let@ () = Cephalopod_dasl.Value.Util.try_with in
     msg.of_value ~type_tag:nsid ev.value)
    |> Error.unwrap_with ectx (fun e -> `Decode_error e)
end

(** Binary event *)

open Common_

type t = {
  header: Cephalopod_dasl.Value.t;
  value: Cephalopod_dasl.Value.t;
}
[@@deriving show { with_path = false }]

type decode_error = Cephalopod_dasl.Value.error_of_cbor [@@deriving show]
(* TODO: validation error? *)

let decode (data : Byte_slice.t) : (t, decode_error) result =
  let@ ectx = Error.try_with in
  let dec = Cephalopod_dasl.Cbor.Decoder.create data in
  let header = Cephalopod_dasl.Value.of_cbor dec |> Error.unwrap ectx in
  let value = Cephalopod_dasl.Value.of_cbor dec |> Error.unwrap ectx in
  { header; value }

let encode (buf : Byte_buffer.t) self : unit =
  Cephalopod_dasl.Value.to_cbor buf self.header;
  Cephalopod_dasl.Value.to_cbor buf self.value

(* TODO: decode into msg *)

type msg = Subscription.main_msg [@@deriving show]

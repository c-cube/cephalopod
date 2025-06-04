(** Binary event *)

type t = {
  header: Value.t;
  value: Value.t;
}
[@@deriving show { with_path = false }]

type decode_error = Value.error_of_cbor [@@deriving show]

let decode (data : Byte_slice.t) : (t, decode_error) result =
  let@ ectx = Error.try_with in
  let dec = Cbor.Decoder.create data in
  let header = Value.of_cbor dec |> Error.unwrap ectx in
  let value = Value.of_cbor dec |> Error.unwrap ectx in
  (* let dec_len = Cephalopod_dasl.Cbor.Decoder.offset dec in
  if dec_len < data.len then Printf.eprintf "read %d B out of %d B\n%!" dec_len data.len; *)
  { header; value }

let encode (buf : Byte_buffer.t) self : unit =
  Value.to_cbor buf self.header;
  Value.to_cbor buf self.value

let type_tag (self:t) : string =
  Value.Util.get_key "t" Value.Util.to_text self.header

(** Data prefixed by its 32 bits, little endian length *)

open struct
  module Byte_buffer = CCByte_buffer
end

(** Write buffer, prefixed by its u32LE length *)
let write_prefixed_len oc (buf : Byte_buffer.t) : unit =
  let b_len = Bytes.create 4 in
  Bytes.set_int32_le b_len 0 (Int32.of_int @@ Byte_buffer.length buf);
  output_bytes oc b_len;
  output oc buf.bs 0 buf.len

(** Read a u32LE-length prefixed item into [buf], or [false] *)
let read_prefixed_len (ic : in_channel) (buf : Byte_buffer.t) : bool =
  Byte_buffer.clear buf;
  let b_len = Bytes.create 4 in
  match really_input ic b_len 0 4 with
  | exception End_of_file -> false
  | () ->
    let len = Int32.to_int (Bytes.get_int32_le b_len 0) in
    Byte_buffer.ensure_free buf len;
    (try
       really_input ic buf.bs 0 len;
       buf.len <- len;
       true
     with End_of_file ->
       (*Logs.debug (fun k ->
           k "Invalid u32le entry (unexpected EOF when reading %dB)" len); *)
       Byte_buffer.clear buf;
       false)

open Common_

type offset = int [@@deriving eq, show]

type header = {
  version: int64;
  roots: Cid.t list;
}
[@@deriving show { with_path = false }]

open struct end

type block_data =
  | Raw of (Byte_slice.t[@printer pp_byte_slice_len])
  | DCBOR42 of Value.t
[@@deriving show { with_path = false }]

type block = {
  cid: Cid.t;
  data: block_data;
}
[@@deriving show { with_path = false }]

type t = {
  header: header;
  blocks: block list;
}
[@@deriving show { with_path = false }]

type error_decode =
  [ `InvalidHeader of string
  | `CarParseError of string * offset
  | Cid.error_decode
  | Value.error_of_cbor
  ]
[@@deriving show]

module Decode = struct
  exception E of error_decode

  let[@inline] unwrap_ (x : ('a, [< error_decode ]) result) : 'a =
    match x with
    | Ok x -> x
    | Error e -> raise (E e)

  type st = { data: Byte_slice.t } [@@unboxed]
  (** Decoding state *)

  let[@inline] create (data0 : Byte_slice.t) : st =
    { data = { data0 with bs = data0.bs } }

  let[@inline] eof (self : st) : bool = self.data.len = 0

  let next_slice_exn (self : st) : Byte_slice.t option =
    if eof self then
      None
    else (
      (* where the data slice begins *)
      let off0 = self.data.off in
      let len, n_bytes_in_len = Cephalopod_leb128.Decode.u64 self.data in
      let len = Int64.to_int len in
      Byte_slice.consume self.data (n_bytes_in_len + len);
      Some (Byte_slice.create self.data.bs ~off:(off0 + n_bytes_in_len) ~len)
    )

  let decode_header_exn offset (v : Value.t) : header =
    let l =
      match v with
      | Map l -> l
      | _ -> raise (E (`CarParseError ("Expected header to be a map", offset)))
    in

    (* version *)
    let version =
      match List.assoc "version" l with
      | Int i -> i
      | _ -> raise (E (`CarParseError ("Invalid `version` in header", offset)))
      | exception _ ->
        raise (E (`CarParseError ("Version not found in header", offset)))
    in

    let roots =
      match List.assoc "roots" l with
      | Array l ->
        List.map
          (function
            | Value.Cid c -> c
            | _ ->
              raise
                (E (`CarParseError ("Roots must be composed of CIDs", offset))))
          l
      | _ -> raise (E (`CarParseError ("Invalid `roots` in header", offset)))
      | exception _ ->
        raise (E (`CarParseError ("Roots not found in header", offset)))
    in
    { version; roots }

  let decode_block_exn (data : Byte_slice.t) : (block, [> error_decode ]) result
      =
    let@ ectx = Error.try_with in
    if data.len < Cid.size_encoded then
      Error.fail ectx
        (`CarParseError ("block is too short to contain a CID", data.off));
    let cid =
      Cid.decode_binary { data with len = Cid.size_encoded } |> unwrap_
    in
    let data =
      match cid.codec with
      | Raw ->
        Raw (Byte_slice.sub data Cid.size_encoded (data.len - Cid.size_encoded))
      | DCBOR42 ->
        let v =
          Value.parse_cbor_str
            ~off:(data.off + Cid.size_encoded)
            ~len:(data.len - Cid.size_encoded)
            (Bytes.unsafe_to_string data.bs)
          |> Error.unwrap ectx
        in
        DCBOR42 v
    in
    { cid; data }
end

let decode_string (str : string) : (t, [> error_decode ]) result =
  try
    let@ ectx = Error.try_with in
    let dec : Decode.st = Decode.create @@ Byte_slice.unsafe_of_string str in
    let header =
      match Decode.next_slice_exn dec with
      | None -> Error.fail ectx (`InvalidHeader "missing header")
      | Some data ->
        let v =
          Value.parse_cbor_str ~off:data.off ~len:data.len
            (Bytes.unsafe_to_string data.bs)
          |> Error.unwrap ectx
        in
        (* Format.printf "header: %a (off=%d, len=%d)@." Value.pp v data.off data.len; *)
        Decode.decode_header_exn data.off v
    in

    let rec read_blocks acc =
      match Decode.next_slice_exn dec with
      | None -> List.rev acc
      | Some block ->
        let block = Decode.decode_block_exn block |> Error.unwrap ectx in
        read_blocks (block :: acc)
    in

    let blocks = read_blocks [] in
    { header; blocks }
  with Decode.E err -> Error err

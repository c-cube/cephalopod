let size_hash = Sha256.size_hash
let size_encoded : int = Sha256.size_hash + 4

type t = {
  codec: Codec.t;
  hash: Sha256.t;  (** len=size_hash *)
}
[@@deriving eq, show { with_path = false }]

type error_decode =
  [ `CidParseError of string
  | `Base32Error of string
  | Codec.error
  ]
[@@deriving show]

open struct
  let fail_decode ectx msg = Error.fail ectx (`CidParseError msg)
end

let decode_binary (bs : Byte_slice.t) : (t, [> error_decode ]) result =
  let@ ectx = Error.try_with in
  if bs.len <> size_encoded then fail_decode ectx "CID length is wrong";

  let version = Bytes.get bs.bs bs.off in
  if Char.code version <> 1 then fail_decode ectx "Expected version to be 1";

  let codec =
    Bytes.get bs.bs (bs.off + 1) |> Codec.of_hex |> Error.unwrap ectx
  in

  let hash_type = Bytes.get bs.bs (bs.off + 2) in
  if Char.code hash_type <> 0x12 then
    fail_decode ectx "Expected hash type to be SHA256";

  let len, n_bytes_in_len =
    try Cephalopod_leb128.Decode.u64 bs 3
    with _ -> fail_decode ectx "Could not read LEB128 length"
  in
  if len <> Int64.of_int Sha256.size_hash then
    fail_decode ectx
    @@ spf "Expected length to be 32 (hash is SHA256), got %Ld instead" len;

  let hash =
    Bytes.sub_string bs.bs (bs.off + 3 + n_bytes_in_len) Sha256.size_hash
    |> Sha256.Private_.make
  in

  { codec; hash }

let[@inline] decode_binary_str str : (t, _) result =
  decode_binary (Byte_slice.unsafe_of_string str)

let encode_binary (self : t) : string =
  let bs = Bytes.create size_encoded in
  Bytes.set bs 0 (Char.chr 1);
  Bytes.set bs 1 (Codec.to_hex self.codec);
  Bytes.set bs 2 (Char.chr 0x12) (* hash *);
  assert (String.length (self.hash :> string) = Sha256.size_hash);
  Bytes.set bs 3 (Char.chr size_hash);
  Bytes.blit_string (self.hash :> string) 0 bs 4 Sha256.size_hash;
  Bytes.unsafe_to_string bs

let alphabet = Base32.make_alphabet "abcdefghijklmnopqrstuvwxyz234567"

let decode_text (str : string) : (t, [> error_decode ]) result =
  let@ ectx = Error.try_with in
  if String.length str = 0 then Error.fail ectx (`CidParseError "Empty string");

  let c0 = String.get str 0 in
  if c0 <> 'b' then Error.fail ectx (`CidParseError "CID must start with 'b'");

  let bin : string =
    match Base32.decode ~alphabet str ~off:1 with
    | Ok s -> s
    | Error (`Msg m) -> Error.fail ectx (`Base32Error m)
  in
  decode_binary_str bin |> Error.unwrap ectx

let encode_text (self : t) : string =
  let bin = encode_binary self in
  let bin_base32 = Base32.encode_exn ~pad:false ~alphabet bin in
  "b" ^ bin_base32

let[@inline] to_yojson (self : t) : Json.t =
  `Assoc [ "$link", `String (encode_text self) ]

let of_yojson (j : Json.t) : (t, string) result =
  try
    let l = Json.Util.to_assoc j in
    let str = Json.Util.to_string @@ List.assoc "$link" l in
    decode_text str |> Result.map_error show_error_decode
  with _ -> Error "invalid CID"

(** A constant dummy CID used for tests and allocations.*)
let dummy : t =
  {
    codec = Codec.Raw;
    hash =
      Sha256.Private_.make
      @@ String.init Sha256.size_hash (fun i ->
             Char.chr (Char.code '1' + (i lsr 3)));
  }

let new_compute_hash codec (data : Byte_slice.t) : t =
  let hash = Sha256.hash_slice data in
  { codec; hash }

let new_from_raw_data (data : Byte_slice.t) : t =
  { codec = Raw; hash = Sha256.hash_slice data }

let new_from_raw_data_str (data : string) : t =
  { codec = Raw; hash = Sha256.hash_string data }

(* TODO: parse the text format, with base32 *)

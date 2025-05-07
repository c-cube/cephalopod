let size_hash = Sha256.size_hash
let size_encoded : int = Sha256.size_hash + 4

type t = {
  codec: Codec.t;
  hash: Sha256.t;  (** len=size_hash *)
}
[@@deriving eq, show { with_path = false }]

type error_decode =
  [ `CidParseError of string
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

let encode_binary (self : t) : string =
  let bs = Bytes.create size_encoded in
  Bytes.set bs 0 (Char.chr 1);
  Bytes.set bs 1 (Codec.to_hex self.codec);
  Bytes.set bs 2 (Char.chr 0x12) (* hash *);
  assert (String.length (self.hash :> string) = Sha256.size_hash);
  Bytes.set bs 3 (Char.chr size_hash);
  Bytes.blit_string (self.hash :> string) 0 bs 4 Sha256.size_hash;
  Bytes.unsafe_to_string bs

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

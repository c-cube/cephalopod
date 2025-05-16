type token =
  | Null
  | Undefined
  | Bool of bool
  | Int of int64
  | Bytes of Byte_slice.t
  | Text of Byte_slice.t
  | Array of int
  | Map of int
  | Tag of int
[@@deriving show { with_path = false }]

open struct
  let[@inline] i64_to_int i =
    let j = Int64.to_int i in
    if Int64.(of_int j = i) then
      j
    else
      failwith "int64 does not fit in int"
end

module Decoder = struct
  exception Error of string * int

  type t = { data: Byte_slice.t } [@@unboxed]

  let fail (self : t) msg : _ = raise (Error (msg, self.data.off))
  let offset self = self.data.off

  let create (data : Byte_slice.t) : t =
    { data = { data with Byte_slice.off = data.off } }

  let of_string ?off ?len str : t =
    create @@ Byte_slice.unsafe_of_string ?off ?len str

  exception EOF

  let[@inline] read_i8 (self : t) =
    let c = Char.code (Bytes.get self.data.bs self.data.off) in
    Byte_slice.consume self.data 1;
    c

  let[@inline] read_i16 (self : t) =
    let c = Bytes.get_uint16_be self.data.bs self.data.off in
    Byte_slice.consume self.data 2;
    c

  let[@inline] read_i32 (self : t) =
    let c = Bytes.get_int32_be self.data.bs self.data.off in
    Byte_slice.consume self.data 4;
    c

  let[@inline] read_i64 (self : t) =
    let c = Bytes.get_int64_be self.data.bs self.data.off in
    Byte_slice.consume self.data 8;
    c

  (* read integer value from least significant bits *)
  let read_int (self : t) low : int64 =
    match low with
    | _ when low < 0 -> fail self " invalid length"
    | _ when low < 24 -> Int64.of_int low
    | 24 -> Int64.of_int (read_i8 self)
    | 25 -> Int64.of_int (read_i16 self)
    | 26 -> Int64.of_int32 (read_i32 self)
    | 27 -> read_i64 self
    | 28 | 29 | 30 -> fail self " invalid length"
    | 31 -> fail self "invalid integer 31 in this context"
    | _ -> assert false

  let read_bytes self low =
    let len = read_int self low |> i64_to_int in
    let res = Byte_slice.sub self.data 0 len in
    Byte_slice.consume self.data len;
    res

  let next (self : t) : token =
    let c = read_i8 self in
    let high = (c land 0b111_00000) lsr 5 in
    let low = c land 0b000_11111 in
    match high with
    | 0 -> Int (read_int self low)
    | 1 ->
      let i = read_int self low in
      Int Int64.(sub minus_one i)
    | 2 ->
      let s = read_bytes self low in
      Bytes s
    | 3 ->
      let s = read_bytes self low in
      Text s
    | 4 ->
      let len = read_int self low |> i64_to_int in
      Array len
    | 5 ->
      let len = read_int self low |> i64_to_int in
      Map len
    | 6 ->
      let tag = read_int self low |> i64_to_int in
      Tag tag
    | 7 ->
      (* simple or float,
         https://www.rfc-editor.org/rfc/rfc8949.html#fpnocont *)
      (match low with
      | 20 -> Bool false
      | 21 -> Bool true
      | 22 -> Null
      | 23 -> Undefined
      | _ when low <= 24 -> fail self "simple value not supported"
      | 25 | 26 | 27 -> fail self "float not supported"
      | 28 | 29 | 30 -> fail self "malformed"
      | 31 -> fail self "uncaught 'break' stop code"
      | _ -> assert false (* unreachable *))
    | _ ->
      (* unreachable *)
      assert false
end

module Encoder = struct
  let[@inline] add_byte (buf : Buffer.t) (high : int) (low : int) =
    let i = (high lsl 5) lor low in
    assert (i land 0xff == i);
    Buffer.add_char buf (Char.unsafe_chr i)

  (* add unsigned integer, including first tag byte *)
  let add_uint buf (high : int) (x : int64) =
    assert (x >= 0L);
    if x < 24L then
      add_byte buf high (i64_to_int x)
    else if x <= 0xffL then (
      add_byte buf high 24;
      Buffer.add_char buf (Char.unsafe_chr (i64_to_int x))
    ) else if x <= 0xff_ffL then (
      add_byte buf high 25;
      Buffer.add_uint16_be buf (i64_to_int x)
    ) else if x <= 0xff_ff_ff_ffL then (
      add_byte buf high 26;
      Buffer.add_int32_be buf (Int64.to_int32 x)
    ) else (
      add_byte buf high 27;
      Buffer.add_int64_be buf x
    )

  let push (buf : Buffer.t) (t : token) : unit =
    match t with
    | Bool false -> add_byte buf 7 20
    | Bool true -> add_byte buf 7 21
    | Null -> add_byte buf 7 22
    | Undefined -> add_byte buf 7 23
    | Array len -> add_uint buf 4 (Int64.of_int len)
    | Map len -> add_uint buf 5 (Int64.of_int len)
    | Text s ->
      add_uint buf 3 (Int64.of_int s.len);
      Buffer.add_subbytes buf s.bs s.off s.len
    | Bytes s ->
      add_uint buf 2 (Int64.of_int s.len);
      Buffer.add_subbytes buf s.bs s.off s.len
    | Tag t -> add_uint buf 6 (Int64.of_int t)
    | Int i ->
      if i >= Int64.zero then
        add_uint buf 0 i
      else if Int64.add Int64.min_int 2L > i then (
        (* large negative int, be careful. encode [(-i)-1] via int64. *)
        add_byte buf 1 27;
        Buffer.add_int64_be buf Int64.(neg (add 1L i))
      ) else
        add_uint buf 1 Int64.(sub (neg i) one)
end

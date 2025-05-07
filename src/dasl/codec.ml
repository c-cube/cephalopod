type t =
  | Raw
  | DCBOR42
[@@deriving eq, show { with_path = false }]

let[@inline] to_hex (self : t) : char =
  match self with
  | Raw -> Char.chr 0x55
  | DCBOR42 -> Char.chr 0x71

type error = [ `CodecParseError of char ] [@@deriving show]

let[@inline] of_hex (c : char) : (t, [> error ]) result =
  match Char.code c with
  | 0x55 -> Ok Raw
  | 0x71 -> Ok DCBOR42
  | _ -> Error (`CodecParseError c)

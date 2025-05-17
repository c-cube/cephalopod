let pp_str_len out s = Format.fprintf out "<data (%d B)>" (String.length s)

let pp_byte_slice_len out (s : Byte_slice.t) =
  Format.fprintf out "<data (%d B)>" s.len

let pp_str_len out s = Format.fprintf out "<data (%dB)>" (String.length s)

let pp_byte_slice_len out (s : Byte_slice.t) =
  Format.fprintf out "<data (%dB)>" s.len

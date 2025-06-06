let size_hash : int = 32

type t = string [@@deriving eq, ord]

let to_hex = CCString.to_hex
let show : t -> string = CCString.to_hex
let pp = CCFormat.of_to_string show

let hash_string (str : string) : t =
  let module H = Digestif.SHA256 in
  H.digest_string str |> H.to_raw_string

let hash_slice (data : Byte_slice.t) : t =
  let module H = Digestif.SHA256 in
  let ctx = H.init () in
  let ctx = H.feed_bytes ctx ~off:data.off ~len:data.len data.bs in
  let hash = H.get ctx in
  H.to_raw_string hash

module Private_ = struct
  let make s : t =
    assert (String.length s = size_hash);
    s
end

open Cephalopod_dasl

type t = [ `Conv_error of Value.Util.conv_error ]
[@@deriving show { with_path = false }]

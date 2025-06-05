type decode_stream_error =
  [ `Msg of string
  | `Missing_type_tag
  | `Decode_error of Cephalopod_dasl.Value.Util.conv_error
  ]
[@@deriving show { with_path = false }]

let decode_stream_event (msg : 'a Base.message)
    (ev : Cephalopod_dasl.Stream_event.t) :
    ('a, [> decode_stream_error ]) result =
  let@ ectx = Error.try_with in
  let fragment =
    Cephalopod_dasl.Stream_event.type_tag ev
    |> Error.unwrap_with ectx (fun _ -> `Missing_type_tag)
  in

  let nsid = msg.nsid_of_fragment fragment in
  (let@ () = Cephalopod_dasl.Value.Util.try_with in
   msg.of_value ~type_tag:nsid ev.value)
  |> Error.unwrap_with ectx (fun e -> `Decode_error e)

type error =
  [ Cephalopod_dasl.Stream_event.decode_error
  | decode_stream_error
  ]
[@@deriving show]

let decode_bytes (msg : 'a Base.message) (data : Byte_slice.t) :
    ('a, [> error ]) result =
  let open CCResult.Infix in
  let* ev = Cephalopod_dasl.Stream_event.decode data in
  decode_stream_event msg ev

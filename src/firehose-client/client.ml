open Common_

open struct
  let pp_buf out (b : Byte_buffer.t) = Format.fprintf out "<data (%d B)>" b.len
end

type connect_error = [ `WS_error of string ] [@@deriving show]

type event =
  | E_received of (Byte_buffer.t[@printer pp_buf])
  | E_closed
[@@deriving show { with_path = false }]

type inner = {
  connected: bool Atomic.t; [@printer fun out b -> Fmt.bool out (Atomic.get b)]
  ws_conn: Piaf.Ws.Descriptor.t; [@opaque]
  ws_uri: Uri.t;
  sw: Eio.Switch.t; [@opaque]
  client: Piaf.Client.t; [@opaque]
  on_event: event -> unit;
}
[@@deriving show { with_path = false }]

type t = {
  inner: inner;
  fiber: unit Eio.Promise.or_exn; [@opaque]
}
[@@deriving show { with_path = false }]

let read_iovec (buf : Byte_buffer.t) (iovec : _ Httpun_types.IOVec.t) : unit =
  Byte_buffer.ensure_free buf iovec.len;
  Bigstringaf.blit_to_bytes iovec.buffer ~src_off:iovec.off buf.bs
    ~dst_off:buf.len ~len:iovec.len;
  buf.len <- buf.len + iovec.len;
  ()

let read_loop (self : inner) () : unit =
  let msg_stream = Piaf.Ws.Descriptor.messages self.ws_conn in

  let buf = Byte_buffer.create ~cap:256 () in
  while Atomic.get self.connected do
    Eio.Switch.check self.sw;

    match Piaf_stream.take msg_stream with
    | None ->
      Atomic.set self.connected false;
      self.on_event E_closed
    | Some (`Binary, iovec) ->
      Byte_buffer.clear buf;
      read_iovec buf iovec;
      Log.debug (fun k -> k "got buffer of len=%d" (Byte_buffer.length buf));
      self.on_event (E_received buf)
    | Some (op, _iovecs) ->
      Log.debug (fun k ->
          k "got WS opcode %a" Httpun_ws.Websocket.Opcode.pp_hum op)
  done;
  ()

let create ~sw ~stdenv ~ws_uri ~on_event () : (t, connect_error) result =
  let stdenv = (stdenv :> Eio_unix.Stdenv.base) in
  let@ ectx = Error.try_with in

  let client =
    let config =
      Piaf.Config.
        { default with max_http_version = Piaf.Versions.HTTP.HTTP_1_1 }
    in
    match Piaf.Client.create ~config ~sw stdenv ws_uri with
    | Ok c -> c
    | Error err ->
      Error.fail ectx
        (`WS_error (Fmt.asprintf "connection error: %a" Piaf.Error.pp_hum err))
  in

  let ws_conn =
    match Piaf.Client.ws_upgrade client (Uri.to_string ws_uri) with
    | Ok c -> c
    | Error err ->
      Error.fail ectx
        (`WS_error (Fmt.asprintf "WS upgrade error: %a" Piaf.Error.pp_hum err))
  in

  let inner =
    { ws_uri; ws_conn; sw; connected = Atomic.make true; client; on_event }
  in
  let fiber = Eio.Fiber.fork_promise ~sw (read_loop inner) in
  let st = { inner; fiber } in

  st

let await (self : t) = Eio.Promise.await_exn self.fiber

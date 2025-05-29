type connect_error = [ `WS_error of string ] [@@deriving show]

type event =
  | E_received of (Byte_buffer.t[@printer pp_buf])
  | E_closed
[@@deriving show]

type t [@@deriving show]
(** The main client *)

val create :
  sw:Eio.Switch.t ->
  stdenv:< Eio_unix.Stdenv.base ; .. > ->
  ws_uri:Uri.t ->
  on_event:(event -> unit) ->
  unit ->
  (t, connect_error) result

val await : t -> unit
val shutdown : t -> unit

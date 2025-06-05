type connect_error = [ `WS_error of string ] [@@deriving show]

(** Raw event *)
type event =
  | E_received of (Byte_buffer.t[@printer pp_buf])
  | E_closed
[@@deriving show]

type t [@@deriving show]
(** The main client *)

val on_event : t -> event Observer.t

val create :
  sw:Eio.Switch.t ->
  stdenv:< Eio_unix.Stdenv.base ; .. > ->
  ws_uri:Uri.t ->
  unit ->
  (t, connect_error) result

val await : t -> unit
val shutdown : t -> unit

(** Higher-level events, decoding the messages *)
module Msg_event : sig
  type error = Cephalopod_xrpc.Decode_msg.error [@@deriving show]

  type 'a t =
    | E_msg of 'a
    | E_closed
    | E_error of error
  [@@deriving show]

  val of_event : msg:'a Cephalopod_xrpc.Base.message -> event -> 'a t
end

module Subscribe : sig
  type handle

  val subscribe :
    msg:'a Cephalopod_xrpc.Base.message ->
    on_msg_event:('a Msg_event.t -> unit) ->
    t ->
    handle

  val unsubscribe : t -> handle -> unit
end

(** Observer, to subscribe to some events. *)

type 'a t
(** Observer of events of type ['a] *)

val create : unit -> 'a t
val emit : 'a t -> 'a -> unit

val emit_lazy : 'a t -> (unit -> 'a) -> unit
(** [emit_lazy obs f] emits the result of [f()], but only calls [f()] if there's
    at least one observer to be notified. *)

type handle

exception Unsubscribe

val subscribe : 'a t -> ('a -> unit) -> handle
(** Subscribe to the events. The callback can raise [Unsubscribe] to remove
    itself. *)

val subscribe' : 'a t -> ('a -> unit) -> unit
(** Subscribe to the events. The callback can raise [Unsubscribe] to remove
    itself. *)

val unsubscribe : _ t -> handle -> unit

val n_subscribers : _ t -> int
(** Current number of subscribers *)

val has_subscribers : _ t -> bool
(** Is there any subscriber? *)

val forward : 'a t -> 'a t -> unit
(** [forward o1 o2] subscribes to [o1] and forwards all events to [o2]. *)

val with_subscribe : 'a t -> ('a -> unit) -> (unit -> 'ret) -> 'ret
(** [with_subscribe obs cb f] subscribes [cb] to [obs], calls [f()], and when
    [f()] is done or has raised, it unsubscribes [cb]. *)

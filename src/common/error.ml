type 'e ectx = { raise: 'a. 'e -> 'a } [@@unboxed]
(** Error context, used to raise errors *)

let[@inline] fail (u : 'err ectx) (e : 'err) : 'a = u.raise e

(** Unwrap a result *)
let[@inline] unwrap (u : 'err ectx) (res : ('a, 'err) result) : 'a =
  match res with
  | Ok x -> x
  | Error err -> u.raise err

let unwrap_with (u : 'err2 ectx) (f : 'err -> 'err2) (res : ('a, 'err) result) :
    'a =
  match res with
  | Ok x -> x
  | Error err -> u.raise @@ f err

let[@inline] try_with (type e) (f : e ectx -> 'a) : ('a, e) result =
  let exception Err of e in
  try Ok (f { raise = (fun e -> raise (Err e)) }) with Err e -> Error e

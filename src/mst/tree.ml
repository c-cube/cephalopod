(** A concrete tree representation for the MST *)

open Cephalopod_dasl

type record =
  | R :
      'r Cephalopod_xrpc.Base.record_def * 'r Cephalopod_xrpc.Base.record
      -> record

let pp_record out (R (def, r)) =
  Fmt.fprintf out "<@[record key=%S@ v=%a@]>" r.key def.record.pp r.value

let show_record = Fmt.to_string pp_record

type t =
  | Node of {
      cid: Cid.t;
      n: Node.t;
      l: t option;
      e: entry list;
    }
  | Record of record
  | Raw_record of {
      type_: string;
      r: Value.t;
    }

and entry = {
  entry: Entry.t;
  key: string;
  v: t;
  t: t option;
}
[@@deriving show { with_path = false }]

type of_car_error =
  [ `Missing_cid of Cid.t
  | `Cid_is_for_raw_data of Cid.t
  | Decode_error.t
  ]
[@@deriving show { with_path = false }]

let of_car (car : Car.t) ~(root : Cid.t) : (t, [> of_car_error ]) result =
  let@ ectx = Error.try_with in

  let blocks_map : Car.block Cid.Map.t =
    List.fold_left
      (fun map b -> Cid.Map.add b.Car.cid b map)
      Cid.Map.empty car.blocks
  in

  let rec conv cid : t =
    match Cid.Map.find_opt cid blocks_map with
    | None -> Error.fail ectx (`Missing_cid cid)
    | Some { cid = _; data = Car.Raw _ } ->
      Error.fail ectx (`Cid_is_for_raw_data cid)
    | Some { cid = _; data = Car.DCBOR42 v } ->
      (match Value.Util.get_type_key_exn v with
      | type_ -> Raw_record { type_; r = v }
      | exception _ ->
        let n = Node.of_value v |> Error.unwrap ectx in
        Node { cid; n; l = Option.map conv n.l; e = List.map conv_entry n.e })
  and conv_entry (e : Entry.t) : entry =
    (* TODO: do the key! keep parent key, use [p] bytes of it + [k] *)
    { entry = e; key = "TODO"; v = conv e.v; t = Option.map conv e.t }
  in
  conv root

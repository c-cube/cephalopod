open Cephalopod_dasl

open struct
  module MST = Cephalopod_mst
  module PB = PrintBox

  let spf = Printf.sprintf

  let record_ ?pad ?bars l : PB.t =
    PB.grid_l ?pad ?bars
    @@ List.map PB.(fun (k, v) -> [ text_with_style Style.bold (k ^ ":"); v ]) l
end

let rec node_to_pb (t : MST.Tree.t) : PB.t =
  match t with
  | MST.Tree.Record r -> PB.(frame @@ text (MST.Tree.show_record r))
  | MST.Tree.Raw_record { type_; r } ->
    PB.(
      frame
      @@ vlist ~bars:false
           [
             text "record";
             record_ ~bars:false
               [
                 "$type", hpad 1 @@ text type_;
                 "r", hpad 1 @@ text (Value.show r);
               ];
           ])
  | MST.Tree.Node { cid; n = _; l; e } ->
    let left_child =
      match l with
      | None -> []
      | Some l -> [ node_to_pb l ]
    in
    let children = left_child @ List.map entry_to_pb e in
    PB.tree (PB.text @@ spf "node cid=%s" (Cid.encode_text cid)) children

and entry_to_pb (e : MST.Tree.entry) : PB.t =
  let open PB in
  let fields =
    [
      "p", hpad 1 @@ text (Int64.to_string e.entry.p);
      "k", hpad 1 @@ text e.entry.k;
      "key", hpad 1 @@ text e.key;
      "v", hpad 1 @@ node_to_pb e.v;
    ]
  in
  match e.t with
  | None -> record_ ~bars:false fields
  | Some t -> tree (record_ ~bars:false fields) [ node_to_pb t ]

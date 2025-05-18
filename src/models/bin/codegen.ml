module Lex = Cephalopod_lexicon
module A = Lex.Ast
module Fmt = CCFormat
module Str_map = Map.Make (String)

open struct
  type 'a iter = ('a -> unit) -> unit

  let ( let@ ) = ( @@ )
  let spf = Printf.sprintf
  let debug = ref false
  let log_ msg = if !debug then Printf.eprintf "%s\n%!" msg
  let logf msg = Printf.ksprintf log_ msg
end

module Dep_graph_for_types = struct
  module RefTbl = CCHashtbl.Make (struct
    type t = A.ref

    let equal = A.equal_ref
    let hash = Hashtbl.hash
  end)

  type node = {
    ref: A.ref;
    def: A.def;
    deps_on: A.ref list;
  }

  type t = { nodes: node RefTbl.t (* object or type only *) }

  let pp out (self : t) =
    let pp_node out n =
      Format.fprintf out "@[<2>%a ->@ %a@]" A.pp_ref n.ref
        (Fmt.Dump.list A.pp_ref) n.deps_on
    in
    Format.fprintf out "@[<v>@[<v2>dep_graph {@,%a@,@]@}@]" (Fmt.iter pp_node)
      (RefTbl.values self.nodes)

  let build (lex_l : A.lexicon list) : t =
    let self = { nodes = RefTbl.create 32 } in
    let handle_def ~lexicon_id (d_name, (d : A.def)) =
      A.iter_refs_def d (fun r -> if r.name = "" then r.name <- lexicon_id);
      match d with
      | Type _ | Object _ ->
        let d_ref = { A.name = lexicon_id; fragment = d_name } in
        let deps_on = ref [] in
        A.iter_refs_def d (fun r -> deps_on := r :: !deps_on);
        let node = { ref = d_ref; def = d; deps_on = !deps_on } in
        assert (not (RefTbl.mem self.nodes d_ref));
        RefTbl.add self.nodes d_ref node
      | Query _ | Procedure _ | Record _ | Subscription _ -> ()
    in
    List.iter
      (fun (lex : A.lexicon) ->
        List.iter (handle_def ~lexicon_id:lex.id) lex.defs)
      lex_l;
    self

  module NodeTbl = CCHashtbl.Make (struct
    type t = node

    let equal a b = A.equal_ref a.ref b.ref
    let hash a = Hashtbl.hash a.ref
  end)

  let to_scc (self : t) : (A.ref * A.def) list list =
    let nodes = RefTbl.values_list self.nodes in
    Containers_scc.scc
      ~tbl:(module NodeTbl)
      ~graph:self
      ~children:(fun self n yield ->
        List.iter
          (fun ref2 ->
            yield
              (try RefTbl.find self.nodes ref2 with Not_found -> assert false))
          n.deps_on)
      ~nodes ()
    |> List.rev_map (List.map (fun n -> n.ref, n.def))
end

module Sort_lexicons = struct
  module Tbl = Hashtbl.Make (struct
    type t = A.lexicon

    let equal a b = a.A.id = b.A.id
    let hash a = Hashtbl.hash a.A.id
  end)

  (** Find dependencies of [lex] *)
  let deps_of_lex (lex : A.lexicon) : string iter =
   fun yield ->
    A.iter_refs_lexicon lex (fun (r : A.ref) ->
        if r.name <> "" then yield r.name)

  let find_lex lex_map name =
    try Str_map.find name lex_map
    with Not_found -> failwith (spf "Unresolved reference to %S" name)

  let sort (lex : A.lexicon list) : A.lexicon list list =
    let lex_map =
      Str_map.of_list @@ List.map (fun (lex : A.lexicon) -> lex.id, lex) lex
    in
    Containers_scc.scc
      ~tbl:(module Tbl)
      ~graph:lex_map
      ~children:(fun lex_map (lex : A.lexicon) ->
        fun yield -> deps_of_lex lex (fun name -> yield (find_lex lex_map name)))
      ~nodes:lex ()
end

module Codegen = struct
  let spf = Printf.sprintf
  let bpf = Printf.bprintf
  let fpf = Printf.fprintf
  let split_id (s : string) : string list = CCString.Split.list_cpy ~by:"." s

  let mod_name s =
    s |> split_id |> List.map String.capitalize_ascii |> String.concat "_"

  let remove_keyword s =
    if List.mem s [ "val"; "type"; "end"; "sig"; "external"; "struct" ] then
      spf "%s_" s
    else
      s

  let field_name s = String.lowercase_ascii s |> remove_keyword

  let val_name_of_ref (ref : A.ref) : string =
    spf "%s_%s"
      (split_id ref.name |> List.map String.lowercase_ascii |> String.concat "_")
      (String.lowercase_ascii ref.fragment)

  let cstor_name_of_ref (ref : A.ref) : string =
    String.capitalize_ascii @@ val_name_of_ref ref

  type out = Buffer.t

  let rec gen_ty ~(inside : A.ref) (out : out) (ty : A.ty) : unit =
    let recurse out ty = gen_ty ~inside out ty in
    match ty.view with
    | A.Null -> bpf out "unit"
    | A.Unknown -> bpf out "Value.t (* unknown *)"
    | A.Boolean _ -> bpf out "bool"
    | A.Int _ -> bpf out "int64"
    | A.Token | A.Object { properties = []; _ } ->
      bpf out "[`%s]" (cstor_name_of_ref inside)
    | A.String _ -> bpf out "string"
    | A.Bytes _ -> bpf out "bytes"
    | A.CidLink -> bpf out "Cid.t"
    | A.Ref { ref; raw = _ } -> bpf out "%s" (val_name_of_ref ref)
    | A.Blob _ -> bpf out "Blob.t"
    | A.Array { items; _ } -> bpf out "%a list" recurse items
    | A.Object { required; nullable; properties } ->
      bpf out "{\n";
      List.iter
        (fun (k, ty) ->
          let required =
            match required, nullable with
            | Some r, _ when List.mem k r -> true
            | _, Some n when List.mem k n -> false
            | Some _, _ -> false
            | None, _ -> true
          in
          let option_suffix =
            if required then
              ""
            else
              " option"
          in
          bpf out "    %s: %a%s;\n" (field_name k) recurse ty option_suffix)
        properties;
      bpf out "  }"
    | A.Union { refs; closed } ->
      bpf out "[\n";
      List.iter
        (fun (r : A.ref) ->
          let cstor = cstor_name_of_ref r in
          bpf out "    | `%s of %s\n" cstor (val_name_of_ref r))
        refs;
      if not closed then
        bpf out "    | `Other of Value.t (** Non closed union *)\n";
      bpf out "    ]";
      ()

  let gen_object (out : out) ((ref, o) : A.ref * A.object_) : unit =
    bpf out "%s = %a" (val_name_of_ref ref) (gen_ty ~inside:ref)
      { description = None; view = Object o }

  let gen_ty_def (out : out) ((ref, ty) : A.ref * A.ty) : unit =
    bpf out "%s = %a" (val_name_of_ref ref) (gen_ty ~inside:ref) ty

  let gen_def_type (out : out) ((ref, def) : A.ref * A.def) : unit =
    match def with
    | A.Object o -> gen_object out (ref, o)
    | A.Type ty -> gen_ty_def out (ref, ty)
    | A.Query _ | A.Procedure _ | A.Record _ | A.Subscription _ ->
      bpf out "%s = [`Todo] (* TODO *)\n" (val_name_of_ref ref)

  let gen_type_clique (oc : out_channel) (clique : (A.ref * A.def) list) : unit
      =
    let out = Buffer.create 32 in
    List.iteri
      (fun i (ref, def) ->
        bpf out "  (** def %s *)\n" (A.show_ref ref);
        if i = 0 then
          bpf out "  type "
        else
          bpf out "  and ";
        gen_def_type out (ref, def);
        bpf out "\n\n")
      clique;
    Buffer.output_buffer oc out

  let gen_def_in_mod (out : out) ((ref, def) : A.ref * A.def) : unit =
    let name = String.lowercase_ascii ref.fragment |> remove_keyword in
    match def with
    | A.Type ({ view = Object { properties = _ :: _; _ }; _ } as ty) ->
      (* alias and redefine *)
      bpf out "nonrec %s = %s = %a" name (val_name_of_ref ref)
        (gen_ty ~inside:ref) ty
    | A.Object ({ properties = _ :: _; _ } as o) ->
      (* alias and redefine *)
      bpf out "nonrec %s = %s = %a" name (val_name_of_ref ref)
        (gen_ty ~inside:ref)
        { A.description = None; view = Object o }
    | A.Type _ | A.Object _ ->
      (* alias to the real definition *)
      bpf out "nonrec %s = %s" name (val_name_of_ref ref)
    | A.Query _ | A.Procedure _ | A.Record _ | A.Subscription _ ->
      bpf out "%s = [`Todo] (* TODO *)\n" name

  let gen_lex (oc : out_channel) (lex : A.lexicon) : unit =
    let out = Buffer.create 32 in

    let gen_def_in_lex out (def_name, def) =
      let ref = A.{ name = lex.id; fragment = def_name } in
      bpf out "  (** def %s *)\n" def_name;
      bpf out "  type ";
      gen_def_in_mod out (ref, def);
      bpf out "\n\n"
    in

    List.iter (gen_def_in_lex out) lex.defs;

    fpf oc "(** lexicon %s\n" lex.id;
    Option.iter (fpf oc "  %s\n") lex.description;
    fpf oc "  *)\n";
    fpf oc "\nmodule %s = struct\n" (mod_name lex.id);
    Buffer.output_buffer oc out;
    fpf oc "end\n\n";
    ()

  let prelude =
    {|(* geherated by Cephalopod_lexicon's codegen tool, do not modify *)
open Cephalopod_dasl

|}

  let run (oc : out_channel) (lex_l : Lex.Ast.lexicon list) : unit =
    let dep_graph = Dep_graph_for_types.build lex_l in
    if !debug then
      Fmt.eprintf "dep graph:@.%a@." Dep_graph_for_types.pp dep_graph;

    (* definitions in a dependency order, so we can emit types *)
    let types_scc = Dep_graph_for_types.to_scc dep_graph in
    if !debug then
      Fmt.eprintf "cliques:@.%a@."
        Fmt.Dump.(list (list (A.pp_ref |> Fmt.map fst)))
        types_scc;

    fpf oc "%s\n" prelude;

    fpf oc "(** Type definitions *)\n";
    fpf oc "module Types = struct\n";
    List.iter (gen_type_clique oc) types_scc;
    fpf oc "end\n\n";

    (* open types for the rest of the code *)
    fpf oc "\n\nopen Types\n\n";

    (* lexicons in {e mostly} dependency order (flatten the cliques) *)
    let lex_l = Sort_lexicons.sort lex_l |> List.flatten in
    List.iter (gen_lex oc) lex_l
end

let parse file : Lex.Ast.lexicon =
  logf "parsing %S" file;
  let j = Yojson.Safe.from_file ~fname:file file in

  match Lex.Ast.lexicon_of_yojson j with
  | Ok lex -> lex
  | Error err ->
    Format.eprintf "error when parsing %S: %s@." file err;
    exit 1

let () =
  let files = ref [] in
  let out = ref "" in
  let opts =
    [ "-d", Arg.Set debug, " debug"; "-o", Arg.Set_string out, " output file" ]
    |> Arg.align
  in
  Arg.parse opts (fun f -> files := f :: !files) "";
  if !out = "" then failwith "need -o";

  let files = CCList.flat_map CCIO.File.walk_l !files in
  let json_files =
    CCList.filter_map
      (function
        | `File, file when Filename.extension file = ".json" -> Some file
        | _ -> None)
      files
    |> List.sort String.compare
  in

  let lex = List.map parse json_files in
  let@ oc = CCIO.with_out !out in
  Codegen.run oc lex

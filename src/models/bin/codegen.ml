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

  let field_name s = String.uncapitalize_ascii s |> remove_keyword

  let val_name_of_ref (ref : A.ref) : string =
    spf "%s_%s"
      (split_id ref.name |> List.map String.lowercase_ascii |> String.concat "_")
      (String.lowercase_ascii ref.fragment)

  let nsid_of_ref (ref : A.ref) : string =
    if ref.fragment = "main" then
      ref.name
    else
      spf "%s#%s" ref.name ref.fragment

  let val_name_unqualified_of_ref (ref : A.ref) : string =
    String.lowercase_ascii ref.fragment

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
      gen_fields ~inside ~required ~nullable ~properties out ()
    | A.Union { refs; closed } -> gen_union ~inside ~refs ~closed out ()

  and gen_fields ~inside ~required ~nullable ~properties out () =
    let recurse out ty = gen_ty ~inside out ty in
    bpf out "{\n";
    List.iter
      (fun (k, ty) ->
        let required =
          match required, nullable with
          | Some r, _ when List.mem k r -> true
          | _, Some n when List.mem k n -> false
          | _ -> false
        in
        let option_suffix =
          if required then
            ""
          else
            " option"
        in
        let fname = field_name k in
        bpf out "    %s: %a%s;\n" fname recurse ty option_suffix)
      properties;
    bpf out "  }"

  and gen_union ~inside:_ ~refs ~closed out () =
    bpf out "[\n";
    List.iteri
      (fun i (r : A.ref) ->
        let cstor = cstor_name_of_ref r in
        bpf out "    | `%s of %s\n" cstor (val_name_of_ref r))
      refs;
    if not closed then
      bpf out "    | `Other of Value.t (** Non closed union *)\n";
    bpf out "    ]"

  let rec gen_decode_ty ~(inside : A.ref) (out : out) (ty : A.ty) : unit =
    let recurse out e = gen_decode_ty ~inside out e in
    match ty.view with
    | A.Null -> bpf out "Value.Util.to_unit"
    | A.Unknown -> bpf out "(fun v -> v (* immediate *))"
    | A.Boolean _ -> bpf out "Value.Util.to_bool"
    | A.Int _ -> bpf out "Value.Util.to_int"
    | A.Token | A.Object { properties = []; _ } ->
      bpf out "(fun _ -> `%s)" (cstor_name_of_ref inside)
    | A.String _ -> bpf out "Value.Util.to_text"
    | A.Bytes _ -> bpf out "Value.Util.to_bytes"
    | A.CidLink -> bpf out "Value.Util.to_cid"
    | A.Ref { ref; raw = _ } -> bpf out "%s_of_value" (val_name_of_ref ref)
    | A.Blob _ -> bpf out "Blob.of_value_exn"
    | A.Array { items; _ } ->
      bpf out "(Value.Util.to_array_of %a)" recurse items
    | A.Object { required; nullable; properties } ->
      bpf out "(fun v ->\n%a)"
        (gen_decode_fields ~inside ~required ~nullable ~properties)
        "v"
    | A.Union { refs; closed } ->
      bpf out "(fun v ->\n%a)" (gen_decode_union ~inside ~refs ~closed) "v"

  and gen_decode_fields ~inside ~required ~nullable ~properties out
      (expr : string) =
    let recurse out e = gen_decode_ty ~inside out e in
    List.iter
      (fun (k, ty) ->
        let required =
          match required, nullable with
          | Some r, _ when List.mem k r -> true
          | _, Some n when List.mem k n -> false
          | _ -> false
        in
        let decode_fun =
          if required then
            "get_key"
          else
            "get_key_opt"
        in
        let fname = field_name k in
        bpf out "    let %s = Value.Util.%s %S %a %s in\n" fname decode_fun k
          recurse ty expr)
      properties;
    bpf out "    {";
    List.iter
      (fun (k, _) ->
        let fname = field_name k in
        bpf out "%s;" fname)
      properties;
    bpf out "}"

  and gen_decode_union ~inside ~refs ~closed out (expr : string) =
    bpf out "    (match Value.Util.get_key %S Value.Util.to_text %s with"
      "$type" expr;
    List.iter
      (fun (r : A.ref) ->
        let cstor = cstor_name_of_ref r in
        bpf out "\n    | %S -> `%s (%s_of_value v)" (nsid_of_ref r)
          (* (val_name_of_ref r) *) cstor (val_name_of_ref r))
      refs;
    if closed then
      bpf out
        "\n\
        \    | v -> Value.Util.conv_error {msg=\"expected %S\"; value=v; \
         path=[]}"
        (val_name_of_ref inside)
    else
      bpf out "\n    | _ -> `Other v (* Non closed union *)\n";
    bpf out "    )"

  let gen_object (out : out) ((ref, o) : A.ref * A.object_) : unit =
    bpf out "%s = %a" (val_name_of_ref ref) (gen_ty ~inside:ref)
      { description = None; view = Object o }

  let gen_decode_object (out : out) ((ref, o) : A.ref * A.object_) : unit =
    let ty : A.ty = { description = None; view = Object o } in
    bpf out "%s_of_value : %s Value.Util.conv = %a" (val_name_of_ref ref)
      (val_name_of_ref ref)
      (gen_decode_ty ~inside:ref)
      ty

  let gen_ty_def (out : out) ((ref, ty) : A.ref * A.ty) : unit =
    bpf out "%s = %a" (val_name_of_ref ref) (gen_ty ~inside:ref) ty

  let gen_decode_ty_def (out : out) ((ref, ty) : A.ref * A.ty) : unit =
    bpf out "%s_of_value : %a Value.Util.conv = %a" (val_name_of_ref ref)
      (gen_ty ~inside:ref) ty
      (gen_decode_ty ~inside:ref)
      ty

  let gen_def_type (out : out) ((ref, def) : A.ref * A.def) : unit =
    match def with
    | A.Object o -> gen_object out (ref, o)
    | A.Type ty -> gen_ty_def out (ref, ty)
    | A.Query _ | A.Procedure _ | A.Record _ | A.Subscription _ -> assert false

  let gen_decode_def_type (out : out) ((ref, def) : A.ref * A.def) : unit =
    match def with
    | A.Object o -> gen_decode_object out (ref, o)
    | A.Type ty -> gen_decode_ty_def out (ref, ty)
    | A.Query _ | A.Procedure _ | A.Record _ | A.Subscription _ -> assert false

  let gen_type_clique (oc : out_channel) (clique : (A.ref * A.def) list) : unit
      =
    let out = Buffer.create 32 in
    List.iteri
      (fun i (ref, def) ->
        bpf out "\n  (** def %s *)\n" (A.show_ref ref);
        if i = 0 then
          bpf out "  type "
        else
          bpf out "  and ";
        gen_def_type out (ref, def);
        bpf out "\n")
      clique;
    bpf out "  [@@deriving show {with_path=false}]\n\n";

    List.iteri
      (fun i (ref, def) ->
        if i = 0 then
          bpf out "  let rec "
        else
          bpf out "  and ";
        gen_decode_def_type out (ref, def);
        bpf out "\n")
      clique;
    bpf out "\n";
    Buffer.output_buffer oc out

  let name_of_params ~ref (_p : A.params) : string =
    spf "%s_params" (val_name_unqualified_of_ref ref)

  let name_of_io ~ref ~(which : [ `In | `Out ]) (_p : A.input_or_output) :
      string =
    spf "%s_%s"
      (val_name_unqualified_of_ref ref)
      (match which with
      | `In -> "input"
      | `Out -> "output")

  let name_of_errors ~ref (_errs : A.error list) : string =
    spf "%s_error" (val_name_unqualified_of_ref ref)

  let name_of_message ~ref (_m : A.message) : string =
    spf "%s_msg" (val_name_unqualified_of_ref ref)

  let define_params ~ref out (p : A.params) : unit =
    bpf out "  type %s = " (name_of_params ~ref p);
    gen_fields ~inside:ref ~required:p.required ~nullable:None
      ~properties:p.properties out ();
    bpf out "\n  [@@deriving show {with_path=false}, make]\n\n";
    bpf out "  let %s_of_value : %s Value.Util.conv = fun v ->\n%a\n"
      (name_of_params ~ref p) (name_of_params ~ref p)
      (gen_decode_fields ~inside:ref ~required:p.required ~nullable:None
         ~properties:p.properties)
      "v";
    bpf out "\n"

  let define_io ~ref ~(which : [ `In | `Out ]) out (io : A.input_or_output) :
      unit =
    let name = name_of_io ~ref ~which io in
    assert (io.schema <> None);
    let ty = Option.get io.schema in
    let as_ref = { A.name = ""; fragment = name } in
    bpf out "  type %s = %a" name (gen_ty ~inside:as_ref) ty;
    bpf out "\n  [@@deriving show {with_path=false}]\n\n";
    bpf out "  let %s_of_value : %s Value.Util.conv = %a\n" name name
      (gen_decode_ty ~inside:as_ref)
      ty;
    bpf out "\n"

  let define_errors ~ref out (errs : A.error list) : unit =
    assert (errs <> []);
    bpf out "  type %s = [" (name_of_errors ~ref errs);
    List.iter
      (fun (e : A.error) ->
        bpf out "  | `%s [@name %S]"
          (String.capitalize_ascii e.name |> remove_keyword)
          e.name)
      errs;
    bpf out "]";
    (* TODO: of value *)
    bpf out "\n  [@@deriving show {with_path=false}]\n\n"

  let define_message ~ref out (m : A.message) : unit =
    let name = name_of_message ~ref m in
    let as_ref = { A.name = ""; fragment = name } in
    bpf out "  type %s = %a" name (gen_ty ~inside:as_ref) m.schema;
    bpf out "\n  [@@deriving show {with_path=false}]\n\n";
    bpf out "  let %s_of_value : %s Value.Util.conv = %a\n" name name
      (gen_decode_ty ~inside:as_ref)
      m.schema;
    bpf out "\n"

  let base_typ_of_name name : string =
    spf "{\n    to_value=%s_to_value;\n    of_value=%s_of_value;\n    pp=pp_%s}"
      name name name

  (** Generate code for a single definition, in a module of its own *)
  let gen_def_in_mod (out : out) ((ref, def) : A.ref * A.def) : unit =
    let name = String.lowercase_ascii ref.fragment |> remove_keyword in

    let alias_pp_encode name ref =
      bpf out "  let pp_%s = pp_%s\n" name (val_name_of_ref ref);
      bpf out "  let %s_of_value = %s_of_value\n" name (val_name_of_ref ref);
      bpf out "  let %s_to_value = %s_to_value\n" name (val_name_of_ref ref)
    in

    let params_as_argument (p : A.params option) : string =
      match p with
      | Some p when p.properties <> [] ->
        define_params ~ref out p;
        let name = name_of_params ~ref p in
        spf "\n    ~parameters:(Params %s)" (base_typ_of_name name)
      | _ -> "~parameters:No_params"
    in

    let input_as_argument (io : A.input_or_output option) : string =
      match io with
      | Some io ->
        let name = name_of_io ~ref ~which:`In io in
        if Option.is_some io.schema then (
          define_io ~ref ~which:`In out io;
          spf "\n    ~input:(IO_encodable {encoding=%s; encode=%s})"
            (A.show_encoding io.encoding)
            (base_typ_of_name name)
        ) else
          spf "\n    ~input:(IO_opaque {encoding=%s})"
            (A.show_encoding io.encoding)
      | _ -> "~input:No_io"
    in

    let output_as_argument (io : A.input_or_output option) : string =
      match io with
      | Some io ->
        let name = name_of_io ~ref ~which:`Out io in
        if Option.is_some io.schema then (
          define_io ~ref ~which:`Out out io;
          spf "\n    ~output:(IO_encodable {encoding=%s; encode=%s})"
            (A.show_encoding io.encoding)
            (base_typ_of_name name)
        ) else
          spf "\n    ~output:(IO_opaque {encoding=%s})"
            (A.show_encoding io.encoding)
      | _ -> "~output:No_io"
    in

    let errors_as_argument (errors : A.error list option) =
      match errors with
      | None | Some [] -> "~errors:No_errors"
      | Some errs ->
        let name = name_of_errors ~ref errs in
        define_errors ~ref out errs;
        spf "\n    ~errors:(Errors {pp=pp_%s})" name
    in

    let message_as_argument (msg : A.message option) =
      match msg with
      | None -> "~message:No_message"
      | Some m ->
        let name = name_of_message ~ref m in
        define_message ~ref out m;
        spf "~message:(Message %s)" (base_typ_of_name name)
    in

    match def with
    | A.Type
        ({ view = Object { properties = _ :: _; _ }; description; _ } as ty) ->
      (* alias and redefine *)
      Option.iter (bpf out "  (** %s *)\n") description;
      bpf out "  type nonrec %s = %s = %a\n" name (val_name_of_ref ref)
        (gen_ty ~inside:ref) ty;
      alias_pp_encode name ref
    | A.Object ({ properties = _ :: _; _ } as o) ->
      (* alias and redefine *)
      bpf out "  type nonrec %s = %s = %a\n" name (val_name_of_ref ref)
        (gen_ty ~inside:ref)
        { A.description = None; view = Object o };
      alias_pp_encode name ref
    | A.Type _ | A.Object _ ->
      (* alias to the real definition *)
      bpf out "  type nonrec %s = %s\n" name (val_name_of_ref ref);
      alias_pp_encode name ref
    | A.Query q ->
      let params = params_as_argument q.parameters in
      let output = output_as_argument q.output in
      let errors = errors_as_argument q.errors in
      Option.iter (bpf out "  (** %s *)\n") q.description;
      bpf out "  let %s: _ Base.query = Base.make_query %s %s %s" name params
        output errors
    | A.Subscription sub ->
      let msg = message_as_argument sub.message in
      let params = params_as_argument sub.parameters in
      let errors = errors_as_argument sub.errors in
      Option.iter (bpf out "  (** %s *)\n") sub.description;
      bpf out "  let %s: _ Base.subscription = Base.make_subscription %s %s %s"
        name params msg errors
    | A.Procedure p ->
      let params = params_as_argument p.parameters in
      let input = input_as_argument p.input in
      let output = output_as_argument p.output in
      let errors = errors_as_argument p.errors in
      Option.iter (bpf out "  (** %s *)\n") p.description;
      bpf out "  let %s: _ Base.procedure = Base.make_procedure %s %s %s %s"
        name params input output errors
    | A.Record r ->
      Option.iter (bpf out "  (** %s *)\n") r.description;
      bpf out "  type %s = " name;
      gen_fields ~inside:ref ~required:r.record.required
        ~nullable:r.record.nullable ~properties:r.record.properties out ();
      bpf out "  [@@deriving show {with_path=false}, make]\n\n"

  let gen_lexicon (oc : out_channel) (lex : A.lexicon) : unit =
    let out = Buffer.create 32 in

    let gen_def_in_lexicon out (def_name, def) =
      let ref = A.{ name = lex.id; fragment = def_name } in
      bpf out "  (** {2 def %s} *)\n\n" def_name;
      gen_def_in_mod out (ref, def);
      bpf out "\n\n"
    in

    List.iter (gen_def_in_lexicon out) lex.defs;

    fpf oc "\n(** lexicon %S\n" lex.id;
    Option.iter (fpf oc "  %s\n") lex.description;
    fpf oc "  *)\n";
    fpf oc "module %s = struct\n" (mod_name lex.id);
    Buffer.output_buffer oc out;
    fpf oc "end\n\n";
    ()

  let prelude =
    {|(* geherated by Cephalopod_lexicon's codegen tool, do not modify *)
open Cephalopod_dasl
[@@@ocaml.warning "-39-41"]
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
    List.iter (gen_lexicon oc) lex_l
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

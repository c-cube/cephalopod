module Lex = Cephalopod_lexicon
module A = Lex.Ast
module Str_map = Map.Make (String)

let ( let@ ) = ( @@ )
let spf = Printf.sprintf
let debug = ref false
let log_ msg = if !debug then Printf.eprintf "%s\n%!" msg
let logf msg = Printf.ksprintf log_ msg

module Sort = struct
  module Tbl = Hashtbl.Make (struct
    type t = A.lexicon

    let equal a b = a.A.id = b.A.id
    let hash a = Hashtbl.hash a.A.id
  end)

  (** Find dependencies of [lex] *)
  let deps_of_lex (lex : A.lexicon) : string list =
    let res = ref [] in
    A.iter_refs_lexicon lex (fun (r : A.ref) ->
        if r.name <> "" then res := r.name :: !res);
    !res

  let find_lex lex_map name =
    try Str_map.find name lex_map
    with Not_found -> failwith (spf "Unresolved reference to %S" name)

  let sort (lex : A.lexicon list) : A.lexicon list =
    let lex_map =
      Str_map.of_list @@ List.map (fun (lex : A.lexicon) -> lex.id, lex) lex
    in
    Containers_scc.scc
      ~tbl:(module Tbl)
      ~graph:lex_map
      ~children:(fun lex_map (lex : A.lexicon) ->
        deps_of_lex lex |> List.rev_map (find_lex lex_map) |> CCList.to_iter)
      ~nodes:lex ()
    |> List.map (function
         | [ lex ] -> lex
         | lexs ->
           failwith
             (spf "circular dep between lexicons: [%s]"
                (String.concat ","
                @@ List.map (fun lex -> spf "%S" lex.A.id) lexs)))
end

module Codegen = struct
  let spf = Printf.sprintf
  let bpf = Printf.bprintf
  let fpf = Printf.fprintf
  let split_id (s : string) : string list = CCString.Split.list_cpy ~by:"." s

  let mod_name s =
    s |> split_id |> List.map String.capitalize_ascii |> String.concat "_"

  type out = Buffer.t

  let gen_def (out : out) ((name, _def) : string * A.def) : unit =
    bpf out "(** def %s *)\n" name;
    ()

  let gen_lex (oc : out_channel) (lex : A.lexicon) : unit =
    let out = Buffer.create 32 in
    bpf out "  (** lexicon %s\n" lex.id;
    Option.iter (bpf out "  %s\n") lex.description;
    bpf out "  *)\n\n";

    List.iter (gen_def out) lex.defs;

    fpf oc "\nmodule %s = struct\n" (mod_name lex.id);
    Buffer.output_buffer oc out;
    fpf oc "end\n";
    ()

  let run (out : out_channel) (lex_l : Lex.Ast.lexicon list) : unit =
    let lex_l = Sort.sort lex_l in
    List.iter (gen_lex out) lex_l
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

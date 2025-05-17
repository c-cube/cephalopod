module Lex = Cephalopod_lexicon

let debug = ref false
let dump = ref false
let list_files = ref false
let log_ msg = if !debug then Printf.eprintf "%s\n%!" msg
let logf msg = Printf.ksprintf log_ msg

let parse file : unit =
  if !list_files then
    Printf.printf "parsing %S\n%!" file
  else
    logf "parsing %S" file;
  let j = Yojson.Safe.from_file ~fname:file file in

  match Lex.Ast.lexicon_of_yojson j with
  | Ok lex ->
    if !dump then Format.printf "## file %S:@.%a@." file Lex.Ast.pp_lexicon lex
  | Error err ->
    Format.eprintf "error when parsing %S: %s@." file err;
    exit 1

let () =
  let files = ref [] in
  let opts =
    [
      "-d", Arg.Set debug, " debug";
      "--dump", Arg.Set dump, " dump lexicon";
      "--list-files", Arg.Set list_files, " list files as they are parsed";
    ]
    |> Arg.align
  in
  Arg.parse opts (fun f -> files := f :: !files) "";

  let files = CCList.flat_map CCIO.File.walk_l !files in
  let json_files =
    CCList.filter_map
      (function
        | `File, file when Filename.extension file = ".json" -> Some file
        | _ -> None)
      files
    |> List.sort String.compare
  in

  List.iter parse json_files

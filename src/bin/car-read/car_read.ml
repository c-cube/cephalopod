open Cephalopod_dasl
module Log = (val Logs.src_log (Logs.Src.create "read-firehose-dump"))

let read_car (file : string) : unit =
  let content = CCIO.File.read_exn file in
  let car =
    match Car.decode_string content with
    | Error err ->
      Log.err (fun k -> k "error:@ %a" Car.pp_error_decode err);
      exit 1
    | Ok c -> c
  in

  let mst =
    Log.info (fun k ->
        k "car.roots: %a" (Fmt.Dump.list Cid.pp) car.header.roots);
    let root =
      match car.header.roots with
      | r :: _ -> r
      | [] ->
        Log.err (fun k -> k "CAR does not have a root");
        exit 1
    in

    (* find commit *)
    let commit_value : Value.t =
      match
        CCList.find_map
          (fun (b : Car.block) ->
            if Cid.equal b.cid root then
              Some b.data
            else
              None)
          car.blocks
      with
      | None ->
        Log.err (fun k -> k "cannot find root %a" Cid.pp root);
        exit 1
      | Some (Car.DCBOR42 v) -> v
      | Some (Car.Raw _) ->
        Log.err (fun k -> k "root block is not dCBOR42");
        exit 1
    in

    let commit =
      match Cephalopod_mst.Commit.of_value commit_value with
      | Error err ->
        Log.err (fun k ->
            k "mst commit error:@ %a" Cephalopod_mst.Tree.pp_of_car_error err);
        exit 1
      | Ok c -> c
    in
    match Cephalopod_mst.Tree.of_car car ~root:commit.data with
    | Error err ->
      Log.err (fun k ->
          k "mst error:@ %a" Cephalopod_mst.Tree.pp_of_car_error err);
      exit 1
    | Ok mst -> mst
  in

  Format.printf "mst: %a@." PrintBox_text.pp
    (Cephalopod_mst_printbox.node_to_pb mst);
  ()

let () =
  let debug = ref false in
  let files = ref [] in
  let opts = [ "-d", Arg.Set debug, " enable debug" ] |> Arg.align in
  Arg.parse opts (fun f -> files := f :: !files) "car_read file+";
  let files = List.rev !files in

  Logs.set_reporter @@ Logs.format_reporter ();
  Logs.set_level ~all:true
    (Some
       (if !debug then
          Debug
        else
          Info));

  List.iter read_car files;
  ()

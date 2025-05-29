module Log = (val Logs.src_log (Logs.Src.create "read-firehose-dump"))

type stats = {
  n_values: int ref;
  n_errors: int ref;
}
[@@deriving show { with_path = false }]

type st = {
  dump: bool;
  stats: stats;
}
[@@deriving show]

let dump_file (st : st) file : unit =
  Log.info (fun k -> k "dumping file %S" file);
  let@ ic = CCIO.with_in file in
  let buf = Byte_buffer.create ~cap:128 () in

  while U32le.read_prefixed_len ic buf do
    Log.debug (fun k -> k "got buf with %dB" buf.len);

    match Cephalopod_dasl.Stream_event.decode (Byte_buffer.to_slice buf) with
    | Ok v ->
      incr st.stats.n_values;
      if st.dump then
        Log.app (fun k ->
            k "@[<2>got event:@ %a@]" Cephalopod_dasl.Stream_event.pp v)
    | Error err ->
      incr st.stats.n_errors;
      Log.err (fun k ->
          k "@[decoding error:@ %a@]"
            Cephalopod_dasl.Stream_event.pp_decode_error err)
  done

let () =
  let debug = ref false in
  let files = ref [] in
  let dump = ref false in
  let opts =
    [
      "-d", Arg.Set debug, " enable debug";
      "--dump", Arg.Set dump, " dump CAR objects";
    ]
    |> Arg.align
  in
  Arg.parse opts (fun f -> files := f :: !files) "read_firehose_dump file+";
  let files = List.rev !files in

  Logs.set_reporter @@ Logs.format_reporter ();
  Logs.set_level ~all:true
    (Some
       (if !debug then
          Debug
        else
          Info));

  let st = { dump = !dump; stats = { n_values = ref 0; n_errors = ref 0 } } in

  List.iter (dump_file st) files;
  Fmt.printf "decoded %d values, %d errors@." !(st.stats.n_values)
    !(st.stats.n_errors);
  ()

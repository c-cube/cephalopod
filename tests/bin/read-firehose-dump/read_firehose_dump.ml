module Log = (val Logs.src_log (Logs.Src.create "read-firehose-dump"))

type stats = {
  n_values: int ref;
  n_errors: int ref;
  n_decode_errors: int ref;
}
[@@deriving show { with_path = false }]

type st = {
  dump: bool;
  decode: bool;
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
            k "@[<2>got event:@ %a@]" Cephalopod_dasl.Stream_event.pp v);

      if st.decode then
        let module M = Cephalopod_models.Models in
        (match
           Cephalopod_models.Base.Decode_message.decode
             M.Com_Atproto_Sync_SubscribeRepos.main.message v
         with
        | Ok msg ->
          Log.app (fun k ->
              k "got firehose message:@ %a"
                M.Com_Atproto_Sync_SubscribeRepos.pp_main_msg msg);

          (match msg with
          | `Com_atproto_sync_subscriberepos_commit c ->
            (match
               Cephalopod_dasl.Car.decode_byte_slice
               @@ Byte_slice.create c.blocks
             with
            | Ok car ->
              Log.app (fun k -> k "decoded CAR: %a" Cephalopod_dasl.Car.pp car)
            | Error err ->
              incr st.stats.n_decode_errors;
              Log.err (fun k ->
                  k "could not decode CAR: %a"
                    Cephalopod_dasl.Car.pp_error_decode err))
          | `Other _ | `Com_atproto_sync_subscriberepos_sync _
          | `Com_atproto_sync_subscriberepos_account _
          | `Com_atproto_sync_subscriberepos_identity _
          | `Com_atproto_sync_subscriberepos_info _ ->
            ())
        | Error err ->
          incr st.stats.n_decode_errors;
          Log.err (fun k ->
              k "failed to decode firehose message:@ %a"
                Cephalopod_models.Base.Decode_message.pp_error err)
        | exception exn ->
          incr st.stats.n_decode_errors;
          Log.err (fun k ->
              k "failed to decode firehose message:@ %s"
                (Printexc.to_string exn)))
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
  let decode = ref false in
  let opts =
    [
      "-d", Arg.Set debug, " enable debug";
      "--dump", Arg.Set dump, " dump decode event";
      "--decode", Arg.Set decode, " try to decode the decode events";
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

  let st =
    {
      dump = !dump;
      decode = !decode;
      stats = { n_values = ref 0; n_errors = ref 0; n_decode_errors = ref 0 };
    }
  in

  List.iter (dump_file st) files;
  Fmt.printf "decoded %d values, %d errors, %d decode errors@."
    !(st.stats.n_values) !(st.stats.n_errors)
    !(st.stats.n_decode_errors);
  ()

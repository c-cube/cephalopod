module Log = (val Logs.src_log (Logs.Src.create "firehose-client"))
module M = Cephalopod_models

let uri =
  ref @@ Uri.of_string "wss://bsky.network/xrpc/com.atproto.sync.subscribeRepos"

let () =
  let debug = ref false in
  let dump = ref "" in
  let show_events = ref false in
  let decode = ref true in
  let show_decoded_events = ref false in
  let opts =
    [
      "-d", Arg.Set debug, " enable debug";
      "--uri", Arg.String (fun s -> uri := Uri.of_string s), " set firehose URI";
      "--show-events", Arg.Set show_events, " show raw events (verbose!)";
      "--dump-into", Arg.Set_string dump, " dump into given file";
      "--decode", Arg.Bool (( := ) decode), " decode events (bool)";
      ( "--show-decoded-events",
        Arg.Set show_decoded_events,
        " show decoded events (verbose!)" );
    ]
    |> Arg.align
  in
  Arg.parse opts (fun _ -> raise (Arg.Help "invalid arg")) "";

  Logs.set_reporter @@ Logs.format_reporter ();
  Logs.set_level ~all:true
    (Some
       (if !debug then
          Debug
        else
          Info));

  Logs.info (fun k -> k "Starting EIO…");

  let@ stdenv = Eio_posix.run in
  let@ sw = Eio.Switch.run ~name:"main" in

  Logs.info (fun k -> k "Connecting to %a" Uri.pp !uri);
  let n_decode_errors = ref 0 in

  let oc =
    if !dump <> "" then
      Some (open_out_bin !dump)
    else
      None
  in
  let@ () = Fun.protect ~finally:(fun () -> Option.iter close_out_noerr oc) in

  let client =
    Cephalopod_firehose_client.Client.create ~sw ~stdenv ~ws_uri:!uri ()
    |> Error.get_or_failwith
         Cephalopod_firehose_client.Client.show_connect_error
  in

  (* callback for stream events *)
  let on_event (ev : Cephalopod_firehose_client.Client.event) : unit =
    Log.debug (fun k ->
        k "got ev %a" Cephalopod_firehose_client.Client.pp_event ev);
    (match ev with
    | E_received buf when !show_events || !decode ->
      (match Cephalopod_dasl.Stream_event.decode (Byte_buffer.to_slice buf) with
      | Ok ev ->
        if !show_events then
          Log.app (fun k ->
              k "received event@ %a" Cephalopod_dasl.Stream_event.pp ev);

        if !decode then (
          match
            Cephalopod_xrpc.Decode_msg.decode_stream_event
              M.Com_Atproto_Sync_SubscribeRepos.main.message ev
          with
          | Ok msg ->
            if !show_decoded_events then
              Log.app (fun k ->
                  k "got firehose message:@ %a"
                    M.Com_Atproto_Sync_SubscribeRepos.pp_main_msg msg)
            else
              Log.info (fun k ->
                  k "got firehose message:@ %a" Util_firehose.pp_msg_short msg)
          | Error err ->
            incr n_decode_errors;
            Log.err (fun k ->
                k "failed to decode firehose message:@ %a"
                  Cephalopod_xrpc.Decode_msg.pp_error err)
          | exception exn ->
            incr n_decode_errors;
            Log.err (fun k ->
                k "failed to decode firehose message:@ %s"
                  (Printexc.to_string exn))
        )
      | Error err ->
        Log.err (fun k ->
            k "error when decoding event:@ %a"
              Cephalopod_dasl.Stream_event.pp_decode_error err))
    | _ -> ());

    match ev, oc with
    | E_received buf, Some oc -> U32le.write_prefixed_len oc buf
    | _ -> ()
  in

  Observer.subscribe'
    (Cephalopod_firehose_client.Client.on_event client)
    on_event;

  let cond_sigint = Eio.Condition.create () in
  Sys.set_signal Sys.sigint
    (Sys.Signal_handle (fun _ -> Eio.Condition.broadcast cond_sigint));

  Eio.Fiber.first
    (fun () ->
      Eio.Condition.await_no_mutex cond_sigint;
      Log.info (fun k -> k "got ctrl-c, shutting down");
      Cephalopod_firehose_client.Client.shutdown client;
      Eio.Switch.fail sw Exit)
    (fun () ->
      Cephalopod_firehose_client.Client.await client;
      Log.info (fun k -> k "client done, shutting down"));

  if !n_decode_errors > 0 then
    Log.warn (fun k -> k "got %d decode errors" !n_decode_errors);

  Log.info (fun k -> k "exiting")

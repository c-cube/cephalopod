module Log = (val Logs.src_log (Logs.Src.create "firehose-client"))

let uri =
  ref @@ Uri.of_string "wss://bsky.network/xrpc/com.atproto.sync.subscribeRepos"

let () =
  let debug = ref false in
  let dump = ref "" in
  let opts =
    [
      "-d", Arg.Set debug, " enable debug";
      "--uri", Arg.String (fun s -> uri := Uri.of_string s), " set firehose URI";
      "--dump", Arg.Set_string dump, " dump into given file";
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

  let oc =
    if !dump <> "" then
      Some (open_out_bin !dump)
    else
      None
  in
  let@ () = Fun.protect ~finally:(fun () -> Option.iter close_out_noerr oc) in

  let client =
    Cephalopod_firehose_client.Client.create ~sw ~stdenv ~ws_uri:!uri
      ~on_event:(fun ev ->
        Log.info (fun k ->
            k "got ev %a" Cephalopod_firehose_client.Client.pp_event ev);

        match ev, oc with
        | E_received buf, Some oc -> U32le.write_prefixed_len oc buf
        | _ -> ())
      ()
    |> Error.get_or_failwith
         Cephalopod_firehose_client.Client.show_connect_error
  in

  Cephalopod_firehose_client.Client.await client

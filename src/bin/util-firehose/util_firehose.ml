module M = Cephalopod_models

let pp_block_size out (data : bytes) =
  Fmt.fprintf out "data(%d B)" (Bytes.length data)

let pp_msg_short out (m : M.Com_Atproto_Sync_SubscribeRepos.main_msg) : unit =
  match m with
  | `Other _ -> Fmt.string out "<other>"
  | `Com_atproto_sync_subscriberepos_sync s ->
    Fmt.fprintf out "<sync rev=%S did=%S time=%s blocks=%a>" s.rev s.did s.time
      pp_block_size s.blocks
  | `Com_atproto_sync_subscriberepos_account acc ->
    Fmt.fprintf out "<account did=%S time=%s active=%b>" acc.did acc.time
      acc.active
  | `Com_atproto_sync_subscriberepos_commit c ->
    Fmt.fprintf out "<commit num-ops=%d rev=%S time=%s blocks=%a>"
      (List.length c.ops) c.rev c.time pp_block_size c.blocks
  | `Com_atproto_sync_subscriberepos_identity id ->
    Fmt.fprintf out "<identity did=%S time=%s>" id.did id.time
  | `Com_atproto_sync_subscriberepos_info i ->
    Fmt.fprintf out "<info name=%S msg=%s>" i.name
      (Option.fold ~none:"none" ~some:(spf "%S") i.message)

(* geherated by Cephalopod_lexicon's codegen tool, do not modify *)
open Cephalopod_dasl
[@@@ocaml.warning "-39-41"]

(** Type definitions *)
module Types = struct

  (** def "app.bsky.feed.describeFeedGenerator#links" *)
  type app_bsky_feed_describefeedgenerator_links = {
    privacyPolicy: string option;
    termsOfService: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_describefeedgenerator_links_of_value : app_bsky_feed_describefeedgenerator_links Value.Util.conv = (fun v ->
    let privacyPolicy = Value.Util.get_key_opt "privacyPolicy" Value.Util.to_text v in
    let termsOfService = Value.Util.get_key_opt "termsOfService" Value.Util.to_text v in
    {privacyPolicy;termsOfService;})


  (** def "app.bsky.actor.defs#profileAssociatedChat" *)
  type app_bsky_actor_defs_profileassociatedchat = {
    allowIncoming: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_profileassociatedchat_of_value : app_bsky_actor_defs_profileassociatedchat Value.Util.conv = (fun v ->
    let allowIncoming = Value.Util.get_key "allowIncoming" Value.Util.to_text v in
    {allowIncoming;})


  (** def "app.bsky.actor.defs#profileAssociated" *)
  type app_bsky_actor_defs_profileassociated = {
    lists: int64 option;
    feedgens: int64 option;
    starterPacks: int64 option;
    labeler: bool option;
    chat: app_bsky_actor_defs_profileassociatedchat option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_profileassociated_of_value : app_bsky_actor_defs_profileassociated Value.Util.conv = (fun v ->
    let lists = Value.Util.get_key_opt "lists" Value.Util.to_int v in
    let feedgens = Value.Util.get_key_opt "feedgens" Value.Util.to_int v in
    let starterPacks = Value.Util.get_key_opt "starterPacks" Value.Util.to_int v in
    let labeler = Value.Util.get_key_opt "labeler" Value.Util.to_bool v in
    let chat = Value.Util.get_key_opt "chat" app_bsky_actor_defs_profileassociatedchat_of_value v in
    {lists;feedgens;starterPacks;labeler;chat;})


  (** def "app.bsky.graph.defs#listPurpose" *)
  type app_bsky_graph_defs_listpurpose = string
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_listpurpose_of_value : string Value.Util.conv = Value.Util.to_text


  (** def "com.atproto.label.defs#label" *)
  type com_atproto_label_defs_label = {
    ver: int64 option;
    src: string;
    uri: string;
    cid: string option;
    val_: string;
    neg: bool option;
    cts: string;
    exp: string option;
    sig_: bytes option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_label_defs_label_of_value : com_atproto_label_defs_label Value.Util.conv = (fun v ->
    let ver = Value.Util.get_key_opt "ver" Value.Util.to_int v in
    let src = Value.Util.get_key "src" Value.Util.to_text v in
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key_opt "cid" Value.Util.to_text v in
    let val_ = Value.Util.get_key "val" Value.Util.to_text v in
    let neg = Value.Util.get_key_opt "neg" Value.Util.to_bool v in
    let cts = Value.Util.get_key "cts" Value.Util.to_text v in
    let exp = Value.Util.get_key_opt "exp" Value.Util.to_text v in
    let sig_ = Value.Util.get_key_opt "sig" Value.Util.to_bytes v in
    {ver;src;uri;cid;val_;neg;cts;exp;sig_;})


  (** def "app.bsky.graph.defs#listViewerState" *)
  type app_bsky_graph_defs_listviewerstate = {
    muted: bool option;
    blocked: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_listviewerstate_of_value : app_bsky_graph_defs_listviewerstate Value.Util.conv = (fun v ->
    let muted = Value.Util.get_key_opt "muted" Value.Util.to_bool v in
    let blocked = Value.Util.get_key_opt "blocked" Value.Util.to_text v in
    {muted;blocked;})


  (** def "app.bsky.graph.defs#listViewBasic" *)
  type app_bsky_graph_defs_listviewbasic = {
    uri: string;
    cid: string;
    name: string;
    purpose: app_bsky_graph_defs_listpurpose;
    avatar: string option;
    listItemCount: int64 option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_graph_defs_listviewerstate option;
    indexedAt: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_listviewbasic_of_value : app_bsky_graph_defs_listviewbasic Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let name = Value.Util.get_key "name" Value.Util.to_text v in
    let purpose = Value.Util.get_key "purpose" app_bsky_graph_defs_listpurpose_of_value v in
    let avatar = Value.Util.get_key_opt "avatar" Value.Util.to_text v in
    let listItemCount = Value.Util.get_key_opt "listItemCount" Value.Util.to_int v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let viewer = Value.Util.get_key_opt "viewer" app_bsky_graph_defs_listviewerstate_of_value v in
    let indexedAt = Value.Util.get_key_opt "indexedAt" Value.Util.to_text v in
    {uri;cid;name;purpose;avatar;listItemCount;labels;viewer;indexedAt;})


  (** def "app.bsky.actor.defs#verificationView" *)
  type app_bsky_actor_defs_verificationview = {
    issuer: string;
    uri: string;
    isValid: bool;
    createdAt: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_verificationview_of_value : app_bsky_actor_defs_verificationview Value.Util.conv = (fun v ->
    let issuer = Value.Util.get_key "issuer" Value.Util.to_text v in
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let isValid = Value.Util.get_key "isValid" Value.Util.to_bool v in
    let createdAt = Value.Util.get_key "createdAt" Value.Util.to_text v in
    {issuer;uri;isValid;createdAt;})


  (** def "app.bsky.actor.defs#verificationState" *)
  type app_bsky_actor_defs_verificationstate = {
    verifications: app_bsky_actor_defs_verificationview list;
    verifiedStatus: string;
    trustedVerifierStatus: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_verificationstate_of_value : app_bsky_actor_defs_verificationstate Value.Util.conv = (fun v ->
    let verifications = Value.Util.get_key "verifications" (Value.Util.to_array_of app_bsky_actor_defs_verificationview_of_value) v in
    let verifiedStatus = Value.Util.get_key "verifiedStatus" Value.Util.to_text v in
    let trustedVerifierStatus = Value.Util.get_key "trustedVerifierStatus" Value.Util.to_text v in
    {verifications;verifiedStatus;trustedVerifierStatus;})


  (** def "app.bsky.embed.external#viewExternal" *)
  type app_bsky_embed_external_viewexternal = {
    uri: string;
    title: string;
    description: string;
    thumb: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_external_viewexternal_of_value : app_bsky_embed_external_viewexternal Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let title = Value.Util.get_key "title" Value.Util.to_text v in
    let description = Value.Util.get_key "description" Value.Util.to_text v in
    let thumb = Value.Util.get_key_opt "thumb" Value.Util.to_text v in
    {uri;title;description;thumb;})


  (** def "app.bsky.embed.external#view" *)
  type app_bsky_embed_external_view = {
    external_: app_bsky_embed_external_viewexternal;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_external_view_of_value : app_bsky_embed_external_view Value.Util.conv = (fun v ->
    let external_ = Value.Util.get_key "external" app_bsky_embed_external_viewexternal_of_value v in
    {external_;})


  (** def "app.bsky.actor.defs#statusView" *)
  type app_bsky_actor_defs_statusview = {
    status: string;
    record: Value.t (* unknown *);
    embed: [
    `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    expiresAt: string option;
    isActive: bool option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_statusview_of_value : app_bsky_actor_defs_statusview Value.Util.conv = (fun v ->
    let status = Value.Util.get_key "status" Value.Util.to_text v in
    let record = Value.Util.get_key "record" (fun v -> v (* immediate *)) v in
    let embed = Value.Util.get_key_opt "embed" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "view" -> `App_bsky_embed_external_view (app_bsky_embed_external_view_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let expiresAt = Value.Util.get_key_opt "expiresAt" Value.Util.to_text v in
    let isActive = Value.Util.get_key_opt "isActive" Value.Util.to_bool v in
    {status;record;embed;expiresAt;isActive;})


  (** def "app.bsky.actor.defs#profileViewBasic" *)
  type app_bsky_actor_defs_profileviewbasic = {
    did: string;
    handle: string;
    displayName: string option;
    avatar: string option;
    associated: app_bsky_actor_defs_profileassociated option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    createdAt: string option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }

  (** def "app.bsky.actor.defs#viewerState" *)
  and app_bsky_actor_defs_viewerstate = {
    muted: bool option;
    mutedByList: app_bsky_graph_defs_listviewbasic option;
    blockedBy: bool option;
    blocking: string option;
    blockingByList: app_bsky_graph_defs_listviewbasic option;
    following: string option;
    followedBy: string option;
    knownFollowers: app_bsky_actor_defs_knownfollowers option;
  }

  (** def "app.bsky.actor.defs#knownFollowers" *)
  and app_bsky_actor_defs_knownfollowers = {
    count: int64;
    followers: app_bsky_actor_defs_profileviewbasic list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_profileviewbasic_of_value : app_bsky_actor_defs_profileviewbasic Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let displayName = Value.Util.get_key_opt "displayName" Value.Util.to_text v in
    let avatar = Value.Util.get_key_opt "avatar" Value.Util.to_text v in
    let associated = Value.Util.get_key_opt "associated" app_bsky_actor_defs_profileassociated_of_value v in
    let viewer = Value.Util.get_key_opt "viewer" app_bsky_actor_defs_viewerstate_of_value v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let createdAt = Value.Util.get_key_opt "createdAt" Value.Util.to_text v in
    let verification = Value.Util.get_key_opt "verification" app_bsky_actor_defs_verificationstate_of_value v in
    let status = Value.Util.get_key_opt "status" app_bsky_actor_defs_statusview_of_value v in
    {did;handle;displayName;avatar;associated;viewer;labels;createdAt;verification;status;})
  and app_bsky_actor_defs_viewerstate_of_value : app_bsky_actor_defs_viewerstate Value.Util.conv = (fun v ->
    let muted = Value.Util.get_key_opt "muted" Value.Util.to_bool v in
    let mutedByList = Value.Util.get_key_opt "mutedByList" app_bsky_graph_defs_listviewbasic_of_value v in
    let blockedBy = Value.Util.get_key_opt "blockedBy" Value.Util.to_bool v in
    let blocking = Value.Util.get_key_opt "blocking" Value.Util.to_text v in
    let blockingByList = Value.Util.get_key_opt "blockingByList" app_bsky_graph_defs_listviewbasic_of_value v in
    let following = Value.Util.get_key_opt "following" Value.Util.to_text v in
    let followedBy = Value.Util.get_key_opt "followedBy" Value.Util.to_text v in
    let knownFollowers = Value.Util.get_key_opt "knownFollowers" app_bsky_actor_defs_knownfollowers_of_value v in
    {muted;mutedByList;blockedBy;blocking;blockingByList;following;followedBy;knownFollowers;})
  and app_bsky_actor_defs_knownfollowers_of_value : app_bsky_actor_defs_knownfollowers Value.Util.conv = (fun v ->
    let count = Value.Util.get_key "count" Value.Util.to_int v in
    let followers = Value.Util.get_key "followers" (Value.Util.to_array_of app_bsky_actor_defs_profileviewbasic_of_value) v in
    {count;followers;})


  (** def "app.bsky.graph.defs#starterPackViewBasic" *)
  type app_bsky_graph_defs_starterpackviewbasic = {
    uri: string;
    cid: string;
    record: Value.t (* unknown *);
    creator: app_bsky_actor_defs_profileviewbasic;
    listItemCount: int64 option;
    joinedWeekCount: int64 option;
    joinedAllTimeCount: int64 option;
    labels: com_atproto_label_defs_label list option;
    indexedAt: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_starterpackviewbasic_of_value : app_bsky_graph_defs_starterpackviewbasic Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let record = Value.Util.get_key "record" (fun v -> v (* immediate *)) v in
    let creator = Value.Util.get_key "creator" app_bsky_actor_defs_profileviewbasic_of_value v in
    let listItemCount = Value.Util.get_key_opt "listItemCount" Value.Util.to_int v in
    let joinedWeekCount = Value.Util.get_key_opt "joinedWeekCount" Value.Util.to_int v in
    let joinedAllTimeCount = Value.Util.get_key_opt "joinedAllTimeCount" Value.Util.to_int v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    {uri;cid;record;creator;listItemCount;joinedWeekCount;joinedAllTimeCount;labels;indexedAt;})


  (** def "com.atproto.repo.strongRef#main" *)
  type com_atproto_repo_strongref_main = {
    uri: string;
    cid: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_repo_strongref_main_of_value : com_atproto_repo_strongref_main Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    {uri;cid;})


  (** def "app.bsky.actor.defs#profileViewDetailed" *)
  type app_bsky_actor_defs_profileviewdetailed = {
    did: string;
    handle: string;
    displayName: string option;
    description: string option;
    avatar: string option;
    banner: string option;
    followersCount: int64 option;
    followsCount: int64 option;
    postsCount: int64 option;
    associated: app_bsky_actor_defs_profileassociated option;
    joinedViaStarterPack: app_bsky_graph_defs_starterpackviewbasic option;
    indexedAt: string option;
    createdAt: string option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    pinnedPost: com_atproto_repo_strongref_main option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_profileviewdetailed_of_value : app_bsky_actor_defs_profileviewdetailed Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let displayName = Value.Util.get_key_opt "displayName" Value.Util.to_text v in
    let description = Value.Util.get_key_opt "description" Value.Util.to_text v in
    let avatar = Value.Util.get_key_opt "avatar" Value.Util.to_text v in
    let banner = Value.Util.get_key_opt "banner" Value.Util.to_text v in
    let followersCount = Value.Util.get_key_opt "followersCount" Value.Util.to_int v in
    let followsCount = Value.Util.get_key_opt "followsCount" Value.Util.to_int v in
    let postsCount = Value.Util.get_key_opt "postsCount" Value.Util.to_int v in
    let associated = Value.Util.get_key_opt "associated" app_bsky_actor_defs_profileassociated_of_value v in
    let joinedViaStarterPack = Value.Util.get_key_opt "joinedViaStarterPack" app_bsky_graph_defs_starterpackviewbasic_of_value v in
    let indexedAt = Value.Util.get_key_opt "indexedAt" Value.Util.to_text v in
    let createdAt = Value.Util.get_key_opt "createdAt" Value.Util.to_text v in
    let viewer = Value.Util.get_key_opt "viewer" app_bsky_actor_defs_viewerstate_of_value v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let pinnedPost = Value.Util.get_key_opt "pinnedPost" com_atproto_repo_strongref_main_of_value v in
    let verification = Value.Util.get_key_opt "verification" app_bsky_actor_defs_verificationstate_of_value v in
    let status = Value.Util.get_key_opt "status" app_bsky_actor_defs_statusview_of_value v in
    {did;handle;displayName;description;avatar;banner;followersCount;followsCount;postsCount;associated;joinedViaStarterPack;indexedAt;createdAt;viewer;labels;pinnedPost;verification;status;})


  (** def "app.bsky.actor.defs#profileView" *)
  type app_bsky_actor_defs_profileview = {
    did: string;
    handle: string;
    displayName: string option;
    description: string option;
    avatar: string option;
    associated: app_bsky_actor_defs_profileassociated option;
    indexedAt: string option;
    createdAt: string option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_profileview_of_value : app_bsky_actor_defs_profileview Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let displayName = Value.Util.get_key_opt "displayName" Value.Util.to_text v in
    let description = Value.Util.get_key_opt "description" Value.Util.to_text v in
    let avatar = Value.Util.get_key_opt "avatar" Value.Util.to_text v in
    let associated = Value.Util.get_key_opt "associated" app_bsky_actor_defs_profileassociated_of_value v in
    let indexedAt = Value.Util.get_key_opt "indexedAt" Value.Util.to_text v in
    let createdAt = Value.Util.get_key_opt "createdAt" Value.Util.to_text v in
    let viewer = Value.Util.get_key_opt "viewer" app_bsky_actor_defs_viewerstate_of_value v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let verification = Value.Util.get_key_opt "verification" app_bsky_actor_defs_verificationstate_of_value v in
    let status = Value.Util.get_key_opt "status" app_bsky_actor_defs_statusview_of_value v in
    {did;handle;displayName;description;avatar;associated;indexedAt;createdAt;viewer;labels;verification;status;})


  (** def "app.bsky.richtext.facet#byteSlice" *)
  type app_bsky_richtext_facet_byteslice = {
    byteStart: int64;
    byteEnd: int64;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_richtext_facet_byteslice_of_value : app_bsky_richtext_facet_byteslice Value.Util.conv = (fun v ->
    let byteStart = Value.Util.get_key "byteStart" Value.Util.to_int v in
    let byteEnd = Value.Util.get_key "byteEnd" Value.Util.to_int v in
    {byteStart;byteEnd;})


  (** def "app.bsky.richtext.facet#mention" *)
  type app_bsky_richtext_facet_mention = {
    did: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_richtext_facet_mention_of_value : app_bsky_richtext_facet_mention Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;})


  (** def "app.bsky.richtext.facet#link" *)
  type app_bsky_richtext_facet_link = {
    uri: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_richtext_facet_link_of_value : app_bsky_richtext_facet_link Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    {uri;})


  (** def "app.bsky.richtext.facet#tag" *)
  type app_bsky_richtext_facet_tag = {
    tag: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_richtext_facet_tag_of_value : app_bsky_richtext_facet_tag Value.Util.conv = (fun v ->
    let tag = Value.Util.get_key "tag" Value.Util.to_text v in
    {tag;})


  (** def "app.bsky.richtext.facet#main" *)
  type app_bsky_richtext_facet_main = {
    index: app_bsky_richtext_facet_byteslice;
    features: [
    `App_bsky_richtext_facet_mention of app_bsky_richtext_facet_mention
    | `App_bsky_richtext_facet_link of app_bsky_richtext_facet_link
    | `App_bsky_richtext_facet_tag of app_bsky_richtext_facet_tag
    | `Other of Value.t (** Non closed union *)
    ] list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_richtext_facet_main_of_value : app_bsky_richtext_facet_main Value.Util.conv = (fun v ->
    let index = Value.Util.get_key "index" app_bsky_richtext_facet_byteslice_of_value v in
    let features = Value.Util.get_key "features" (Value.Util.to_array_of (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "mention" -> `App_bsky_richtext_facet_mention (app_bsky_richtext_facet_mention_of_value v)
    | "link" -> `App_bsky_richtext_facet_link (app_bsky_richtext_facet_link_of_value v)
    | "tag" -> `App_bsky_richtext_facet_tag (app_bsky_richtext_facet_tag_of_value v)
    | _ -> `Other v (* Non closed union *)
    ))) v in
    {index;features;})


  (** def "app.bsky.feed.defs#generatorViewerState" *)
  type app_bsky_feed_defs_generatorviewerstate = {
    like: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_generatorviewerstate_of_value : app_bsky_feed_defs_generatorviewerstate Value.Util.conv = (fun v ->
    let like = Value.Util.get_key_opt "like" Value.Util.to_text v in
    {like;})


  (** def "app.bsky.feed.defs#generatorView" *)
  type app_bsky_feed_defs_generatorview = {
    uri: string;
    cid: string;
    did: string;
    creator: app_bsky_actor_defs_profileview;
    displayName: string;
    description: string option;
    descriptionFacets: app_bsky_richtext_facet_main list option;
    avatar: string option;
    likeCount: int64 option;
    acceptsInteractions: bool option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_feed_defs_generatorviewerstate option;
    contentMode: string option;
    indexedAt: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_generatorview_of_value : app_bsky_feed_defs_generatorview Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let creator = Value.Util.get_key "creator" app_bsky_actor_defs_profileview_of_value v in
    let displayName = Value.Util.get_key "displayName" Value.Util.to_text v in
    let description = Value.Util.get_key_opt "description" Value.Util.to_text v in
    let descriptionFacets = Value.Util.get_key_opt "descriptionFacets" (Value.Util.to_array_of app_bsky_richtext_facet_main_of_value) v in
    let avatar = Value.Util.get_key_opt "avatar" Value.Util.to_text v in
    let likeCount = Value.Util.get_key_opt "likeCount" Value.Util.to_int v in
    let acceptsInteractions = Value.Util.get_key_opt "acceptsInteractions" Value.Util.to_bool v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let viewer = Value.Util.get_key_opt "viewer" app_bsky_feed_defs_generatorviewerstate_of_value v in
    let contentMode = Value.Util.get_key_opt "contentMode" Value.Util.to_text v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    {uri;cid;did;creator;displayName;description;descriptionFacets;avatar;likeCount;acceptsInteractions;labels;viewer;contentMode;indexedAt;})


  (** def "app.bsky.embed.defs#aspectRatio" *)
  type app_bsky_embed_defs_aspectratio = {
    width: int64;
    height: int64;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_defs_aspectratio_of_value : app_bsky_embed_defs_aspectratio Value.Util.conv = (fun v ->
    let width = Value.Util.get_key "width" Value.Util.to_int v in
    let height = Value.Util.get_key "height" Value.Util.to_int v in
    {width;height;})


  (** def "app.bsky.embed.images#viewImage" *)
  type app_bsky_embed_images_viewimage = {
    thumb: string;
    fullsize: string;
    alt: string;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_images_viewimage_of_value : app_bsky_embed_images_viewimage Value.Util.conv = (fun v ->
    let thumb = Value.Util.get_key "thumb" Value.Util.to_text v in
    let fullsize = Value.Util.get_key "fullsize" Value.Util.to_text v in
    let alt = Value.Util.get_key "alt" Value.Util.to_text v in
    let aspectRatio = Value.Util.get_key_opt "aspectRatio" app_bsky_embed_defs_aspectratio_of_value v in
    {thumb;fullsize;alt;aspectRatio;})


  (** def "com.atproto.repo.applyWrites#create" *)
  type com_atproto_repo_applywrites_create = {
    collection: string;
    rkey: string option;
    value: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_repo_applywrites_create_of_value : com_atproto_repo_applywrites_create Value.Util.conv = (fun v ->
    let collection = Value.Util.get_key "collection" Value.Util.to_text v in
    let rkey = Value.Util.get_key_opt "rkey" Value.Util.to_text v in
    let value = Value.Util.get_key "value" (fun v -> v (* immediate *)) v in
    {collection;rkey;value;})


  (** def "com.atproto.sync.defs#hostStatus" *)
  type com_atproto_sync_defs_hoststatus = string
  [@@deriving show {with_path=false}]

  let rec com_atproto_sync_defs_hoststatus_of_value : string Value.Util.conv = Value.Util.to_text


  (** def "app.bsky.embed.images#image" *)
  type app_bsky_embed_images_image = {
    image: Blob.t;
    alt: string;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_images_image_of_value : app_bsky_embed_images_image Value.Util.conv = (fun v ->
    let image = Value.Util.get_key "image" Blob.of_value_exn v in
    let alt = Value.Util.get_key "alt" Value.Util.to_text v in
    let aspectRatio = Value.Util.get_key_opt "aspectRatio" app_bsky_embed_defs_aspectratio_of_value v in
    {image;alt;aspectRatio;})


  (** def "app.bsky.embed.images#main" *)
  type app_bsky_embed_images_main = {
    images: app_bsky_embed_images_image list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_images_main_of_value : app_bsky_embed_images_main Value.Util.conv = (fun v ->
    let images = Value.Util.get_key "images" (Value.Util.to_array_of app_bsky_embed_images_image_of_value) v in
    {images;})


  (** def "com.atproto.sync.subscribeRepos#account" *)
  type com_atproto_sync_subscriberepos_account = {
    seq: int64;
    did: string;
    time: string;
    active: bool;
    status: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_sync_subscriberepos_account_of_value : com_atproto_sync_subscriberepos_account Value.Util.conv = (fun v ->
    let seq = Value.Util.get_key "seq" Value.Util.to_int v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let time = Value.Util.get_key "time" Value.Util.to_text v in
    let active = Value.Util.get_key "active" Value.Util.to_bool v in
    let status = Value.Util.get_key_opt "status" Value.Util.to_text v in
    {seq;did;time;active;status;})


  (** def "app.bsky.actor.defs#adultContentPref" *)
  type app_bsky_actor_defs_adultcontentpref = {
    enabled: bool;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_adultcontentpref_of_value : app_bsky_actor_defs_adultcontentpref Value.Util.conv = (fun v ->
    let enabled = Value.Util.get_key "enabled" Value.Util.to_bool v in
    {enabled;})


  (** def "app.bsky.actor.defs#contentLabelPref" *)
  type app_bsky_actor_defs_contentlabelpref = {
    labelerDid: string option;
    label: string;
    visibility: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_contentlabelpref_of_value : app_bsky_actor_defs_contentlabelpref Value.Util.conv = (fun v ->
    let labelerDid = Value.Util.get_key_opt "labelerDid" Value.Util.to_text v in
    let label = Value.Util.get_key "label" Value.Util.to_text v in
    let visibility = Value.Util.get_key "visibility" Value.Util.to_text v in
    {labelerDid;label;visibility;})


  (** def "app.bsky.actor.defs#savedFeedsPref" *)
  type app_bsky_actor_defs_savedfeedspref = {
    pinned: string list;
    saved: string list;
    timelineIndex: int64 option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_savedfeedspref_of_value : app_bsky_actor_defs_savedfeedspref Value.Util.conv = (fun v ->
    let pinned = Value.Util.get_key "pinned" (Value.Util.to_array_of Value.Util.to_text) v in
    let saved = Value.Util.get_key "saved" (Value.Util.to_array_of Value.Util.to_text) v in
    let timelineIndex = Value.Util.get_key_opt "timelineIndex" Value.Util.to_int v in
    {pinned;saved;timelineIndex;})


  (** def "app.bsky.actor.defs#savedFeed" *)
  type app_bsky_actor_defs_savedfeed = {
    id: string;
    type_: string;
    value: string;
    pinned: bool;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_savedfeed_of_value : app_bsky_actor_defs_savedfeed Value.Util.conv = (fun v ->
    let id = Value.Util.get_key "id" Value.Util.to_text v in
    let type_ = Value.Util.get_key "type" Value.Util.to_text v in
    let value = Value.Util.get_key "value" Value.Util.to_text v in
    let pinned = Value.Util.get_key "pinned" Value.Util.to_bool v in
    {id;type_;value;pinned;})


  (** def "app.bsky.actor.defs#savedFeedsPrefV2" *)
  type app_bsky_actor_defs_savedfeedsprefv2 = {
    items: app_bsky_actor_defs_savedfeed list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_savedfeedsprefv2_of_value : app_bsky_actor_defs_savedfeedsprefv2 Value.Util.conv = (fun v ->
    let items = Value.Util.get_key "items" (Value.Util.to_array_of app_bsky_actor_defs_savedfeed_of_value) v in
    {items;})


  (** def "app.bsky.actor.defs#personalDetailsPref" *)
  type app_bsky_actor_defs_personaldetailspref = {
    birthDate: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_personaldetailspref_of_value : app_bsky_actor_defs_personaldetailspref Value.Util.conv = (fun v ->
    let birthDate = Value.Util.get_key_opt "birthDate" Value.Util.to_text v in
    {birthDate;})


  (** def "app.bsky.actor.defs#feedViewPref" *)
  type app_bsky_actor_defs_feedviewpref = {
    feed: string;
    hideReplies: bool option;
    hideRepliesByUnfollowed: bool option;
    hideRepliesByLikeCount: int64 option;
    hideReposts: bool option;
    hideQuotePosts: bool option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_feedviewpref_of_value : app_bsky_actor_defs_feedviewpref Value.Util.conv = (fun v ->
    let feed = Value.Util.get_key "feed" Value.Util.to_text v in
    let hideReplies = Value.Util.get_key_opt "hideReplies" Value.Util.to_bool v in
    let hideRepliesByUnfollowed = Value.Util.get_key_opt "hideRepliesByUnfollowed" Value.Util.to_bool v in
    let hideRepliesByLikeCount = Value.Util.get_key_opt "hideRepliesByLikeCount" Value.Util.to_int v in
    let hideReposts = Value.Util.get_key_opt "hideReposts" Value.Util.to_bool v in
    let hideQuotePosts = Value.Util.get_key_opt "hideQuotePosts" Value.Util.to_bool v in
    {feed;hideReplies;hideRepliesByUnfollowed;hideRepliesByLikeCount;hideReposts;hideQuotePosts;})


  (** def "app.bsky.actor.defs#threadViewPref" *)
  type app_bsky_actor_defs_threadviewpref = {
    sort: string option;
    prioritizeFollowedUsers: bool option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_threadviewpref_of_value : app_bsky_actor_defs_threadviewpref Value.Util.conv = (fun v ->
    let sort = Value.Util.get_key_opt "sort" Value.Util.to_text v in
    let prioritizeFollowedUsers = Value.Util.get_key_opt "prioritizeFollowedUsers" Value.Util.to_bool v in
    {sort;prioritizeFollowedUsers;})


  (** def "app.bsky.actor.defs#interestsPref" *)
  type app_bsky_actor_defs_interestspref = {
    tags: string list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_interestspref_of_value : app_bsky_actor_defs_interestspref Value.Util.conv = (fun v ->
    let tags = Value.Util.get_key "tags" (Value.Util.to_array_of Value.Util.to_text) v in
    {tags;})


  (** def "app.bsky.actor.defs#mutedWordTarget" *)
  type app_bsky_actor_defs_mutedwordtarget = string
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_mutedwordtarget_of_value : string Value.Util.conv = Value.Util.to_text


  (** def "app.bsky.actor.defs#mutedWord" *)
  type app_bsky_actor_defs_mutedword = {
    id: string option;
    value: string;
    targets: app_bsky_actor_defs_mutedwordtarget list;
    actorTarget: string option;
    expiresAt: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_mutedword_of_value : app_bsky_actor_defs_mutedword Value.Util.conv = (fun v ->
    let id = Value.Util.get_key_opt "id" Value.Util.to_text v in
    let value = Value.Util.get_key "value" Value.Util.to_text v in
    let targets = Value.Util.get_key "targets" (Value.Util.to_array_of app_bsky_actor_defs_mutedwordtarget_of_value) v in
    let actorTarget = Value.Util.get_key_opt "actorTarget" Value.Util.to_text v in
    let expiresAt = Value.Util.get_key_opt "expiresAt" Value.Util.to_text v in
    {id;value;targets;actorTarget;expiresAt;})


  (** def "app.bsky.actor.defs#mutedWordsPref" *)
  type app_bsky_actor_defs_mutedwordspref = {
    items: app_bsky_actor_defs_mutedword list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_mutedwordspref_of_value : app_bsky_actor_defs_mutedwordspref Value.Util.conv = (fun v ->
    let items = Value.Util.get_key "items" (Value.Util.to_array_of app_bsky_actor_defs_mutedword_of_value) v in
    {items;})


  (** def "app.bsky.actor.defs#hiddenPostsPref" *)
  type app_bsky_actor_defs_hiddenpostspref = {
    items: string list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_hiddenpostspref_of_value : app_bsky_actor_defs_hiddenpostspref Value.Util.conv = (fun v ->
    let items = Value.Util.get_key "items" (Value.Util.to_array_of Value.Util.to_text) v in
    {items;})


  (** def "app.bsky.actor.defs#bskyAppProgressGuide" *)
  type app_bsky_actor_defs_bskyappprogressguide = {
    guide: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_bskyappprogressguide_of_value : app_bsky_actor_defs_bskyappprogressguide Value.Util.conv = (fun v ->
    let guide = Value.Util.get_key "guide" Value.Util.to_text v in
    {guide;})


  (** def "app.bsky.actor.defs#nux" *)
  type app_bsky_actor_defs_nux = {
    id: string;
    completed: bool;
    data: string option;
    expiresAt: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_nux_of_value : app_bsky_actor_defs_nux Value.Util.conv = (fun v ->
    let id = Value.Util.get_key "id" Value.Util.to_text v in
    let completed = Value.Util.get_key "completed" Value.Util.to_bool v in
    let data = Value.Util.get_key_opt "data" Value.Util.to_text v in
    let expiresAt = Value.Util.get_key_opt "expiresAt" Value.Util.to_text v in
    {id;completed;data;expiresAt;})


  (** def "app.bsky.actor.defs#bskyAppStatePref" *)
  type app_bsky_actor_defs_bskyappstatepref = {
    activeProgressGuide: app_bsky_actor_defs_bskyappprogressguide option;
    queuedNudges: string list option;
    nuxs: app_bsky_actor_defs_nux list option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_bskyappstatepref_of_value : app_bsky_actor_defs_bskyappstatepref Value.Util.conv = (fun v ->
    let activeProgressGuide = Value.Util.get_key_opt "activeProgressGuide" app_bsky_actor_defs_bskyappprogressguide_of_value v in
    let queuedNudges = Value.Util.get_key_opt "queuedNudges" (Value.Util.to_array_of Value.Util.to_text) v in
    let nuxs = Value.Util.get_key_opt "nuxs" (Value.Util.to_array_of app_bsky_actor_defs_nux_of_value) v in
    {activeProgressGuide;queuedNudges;nuxs;})


  (** def "app.bsky.actor.defs#labelerPrefItem" *)
  type app_bsky_actor_defs_labelerprefitem = {
    did: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_labelerprefitem_of_value : app_bsky_actor_defs_labelerprefitem Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;})


  (** def "app.bsky.actor.defs#labelersPref" *)
  type app_bsky_actor_defs_labelerspref = {
    labelers: app_bsky_actor_defs_labelerprefitem list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_labelerspref_of_value : app_bsky_actor_defs_labelerspref Value.Util.conv = (fun v ->
    let labelers = Value.Util.get_key "labelers" (Value.Util.to_array_of app_bsky_actor_defs_labelerprefitem_of_value) v in
    {labelers;})


  (** def "app.bsky.feed.threadgate#mentionRule" *)
  type app_bsky_feed_threadgate_mentionrule = [`App_bsky_feed_threadgate_mentionrule]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_threadgate_mentionrule_of_value : app_bsky_feed_threadgate_mentionrule Value.Util.conv = (fun _ -> `App_bsky_feed_threadgate_mentionrule)


  (** def "app.bsky.feed.threadgate#followerRule" *)
  type app_bsky_feed_threadgate_followerrule = [`App_bsky_feed_threadgate_followerrule]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_threadgate_followerrule_of_value : app_bsky_feed_threadgate_followerrule Value.Util.conv = (fun _ -> `App_bsky_feed_threadgate_followerrule)


  (** def "app.bsky.feed.threadgate#followingRule" *)
  type app_bsky_feed_threadgate_followingrule = [`App_bsky_feed_threadgate_followingrule]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_threadgate_followingrule_of_value : app_bsky_feed_threadgate_followingrule Value.Util.conv = (fun _ -> `App_bsky_feed_threadgate_followingrule)


  (** def "app.bsky.feed.threadgate#listRule" *)
  type app_bsky_feed_threadgate_listrule = {
    list: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_threadgate_listrule_of_value : app_bsky_feed_threadgate_listrule Value.Util.conv = (fun v ->
    let list = Value.Util.get_key "list" Value.Util.to_text v in
    {list;})


  (** def "app.bsky.feed.postgate#disableRule" *)
  type app_bsky_feed_postgate_disablerule = [`App_bsky_feed_postgate_disablerule]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_postgate_disablerule_of_value : app_bsky_feed_postgate_disablerule Value.Util.conv = (fun _ -> `App_bsky_feed_postgate_disablerule)


  (** def "app.bsky.actor.defs#postInteractionSettingsPref" *)
  type app_bsky_actor_defs_postinteractionsettingspref = {
    threadgateAllowRules: [
    `App_bsky_feed_threadgate_mentionrule of app_bsky_feed_threadgate_mentionrule
    | `App_bsky_feed_threadgate_followerrule of app_bsky_feed_threadgate_followerrule
    | `App_bsky_feed_threadgate_followingrule of app_bsky_feed_threadgate_followingrule
    | `App_bsky_feed_threadgate_listrule of app_bsky_feed_threadgate_listrule
    | `Other of Value.t (** Non closed union *)
    ] list option;
    postgateEmbeddingRules: [
    `App_bsky_feed_postgate_disablerule of app_bsky_feed_postgate_disablerule
    | `Other of Value.t (** Non closed union *)
    ] list option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_postinteractionsettingspref_of_value : app_bsky_actor_defs_postinteractionsettingspref Value.Util.conv = (fun v ->
    let threadgateAllowRules = Value.Util.get_key_opt "threadgateAllowRules" (Value.Util.to_array_of (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "mentionRule" -> `App_bsky_feed_threadgate_mentionrule (app_bsky_feed_threadgate_mentionrule_of_value v)
    | "followerRule" -> `App_bsky_feed_threadgate_followerrule (app_bsky_feed_threadgate_followerrule_of_value v)
    | "followingRule" -> `App_bsky_feed_threadgate_followingrule (app_bsky_feed_threadgate_followingrule_of_value v)
    | "listRule" -> `App_bsky_feed_threadgate_listrule (app_bsky_feed_threadgate_listrule_of_value v)
    | _ -> `Other v (* Non closed union *)
    ))) v in
    let postgateEmbeddingRules = Value.Util.get_key_opt "postgateEmbeddingRules" (Value.Util.to_array_of (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "disableRule" -> `App_bsky_feed_postgate_disablerule (app_bsky_feed_postgate_disablerule_of_value v)
    | _ -> `Other v (* Non closed union *)
    ))) v in
    {threadgateAllowRules;postgateEmbeddingRules;})


  (** def "app.bsky.actor.defs#verificationPrefs" *)
  type app_bsky_actor_defs_verificationprefs = {
    hideBadges: bool option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_verificationprefs_of_value : app_bsky_actor_defs_verificationprefs Value.Util.conv = (fun v ->
    let hideBadges = Value.Util.get_key_opt "hideBadges" Value.Util.to_bool v in
    {hideBadges;})


  (** def "app.bsky.actor.defs#preferences" *)
  type app_bsky_actor_defs_preferences = [
    `App_bsky_actor_defs_adultcontentpref of app_bsky_actor_defs_adultcontentpref
    | `App_bsky_actor_defs_contentlabelpref of app_bsky_actor_defs_contentlabelpref
    | `App_bsky_actor_defs_savedfeedspref of app_bsky_actor_defs_savedfeedspref
    | `App_bsky_actor_defs_savedfeedsprefv2 of app_bsky_actor_defs_savedfeedsprefv2
    | `App_bsky_actor_defs_personaldetailspref of app_bsky_actor_defs_personaldetailspref
    | `App_bsky_actor_defs_feedviewpref of app_bsky_actor_defs_feedviewpref
    | `App_bsky_actor_defs_threadviewpref of app_bsky_actor_defs_threadviewpref
    | `App_bsky_actor_defs_interestspref of app_bsky_actor_defs_interestspref
    | `App_bsky_actor_defs_mutedwordspref of app_bsky_actor_defs_mutedwordspref
    | `App_bsky_actor_defs_hiddenpostspref of app_bsky_actor_defs_hiddenpostspref
    | `App_bsky_actor_defs_bskyappstatepref of app_bsky_actor_defs_bskyappstatepref
    | `App_bsky_actor_defs_labelerspref of app_bsky_actor_defs_labelerspref
    | `App_bsky_actor_defs_postinteractionsettingspref of app_bsky_actor_defs_postinteractionsettingspref
    | `App_bsky_actor_defs_verificationprefs of app_bsky_actor_defs_verificationprefs
    | `Other of Value.t (** Non closed union *)
    ] list
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_defs_preferences_of_value : [
    `App_bsky_actor_defs_adultcontentpref of app_bsky_actor_defs_adultcontentpref
    | `App_bsky_actor_defs_contentlabelpref of app_bsky_actor_defs_contentlabelpref
    | `App_bsky_actor_defs_savedfeedspref of app_bsky_actor_defs_savedfeedspref
    | `App_bsky_actor_defs_savedfeedsprefv2 of app_bsky_actor_defs_savedfeedsprefv2
    | `App_bsky_actor_defs_personaldetailspref of app_bsky_actor_defs_personaldetailspref
    | `App_bsky_actor_defs_feedviewpref of app_bsky_actor_defs_feedviewpref
    | `App_bsky_actor_defs_threadviewpref of app_bsky_actor_defs_threadviewpref
    | `App_bsky_actor_defs_interestspref of app_bsky_actor_defs_interestspref
    | `App_bsky_actor_defs_mutedwordspref of app_bsky_actor_defs_mutedwordspref
    | `App_bsky_actor_defs_hiddenpostspref of app_bsky_actor_defs_hiddenpostspref
    | `App_bsky_actor_defs_bskyappstatepref of app_bsky_actor_defs_bskyappstatepref
    | `App_bsky_actor_defs_labelerspref of app_bsky_actor_defs_labelerspref
    | `App_bsky_actor_defs_postinteractionsettingspref of app_bsky_actor_defs_postinteractionsettingspref
    | `App_bsky_actor_defs_verificationprefs of app_bsky_actor_defs_verificationprefs
    | `Other of Value.t (** Non closed union *)
    ] list Value.Util.conv = (Value.Util.to_array_of (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "adultContentPref" -> `App_bsky_actor_defs_adultcontentpref (app_bsky_actor_defs_adultcontentpref_of_value v)
    | "contentLabelPref" -> `App_bsky_actor_defs_contentlabelpref (app_bsky_actor_defs_contentlabelpref_of_value v)
    | "savedFeedsPref" -> `App_bsky_actor_defs_savedfeedspref (app_bsky_actor_defs_savedfeedspref_of_value v)
    | "savedFeedsPrefV2" -> `App_bsky_actor_defs_savedfeedsprefv2 (app_bsky_actor_defs_savedfeedsprefv2_of_value v)
    | "personalDetailsPref" -> `App_bsky_actor_defs_personaldetailspref (app_bsky_actor_defs_personaldetailspref_of_value v)
    | "feedViewPref" -> `App_bsky_actor_defs_feedviewpref (app_bsky_actor_defs_feedviewpref_of_value v)
    | "threadViewPref" -> `App_bsky_actor_defs_threadviewpref (app_bsky_actor_defs_threadviewpref_of_value v)
    | "interestsPref" -> `App_bsky_actor_defs_interestspref (app_bsky_actor_defs_interestspref_of_value v)
    | "mutedWordsPref" -> `App_bsky_actor_defs_mutedwordspref (app_bsky_actor_defs_mutedwordspref_of_value v)
    | "hiddenPostsPref" -> `App_bsky_actor_defs_hiddenpostspref (app_bsky_actor_defs_hiddenpostspref_of_value v)
    | "bskyAppStatePref" -> `App_bsky_actor_defs_bskyappstatepref (app_bsky_actor_defs_bskyappstatepref_of_value v)
    | "labelersPref" -> `App_bsky_actor_defs_labelerspref (app_bsky_actor_defs_labelerspref_of_value v)
    | "postInteractionSettingsPref" -> `App_bsky_actor_defs_postinteractionsettingspref (app_bsky_actor_defs_postinteractionsettingspref_of_value v)
    | "verificationPrefs" -> `App_bsky_actor_defs_verificationprefs (app_bsky_actor_defs_verificationprefs_of_value v)
    | _ -> `Other v (* Non closed union *)
    )))


  (** def "com.atproto.moderation.defs#reasonType" *)
  type com_atproto_moderation_defs_reasontype = string
  [@@deriving show {with_path=false}]

  let rec com_atproto_moderation_defs_reasontype_of_value : string Value.Util.conv = Value.Util.to_text


  (** def "app.bsky.embed.images#view" *)
  type app_bsky_embed_images_view = {
    images: app_bsky_embed_images_viewimage list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_images_view_of_value : app_bsky_embed_images_view Value.Util.conv = (fun v ->
    let images = Value.Util.get_key "images" (Value.Util.to_array_of app_bsky_embed_images_viewimage_of_value) v in
    {images;})


  (** def "app.bsky.embed.video#view" *)
  type app_bsky_embed_video_view = {
    cid: string;
    playlist: string;
    thumbnail: string option;
    alt: string option;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_video_view_of_value : app_bsky_embed_video_view Value.Util.conv = (fun v ->
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let playlist = Value.Util.get_key "playlist" Value.Util.to_text v in
    let thumbnail = Value.Util.get_key_opt "thumbnail" Value.Util.to_text v in
    let alt = Value.Util.get_key_opt "alt" Value.Util.to_text v in
    let aspectRatio = Value.Util.get_key_opt "aspectRatio" app_bsky_embed_defs_aspectratio_of_value v in
    {cid;playlist;thumbnail;alt;aspectRatio;})


  (** def "app.bsky.embed.record#viewNotFound" *)
  type app_bsky_embed_record_viewnotfound = {
    uri: string;
    notFound: bool;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_record_viewnotfound_of_value : app_bsky_embed_record_viewnotfound Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let notFound = Value.Util.get_key "notFound" Value.Util.to_bool v in
    {uri;notFound;})


  (** def "app.bsky.feed.defs#blockedAuthor" *)
  type app_bsky_feed_defs_blockedauthor = {
    did: string;
    viewer: app_bsky_actor_defs_viewerstate option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_blockedauthor_of_value : app_bsky_feed_defs_blockedauthor Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let viewer = Value.Util.get_key_opt "viewer" app_bsky_actor_defs_viewerstate_of_value v in
    {did;viewer;})


  (** def "app.bsky.embed.record#viewBlocked" *)
  type app_bsky_embed_record_viewblocked = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_record_viewblocked_of_value : app_bsky_embed_record_viewblocked Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let blocked = Value.Util.get_key "blocked" Value.Util.to_bool v in
    let author = Value.Util.get_key "author" app_bsky_feed_defs_blockedauthor_of_value v in
    {uri;blocked;author;})


  (** def "app.bsky.embed.record#viewDetached" *)
  type app_bsky_embed_record_viewdetached = {
    uri: string;
    detached: bool;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_record_viewdetached_of_value : app_bsky_embed_record_viewdetached Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let detached = Value.Util.get_key "detached" Value.Util.to_bool v in
    {uri;detached;})


  (** def "app.bsky.graph.defs#listView" *)
  type app_bsky_graph_defs_listview = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    name: string;
    purpose: app_bsky_graph_defs_listpurpose;
    description: string option;
    descriptionFacets: app_bsky_richtext_facet_main list option;
    avatar: string option;
    listItemCount: int64 option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_graph_defs_listviewerstate option;
    indexedAt: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_listview_of_value : app_bsky_graph_defs_listview Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let creator = Value.Util.get_key "creator" app_bsky_actor_defs_profileview_of_value v in
    let name = Value.Util.get_key "name" Value.Util.to_text v in
    let purpose = Value.Util.get_key "purpose" app_bsky_graph_defs_listpurpose_of_value v in
    let description = Value.Util.get_key_opt "description" Value.Util.to_text v in
    let descriptionFacets = Value.Util.get_key_opt "descriptionFacets" (Value.Util.to_array_of app_bsky_richtext_facet_main_of_value) v in
    let avatar = Value.Util.get_key_opt "avatar" Value.Util.to_text v in
    let listItemCount = Value.Util.get_key_opt "listItemCount" Value.Util.to_int v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let viewer = Value.Util.get_key_opt "viewer" app_bsky_graph_defs_listviewerstate_of_value v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    {uri;cid;creator;name;purpose;description;descriptionFacets;avatar;listItemCount;labels;viewer;indexedAt;})


  (** def "app.bsky.labeler.defs#labelerViewerState" *)
  type app_bsky_labeler_defs_labelerviewerstate = {
    like: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_labeler_defs_labelerviewerstate_of_value : app_bsky_labeler_defs_labelerviewerstate Value.Util.conv = (fun v ->
    let like = Value.Util.get_key_opt "like" Value.Util.to_text v in
    {like;})


  (** def "app.bsky.labeler.defs#labelerView" *)
  type app_bsky_labeler_defs_labelerview = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    likeCount: int64 option;
    viewer: app_bsky_labeler_defs_labelerviewerstate option;
    indexedAt: string;
    labels: com_atproto_label_defs_label list option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_labeler_defs_labelerview_of_value : app_bsky_labeler_defs_labelerview Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let creator = Value.Util.get_key "creator" app_bsky_actor_defs_profileview_of_value v in
    let likeCount = Value.Util.get_key_opt "likeCount" Value.Util.to_int v in
    let viewer = Value.Util.get_key_opt "viewer" app_bsky_labeler_defs_labelerviewerstate_of_value v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    {uri;cid;creator;likeCount;viewer;indexedAt;labels;})


  (** def "app.bsky.embed.record#viewRecord" *)
  type app_bsky_embed_record_viewrecord = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileviewbasic;
    value: Value.t (* unknown *);
    labels: com_atproto_label_defs_label list option;
    replyCount: int64 option;
    repostCount: int64 option;
    likeCount: int64 option;
    quoteCount: int64 option;
    embeds: [
    `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `App_bsky_embed_recordwithmedia_view of app_bsky_embed_recordwithmedia_view
    | `Other of Value.t (** Non closed union *)
    ] list option;
    indexedAt: string;
  }

  (** def "app.bsky.embed.record#view" *)
  and app_bsky_embed_record_view = {
    record: [
    `App_bsky_embed_record_viewrecord of app_bsky_embed_record_viewrecord
    | `App_bsky_embed_record_viewnotfound of app_bsky_embed_record_viewnotfound
    | `App_bsky_embed_record_viewblocked of app_bsky_embed_record_viewblocked
    | `App_bsky_embed_record_viewdetached of app_bsky_embed_record_viewdetached
    | `App_bsky_feed_defs_generatorview of app_bsky_feed_defs_generatorview
    | `App_bsky_graph_defs_listview of app_bsky_graph_defs_listview
    | `App_bsky_labeler_defs_labelerview of app_bsky_labeler_defs_labelerview
    | `App_bsky_graph_defs_starterpackviewbasic of app_bsky_graph_defs_starterpackviewbasic
    | `Other of Value.t (** Non closed union *)
    ];
  }

  (** def "app.bsky.embed.recordWithMedia#view" *)
  and app_bsky_embed_recordwithmedia_view = {
    record: app_bsky_embed_record_view;
    media: [
    `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `Other of Value.t (** Non closed union *)
    ];
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_record_viewrecord_of_value : app_bsky_embed_record_viewrecord Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let author = Value.Util.get_key "author" app_bsky_actor_defs_profileviewbasic_of_value v in
    let value = Value.Util.get_key "value" (fun v -> v (* immediate *)) v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let replyCount = Value.Util.get_key_opt "replyCount" Value.Util.to_int v in
    let repostCount = Value.Util.get_key_opt "repostCount" Value.Util.to_int v in
    let likeCount = Value.Util.get_key_opt "likeCount" Value.Util.to_int v in
    let quoteCount = Value.Util.get_key_opt "quoteCount" Value.Util.to_int v in
    let embeds = Value.Util.get_key_opt "embeds" (Value.Util.to_array_of (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "view" -> `App_bsky_embed_images_view (app_bsky_embed_images_view_of_value v)
    | "view" -> `App_bsky_embed_video_view (app_bsky_embed_video_view_of_value v)
    | "view" -> `App_bsky_embed_external_view (app_bsky_embed_external_view_of_value v)
    | "view" -> `App_bsky_embed_record_view (app_bsky_embed_record_view_of_value v)
    | "view" -> `App_bsky_embed_recordwithmedia_view (app_bsky_embed_recordwithmedia_view_of_value v)
    | _ -> `Other v (* Non closed union *)
    ))) v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    {uri;cid;author;value;labels;replyCount;repostCount;likeCount;quoteCount;embeds;indexedAt;})
  and app_bsky_embed_record_view_of_value : app_bsky_embed_record_view Value.Util.conv = (fun v ->
    let record = Value.Util.get_key "record" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "viewRecord" -> `App_bsky_embed_record_viewrecord (app_bsky_embed_record_viewrecord_of_value v)
    | "viewNotFound" -> `App_bsky_embed_record_viewnotfound (app_bsky_embed_record_viewnotfound_of_value v)
    | "viewBlocked" -> `App_bsky_embed_record_viewblocked (app_bsky_embed_record_viewblocked_of_value v)
    | "viewDetached" -> `App_bsky_embed_record_viewdetached (app_bsky_embed_record_viewdetached_of_value v)
    | "generatorView" -> `App_bsky_feed_defs_generatorview (app_bsky_feed_defs_generatorview_of_value v)
    | "listView" -> `App_bsky_graph_defs_listview (app_bsky_graph_defs_listview_of_value v)
    | "labelerView" -> `App_bsky_labeler_defs_labelerview (app_bsky_labeler_defs_labelerview_of_value v)
    | "starterPackViewBasic" -> `App_bsky_graph_defs_starterpackviewbasic (app_bsky_graph_defs_starterpackviewbasic_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    {record;})
  and app_bsky_embed_recordwithmedia_view_of_value : app_bsky_embed_recordwithmedia_view Value.Util.conv = (fun v ->
    let record = Value.Util.get_key "record" app_bsky_embed_record_view_of_value v in
    let media = Value.Util.get_key "media" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "view" -> `App_bsky_embed_images_view (app_bsky_embed_images_view_of_value v)
    | "view" -> `App_bsky_embed_video_view (app_bsky_embed_video_view_of_value v)
    | "view" -> `App_bsky_embed_external_view (app_bsky_embed_external_view_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    {record;media;})


  (** def "app.bsky.feed.defs#requestMore" *)
  type app_bsky_feed_defs_requestmore = [`App_bsky_feed_defs_requestmore]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_requestmore_of_value : [`App_bsky_feed_defs_requestmore] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_requestmore)


  (** def "app.bsky.feed.defs#interactionSeen" *)
  type app_bsky_feed_defs_interactionseen = [`App_bsky_feed_defs_interactionseen]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_interactionseen_of_value : [`App_bsky_feed_defs_interactionseen] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_interactionseen)


  (** def "com.atproto.repo.applyWrites#delete" *)
  type com_atproto_repo_applywrites_delete = {
    collection: string;
    rkey: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_repo_applywrites_delete_of_value : com_atproto_repo_applywrites_delete Value.Util.conv = (fun v ->
    let collection = Value.Util.get_key "collection" Value.Util.to_text v in
    let rkey = Value.Util.get_key "rkey" Value.Util.to_text v in
    {collection;rkey;})


  (** def "com.atproto.repo.defs#commitMeta" *)
  type com_atproto_repo_defs_commitmeta = {
    cid: string;
    rev: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_repo_defs_commitmeta_of_value : com_atproto_repo_defs_commitmeta Value.Util.conv = (fun v ->
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let rev = Value.Util.get_key "rev" Value.Util.to_text v in
    {cid;rev;})


  (** def "com.atproto.server.describeServer#links" *)
  type com_atproto_server_describeserver_links = {
    privacyPolicy: string option;
    termsOfService: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_server_describeserver_links_of_value : com_atproto_server_describeserver_links Value.Util.conv = (fun v ->
    let privacyPolicy = Value.Util.get_key_opt "privacyPolicy" Value.Util.to_text v in
    let termsOfService = Value.Util.get_key_opt "termsOfService" Value.Util.to_text v in
    {privacyPolicy;termsOfService;})


  (** def "com.atproto.label.subscribeLabels#info" *)
  type com_atproto_label_subscribelabels_info = {
    name: string;
    message: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_label_subscribelabels_info_of_value : com_atproto_label_subscribelabels_info Value.Util.conv = (fun v ->
    let name = Value.Util.get_key "name" Value.Util.to_text v in
    let message = Value.Util.get_key_opt "message" Value.Util.to_text v in
    {name;message;})


  (** def "app.bsky.embed.video#caption" *)
  type app_bsky_embed_video_caption = {
    lang: string;
    file: Blob.t;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_video_caption_of_value : app_bsky_embed_video_caption Value.Util.conv = (fun v ->
    let lang = Value.Util.get_key "lang" Value.Util.to_text v in
    let file = Value.Util.get_key "file" Blob.of_value_exn v in
    {lang;file;})


  (** def "app.bsky.embed.video#main" *)
  type app_bsky_embed_video_main = {
    video: Blob.t;
    captions: app_bsky_embed_video_caption list option;
    alt: string option;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_video_main_of_value : app_bsky_embed_video_main Value.Util.conv = (fun v ->
    let video = Value.Util.get_key "video" Blob.of_value_exn v in
    let captions = Value.Util.get_key_opt "captions" (Value.Util.to_array_of app_bsky_embed_video_caption_of_value) v in
    let alt = Value.Util.get_key_opt "alt" Value.Util.to_text v in
    let aspectRatio = Value.Util.get_key_opt "aspectRatio" app_bsky_embed_defs_aspectratio_of_value v in
    {video;captions;alt;aspectRatio;})


  (** def "app.bsky.feed.describeFeedGenerator#feed" *)
  type app_bsky_feed_describefeedgenerator_feed = {
    uri: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_describefeedgenerator_feed_of_value : app_bsky_feed_describefeedgenerator_feed Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    {uri;})


  (** def "app.bsky.feed.defs#requestLess" *)
  type app_bsky_feed_defs_requestless = [`App_bsky_feed_defs_requestless]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_requestless_of_value : [`App_bsky_feed_defs_requestless] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_requestless)


  (** def "app.bsky.video.defs#jobStatus" *)
  type app_bsky_video_defs_jobstatus = {
    jobId: string;
    did: string;
    state: string;
    progress: int64 option;
    blob: Blob.t option;
    error: string option;
    message: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_video_defs_jobstatus_of_value : app_bsky_video_defs_jobstatus Value.Util.conv = (fun v ->
    let jobId = Value.Util.get_key "jobId" Value.Util.to_text v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let state = Value.Util.get_key "state" Value.Util.to_text v in
    let progress = Value.Util.get_key_opt "progress" Value.Util.to_int v in
    let blob = Value.Util.get_key_opt "blob" Blob.of_value_exn v in
    let error = Value.Util.get_key_opt "error" Value.Util.to_text v in
    let message = Value.Util.get_key_opt "message" Value.Util.to_text v in
    {jobId;did;state;progress;blob;error;message;})


  (** def "app.bsky.feed.defs#interactionReply" *)
  type app_bsky_feed_defs_interactionreply = [`App_bsky_feed_defs_interactionreply]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_interactionreply_of_value : [`App_bsky_feed_defs_interactionreply] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_interactionreply)


  (** def "app.bsky.feed.defs#reasonPin" *)
  type app_bsky_feed_defs_reasonpin = [`App_bsky_feed_defs_reasonpin]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_reasonpin_of_value : app_bsky_feed_defs_reasonpin Value.Util.conv = (fun _ -> `App_bsky_feed_defs_reasonpin)


  (** def "app.bsky.notification.defs#recordDeleted" *)
  type app_bsky_notification_defs_recorddeleted = [`App_bsky_notification_defs_recorddeleted]
  [@@deriving show {with_path=false}]

  let rec app_bsky_notification_defs_recorddeleted_of_value : app_bsky_notification_defs_recorddeleted Value.Util.conv = (fun _ -> `App_bsky_notification_defs_recorddeleted)


  (** def "app.bsky.unspecced.getTaggedSuggestions#suggestion" *)
  type app_bsky_unspecced_gettaggedsuggestions_suggestion = {
    tag: string;
    subjectType: string;
    subject: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_unspecced_gettaggedsuggestions_suggestion_of_value : app_bsky_unspecced_gettaggedsuggestions_suggestion Value.Util.conv = (fun v ->
    let tag = Value.Util.get_key "tag" Value.Util.to_text v in
    let subjectType = Value.Util.get_key "subjectType" Value.Util.to_text v in
    let subject = Value.Util.get_key "subject" Value.Util.to_text v in
    {tag;subjectType;subject;})


  (** def "app.bsky.feed.defs#skeletonReasonPin" *)
  type app_bsky_feed_defs_skeletonreasonpin = [`App_bsky_feed_defs_skeletonreasonpin]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_skeletonreasonpin_of_value : app_bsky_feed_defs_skeletonreasonpin Value.Util.conv = (fun _ -> `App_bsky_feed_defs_skeletonreasonpin)


  (** def "com.atproto.admin.defs#repoRef" *)
  type com_atproto_admin_defs_reporef = {
    did: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_admin_defs_reporef_of_value : com_atproto_admin_defs_reporef Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;})


  (** def "com.atproto.server.defs#inviteCodeUse" *)
  type com_atproto_server_defs_invitecodeuse = {
    usedBy: string;
    usedAt: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_server_defs_invitecodeuse_of_value : com_atproto_server_defs_invitecodeuse Value.Util.conv = (fun v ->
    let usedBy = Value.Util.get_key "usedBy" Value.Util.to_text v in
    let usedAt = Value.Util.get_key "usedAt" Value.Util.to_text v in
    {usedBy;usedAt;})


  (** def "app.bsky.feed.getLikes#like" *)
  type app_bsky_feed_getlikes_like = {
    indexedAt: string;
    createdAt: string;
    actor: app_bsky_actor_defs_profileview;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_getlikes_like_of_value : app_bsky_feed_getlikes_like Value.Util.conv = (fun v ->
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    let createdAt = Value.Util.get_key "createdAt" Value.Util.to_text v in
    let actor = Value.Util.get_key "actor" app_bsky_actor_defs_profileview_of_value v in
    {indexedAt;createdAt;actor;})


  (** def "app.bsky.embed.external#external" *)
  type app_bsky_embed_external_external = {
    uri: string;
    title: string;
    description: string;
    thumb: Blob.t option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_external_external_of_value : app_bsky_embed_external_external Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let title = Value.Util.get_key "title" Value.Util.to_text v in
    let description = Value.Util.get_key "description" Value.Util.to_text v in
    let thumb = Value.Util.get_key_opt "thumb" Blob.of_value_exn v in
    {uri;title;description;thumb;})


  (** def "com.atproto.label.defs#labelValueDefinitionStrings" *)
  type com_atproto_label_defs_labelvaluedefinitionstrings = {
    lang: string;
    name: string;
    description: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_label_defs_labelvaluedefinitionstrings_of_value : com_atproto_label_defs_labelvaluedefinitionstrings Value.Util.conv = (fun v ->
    let lang = Value.Util.get_key "lang" Value.Util.to_text v in
    let name = Value.Util.get_key "name" Value.Util.to_text v in
    let description = Value.Util.get_key "description" Value.Util.to_text v in
    {lang;name;description;})


  (** def "com.atproto.label.defs#labelValueDefinition" *)
  type com_atproto_label_defs_labelvaluedefinition = {
    identifier: string;
    severity: string;
    blurs: string;
    defaultSetting: string option;
    adultOnly: bool option;
    locales: com_atproto_label_defs_labelvaluedefinitionstrings list;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_label_defs_labelvaluedefinition_of_value : com_atproto_label_defs_labelvaluedefinition Value.Util.conv = (fun v ->
    let identifier = Value.Util.get_key "identifier" Value.Util.to_text v in
    let severity = Value.Util.get_key "severity" Value.Util.to_text v in
    let blurs = Value.Util.get_key "blurs" Value.Util.to_text v in
    let defaultSetting = Value.Util.get_key_opt "defaultSetting" Value.Util.to_text v in
    let adultOnly = Value.Util.get_key_opt "adultOnly" Value.Util.to_bool v in
    let locales = Value.Util.get_key "locales" (Value.Util.to_array_of com_atproto_label_defs_labelvaluedefinitionstrings_of_value) v in
    {identifier;severity;blurs;defaultSetting;adultOnly;locales;})


  (** def "app.bsky.feed.post#textSlice" *)
  type app_bsky_feed_post_textslice = {
    start: int64;
    end_: int64;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_post_textslice_of_value : app_bsky_feed_post_textslice Value.Util.conv = (fun v ->
    let start = Value.Util.get_key "start" Value.Util.to_int v in
    let end_ = Value.Util.get_key "end" Value.Util.to_int v in
    {start;end_;})


  (** def "com.atproto.label.defs#labelValue" *)
  type com_atproto_label_defs_labelvalue = string
  [@@deriving show {with_path=false}]

  let rec com_atproto_label_defs_labelvalue_of_value : string Value.Util.conv = Value.Util.to_text


  (** def "com.atproto.moderation.defs#reasonAppeal" *)
  type com_atproto_moderation_defs_reasonappeal = [`Com_atproto_moderation_defs_reasonappeal]
  [@@deriving show {with_path=false}]

  let rec com_atproto_moderation_defs_reasonappeal_of_value : [`Com_atproto_moderation_defs_reasonappeal] Value.Util.conv = (fun _ -> `Com_atproto_moderation_defs_reasonappeal)


  (** def "app.bsky.graph.defs#listItemView" *)
  type app_bsky_graph_defs_listitemview = {
    uri: string;
    subject: app_bsky_actor_defs_profileview;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_listitemview_of_value : app_bsky_graph_defs_listitemview Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let subject = Value.Util.get_key "subject" app_bsky_actor_defs_profileview_of_value v in
    {uri;subject;})


  (** def "com.atproto.admin.defs#threatSignature" *)
  type com_atproto_admin_defs_threatsignature = {
    property: string;
    value: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_admin_defs_threatsignature_of_value : com_atproto_admin_defs_threatsignature Value.Util.conv = (fun v ->
    let property = Value.Util.get_key "property" Value.Util.to_text v in
    let value = Value.Util.get_key "value" Value.Util.to_text v in
    {property;value;})


  (** def "app.bsky.feed.defs#skeletonReasonRepost" *)
  type app_bsky_feed_defs_skeletonreasonrepost = {
    repost: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_skeletonreasonrepost_of_value : app_bsky_feed_defs_skeletonreasonrepost Value.Util.conv = (fun v ->
    let repost = Value.Util.get_key "repost" Value.Util.to_text v in
    {repost;})


  (** def "app.bsky.feed.defs#interaction" *)
  type app_bsky_feed_defs_interaction = {
    item: string option;
    event: string option;
    feedContext: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_interaction_of_value : app_bsky_feed_defs_interaction Value.Util.conv = (fun v ->
    let item = Value.Util.get_key_opt "item" Value.Util.to_text v in
    let event = Value.Util.get_key_opt "event" Value.Util.to_text v in
    let feedContext = Value.Util.get_key_opt "feedContext" Value.Util.to_text v in
    {item;event;feedContext;})


  (** def "com.atproto.moderation.defs#reasonViolation" *)
  type com_atproto_moderation_defs_reasonviolation = [`Com_atproto_moderation_defs_reasonviolation]
  [@@deriving show {with_path=false}]

  let rec com_atproto_moderation_defs_reasonviolation_of_value : [`Com_atproto_moderation_defs_reasonviolation] Value.Util.conv = (fun _ -> `Com_atproto_moderation_defs_reasonviolation)


  (** def "com.atproto.sync.subscribeRepos#repoOp" *)
  type com_atproto_sync_subscriberepos_repoop = {
    action: string;
    path: string;
    cid: Cid.t;
    prev: Cid.t option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_sync_subscriberepos_repoop_of_value : com_atproto_sync_subscriberepos_repoop Value.Util.conv = (fun v ->
    let action = Value.Util.get_key "action" Value.Util.to_text v in
    let path = Value.Util.get_key "path" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_cid v in
    let prev = Value.Util.get_key_opt "prev" Value.Util.to_cid v in
    {action;path;cid;prev;})


  (** def "com.atproto.sync.subscribeRepos#commit" *)
  type com_atproto_sync_subscriberepos_commit = {
    seq: int64;
    rebase: bool;
    tooBig: bool;
    repo: string;
    commit: Cid.t;
    rev: string;
    since: string;
    blocks: bytes;
    ops: com_atproto_sync_subscriberepos_repoop list;
    blobs: Cid.t list;
    prevData: Cid.t option;
    time: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_sync_subscriberepos_commit_of_value : com_atproto_sync_subscriberepos_commit Value.Util.conv = (fun v ->
    let seq = Value.Util.get_key "seq" Value.Util.to_int v in
    let rebase = Value.Util.get_key "rebase" Value.Util.to_bool v in
    let tooBig = Value.Util.get_key "tooBig" Value.Util.to_bool v in
    let repo = Value.Util.get_key "repo" Value.Util.to_text v in
    let commit = Value.Util.get_key "commit" Value.Util.to_cid v in
    let rev = Value.Util.get_key "rev" Value.Util.to_text v in
    let since = Value.Util.get_key "since" Value.Util.to_text v in
    let blocks = Value.Util.get_key "blocks" Value.Util.to_bytes v in
    let ops = Value.Util.get_key "ops" (Value.Util.to_array_of com_atproto_sync_subscriberepos_repoop_of_value) v in
    let blobs = Value.Util.get_key "blobs" (Value.Util.to_array_of Value.Util.to_cid) v in
    let prevData = Value.Util.get_key_opt "prevData" Value.Util.to_cid v in
    let time = Value.Util.get_key "time" Value.Util.to_text v in
    {seq;rebase;tooBig;repo;commit;rev;since;blocks;ops;blobs;prevData;time;})


  (** def "app.bsky.actor.status#live" *)
  type app_bsky_actor_status_live = [`App_bsky_actor_status_live]
  [@@deriving show {with_path=false}]

  let rec app_bsky_actor_status_live_of_value : [`App_bsky_actor_status_live] Value.Util.conv = (fun _ -> `App_bsky_actor_status_live)


  (** def "app.bsky.feed.defs#viewerState" *)
  type app_bsky_feed_defs_viewerstate = {
    repost: string option;
    like: string option;
    threadMuted: bool option;
    replyDisabled: bool option;
    embeddingDisabled: bool option;
    pinned: bool option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_viewerstate_of_value : app_bsky_feed_defs_viewerstate Value.Util.conv = (fun v ->
    let repost = Value.Util.get_key_opt "repost" Value.Util.to_text v in
    let like = Value.Util.get_key_opt "like" Value.Util.to_text v in
    let threadMuted = Value.Util.get_key_opt "threadMuted" Value.Util.to_bool v in
    let replyDisabled = Value.Util.get_key_opt "replyDisabled" Value.Util.to_bool v in
    let embeddingDisabled = Value.Util.get_key_opt "embeddingDisabled" Value.Util.to_bool v in
    let pinned = Value.Util.get_key_opt "pinned" Value.Util.to_bool v in
    {repost;like;threadMuted;replyDisabled;embeddingDisabled;pinned;})


  (** def "app.bsky.feed.defs#threadgateView" *)
  type app_bsky_feed_defs_threadgateview = {
    uri: string option;
    cid: string option;
    record: Value.t (* unknown *) option;
    lists: app_bsky_graph_defs_listviewbasic list option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_threadgateview_of_value : app_bsky_feed_defs_threadgateview Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key_opt "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key_opt "cid" Value.Util.to_text v in
    let record = Value.Util.get_key_opt "record" (fun v -> v (* immediate *)) v in
    let lists = Value.Util.get_key_opt "lists" (Value.Util.to_array_of app_bsky_graph_defs_listviewbasic_of_value) v in
    {uri;cid;record;lists;})


  (** def "app.bsky.feed.defs#postView" *)
  type app_bsky_feed_defs_postview = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileviewbasic;
    record: Value.t (* unknown *);
    embed: [
    `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `App_bsky_embed_recordwithmedia_view of app_bsky_embed_recordwithmedia_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    replyCount: int64 option;
    repostCount: int64 option;
    likeCount: int64 option;
    quoteCount: int64 option;
    indexedAt: string;
    viewer: app_bsky_feed_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    threadgate: app_bsky_feed_defs_threadgateview option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_postview_of_value : app_bsky_feed_defs_postview Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let author = Value.Util.get_key "author" app_bsky_actor_defs_profileviewbasic_of_value v in
    let record = Value.Util.get_key "record" (fun v -> v (* immediate *)) v in
    let embed = Value.Util.get_key_opt "embed" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "view" -> `App_bsky_embed_images_view (app_bsky_embed_images_view_of_value v)
    | "view" -> `App_bsky_embed_video_view (app_bsky_embed_video_view_of_value v)
    | "view" -> `App_bsky_embed_external_view (app_bsky_embed_external_view_of_value v)
    | "view" -> `App_bsky_embed_record_view (app_bsky_embed_record_view_of_value v)
    | "view" -> `App_bsky_embed_recordwithmedia_view (app_bsky_embed_recordwithmedia_view_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let replyCount = Value.Util.get_key_opt "replyCount" Value.Util.to_int v in
    let repostCount = Value.Util.get_key_opt "repostCount" Value.Util.to_int v in
    let likeCount = Value.Util.get_key_opt "likeCount" Value.Util.to_int v in
    let quoteCount = Value.Util.get_key_opt "quoteCount" Value.Util.to_int v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    let viewer = Value.Util.get_key_opt "viewer" app_bsky_feed_defs_viewerstate_of_value v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let threadgate = Value.Util.get_key_opt "threadgate" app_bsky_feed_defs_threadgateview_of_value v in
    {uri;cid;author;record;embed;replyCount;repostCount;likeCount;quoteCount;indexedAt;viewer;labels;threadgate;})


  (** def "app.bsky.feed.defs#notFoundPost" *)
  type app_bsky_feed_defs_notfoundpost = {
    uri: string;
    notFound: bool;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_notfoundpost_of_value : app_bsky_feed_defs_notfoundpost Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let notFound = Value.Util.get_key "notFound" Value.Util.to_bool v in
    {uri;notFound;})


  (** def "app.bsky.feed.defs#blockedPost" *)
  type app_bsky_feed_defs_blockedpost = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_blockedpost_of_value : app_bsky_feed_defs_blockedpost Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let blocked = Value.Util.get_key "blocked" Value.Util.to_bool v in
    let author = Value.Util.get_key "author" app_bsky_feed_defs_blockedauthor_of_value v in
    {uri;blocked;author;})


  (** def "app.bsky.feed.defs#replyRef" *)
  type app_bsky_feed_defs_replyref = {
    root: [
    `App_bsky_feed_defs_postview of app_bsky_feed_defs_postview
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ];
    parent: [
    `App_bsky_feed_defs_postview of app_bsky_feed_defs_postview
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ];
    grandparentAuthor: app_bsky_actor_defs_profileviewbasic option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_replyref_of_value : app_bsky_feed_defs_replyref Value.Util.conv = (fun v ->
    let root = Value.Util.get_key "root" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "postView" -> `App_bsky_feed_defs_postview (app_bsky_feed_defs_postview_of_value v)
    | "notFoundPost" -> `App_bsky_feed_defs_notfoundpost (app_bsky_feed_defs_notfoundpost_of_value v)
    | "blockedPost" -> `App_bsky_feed_defs_blockedpost (app_bsky_feed_defs_blockedpost_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let parent = Value.Util.get_key "parent" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "postView" -> `App_bsky_feed_defs_postview (app_bsky_feed_defs_postview_of_value v)
    | "notFoundPost" -> `App_bsky_feed_defs_notfoundpost (app_bsky_feed_defs_notfoundpost_of_value v)
    | "blockedPost" -> `App_bsky_feed_defs_blockedpost (app_bsky_feed_defs_blockedpost_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let grandparentAuthor = Value.Util.get_key_opt "grandparentAuthor" app_bsky_actor_defs_profileviewbasic_of_value v in
    {root;parent;grandparentAuthor;})


  (** def "app.bsky.feed.defs#reasonRepost" *)
  type app_bsky_feed_defs_reasonrepost = {
    by: app_bsky_actor_defs_profileviewbasic;
    indexedAt: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_reasonrepost_of_value : app_bsky_feed_defs_reasonrepost Value.Util.conv = (fun v ->
    let by = Value.Util.get_key "by" app_bsky_actor_defs_profileviewbasic_of_value v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    {by;indexedAt;})


  (** def "app.bsky.feed.defs#feedViewPost" *)
  type app_bsky_feed_defs_feedviewpost = {
    post: app_bsky_feed_defs_postview;
    reply: app_bsky_feed_defs_replyref option;
    reason: [
    `App_bsky_feed_defs_reasonrepost of app_bsky_feed_defs_reasonrepost
    | `App_bsky_feed_defs_reasonpin of app_bsky_feed_defs_reasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedContext: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_feedviewpost_of_value : app_bsky_feed_defs_feedviewpost Value.Util.conv = (fun v ->
    let post = Value.Util.get_key "post" app_bsky_feed_defs_postview_of_value v in
    let reply = Value.Util.get_key_opt "reply" app_bsky_feed_defs_replyref_of_value v in
    let reason = Value.Util.get_key_opt "reason" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "reasonRepost" -> `App_bsky_feed_defs_reasonrepost (app_bsky_feed_defs_reasonrepost_of_value v)
    | "reasonPin" -> `App_bsky_feed_defs_reasonpin (app_bsky_feed_defs_reasonpin_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let feedContext = Value.Util.get_key_opt "feedContext" Value.Util.to_text v in
    {post;reply;reason;feedContext;})


  (** def "com.atproto.repo.applyWrites#createResult" *)
  type com_atproto_repo_applywrites_createresult = {
    uri: string;
    cid: string;
    validationStatus: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_repo_applywrites_createresult_of_value : com_atproto_repo_applywrites_createresult Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let validationStatus = Value.Util.get_key_opt "validationStatus" Value.Util.to_text v in
    {uri;cid;validationStatus;})


  (** def "com.atproto.sync.subscribeRepos#identity" *)
  type com_atproto_sync_subscriberepos_identity = {
    seq: int64;
    did: string;
    time: string;
    handle: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_sync_subscriberepos_identity_of_value : com_atproto_sync_subscriberepos_identity Value.Util.conv = (fun v ->
    let seq = Value.Util.get_key "seq" Value.Util.to_int v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let time = Value.Util.get_key "time" Value.Util.to_text v in
    let handle = Value.Util.get_key_opt "handle" Value.Util.to_text v in
    {seq;did;time;handle;})


  (** def "com.atproto.admin.defs#statusAttr" *)
  type com_atproto_admin_defs_statusattr = {
    applied: bool;
    ref: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_admin_defs_statusattr_of_value : com_atproto_admin_defs_statusattr Value.Util.conv = (fun v ->
    let applied = Value.Util.get_key "applied" Value.Util.to_bool v in
    let ref = Value.Util.get_key_opt "ref" Value.Util.to_text v in
    {applied;ref;})


  (** def "com.atproto.server.createAppPassword#appPassword" *)
  type com_atproto_server_createapppassword_apppassword = {
    name: string;
    password: string;
    createdAt: string;
    privileged: bool option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_server_createapppassword_apppassword_of_value : com_atproto_server_createapppassword_apppassword Value.Util.conv = (fun v ->
    let name = Value.Util.get_key "name" Value.Util.to_text v in
    let password = Value.Util.get_key "password" Value.Util.to_text v in
    let createdAt = Value.Util.get_key "createdAt" Value.Util.to_text v in
    let privileged = Value.Util.get_key_opt "privileged" Value.Util.to_bool v in
    {name;password;createdAt;privileged;})


  (** def "app.bsky.unspecced.getConfig#liveNowConfig" *)
  type app_bsky_unspecced_getconfig_livenowconfig = {
    did: string;
    domains: string list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_unspecced_getconfig_livenowconfig_of_value : app_bsky_unspecced_getconfig_livenowconfig Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let domains = Value.Util.get_key "domains" (Value.Util.to_array_of Value.Util.to_text) v in
    {did;domains;})


  (** def "com.atproto.repo.applyWrites#update" *)
  type com_atproto_repo_applywrites_update = {
    collection: string;
    rkey: string;
    value: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_repo_applywrites_update_of_value : com_atproto_repo_applywrites_update Value.Util.conv = (fun v ->
    let collection = Value.Util.get_key "collection" Value.Util.to_text v in
    let rkey = Value.Util.get_key "rkey" Value.Util.to_text v in
    let value = Value.Util.get_key "value" (fun v -> v (* immediate *)) v in
    {collection;rkey;value;})


  (** def "app.bsky.feed.defs#clickthroughEmbed" *)
  type app_bsky_feed_defs_clickthroughembed = [`App_bsky_feed_defs_clickthroughembed]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_clickthroughembed_of_value : [`App_bsky_feed_defs_clickthroughembed] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_clickthroughembed)


  (** def "app.bsky.feed.defs#interactionLike" *)
  type app_bsky_feed_defs_interactionlike = [`App_bsky_feed_defs_interactionlike]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_interactionlike_of_value : [`App_bsky_feed_defs_interactionlike] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_interactionlike)


  (** def "app.bsky.labeler.defs#labelerPolicies" *)
  type app_bsky_labeler_defs_labelerpolicies = {
    labelValues: com_atproto_label_defs_labelvalue list;
    labelValueDefinitions: com_atproto_label_defs_labelvaluedefinition list option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_labeler_defs_labelerpolicies_of_value : app_bsky_labeler_defs_labelerpolicies Value.Util.conv = (fun v ->
    let labelValues = Value.Util.get_key "labelValues" (Value.Util.to_array_of com_atproto_label_defs_labelvalue_of_value) v in
    let labelValueDefinitions = Value.Util.get_key_opt "labelValueDefinitions" (Value.Util.to_array_of com_atproto_label_defs_labelvaluedefinition_of_value) v in
    {labelValues;labelValueDefinitions;})


  (** def "com.atproto.moderation.defs#subjectType" *)
  type com_atproto_moderation_defs_subjecttype = string
  [@@deriving show {with_path=false}]

  let rec com_atproto_moderation_defs_subjecttype_of_value : string Value.Util.conv = Value.Util.to_text


  (** def "app.bsky.labeler.defs#labelerViewDetailed" *)
  type app_bsky_labeler_defs_labelerviewdetailed = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    policies: app_bsky_labeler_defs_labelerpolicies;
    likeCount: int64 option;
    viewer: app_bsky_labeler_defs_labelerviewerstate option;
    indexedAt: string;
    labels: com_atproto_label_defs_label list option;
    reasonTypes: com_atproto_moderation_defs_reasontype list option;
    subjectTypes: com_atproto_moderation_defs_subjecttype list option;
    subjectCollections: string list option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_labeler_defs_labelerviewdetailed_of_value : app_bsky_labeler_defs_labelerviewdetailed Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let creator = Value.Util.get_key "creator" app_bsky_actor_defs_profileview_of_value v in
    let policies = Value.Util.get_key "policies" app_bsky_labeler_defs_labelerpolicies_of_value v in
    let likeCount = Value.Util.get_key_opt "likeCount" Value.Util.to_int v in
    let viewer = Value.Util.get_key_opt "viewer" app_bsky_labeler_defs_labelerviewerstate_of_value v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let reasonTypes = Value.Util.get_key_opt "reasonTypes" (Value.Util.to_array_of com_atproto_moderation_defs_reasontype_of_value) v in
    let subjectTypes = Value.Util.get_key_opt "subjectTypes" (Value.Util.to_array_of com_atproto_moderation_defs_subjecttype_of_value) v in
    let subjectCollections = Value.Util.get_key_opt "subjectCollections" (Value.Util.to_array_of Value.Util.to_text) v in
    {uri;cid;creator;policies;likeCount;viewer;indexedAt;labels;reasonTypes;subjectTypes;subjectCollections;})


  (** def "app.bsky.embed.record#main" *)
  type app_bsky_embed_record_main = {
    record: com_atproto_repo_strongref_main;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_record_main_of_value : app_bsky_embed_record_main Value.Util.conv = (fun v ->
    let record = Value.Util.get_key "record" com_atproto_repo_strongref_main_of_value v in
    {record;})


  (** def "app.bsky.unspecced.defs#skeletonSearchActor" *)
  type app_bsky_unspecced_defs_skeletonsearchactor = {
    did: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_unspecced_defs_skeletonsearchactor_of_value : app_bsky_unspecced_defs_skeletonsearchactor Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;})


  (** def "com.atproto.identity.defs#identityInfo" *)
  type com_atproto_identity_defs_identityinfo = {
    did: string;
    handle: string;
    didDoc: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_identity_defs_identityinfo_of_value : com_atproto_identity_defs_identityinfo Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let didDoc = Value.Util.get_key "didDoc" (fun v -> v (* immediate *)) v in
    {did;handle;didDoc;})


  (** def "app.bsky.graph.defs#referencelist" *)
  type app_bsky_graph_defs_referencelist = [`App_bsky_graph_defs_referencelist]
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_referencelist_of_value : [`App_bsky_graph_defs_referencelist] Value.Util.conv = (fun _ -> `App_bsky_graph_defs_referencelist)


  (** def "app.bsky.feed.post#replyRef" *)
  type app_bsky_feed_post_replyref = {
    root: com_atproto_repo_strongref_main;
    parent: com_atproto_repo_strongref_main;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_post_replyref_of_value : app_bsky_feed_post_replyref Value.Util.conv = (fun v ->
    let root = Value.Util.get_key "root" com_atproto_repo_strongref_main_of_value v in
    let parent = Value.Util.get_key "parent" com_atproto_repo_strongref_main_of_value v in
    {root;parent;})


  (** def "com.atproto.server.describeServer#contact" *)
  type com_atproto_server_describeserver_contact = {
    email: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_server_describeserver_contact_of_value : com_atproto_server_describeserver_contact Value.Util.conv = (fun v ->
    let email = Value.Util.get_key_opt "email" Value.Util.to_text v in
    {email;})


  (** def "app.bsky.unspecced.defs#skeletonTrend" *)
  type app_bsky_unspecced_defs_skeletontrend = {
    topic: string;
    displayName: string;
    link: string;
    startedAt: string;
    postCount: int64;
    status: string option;
    category: string option;
    dids: string list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_unspecced_defs_skeletontrend_of_value : app_bsky_unspecced_defs_skeletontrend Value.Util.conv = (fun v ->
    let topic = Value.Util.get_key "topic" Value.Util.to_text v in
    let displayName = Value.Util.get_key "displayName" Value.Util.to_text v in
    let link = Value.Util.get_key "link" Value.Util.to_text v in
    let startedAt = Value.Util.get_key "startedAt" Value.Util.to_text v in
    let postCount = Value.Util.get_key "postCount" Value.Util.to_int v in
    let status = Value.Util.get_key_opt "status" Value.Util.to_text v in
    let category = Value.Util.get_key_opt "category" Value.Util.to_text v in
    let dids = Value.Util.get_key "dids" (Value.Util.to_array_of Value.Util.to_text) v in
    {topic;displayName;link;startedAt;postCount;status;category;dids;})


  (** def "com.atproto.sync.listReposByCollection#repo" *)
  type com_atproto_sync_listreposbycollection_repo = {
    did: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_sync_listreposbycollection_repo_of_value : com_atproto_sync_listreposbycollection_repo Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;})


  (** def "com.atproto.repo.listRecords#record" *)
  type com_atproto_repo_listrecords_record = {
    uri: string;
    cid: string;
    value: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_repo_listrecords_record_of_value : com_atproto_repo_listrecords_record Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let value = Value.Util.get_key "value" (fun v -> v (* immediate *)) v in
    {uri;cid;value;})


  (** def "com.atproto.moderation.defs#reasonSexual" *)
  type com_atproto_moderation_defs_reasonsexual = [`Com_atproto_moderation_defs_reasonsexual]
  [@@deriving show {with_path=false}]

  let rec com_atproto_moderation_defs_reasonsexual_of_value : [`Com_atproto_moderation_defs_reasonsexual] Value.Util.conv = (fun _ -> `Com_atproto_moderation_defs_reasonsexual)


  (** def "com.atproto.moderation.defs#reasonOther" *)
  type com_atproto_moderation_defs_reasonother = [`Com_atproto_moderation_defs_reasonother]
  [@@deriving show {with_path=false}]

  let rec com_atproto_moderation_defs_reasonother_of_value : [`Com_atproto_moderation_defs_reasonother] Value.Util.conv = (fun _ -> `Com_atproto_moderation_defs_reasonother)


  (** def "app.bsky.graph.defs#curatelist" *)
  type app_bsky_graph_defs_curatelist = [`App_bsky_graph_defs_curatelist]
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_curatelist_of_value : [`App_bsky_graph_defs_curatelist] Value.Util.conv = (fun _ -> `App_bsky_graph_defs_curatelist)


  (** def "app.bsky.graph.defs#relationship" *)
  type app_bsky_graph_defs_relationship = {
    did: string;
    following: string option;
    followedBy: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_relationship_of_value : app_bsky_graph_defs_relationship Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let following = Value.Util.get_key_opt "following" Value.Util.to_text v in
    let followedBy = Value.Util.get_key_opt "followedBy" Value.Util.to_text v in
    {did;following;followedBy;})


  (** def "app.bsky.graph.defs#notFoundActor" *)
  type app_bsky_graph_defs_notfoundactor = {
    actor: string;
    notFound: bool;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_notfoundactor_of_value : app_bsky_graph_defs_notfoundactor Value.Util.conv = (fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    let notFound = Value.Util.get_key "notFound" Value.Util.to_bool v in
    {actor;notFound;})


  (** def "com.atproto.repo.listMissingBlobs#recordBlob" *)
  type com_atproto_repo_listmissingblobs_recordblob = {
    cid: string;
    recordUri: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_repo_listmissingblobs_recordblob_of_value : com_atproto_repo_listmissingblobs_recordblob Value.Util.conv = (fun v ->
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let recordUri = Value.Util.get_key "recordUri" Value.Util.to_text v in
    {cid;recordUri;})


  (** def "com.atproto.label.defs#selfLabel" *)
  type com_atproto_label_defs_selflabel = {
    val_: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_label_defs_selflabel_of_value : com_atproto_label_defs_selflabel Value.Util.conv = (fun v ->
    let val_ = Value.Util.get_key "val" Value.Util.to_text v in
    {val_;})


  (** def "com.atproto.admin.defs#repoBlobRef" *)
  type com_atproto_admin_defs_repoblobref = {
    did: string;
    cid: string;
    recordUri: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_admin_defs_repoblobref_of_value : com_atproto_admin_defs_repoblobref Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let recordUri = Value.Util.get_key_opt "recordUri" Value.Util.to_text v in
    {did;cid;recordUri;})


  (** def "com.atproto.moderation.defs#reasonRude" *)
  type com_atproto_moderation_defs_reasonrude = [`Com_atproto_moderation_defs_reasonrude]
  [@@deriving show {with_path=false}]

  let rec com_atproto_moderation_defs_reasonrude_of_value : [`Com_atproto_moderation_defs_reasonrude] Value.Util.conv = (fun _ -> `Com_atproto_moderation_defs_reasonrude)


  (** def "com.atproto.sync.subscribeRepos#sync" *)
  type com_atproto_sync_subscriberepos_sync = {
    seq: int64;
    did: string;
    blocks: bytes;
    rev: string;
    time: string;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_sync_subscriberepos_sync_of_value : com_atproto_sync_subscriberepos_sync Value.Util.conv = (fun v ->
    let seq = Value.Util.get_key "seq" Value.Util.to_int v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let blocks = Value.Util.get_key "blocks" Value.Util.to_bytes v in
    let rev = Value.Util.get_key "rev" Value.Util.to_text v in
    let time = Value.Util.get_key "time" Value.Util.to_text v in
    {seq;did;blocks;rev;time;})


  (** def "app.bsky.graph.defs#starterPackView" *)
  type app_bsky_graph_defs_starterpackview = {
    uri: string;
    cid: string;
    record: Value.t (* unknown *);
    creator: app_bsky_actor_defs_profileviewbasic;
    list: app_bsky_graph_defs_listviewbasic option;
    listItemsSample: app_bsky_graph_defs_listitemview list option;
    feeds: app_bsky_feed_defs_generatorview list option;
    joinedWeekCount: int64 option;
    joinedAllTimeCount: int64 option;
    labels: com_atproto_label_defs_label list option;
    indexedAt: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_starterpackview_of_value : app_bsky_graph_defs_starterpackview Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let record = Value.Util.get_key "record" (fun v -> v (* immediate *)) v in
    let creator = Value.Util.get_key "creator" app_bsky_actor_defs_profileviewbasic_of_value v in
    let list = Value.Util.get_key_opt "list" app_bsky_graph_defs_listviewbasic_of_value v in
    let listItemsSample = Value.Util.get_key_opt "listItemsSample" (Value.Util.to_array_of app_bsky_graph_defs_listitemview_of_value) v in
    let feeds = Value.Util.get_key_opt "feeds" (Value.Util.to_array_of app_bsky_feed_defs_generatorview_of_value) v in
    let joinedWeekCount = Value.Util.get_key_opt "joinedWeekCount" Value.Util.to_int v in
    let joinedAllTimeCount = Value.Util.get_key_opt "joinedAllTimeCount" Value.Util.to_int v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    {uri;cid;record;creator;list;listItemsSample;feeds;joinedWeekCount;joinedAllTimeCount;labels;indexedAt;})


  (** def "app.bsky.feed.defs#interactionQuote" *)
  type app_bsky_feed_defs_interactionquote = [`App_bsky_feed_defs_interactionquote]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_interactionquote_of_value : [`App_bsky_feed_defs_interactionquote] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_interactionquote)


  (** def "com.atproto.repo.applyWrites#deleteResult" *)
  type com_atproto_repo_applywrites_deleteresult = [`Com_atproto_repo_applywrites_deleteresult]
  [@@deriving show {with_path=false}]

  let rec com_atproto_repo_applywrites_deleteresult_of_value : com_atproto_repo_applywrites_deleteresult Value.Util.conv = (fun _ -> `Com_atproto_repo_applywrites_deleteresult)


  (** def "com.atproto.repo.applyWrites#updateResult" *)
  type com_atproto_repo_applywrites_updateresult = {
    uri: string;
    cid: string;
    validationStatus: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_repo_applywrites_updateresult_of_value : com_atproto_repo_applywrites_updateresult Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let validationStatus = Value.Util.get_key_opt "validationStatus" Value.Util.to_text v in
    {uri;cid;validationStatus;})


  (** def "app.bsky.unspecced.defs#trendView" *)
  type app_bsky_unspecced_defs_trendview = {
    topic: string;
    displayName: string;
    link: string;
    startedAt: string;
    postCount: int64;
    status: string option;
    category: string option;
    actors: app_bsky_actor_defs_profileviewbasic list;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_unspecced_defs_trendview_of_value : app_bsky_unspecced_defs_trendview Value.Util.conv = (fun v ->
    let topic = Value.Util.get_key "topic" Value.Util.to_text v in
    let displayName = Value.Util.get_key "displayName" Value.Util.to_text v in
    let link = Value.Util.get_key "link" Value.Util.to_text v in
    let startedAt = Value.Util.get_key "startedAt" Value.Util.to_text v in
    let postCount = Value.Util.get_key "postCount" Value.Util.to_int v in
    let status = Value.Util.get_key_opt "status" Value.Util.to_text v in
    let category = Value.Util.get_key_opt "category" Value.Util.to_text v in
    let actors = Value.Util.get_key "actors" (Value.Util.to_array_of app_bsky_actor_defs_profileviewbasic_of_value) v in
    {topic;displayName;link;startedAt;postCount;status;category;actors;})


  (** def "app.bsky.feed.defs#clickthroughItem" *)
  type app_bsky_feed_defs_clickthroughitem = [`App_bsky_feed_defs_clickthroughitem]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_clickthroughitem_of_value : [`App_bsky_feed_defs_clickthroughitem] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_clickthroughitem)


  (** def "app.bsky.graph.starterpack#feedItem" *)
  type app_bsky_graph_starterpack_feeditem = {
    uri: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_starterpack_feeditem_of_value : app_bsky_graph_starterpack_feeditem Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    {uri;})


  (** def "app.bsky.unspecced.defs#skeletonSearchPost" *)
  type app_bsky_unspecced_defs_skeletonsearchpost = {
    uri: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_unspecced_defs_skeletonsearchpost_of_value : app_bsky_unspecced_defs_skeletonsearchpost Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    {uri;})


  (** def "app.bsky.embed.external#main" *)
  type app_bsky_embed_external_main = {
    external_: app_bsky_embed_external_external;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_external_main_of_value : app_bsky_embed_external_main Value.Util.conv = (fun v ->
    let external_ = Value.Util.get_key "external" app_bsky_embed_external_external_of_value v in
    {external_;})


  (** def "app.bsky.notification.listNotifications#notification" *)
  type app_bsky_notification_listnotifications_notification = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileview;
    reason: string;
    reasonSubject: string option;
    record: Value.t (* unknown *);
    isRead: bool;
    indexedAt: string;
    labels: com_atproto_label_defs_label list option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_notification_listnotifications_notification_of_value : app_bsky_notification_listnotifications_notification Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let author = Value.Util.get_key "author" app_bsky_actor_defs_profileview_of_value v in
    let reason = Value.Util.get_key "reason" Value.Util.to_text v in
    let reasonSubject = Value.Util.get_key_opt "reasonSubject" Value.Util.to_text v in
    let record = Value.Util.get_key "record" (fun v -> v (* immediate *)) v in
    let isRead = Value.Util.get_key "isRead" Value.Util.to_bool v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    let labels = Value.Util.get_key_opt "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    {uri;cid;author;reason;reasonSubject;record;isRead;indexedAt;labels;})


  (** def "app.bsky.feed.defs#threadContext" *)
  type app_bsky_feed_defs_threadcontext = {
    rootAuthorLike: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_threadcontext_of_value : app_bsky_feed_defs_threadcontext Value.Util.conv = (fun v ->
    let rootAuthorLike = Value.Util.get_key_opt "rootAuthorLike" Value.Util.to_text v in
    {rootAuthorLike;})


  (** def "app.bsky.unspecced.defs#skeletonSearchStarterPack" *)
  type app_bsky_unspecced_defs_skeletonsearchstarterpack = {
    uri: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_unspecced_defs_skeletonsearchstarterpack_of_value : app_bsky_unspecced_defs_skeletonsearchstarterpack Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    {uri;})


  (** def "com.atproto.sync.subscribeRepos#info" *)
  type com_atproto_sync_subscriberepos_info = {
    name: string;
    message: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_sync_subscriberepos_info_of_value : com_atproto_sync_subscriberepos_info Value.Util.conv = (fun v ->
    let name = Value.Util.get_key "name" Value.Util.to_text v in
    let message = Value.Util.get_key_opt "message" Value.Util.to_text v in
    {name;message;})


  (** def "app.bsky.feed.defs#interactionRepost" *)
  type app_bsky_feed_defs_interactionrepost = [`App_bsky_feed_defs_interactionrepost]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_interactionrepost_of_value : [`App_bsky_feed_defs_interactionrepost] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_interactionrepost)


  (** def "com.atproto.server.createInviteCodes#accountCodes" *)
  type com_atproto_server_createinvitecodes_accountcodes = {
    account: string;
    codes: string list;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_server_createinvitecodes_accountcodes_of_value : com_atproto_server_createinvitecodes_accountcodes Value.Util.conv = (fun v ->
    let account = Value.Util.get_key "account" Value.Util.to_text v in
    let codes = Value.Util.get_key "codes" (Value.Util.to_array_of Value.Util.to_text) v in
    {account;codes;})


  (** def "com.atproto.server.defs#inviteCode" *)
  type com_atproto_server_defs_invitecode = {
    code: string;
    available: int64;
    disabled: bool;
    forAccount: string;
    createdBy: string;
    createdAt: string;
    uses: com_atproto_server_defs_invitecodeuse list;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_server_defs_invitecode_of_value : com_atproto_server_defs_invitecode Value.Util.conv = (fun v ->
    let code = Value.Util.get_key "code" Value.Util.to_text v in
    let available = Value.Util.get_key "available" Value.Util.to_int v in
    let disabled = Value.Util.get_key "disabled" Value.Util.to_bool v in
    let forAccount = Value.Util.get_key "forAccount" Value.Util.to_text v in
    let createdBy = Value.Util.get_key "createdBy" Value.Util.to_text v in
    let createdAt = Value.Util.get_key "createdAt" Value.Util.to_text v in
    let uses = Value.Util.get_key "uses" (Value.Util.to_array_of com_atproto_server_defs_invitecodeuse_of_value) v in
    {code;available;disabled;forAccount;createdBy;createdAt;uses;})


  (** def "com.atproto.admin.defs#accountView" *)
  type com_atproto_admin_defs_accountview = {
    did: string;
    handle: string;
    email: string option;
    relatedRecords: Value.t (* unknown *) list option;
    indexedAt: string;
    invitedBy: com_atproto_server_defs_invitecode option;
    invites: com_atproto_server_defs_invitecode list option;
    invitesDisabled: bool option;
    emailConfirmedAt: string option;
    inviteNote: string option;
    deactivatedAt: string option;
    threatSignatures: com_atproto_admin_defs_threatsignature list option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_admin_defs_accountview_of_value : com_atproto_admin_defs_accountview Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let email = Value.Util.get_key_opt "email" Value.Util.to_text v in
    let relatedRecords = Value.Util.get_key_opt "relatedRecords" (Value.Util.to_array_of (fun v -> v (* immediate *))) v in
    let indexedAt = Value.Util.get_key "indexedAt" Value.Util.to_text v in
    let invitedBy = Value.Util.get_key_opt "invitedBy" com_atproto_server_defs_invitecode_of_value v in
    let invites = Value.Util.get_key_opt "invites" (Value.Util.to_array_of com_atproto_server_defs_invitecode_of_value) v in
    let invitesDisabled = Value.Util.get_key_opt "invitesDisabled" Value.Util.to_bool v in
    let emailConfirmedAt = Value.Util.get_key_opt "emailConfirmedAt" Value.Util.to_text v in
    let inviteNote = Value.Util.get_key_opt "inviteNote" Value.Util.to_text v in
    let deactivatedAt = Value.Util.get_key_opt "deactivatedAt" Value.Util.to_text v in
    let threatSignatures = Value.Util.get_key_opt "threatSignatures" (Value.Util.to_array_of com_atproto_admin_defs_threatsignature_of_value) v in
    {did;handle;email;relatedRecords;indexedAt;invitedBy;invites;invitesDisabled;emailConfirmedAt;inviteNote;deactivatedAt;threatSignatures;})


  (** def "app.bsky.feed.defs#interactionShare" *)
  type app_bsky_feed_defs_interactionshare = [`App_bsky_feed_defs_interactionshare]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_interactionshare_of_value : [`App_bsky_feed_defs_interactionshare] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_interactionshare)


  (** def "com.atproto.moderation.defs#reasonSpam" *)
  type com_atproto_moderation_defs_reasonspam = [`Com_atproto_moderation_defs_reasonspam]
  [@@deriving show {with_path=false}]

  let rec com_atproto_moderation_defs_reasonspam_of_value : [`Com_atproto_moderation_defs_reasonspam] Value.Util.conv = (fun _ -> `Com_atproto_moderation_defs_reasonspam)


  (** def "app.bsky.unspecced.defs#trendingTopic" *)
  type app_bsky_unspecced_defs_trendingtopic = {
    topic: string;
    displayName: string option;
    description: string option;
    link: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_unspecced_defs_trendingtopic_of_value : app_bsky_unspecced_defs_trendingtopic Value.Util.conv = (fun v ->
    let topic = Value.Util.get_key "topic" Value.Util.to_text v in
    let displayName = Value.Util.get_key_opt "displayName" Value.Util.to_text v in
    let description = Value.Util.get_key_opt "description" Value.Util.to_text v in
    let link = Value.Util.get_key "link" Value.Util.to_text v in
    {topic;displayName;description;link;})


  (** def "app.bsky.feed.defs#clickthroughAuthor" *)
  type app_bsky_feed_defs_clickthroughauthor = [`App_bsky_feed_defs_clickthroughauthor]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_clickthroughauthor_of_value : [`App_bsky_feed_defs_clickthroughauthor] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_clickthroughauthor)


  (** def "com.atproto.label.defs#selfLabels" *)
  type com_atproto_label_defs_selflabels = {
    values: com_atproto_label_defs_selflabel list;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_label_defs_selflabels_of_value : com_atproto_label_defs_selflabels Value.Util.conv = (fun v ->
    let values = Value.Util.get_key "values" (Value.Util.to_array_of com_atproto_label_defs_selflabel_of_value) v in
    {values;})


  (** def "app.bsky.feed.defs#skeletonFeedPost" *)
  type app_bsky_feed_defs_skeletonfeedpost = {
    post: string;
    reason: [
    `App_bsky_feed_defs_skeletonreasonrepost of app_bsky_feed_defs_skeletonreasonrepost
    | `App_bsky_feed_defs_skeletonreasonpin of app_bsky_feed_defs_skeletonreasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedContext: string option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_skeletonfeedpost_of_value : app_bsky_feed_defs_skeletonfeedpost Value.Util.conv = (fun v ->
    let post = Value.Util.get_key "post" Value.Util.to_text v in
    let reason = Value.Util.get_key_opt "reason" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "skeletonReasonRepost" -> `App_bsky_feed_defs_skeletonreasonrepost (app_bsky_feed_defs_skeletonreasonrepost_of_value v)
    | "skeletonReasonPin" -> `App_bsky_feed_defs_skeletonreasonpin (app_bsky_feed_defs_skeletonreasonpin_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let feedContext = Value.Util.get_key_opt "feedContext" Value.Util.to_text v in
    {post;reason;feedContext;})


  (** def "app.bsky.feed.defs#threadViewPost" *)
  type app_bsky_feed_defs_threadviewpost = {
    post: app_bsky_feed_defs_postview;
    parent: [
    `App_bsky_feed_defs_threadviewpost of app_bsky_feed_defs_threadviewpost
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ] option;
    replies: [
    `App_bsky_feed_defs_threadviewpost of app_bsky_feed_defs_threadviewpost
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ] list option;
    threadContext: app_bsky_feed_defs_threadcontext option;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_threadviewpost_of_value : app_bsky_feed_defs_threadviewpost Value.Util.conv = (fun v ->
    let post = Value.Util.get_key "post" app_bsky_feed_defs_postview_of_value v in
    let parent = Value.Util.get_key_opt "parent" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "threadViewPost" -> `App_bsky_feed_defs_threadviewpost (app_bsky_feed_defs_threadviewpost_of_value v)
    | "notFoundPost" -> `App_bsky_feed_defs_notfoundpost (app_bsky_feed_defs_notfoundpost_of_value v)
    | "blockedPost" -> `App_bsky_feed_defs_blockedpost (app_bsky_feed_defs_blockedpost_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let replies = Value.Util.get_key_opt "replies" (Value.Util.to_array_of (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "threadViewPost" -> `App_bsky_feed_defs_threadviewpost (app_bsky_feed_defs_threadviewpost_of_value v)
    | "notFoundPost" -> `App_bsky_feed_defs_notfoundpost (app_bsky_feed_defs_notfoundpost_of_value v)
    | "blockedPost" -> `App_bsky_feed_defs_blockedpost (app_bsky_feed_defs_blockedpost_of_value v)
    | _ -> `Other v (* Non closed union *)
    ))) v in
    let threadContext = Value.Util.get_key_opt "threadContext" app_bsky_feed_defs_threadcontext_of_value v in
    {post;parent;replies;threadContext;})


  (** def "app.bsky.feed.defs#contentModeUnspecified" *)
  type app_bsky_feed_defs_contentmodeunspecified = [`App_bsky_feed_defs_contentmodeunspecified]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_contentmodeunspecified_of_value : [`App_bsky_feed_defs_contentmodeunspecified] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_contentmodeunspecified)


  (** def "app.bsky.feed.post#entity" *)
  type app_bsky_feed_post_entity = {
    index: app_bsky_feed_post_textslice;
    type_: string;
    value: string;
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_post_entity_of_value : app_bsky_feed_post_entity Value.Util.conv = (fun v ->
    let index = Value.Util.get_key "index" app_bsky_feed_post_textslice_of_value v in
    let type_ = Value.Util.get_key "type" Value.Util.to_text v in
    let value = Value.Util.get_key "value" Value.Util.to_text v in
    {index;type_;value;})


  (** def "com.atproto.sync.listRepos#repo" *)
  type com_atproto_sync_listrepos_repo = {
    did: string;
    head: string;
    rev: string;
    active: bool option;
    status: string option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_sync_listrepos_repo_of_value : com_atproto_sync_listrepos_repo Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let head = Value.Util.get_key "head" Value.Util.to_text v in
    let rev = Value.Util.get_key "rev" Value.Util.to_text v in
    let active = Value.Util.get_key_opt "active" Value.Util.to_bool v in
    let status = Value.Util.get_key_opt "status" Value.Util.to_text v in
    {did;head;rev;active;status;})


  (** def "com.atproto.server.listAppPasswords#appPassword" *)
  type com_atproto_server_listapppasswords_apppassword = {
    name: string;
    createdAt: string;
    privileged: bool option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_server_listapppasswords_apppassword_of_value : com_atproto_server_listapppasswords_apppassword Value.Util.conv = (fun v ->
    let name = Value.Util.get_key "name" Value.Util.to_text v in
    let createdAt = Value.Util.get_key "createdAt" Value.Util.to_text v in
    let privileged = Value.Util.get_key_opt "privileged" Value.Util.to_bool v in
    {name;createdAt;privileged;})


  (** def "com.atproto.moderation.defs#reasonMisleading" *)
  type com_atproto_moderation_defs_reasonmisleading = [`Com_atproto_moderation_defs_reasonmisleading]
  [@@deriving show {with_path=false}]

  let rec com_atproto_moderation_defs_reasonmisleading_of_value : [`Com_atproto_moderation_defs_reasonmisleading] Value.Util.conv = (fun _ -> `Com_atproto_moderation_defs_reasonmisleading)


  (** def "com.atproto.sync.listHosts#host" *)
  type com_atproto_sync_listhosts_host = {
    hostname: string;
    seq: int64 option;
    accountCount: int64 option;
    status: com_atproto_sync_defs_hoststatus option;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_sync_listhosts_host_of_value : com_atproto_sync_listhosts_host Value.Util.conv = (fun v ->
    let hostname = Value.Util.get_key "hostname" Value.Util.to_text v in
    let seq = Value.Util.get_key_opt "seq" Value.Util.to_int v in
    let accountCount = Value.Util.get_key_opt "accountCount" Value.Util.to_int v in
    let status = Value.Util.get_key_opt "status" com_atproto_sync_defs_hoststatus_of_value v in
    {hostname;seq;accountCount;status;})


  (** def "app.bsky.feed.defs#contentModeVideo" *)
  type app_bsky_feed_defs_contentmodevideo = [`App_bsky_feed_defs_contentmodevideo]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_contentmodevideo_of_value : [`App_bsky_feed_defs_contentmodevideo] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_contentmodevideo)


  (** def "app.bsky.embed.recordWithMedia#main" *)
  type app_bsky_embed_recordwithmedia_main = {
    record: app_bsky_embed_record_main;
    media: [
    `App_bsky_embed_images_main of app_bsky_embed_images_main
    | `App_bsky_embed_video_main of app_bsky_embed_video_main
    | `App_bsky_embed_external_main of app_bsky_embed_external_main
    | `Other of Value.t (** Non closed union *)
    ];
  }
  [@@deriving show {with_path=false}]

  let rec app_bsky_embed_recordwithmedia_main_of_value : app_bsky_embed_recordwithmedia_main Value.Util.conv = (fun v ->
    let record = Value.Util.get_key "record" app_bsky_embed_record_main_of_value v in
    let media = Value.Util.get_key "media" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "main" -> `App_bsky_embed_images_main (app_bsky_embed_images_main_of_value v)
    | "main" -> `App_bsky_embed_video_main (app_bsky_embed_video_main_of_value v)
    | "main" -> `App_bsky_embed_external_main (app_bsky_embed_external_main_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    {record;media;})


  (** def "app.bsky.graph.defs#modlist" *)
  type app_bsky_graph_defs_modlist = [`App_bsky_graph_defs_modlist]
  [@@deriving show {with_path=false}]

  let rec app_bsky_graph_defs_modlist_of_value : [`App_bsky_graph_defs_modlist] Value.Util.conv = (fun _ -> `App_bsky_graph_defs_modlist)


  (** def "com.atproto.label.subscribeLabels#labels" *)
  type com_atproto_label_subscribelabels_labels = {
    seq: int64;
    labels: com_atproto_label_defs_label list;
  }
  [@@deriving show {with_path=false}]

  let rec com_atproto_label_subscribelabels_labels_of_value : com_atproto_label_subscribelabels_labels Value.Util.conv = (fun v ->
    let seq = Value.Util.get_key "seq" Value.Util.to_int v in
    let labels = Value.Util.get_key "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    {seq;labels;})


  (** def "app.bsky.feed.defs#clickthroughReposter" *)
  type app_bsky_feed_defs_clickthroughreposter = [`App_bsky_feed_defs_clickthroughreposter]
  [@@deriving show {with_path=false}]

  let rec app_bsky_feed_defs_clickthroughreposter_of_value : [`App_bsky_feed_defs_clickthroughreposter] Value.Util.conv = (fun _ -> `App_bsky_feed_defs_clickthroughreposter)

end



open Types


(** lexicon "com.atproto.temp.requestPhoneVerification"
  *)
module Com_Atproto_Temp_RequestPhoneVerification = struct
  (** {2 def main} *)

  type main_input = {
    phoneNumber: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let phoneNumber = Value.Util.get_key "phoneNumber" Value.Util.to_text v in
    {phoneNumber;})

  (** Request a verification code to be sent to the supplied phone number *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.temp.fetchLabels"
  *)
module Com_Atproto_Temp_FetchLabels = struct
  (** {2 def main} *)

  type main_params = {
    since: int64 option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let since = Value.Util.get_key_opt "since" Value.Util.to_int v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {since;limit;}

  type main_output = {
    labels: com_atproto_label_defs_label list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let labels = Value.Util.get_key "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    {labels;})

  (** DEPRECATED: use queryLabels or subscribeLabels instead -- Fetch all labels from a labeler created after a certain date. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.temp.checkSignupQueue"
  *)
module Com_Atproto_Temp_CheckSignupQueue = struct
  (** {2 def main} *)

  type main_output = {
    activated: bool;
    placeInQueue: int64 option;
    estimatedTimeMs: int64 option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let activated = Value.Util.get_key "activated" Value.Util.to_bool v in
    let placeInQueue = Value.Util.get_key_opt "placeInQueue" Value.Util.to_int v in
    let estimatedTimeMs = Value.Util.get_key_opt "estimatedTimeMs" Value.Util.to_int v in
    {activated;placeInQueue;estimatedTimeMs;})

  (** Check accounts location in signup queue. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.temp.addReservedHandle"
  *)
module Com_Atproto_Temp_AddReservedHandle = struct
  (** {2 def main} *)

  type main_input = {
    handle: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    {handle;})

  type main_output = [`_main_output]
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun _ -> `_main_output)

  (** Add a handle to the set of reserved handles. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.sync.subscribeRepos"
  *)
module Com_Atproto_Sync_SubscribeRepos = struct
  (** {2 def main} *)

  type main_msg = [
    `Com_atproto_sync_subscriberepos_commit of com_atproto_sync_subscriberepos_commit
    | `Com_atproto_sync_subscriberepos_sync of com_atproto_sync_subscriberepos_sync
    | `Com_atproto_sync_subscriberepos_identity of com_atproto_sync_subscriberepos_identity
    | `Com_atproto_sync_subscriberepos_account of com_atproto_sync_subscriberepos_account
    | `Com_atproto_sync_subscriberepos_info of com_atproto_sync_subscriberepos_info
    | `Other of Value.t (** Non closed union *)
    ]
  [@@deriving show {with_path=false}]

  let main_msg_of_value : main_msg Value.Util.conv = (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "commit" -> `Com_atproto_sync_subscriberepos_commit (com_atproto_sync_subscriberepos_commit_of_value v)
    | "sync" -> `Com_atproto_sync_subscriberepos_sync (com_atproto_sync_subscriberepos_sync_of_value v)
    | "identity" -> `Com_atproto_sync_subscriberepos_identity (com_atproto_sync_subscriberepos_identity_of_value v)
    | "account" -> `Com_atproto_sync_subscriberepos_account (com_atproto_sync_subscriberepos_account_of_value v)
    | "info" -> `Com_atproto_sync_subscriberepos_info (com_atproto_sync_subscriberepos_info_of_value v)
    | _ -> `Other v (* Non closed union *)
    ))

  type main_params = {
    cursor: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_int v in
    {cursor;}

  type main_error = [ `FutureCursor [@name "FutureCursor"] | `ConsumerTooSlow [@name "ConsumerTooSlow"]]
  [@@deriving show {with_path=false}]

  (** Repository event stream, aka Firehose endpoint. Outputs repo commits with diff data, and identity update events, for all repositories on the current server. See the atproto specifications for details around stream sequencing, repo versioning, CAR diff format, and more. Public and does not require auth; implemented by PDS and Relay. *)
  let main: _ Base.subscription = Base.make_subscription 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) ~message:(Message {
    to_value=main_msg_to_value;
    of_value=main_msg_of_value;
    pp=pp_main_msg}) 
    ~errors:(Errors {pp=pp_main_error})

  (** {2 def commit} *)

  type nonrec commit = com_atproto_sync_subscriberepos_commit = {
    seq: int64;
    rebase: bool;
    tooBig: bool;
    repo: string;
    commit: Cid.t;
    rev: string;
    since: string;
    blocks: bytes;
    ops: com_atproto_sync_subscriberepos_repoop list;
    blobs: Cid.t list;
    prevData: Cid.t option;
    time: string;
  }
  let pp_commit = pp_com_atproto_sync_subscriberepos_commit
  let commit_of_value = com_atproto_sync_subscriberepos_commit_of_value
  let commit_to_value = com_atproto_sync_subscriberepos_commit_to_value


  (** {2 def sync} *)

  type nonrec sync = com_atproto_sync_subscriberepos_sync = {
    seq: int64;
    did: string;
    blocks: bytes;
    rev: string;
    time: string;
  }
  let pp_sync = pp_com_atproto_sync_subscriberepos_sync
  let sync_of_value = com_atproto_sync_subscriberepos_sync_of_value
  let sync_to_value = com_atproto_sync_subscriberepos_sync_to_value


  (** {2 def identity} *)

  type nonrec identity = com_atproto_sync_subscriberepos_identity = {
    seq: int64;
    did: string;
    time: string;
    handle: string option;
  }
  let pp_identity = pp_com_atproto_sync_subscriberepos_identity
  let identity_of_value = com_atproto_sync_subscriberepos_identity_of_value
  let identity_to_value = com_atproto_sync_subscriberepos_identity_to_value


  (** {2 def account} *)

  type nonrec account = com_atproto_sync_subscriberepos_account = {
    seq: int64;
    did: string;
    time: string;
    active: bool;
    status: string option;
  }
  let pp_account = pp_com_atproto_sync_subscriberepos_account
  let account_of_value = com_atproto_sync_subscriberepos_account_of_value
  let account_to_value = com_atproto_sync_subscriberepos_account_to_value


  (** {2 def info} *)

  type nonrec info = com_atproto_sync_subscriberepos_info = {
    name: string;
    message: string option;
  }
  let pp_info = pp_com_atproto_sync_subscriberepos_info
  let info_of_value = com_atproto_sync_subscriberepos_info_of_value
  let info_to_value = com_atproto_sync_subscriberepos_info_to_value


  (** {2 def repoOp} *)

  type nonrec repoop = com_atproto_sync_subscriberepos_repoop = {
    action: string;
    path: string;
    cid: Cid.t;
    prev: Cid.t option;
  }
  let pp_repoop = pp_com_atproto_sync_subscriberepos_repoop
  let repoop_of_value = com_atproto_sync_subscriberepos_repoop_of_value
  let repoop_to_value = com_atproto_sync_subscriberepos_repoop_to_value


end


(** lexicon "com.atproto.sync.requestCrawl"
  *)
module Com_Atproto_Sync_RequestCrawl = struct
  (** {2 def main} *)

  type main_input = {
    hostname: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let hostname = Value.Util.get_key "hostname" Value.Util.to_text v in
    {hostname;})

  type main_error = [ `HostBanned [@name "HostBanned"]]
  [@@deriving show {with_path=false}]

  (** Request a service to persistently crawl hosted repos. Expected use is new PDS instances declaring their existence to Relays. Does not require auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.sync.notifyOfUpdate"
  *)
module Com_Atproto_Sync_NotifyOfUpdate = struct
  (** {2 def main} *)

  type main_input = {
    hostname: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let hostname = Value.Util.get_key "hostname" Value.Util.to_text v in
    {hostname;})

  (** Notify a crawling service of a recent update, and that crawling should resume. Intended use is after a gap between repo stream events caused the crawling service to disconnect. Does not require auth; implemented by Relay. DEPRECATED: just use com.atproto.sync.requestCrawl *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.sync.listReposByCollection"
  *)
module Com_Atproto_Sync_ListReposByCollection = struct
  (** {2 def main} *)

  type main_params = {
    collection: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let collection = Value.Util.get_key "collection" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {collection;limit;cursor;}

  type main_output = {
    cursor: string option;
    repos: com_atproto_sync_listreposbycollection_repo list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let repos = Value.Util.get_key "repos" (Value.Util.to_array_of com_atproto_sync_listreposbycollection_repo_of_value) v in
    {cursor;repos;})

  (** Enumerates all the DIDs which have records with the given collection NSID. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def repo} *)

  type nonrec repo = com_atproto_sync_listreposbycollection_repo = {
    did: string;
  }
  let pp_repo = pp_com_atproto_sync_listreposbycollection_repo
  let repo_of_value = com_atproto_sync_listreposbycollection_repo_of_value
  let repo_to_value = com_atproto_sync_listreposbycollection_repo_to_value


end


(** lexicon "com.atproto.sync.listRepos"
  *)
module Com_Atproto_Sync_ListRepos = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {limit;cursor;}

  type main_output = {
    cursor: string option;
    repos: com_atproto_sync_listrepos_repo list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let repos = Value.Util.get_key "repos" (Value.Util.to_array_of com_atproto_sync_listrepos_repo_of_value) v in
    {cursor;repos;})

  (** Enumerates all the DID, rev, and commit CID for all repos hosted by this service. Does not require auth; implemented by PDS and Relay. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def repo} *)

  type nonrec repo = com_atproto_sync_listrepos_repo = {
    did: string;
    head: string;
    rev: string;
    active: bool option;
    status: string option;
  }
  let pp_repo = pp_com_atproto_sync_listrepos_repo
  let repo_of_value = com_atproto_sync_listrepos_repo_of_value
  let repo_to_value = com_atproto_sync_listrepos_repo_to_value


end


(** lexicon "com.atproto.sync.listHosts"
  *)
module Com_Atproto_Sync_ListHosts = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {limit;cursor;}

  type main_output = {
    cursor: string option;
    hosts: com_atproto_sync_listhosts_host list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let hosts = Value.Util.get_key "hosts" (Value.Util.to_array_of com_atproto_sync_listhosts_host_of_value) v in
    {cursor;hosts;})

  (** Enumerates upstream hosts (eg, PDS or relay instances) that this service consumes from. Implemented by relays. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def host} *)

  type nonrec host = com_atproto_sync_listhosts_host = {
    hostname: string;
    seq: int64 option;
    accountCount: int64 option;
    status: com_atproto_sync_defs_hoststatus option;
  }
  let pp_host = pp_com_atproto_sync_listhosts_host
  let host_of_value = com_atproto_sync_listhosts_host_of_value
  let host_to_value = com_atproto_sync_listhosts_host_to_value


end


(** lexicon "com.atproto.sync.listBlobs"
  *)
module Com_Atproto_Sync_ListBlobs = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
    since: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let since = Value.Util.get_key_opt "since" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {did;since;limit;cursor;}

  type main_output = {
    cursor: string option;
    cids: string list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let cids = Value.Util.get_key "cids" (Value.Util.to_array_of Value.Util.to_text) v in
    {cursor;cids;})

  type main_error = [ `RepoNotFound [@name "RepoNotFound"] | `RepoTakendown [@name "RepoTakendown"] | `RepoSuspended [@name "RepoSuspended"] | `RepoDeactivated [@name "RepoDeactivated"]]
  [@@deriving show {with_path=false}]

  (** List blob CIDs for an account, since some repo revision. Does not require auth; implemented by PDS. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.sync.getRepoStatus"
  *)
module Com_Atproto_Sync_GetRepoStatus = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;}

  type main_output = {
    did: string;
    active: bool;
    status: string option;
    rev: string option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let active = Value.Util.get_key "active" Value.Util.to_bool v in
    let status = Value.Util.get_key_opt "status" Value.Util.to_text v in
    let rev = Value.Util.get_key_opt "rev" Value.Util.to_text v in
    {did;active;status;rev;})

  type main_error = [ `RepoNotFound [@name "RepoNotFound"]]
  [@@deriving show {with_path=false}]

  (** Get the hosting status for a repository, on this server. Expected to be implemented by PDS and Relay. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.sync.getRepo"
  *)
module Com_Atproto_Sync_GetRepo = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
    since: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let since = Value.Util.get_key_opt "since" Value.Util.to_text v in
    {did;since;}

  type main_error = [ `RepoNotFound [@name "RepoNotFound"] | `RepoTakendown [@name "RepoTakendown"] | `RepoSuspended [@name "RepoSuspended"] | `RepoDeactivated [@name "RepoDeactivated"]]
  [@@deriving show {with_path=false}]

  (** Download a repository export as CAR file. Optionally only a 'diff' since a previous revision. Does not require auth; implemented by PDS. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_opaque {encoding=CAR}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.sync.getRecord"
  *)
module Com_Atproto_Sync_GetRecord = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
    collection: string;
    rkey: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let collection = Value.Util.get_key "collection" Value.Util.to_text v in
    let rkey = Value.Util.get_key "rkey" Value.Util.to_text v in
    {did;collection;rkey;}

  type main_error = [ `RecordNotFound [@name "RecordNotFound"] | `RepoNotFound [@name "RepoNotFound"] | `RepoTakendown [@name "RepoTakendown"] | `RepoSuspended [@name "RepoSuspended"] | `RepoDeactivated [@name "RepoDeactivated"]]
  [@@deriving show {with_path=false}]

  (** Get data blocks needed to prove the existence or non-existence of record in the current version of repo. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_opaque {encoding=CAR}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.sync.getLatestCommit"
  *)
module Com_Atproto_Sync_GetLatestCommit = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;}

  type main_output = {
    cid: string;
    rev: string;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let rev = Value.Util.get_key "rev" Value.Util.to_text v in
    {cid;rev;})

  type main_error = [ `RepoNotFound [@name "RepoNotFound"] | `RepoTakendown [@name "RepoTakendown"] | `RepoSuspended [@name "RepoSuspended"] | `RepoDeactivated [@name "RepoDeactivated"]]
  [@@deriving show {with_path=false}]

  (** Get the current commit CID & revision of the specified repo. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.sync.getHostStatus"
  *)
module Com_Atproto_Sync_GetHostStatus = struct
  (** {2 def main} *)

  type main_params = {
    hostname: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let hostname = Value.Util.get_key "hostname" Value.Util.to_text v in
    {hostname;}

  type main_output = {
    hostname: string;
    seq: int64 option;
    accountCount: int64 option;
    status: com_atproto_sync_defs_hoststatus option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let hostname = Value.Util.get_key "hostname" Value.Util.to_text v in
    let seq = Value.Util.get_key_opt "seq" Value.Util.to_int v in
    let accountCount = Value.Util.get_key_opt "accountCount" Value.Util.to_int v in
    let status = Value.Util.get_key_opt "status" com_atproto_sync_defs_hoststatus_of_value v in
    {hostname;seq;accountCount;status;})

  type main_error = [ `HostNotFound [@name "HostNotFound"]]
  [@@deriving show {with_path=false}]

  (** Returns information about a specified upstream host, as consumed by the server. Implemented by relays. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.sync.getHead"
  *)
module Com_Atproto_Sync_GetHead = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;}

  type main_output = {
    root: string;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let root = Value.Util.get_key "root" Value.Util.to_text v in
    {root;})

  type main_error = [ `HeadNotFound [@name "HeadNotFound"]]
  [@@deriving show {with_path=false}]

  (** DEPRECATED - please use com.atproto.sync.getLatestCommit instead *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.sync.getCheckout"
  *)
module Com_Atproto_Sync_GetCheckout = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;}

  (** DEPRECATED - please use com.atproto.sync.getRepo instead *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_opaque {encoding=CAR}) ~errors:No_errors

end


(** lexicon "com.atproto.sync.getBlocks"
  *)
module Com_Atproto_Sync_GetBlocks = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
    cids: string list;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let cids = Value.Util.get_key "cids" (Value.Util.to_array_of Value.Util.to_text) v in
    {did;cids;}

  type main_error = [ `BlockNotFound [@name "BlockNotFound"] | `RepoNotFound [@name "RepoNotFound"] | `RepoTakendown [@name "RepoTakendown"] | `RepoSuspended [@name "RepoSuspended"] | `RepoDeactivated [@name "RepoDeactivated"]]
  [@@deriving show {with_path=false}]

  (** Get data blocks from a given repo, by CID. For example, intermediate MST nodes, or records. Does not require auth; implemented by PDS. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_opaque {encoding=CAR}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.sync.getBlob"
  *)
module Com_Atproto_Sync_GetBlob = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
    cid: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    {did;cid;}

  type main_error = [ `BlobNotFound [@name "BlobNotFound"] | `RepoNotFound [@name "RepoNotFound"] | `RepoTakendown [@name "RepoTakendown"] | `RepoSuspended [@name "RepoSuspended"] | `RepoDeactivated [@name "RepoDeactivated"]]
  [@@deriving show {with_path=false}]

  (** Get a blob associated with a given account. Returns the full blob as originally uploaded. Does not require auth; implemented by PDS. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_opaque {encoding=(Other "*/*")}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.sync.defs"
  *)
module Com_Atproto_Sync_Defs = struct
  (** {2 def hostStatus} *)

  type nonrec hoststatus = com_atproto_sync_defs_hoststatus
  let pp_hoststatus = pp_com_atproto_sync_defs_hoststatus
  let hoststatus_of_value = com_atproto_sync_defs_hoststatus_of_value
  let hoststatus_to_value = com_atproto_sync_defs_hoststatus_to_value


end


(** lexicon "com.atproto.server.updateEmail"
  *)
module Com_Atproto_Server_UpdateEmail = struct
  (** {2 def main} *)

  type main_input = {
    email: string;
    emailAuthFactor: bool option;
    token: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let email = Value.Util.get_key "email" Value.Util.to_text v in
    let emailAuthFactor = Value.Util.get_key_opt "emailAuthFactor" Value.Util.to_bool v in
    let token = Value.Util.get_key_opt "token" Value.Util.to_text v in
    {email;emailAuthFactor;token;})

  type main_error = [ `ExpiredToken [@name "ExpiredToken"] | `InvalidToken [@name "InvalidToken"] | `TokenRequired [@name "TokenRequired"]]
  [@@deriving show {with_path=false}]

  (** Update an account's email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.server.revokeAppPassword"
  *)
module Com_Atproto_Server_RevokeAppPassword = struct
  (** {2 def main} *)

  type main_input = {
    name: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let name = Value.Util.get_key "name" Value.Util.to_text v in
    {name;})

  (** Revoke an App Password by name. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.resetPassword"
  *)
module Com_Atproto_Server_ResetPassword = struct
  (** {2 def main} *)

  type main_input = {
    token: string;
    password: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let token = Value.Util.get_key "token" Value.Util.to_text v in
    let password = Value.Util.get_key "password" Value.Util.to_text v in
    {token;password;})

  type main_error = [ `ExpiredToken [@name "ExpiredToken"] | `InvalidToken [@name "InvalidToken"]]
  [@@deriving show {with_path=false}]

  (** Reset a user account password using a token. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.server.reserveSigningKey"
  *)
module Com_Atproto_Server_ReserveSigningKey = struct
  (** {2 def main} *)

  type main_input = {
    did: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let did = Value.Util.get_key_opt "did" Value.Util.to_text v in
    {did;})

  type main_output = {
    signingKey: string;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let signingKey = Value.Util.get_key "signingKey" Value.Util.to_text v in
    {signingKey;})

  (** Reserve a repo signing key, for use with account creation. Necessary so that a DID PLC update operation can be constructed during an account migraiton. Public and does not require auth; implemented by PDS. NOTE: this endpoint may change when full account migration is implemented. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.server.requestPasswordReset"
  *)
module Com_Atproto_Server_RequestPasswordReset = struct
  (** {2 def main} *)

  type main_input = {
    email: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let email = Value.Util.get_key "email" Value.Util.to_text v in
    {email;})

  (** Initiate a user account password reset via email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.requestEmailUpdate"
  *)
module Com_Atproto_Server_RequestEmailUpdate = struct
  (** {2 def main} *)

  type main_output = {
    tokenRequired: bool;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let tokenRequired = Value.Util.get_key "tokenRequired" Value.Util.to_bool v in
    {tokenRequired;})

  (** Request a token in order to update email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.server.requestEmailConfirmation"
  *)
module Com_Atproto_Server_RequestEmailConfirmation = struct
  (** {2 def main} *)

  (** Request an email with a code to confirm ownership of email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.requestAccountDelete"
  *)
module Com_Atproto_Server_RequestAccountDelete = struct
  (** {2 def main} *)

  (** Initiate a user account deletion via email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.refreshSession"
  *)
module Com_Atproto_Server_RefreshSession = struct
  (** {2 def main} *)

  type main_output = {
    accessJwt: string;
    refreshJwt: string;
    handle: string;
    did: string;
    didDoc: Value.t (* unknown *) option;
    active: bool option;
    status: string option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let accessJwt = Value.Util.get_key "accessJwt" Value.Util.to_text v in
    let refreshJwt = Value.Util.get_key "refreshJwt" Value.Util.to_text v in
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let didDoc = Value.Util.get_key_opt "didDoc" (fun v -> v (* immediate *)) v in
    let active = Value.Util.get_key_opt "active" Value.Util.to_bool v in
    let status = Value.Util.get_key_opt "status" Value.Util.to_text v in
    {accessJwt;refreshJwt;handle;did;didDoc;active;status;})

  type main_error = [ `AccountTakedown [@name "AccountTakedown"]]
  [@@deriving show {with_path=false}]

  (** Refresh an authentication session. Requires auth using the 'refreshJwt' (not the 'accessJwt'). *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.server.listAppPasswords"
  *)
module Com_Atproto_Server_ListAppPasswords = struct
  (** {2 def main} *)

  type main_output = {
    passwords: com_atproto_server_listapppasswords_apppassword list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let passwords = Value.Util.get_key "passwords" (Value.Util.to_array_of com_atproto_server_listapppasswords_apppassword_of_value) v in
    {passwords;})

  type main_error = [ `AccountTakedown [@name "AccountTakedown"]]
  [@@deriving show {with_path=false}]

  (** List all App Passwords. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

  (** {2 def appPassword} *)

  type nonrec apppassword = com_atproto_server_listapppasswords_apppassword = {
    name: string;
    createdAt: string;
    privileged: bool option;
  }
  let pp_apppassword = pp_com_atproto_server_listapppasswords_apppassword
  let apppassword_of_value = com_atproto_server_listapppasswords_apppassword_of_value
  let apppassword_to_value = com_atproto_server_listapppasswords_apppassword_to_value


end


(** lexicon "com.atproto.server.getSession"
  *)
module Com_Atproto_Server_GetSession = struct
  (** {2 def main} *)

  type main_output = {
    handle: string;
    did: string;
    email: string option;
    emailConfirmed: bool option;
    emailAuthFactor: bool option;
    didDoc: Value.t (* unknown *) option;
    active: bool option;
    status: string option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let email = Value.Util.get_key_opt "email" Value.Util.to_text v in
    let emailConfirmed = Value.Util.get_key_opt "emailConfirmed" Value.Util.to_bool v in
    let emailAuthFactor = Value.Util.get_key_opt "emailAuthFactor" Value.Util.to_bool v in
    let didDoc = Value.Util.get_key_opt "didDoc" (fun v -> v (* immediate *)) v in
    let active = Value.Util.get_key_opt "active" Value.Util.to_bool v in
    let status = Value.Util.get_key_opt "status" Value.Util.to_text v in
    {handle;did;email;emailConfirmed;emailAuthFactor;didDoc;active;status;})

  (** Get information about the current auth session. Requires auth. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.server.getServiceAuth"
  *)
module Com_Atproto_Server_GetServiceAuth = struct
  (** {2 def main} *)

  type main_params = {
    aud: string;
    exp: int64 option;
    lxm: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let aud = Value.Util.get_key "aud" Value.Util.to_text v in
    let exp = Value.Util.get_key_opt "exp" Value.Util.to_int v in
    let lxm = Value.Util.get_key_opt "lxm" Value.Util.to_text v in
    {aud;exp;lxm;}

  type main_output = {
    token: string;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let token = Value.Util.get_key "token" Value.Util.to_text v in
    {token;})

  type main_error = [ `BadExpiration [@name "BadExpiration"]]
  [@@deriving show {with_path=false}]

  (** Get a signed token on behalf of the requesting DID for the requested service. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.server.getAccountInviteCodes"
  *)
module Com_Atproto_Server_GetAccountInviteCodes = struct
  (** {2 def main} *)

  type main_params = {
    includeUsed: bool option;
    createAvailable: bool option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let includeUsed = Value.Util.get_key_opt "includeUsed" Value.Util.to_bool v in
    let createAvailable = Value.Util.get_key_opt "createAvailable" Value.Util.to_bool v in
    {includeUsed;createAvailable;}

  type main_output = {
    codes: com_atproto_server_defs_invitecode list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let codes = Value.Util.get_key "codes" (Value.Util.to_array_of com_atproto_server_defs_invitecode_of_value) v in
    {codes;})

  type main_error = [ `DuplicateCreate [@name "DuplicateCreate"]]
  [@@deriving show {with_path=false}]

  (** Get all invite codes for the current account. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.server.describeServer"
  *)
module Com_Atproto_Server_DescribeServer = struct
  (** {2 def main} *)

  type main_output = {
    inviteCodeRequired: bool option;
    phoneVerificationRequired: bool option;
    availableUserDomains: string list;
    links: com_atproto_server_describeserver_links option;
    contact: com_atproto_server_describeserver_contact option;
    did: string;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let inviteCodeRequired = Value.Util.get_key_opt "inviteCodeRequired" Value.Util.to_bool v in
    let phoneVerificationRequired = Value.Util.get_key_opt "phoneVerificationRequired" Value.Util.to_bool v in
    let availableUserDomains = Value.Util.get_key "availableUserDomains" (Value.Util.to_array_of Value.Util.to_text) v in
    let links = Value.Util.get_key_opt "links" com_atproto_server_describeserver_links_of_value v in
    let contact = Value.Util.get_key_opt "contact" com_atproto_server_describeserver_contact_of_value v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {inviteCodeRequired;phoneVerificationRequired;availableUserDomains;links;contact;did;})

  (** Describes the server's account creation requirements and capabilities. Implemented by PDS. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def links} *)

  type nonrec links = com_atproto_server_describeserver_links = {
    privacyPolicy: string option;
    termsOfService: string option;
  }
  let pp_links = pp_com_atproto_server_describeserver_links
  let links_of_value = com_atproto_server_describeserver_links_of_value
  let links_to_value = com_atproto_server_describeserver_links_to_value


  (** {2 def contact} *)

  type nonrec contact = com_atproto_server_describeserver_contact = {
    email: string option;
  }
  let pp_contact = pp_com_atproto_server_describeserver_contact
  let contact_of_value = com_atproto_server_describeserver_contact_of_value
  let contact_to_value = com_atproto_server_describeserver_contact_to_value


end


(** lexicon "com.atproto.server.deleteSession"
  *)
module Com_Atproto_Server_DeleteSession = struct
  (** {2 def main} *)

  (** Delete the current session. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.deleteAccount"
  *)
module Com_Atproto_Server_DeleteAccount = struct
  (** {2 def main} *)

  type main_input = {
    did: string;
    password: string;
    token: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let password = Value.Util.get_key "password" Value.Util.to_text v in
    let token = Value.Util.get_key "token" Value.Util.to_text v in
    {did;password;token;})

  type main_error = [ `ExpiredToken [@name "ExpiredToken"] | `InvalidToken [@name "InvalidToken"]]
  [@@deriving show {with_path=false}]

  (** Delete an actor's account with a token and password. Can only be called after requesting a deletion token. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.server.deactivateAccount"
  *)
module Com_Atproto_Server_DeactivateAccount = struct
  (** {2 def main} *)

  type main_input = {
    deleteAfter: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let deleteAfter = Value.Util.get_key_opt "deleteAfter" Value.Util.to_text v in
    {deleteAfter;})

  (** Deactivates a currently active account. Stops serving of repo, and future writes to repo until reactivated. Used to finalize account migration with the old host after the account has been activated on the new host. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.createSession"
  *)
module Com_Atproto_Server_CreateSession = struct
  (** {2 def main} *)

  type main_input = {
    identifier: string;
    password: string;
    authFactorToken: string option;
    allowTakendown: bool option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let identifier = Value.Util.get_key "identifier" Value.Util.to_text v in
    let password = Value.Util.get_key "password" Value.Util.to_text v in
    let authFactorToken = Value.Util.get_key_opt "authFactorToken" Value.Util.to_text v in
    let allowTakendown = Value.Util.get_key_opt "allowTakendown" Value.Util.to_bool v in
    {identifier;password;authFactorToken;allowTakendown;})

  type main_output = {
    accessJwt: string;
    refreshJwt: string;
    handle: string;
    did: string;
    didDoc: Value.t (* unknown *) option;
    email: string option;
    emailConfirmed: bool option;
    emailAuthFactor: bool option;
    active: bool option;
    status: string option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let accessJwt = Value.Util.get_key "accessJwt" Value.Util.to_text v in
    let refreshJwt = Value.Util.get_key "refreshJwt" Value.Util.to_text v in
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let didDoc = Value.Util.get_key_opt "didDoc" (fun v -> v (* immediate *)) v in
    let email = Value.Util.get_key_opt "email" Value.Util.to_text v in
    let emailConfirmed = Value.Util.get_key_opt "emailConfirmed" Value.Util.to_bool v in
    let emailAuthFactor = Value.Util.get_key_opt "emailAuthFactor" Value.Util.to_bool v in
    let active = Value.Util.get_key_opt "active" Value.Util.to_bool v in
    let status = Value.Util.get_key_opt "status" Value.Util.to_text v in
    {accessJwt;refreshJwt;handle;did;didDoc;email;emailConfirmed;emailAuthFactor;active;status;})

  type main_error = [ `AccountTakedown [@name "AccountTakedown"] | `AuthFactorTokenRequired [@name "AuthFactorTokenRequired"]]
  [@@deriving show {with_path=false}]

  (** Create an authentication session. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.server.createInviteCodes"
  *)
module Com_Atproto_Server_CreateInviteCodes = struct
  (** {2 def main} *)

  type main_input = {
    codeCount: int64;
    useCount: int64;
    forAccounts: string list option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let codeCount = Value.Util.get_key "codeCount" Value.Util.to_int v in
    let useCount = Value.Util.get_key "useCount" Value.Util.to_int v in
    let forAccounts = Value.Util.get_key_opt "forAccounts" (Value.Util.to_array_of Value.Util.to_text) v in
    {codeCount;useCount;forAccounts;})

  type main_output = {
    codes: com_atproto_server_createinvitecodes_accountcodes list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let codes = Value.Util.get_key "codes" (Value.Util.to_array_of com_atproto_server_createinvitecodes_accountcodes_of_value) v in
    {codes;})

  (** Create invite codes. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def accountCodes} *)

  type nonrec accountcodes = com_atproto_server_createinvitecodes_accountcodes = {
    account: string;
    codes: string list;
  }
  let pp_accountcodes = pp_com_atproto_server_createinvitecodes_accountcodes
  let accountcodes_of_value = com_atproto_server_createinvitecodes_accountcodes_of_value
  let accountcodes_to_value = com_atproto_server_createinvitecodes_accountcodes_to_value


end


(** lexicon "com.atproto.server.createInviteCode"
  *)
module Com_Atproto_Server_CreateInviteCode = struct
  (** {2 def main} *)

  type main_input = {
    useCount: int64;
    forAccount: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let useCount = Value.Util.get_key "useCount" Value.Util.to_int v in
    let forAccount = Value.Util.get_key_opt "forAccount" Value.Util.to_text v in
    {useCount;forAccount;})

  type main_output = {
    code: string;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let code = Value.Util.get_key "code" Value.Util.to_text v in
    {code;})

  (** Create an invite code. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.server.createAppPassword"
  *)
module Com_Atproto_Server_CreateAppPassword = struct
  (** {2 def main} *)

  type main_input = {
    name: string;
    privileged: bool option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let name = Value.Util.get_key "name" Value.Util.to_text v in
    let privileged = Value.Util.get_key_opt "privileged" Value.Util.to_bool v in
    {name;privileged;})

  type main_output = com_atproto_server_createapppassword_apppassword
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = com_atproto_server_createapppassword_apppassword_of_value

  type main_error = [ `AccountTakedown [@name "AccountTakedown"]]
  [@@deriving show {with_path=false}]

  (** Create an App Password. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

  (** {2 def appPassword} *)

  type nonrec apppassword = com_atproto_server_createapppassword_apppassword = {
    name: string;
    password: string;
    createdAt: string;
    privileged: bool option;
  }
  let pp_apppassword = pp_com_atproto_server_createapppassword_apppassword
  let apppassword_of_value = com_atproto_server_createapppassword_apppassword_of_value
  let apppassword_to_value = com_atproto_server_createapppassword_apppassword_to_value


end


(** lexicon "com.atproto.server.createAccount"
  *)
module Com_Atproto_Server_CreateAccount = struct
  (** {2 def main} *)

  type main_input = {
    email: string option;
    handle: string;
    did: string option;
    inviteCode: string option;
    verificationCode: string option;
    verificationPhone: string option;
    password: string option;
    recoveryKey: string option;
    plcOp: Value.t (* unknown *) option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let email = Value.Util.get_key_opt "email" Value.Util.to_text v in
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let did = Value.Util.get_key_opt "did" Value.Util.to_text v in
    let inviteCode = Value.Util.get_key_opt "inviteCode" Value.Util.to_text v in
    let verificationCode = Value.Util.get_key_opt "verificationCode" Value.Util.to_text v in
    let verificationPhone = Value.Util.get_key_opt "verificationPhone" Value.Util.to_text v in
    let password = Value.Util.get_key_opt "password" Value.Util.to_text v in
    let recoveryKey = Value.Util.get_key_opt "recoveryKey" Value.Util.to_text v in
    let plcOp = Value.Util.get_key_opt "plcOp" (fun v -> v (* immediate *)) v in
    {email;handle;did;inviteCode;verificationCode;verificationPhone;password;recoveryKey;plcOp;})

  type main_output = {
    accessJwt: string;
    refreshJwt: string;
    handle: string;
    did: string;
    didDoc: Value.t (* unknown *) option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let accessJwt = Value.Util.get_key "accessJwt" Value.Util.to_text v in
    let refreshJwt = Value.Util.get_key "refreshJwt" Value.Util.to_text v in
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let didDoc = Value.Util.get_key_opt "didDoc" (fun v -> v (* immediate *)) v in
    {accessJwt;refreshJwt;handle;did;didDoc;})

  type main_error = [ `InvalidHandle [@name "InvalidHandle"] | `InvalidPassword [@name "InvalidPassword"] | `InvalidInviteCode [@name "InvalidInviteCode"] | `HandleNotAvailable [@name "HandleNotAvailable"] | `UnsupportedDomain [@name "UnsupportedDomain"] | `UnresolvableDid [@name "UnresolvableDid"] | `IncompatibleDidDoc [@name "IncompatibleDidDoc"]]
  [@@deriving show {with_path=false}]

  (** Create an account. Implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.server.confirmEmail"
  *)
module Com_Atproto_Server_ConfirmEmail = struct
  (** {2 def main} *)

  type main_input = {
    email: string;
    token: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let email = Value.Util.get_key "email" Value.Util.to_text v in
    let token = Value.Util.get_key "token" Value.Util.to_text v in
    {email;token;})

  type main_error = [ `AccountNotFound [@name "AccountNotFound"] | `ExpiredToken [@name "ExpiredToken"] | `InvalidToken [@name "InvalidToken"] | `InvalidEmail [@name "InvalidEmail"]]
  [@@deriving show {with_path=false}]

  (** Confirm an email using a token from com.atproto.server.requestEmailConfirmation. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.server.checkAccountStatus"
  *)
module Com_Atproto_Server_CheckAccountStatus = struct
  (** {2 def main} *)

  type main_output = {
    activated: bool;
    validDid: bool;
    repoCommit: string;
    repoRev: string;
    repoBlocks: int64;
    indexedRecords: int64;
    privateStateValues: int64;
    expectedBlobs: int64;
    importedBlobs: int64;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let activated = Value.Util.get_key "activated" Value.Util.to_bool v in
    let validDid = Value.Util.get_key "validDid" Value.Util.to_bool v in
    let repoCommit = Value.Util.get_key "repoCommit" Value.Util.to_text v in
    let repoRev = Value.Util.get_key "repoRev" Value.Util.to_text v in
    let repoBlocks = Value.Util.get_key "repoBlocks" Value.Util.to_int v in
    let indexedRecords = Value.Util.get_key "indexedRecords" Value.Util.to_int v in
    let privateStateValues = Value.Util.get_key "privateStateValues" Value.Util.to_int v in
    let expectedBlobs = Value.Util.get_key "expectedBlobs" Value.Util.to_int v in
    let importedBlobs = Value.Util.get_key "importedBlobs" Value.Util.to_int v in
    {activated;validDid;repoCommit;repoRev;repoBlocks;indexedRecords;privateStateValues;expectedBlobs;importedBlobs;})

  (** Returns the status of an account, especially as pertaining to import or recovery. Can be called many times over the course of an account migration. Requires auth and can only be called pertaining to oneself. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.server.activateAccount"
  *)
module Com_Atproto_Server_ActivateAccount = struct
  (** {2 def main} *)

  (** Activates a currently deactivated account. Used to finalize account migration after the account's repo is imported and identity is setup. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.repo.uploadBlob"
  *)
module Com_Atproto_Repo_UploadBlob = struct
  (** {2 def main} *)

  type main_output = {
    blob: Blob.t;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let blob = Value.Util.get_key "blob" Blob.of_value_exn v in
    {blob;})

  (** Upload a new blob, to be referenced from a repository record. The blob will be deleted if it is not referenced within a time window (eg, minutes). Blob restrictions (mimetype, size, etc) are enforced when the reference is created. Requires auth, implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_opaque {encoding=(Other "*/*")}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.repo.putRecord"
  *)
module Com_Atproto_Repo_PutRecord = struct
  (** {2 def main} *)

  type main_input = {
    repo: string;
    collection: string;
    rkey: string;
    validate: bool option;
    record: Value.t (* unknown *);
    swapRecord: string option;
    swapCommit: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let repo = Value.Util.get_key "repo" Value.Util.to_text v in
    let collection = Value.Util.get_key "collection" Value.Util.to_text v in
    let rkey = Value.Util.get_key "rkey" Value.Util.to_text v in
    let validate = Value.Util.get_key_opt "validate" Value.Util.to_bool v in
    let record = Value.Util.get_key "record" (fun v -> v (* immediate *)) v in
    let swapRecord = Value.Util.get_key_opt "swapRecord" Value.Util.to_text v in
    let swapCommit = Value.Util.get_key_opt "swapCommit" Value.Util.to_text v in
    {repo;collection;rkey;validate;record;swapRecord;swapCommit;})

  type main_output = {
    uri: string;
    cid: string;
    commit: com_atproto_repo_defs_commitmeta option;
    validationStatus: string option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let commit = Value.Util.get_key_opt "commit" com_atproto_repo_defs_commitmeta_of_value v in
    let validationStatus = Value.Util.get_key_opt "validationStatus" Value.Util.to_text v in
    {uri;cid;commit;validationStatus;})

  type main_error = [ `InvalidSwap [@name "InvalidSwap"]]
  [@@deriving show {with_path=false}]

  (** Write a repository record, creating or updating it as needed. Requires auth, implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.repo.listRecords"
  *)
module Com_Atproto_Repo_ListRecords = struct
  (** {2 def main} *)

  type main_params = {
    repo: string;
    collection: string;
    limit: int64 option;
    cursor: string option;
    reverse: bool option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let repo = Value.Util.get_key "repo" Value.Util.to_text v in
    let collection = Value.Util.get_key "collection" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let reverse = Value.Util.get_key_opt "reverse" Value.Util.to_bool v in
    {repo;collection;limit;cursor;reverse;}

  type main_output = {
    cursor: string option;
    records: com_atproto_repo_listrecords_record list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let records = Value.Util.get_key "records" (Value.Util.to_array_of com_atproto_repo_listrecords_record_of_value) v in
    {cursor;records;})

  (** List a range of records in a repository, matching a specific collection. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def record} *)

  type nonrec record = com_atproto_repo_listrecords_record = {
    uri: string;
    cid: string;
    value: Value.t (* unknown *);
  }
  let pp_record = pp_com_atproto_repo_listrecords_record
  let record_of_value = com_atproto_repo_listrecords_record_of_value
  let record_to_value = com_atproto_repo_listrecords_record_to_value


end


(** lexicon "com.atproto.repo.listMissingBlobs"
  *)
module Com_Atproto_Repo_ListMissingBlobs = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {limit;cursor;}

  type main_output = {
    cursor: string option;
    blobs: com_atproto_repo_listmissingblobs_recordblob list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let blobs = Value.Util.get_key "blobs" (Value.Util.to_array_of com_atproto_repo_listmissingblobs_recordblob_of_value) v in
    {cursor;blobs;})

  (** Returns a list of missing blobs for the requesting account. Intended to be used in the account migration flow. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def recordBlob} *)

  type nonrec recordblob = com_atproto_repo_listmissingblobs_recordblob = {
    cid: string;
    recordUri: string;
  }
  let pp_recordblob = pp_com_atproto_repo_listmissingblobs_recordblob
  let recordblob_of_value = com_atproto_repo_listmissingblobs_recordblob_of_value
  let recordblob_to_value = com_atproto_repo_listmissingblobs_recordblob_to_value


end


(** lexicon "com.atproto.repo.importRepo"
  *)
module Com_Atproto_Repo_ImportRepo = struct
  (** {2 def main} *)

  (** Import a repo in the form of a CAR file. Requires Content-Length HTTP header to be set. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_opaque {encoding=CAR}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.repo.getRecord"
  *)
module Com_Atproto_Repo_GetRecord = struct
  (** {2 def main} *)

  type main_params = {
    repo: string;
    collection: string;
    rkey: string;
    cid: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let repo = Value.Util.get_key "repo" Value.Util.to_text v in
    let collection = Value.Util.get_key "collection" Value.Util.to_text v in
    let rkey = Value.Util.get_key "rkey" Value.Util.to_text v in
    let cid = Value.Util.get_key_opt "cid" Value.Util.to_text v in
    {repo;collection;rkey;cid;}

  type main_output = {
    uri: string;
    cid: string option;
    value: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key_opt "cid" Value.Util.to_text v in
    let value = Value.Util.get_key "value" (fun v -> v (* immediate *)) v in
    {uri;cid;value;})

  type main_error = [ `RecordNotFound [@name "RecordNotFound"]]
  [@@deriving show {with_path=false}]

  (** Get a single record from a repository. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.repo.describeRepo"
  *)
module Com_Atproto_Repo_DescribeRepo = struct
  (** {2 def main} *)

  type main_params = {
    repo: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let repo = Value.Util.get_key "repo" Value.Util.to_text v in
    {repo;}

  type main_output = {
    handle: string;
    did: string;
    didDoc: Value.t (* unknown *);
    collections: string list;
    handleIsCorrect: bool;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let didDoc = Value.Util.get_key "didDoc" (fun v -> v (* immediate *)) v in
    let collections = Value.Util.get_key "collections" (Value.Util.to_array_of Value.Util.to_text) v in
    let handleIsCorrect = Value.Util.get_key "handleIsCorrect" Value.Util.to_bool v in
    {handle;did;didDoc;collections;handleIsCorrect;})

  (** Get information about an account and repository, including the list of collections. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.repo.deleteRecord"
  *)
module Com_Atproto_Repo_DeleteRecord = struct
  (** {2 def main} *)

  type main_input = {
    repo: string;
    collection: string;
    rkey: string;
    swapRecord: string option;
    swapCommit: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let repo = Value.Util.get_key "repo" Value.Util.to_text v in
    let collection = Value.Util.get_key "collection" Value.Util.to_text v in
    let rkey = Value.Util.get_key "rkey" Value.Util.to_text v in
    let swapRecord = Value.Util.get_key_opt "swapRecord" Value.Util.to_text v in
    let swapCommit = Value.Util.get_key_opt "swapCommit" Value.Util.to_text v in
    {repo;collection;rkey;swapRecord;swapCommit;})

  type main_output = {
    commit: com_atproto_repo_defs_commitmeta option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let commit = Value.Util.get_key_opt "commit" com_atproto_repo_defs_commitmeta_of_value v in
    {commit;})

  type main_error = [ `InvalidSwap [@name "InvalidSwap"]]
  [@@deriving show {with_path=false}]

  (** Delete a repository record, or ensure it doesn't exist. Requires auth, implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.repo.createRecord"
  *)
module Com_Atproto_Repo_CreateRecord = struct
  (** {2 def main} *)

  type main_input = {
    repo: string;
    collection: string;
    rkey: string option;
    validate: bool option;
    record: Value.t (* unknown *);
    swapCommit: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let repo = Value.Util.get_key "repo" Value.Util.to_text v in
    let collection = Value.Util.get_key "collection" Value.Util.to_text v in
    let rkey = Value.Util.get_key_opt "rkey" Value.Util.to_text v in
    let validate = Value.Util.get_key_opt "validate" Value.Util.to_bool v in
    let record = Value.Util.get_key "record" (fun v -> v (* immediate *)) v in
    let swapCommit = Value.Util.get_key_opt "swapCommit" Value.Util.to_text v in
    {repo;collection;rkey;validate;record;swapCommit;})

  type main_output = {
    uri: string;
    cid: string;
    commit: com_atproto_repo_defs_commitmeta option;
    validationStatus: string option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key "cid" Value.Util.to_text v in
    let commit = Value.Util.get_key_opt "commit" com_atproto_repo_defs_commitmeta_of_value v in
    let validationStatus = Value.Util.get_key_opt "validationStatus" Value.Util.to_text v in
    {uri;cid;commit;validationStatus;})

  type main_error = [ `InvalidSwap [@name "InvalidSwap"]]
  [@@deriving show {with_path=false}]

  (** Create a single new repository record. Requires auth, implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.repo.applyWrites"
  *)
module Com_Atproto_Repo_ApplyWrites = struct
  (** {2 def main} *)

  type main_input = {
    repo: string;
    validate: bool option;
    writes: [
    `Com_atproto_repo_applywrites_create of com_atproto_repo_applywrites_create
    | `Com_atproto_repo_applywrites_update of com_atproto_repo_applywrites_update
    | `Com_atproto_repo_applywrites_delete of com_atproto_repo_applywrites_delete
    ] list;
    swapCommit: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let repo = Value.Util.get_key "repo" Value.Util.to_text v in
    let validate = Value.Util.get_key_opt "validate" Value.Util.to_bool v in
    let writes = Value.Util.get_key "writes" (Value.Util.to_array_of (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "create" -> `Com_atproto_repo_applywrites_create (com_atproto_repo_applywrites_create_of_value v)
    | "update" -> `Com_atproto_repo_applywrites_update (com_atproto_repo_applywrites_update_of_value v)
    | "delete" -> `Com_atproto_repo_applywrites_delete (com_atproto_repo_applywrites_delete_of_value v)    ))) v in
    let swapCommit = Value.Util.get_key_opt "swapCommit" Value.Util.to_text v in
    {repo;validate;writes;swapCommit;})

  type main_output = {
    commit: com_atproto_repo_defs_commitmeta option;
    results: [
    `Com_atproto_repo_applywrites_createresult of com_atproto_repo_applywrites_createresult
    | `Com_atproto_repo_applywrites_updateresult of com_atproto_repo_applywrites_updateresult
    | `Com_atproto_repo_applywrites_deleteresult of com_atproto_repo_applywrites_deleteresult
    ] list option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let commit = Value.Util.get_key_opt "commit" com_atproto_repo_defs_commitmeta_of_value v in
    let results = Value.Util.get_key_opt "results" (Value.Util.to_array_of (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "createResult" -> `Com_atproto_repo_applywrites_createresult (com_atproto_repo_applywrites_createresult_of_value v)
    | "updateResult" -> `Com_atproto_repo_applywrites_updateresult (com_atproto_repo_applywrites_updateresult_of_value v)
    | "deleteResult" -> `Com_atproto_repo_applywrites_deleteresult (com_atproto_repo_applywrites_deleteresult_of_value v)    ))) v in
    {commit;results;})

  type main_error = [ `InvalidSwap [@name "InvalidSwap"]]
  [@@deriving show {with_path=false}]

  (** Apply a batch transaction of repository creates, updates, and deletes. Requires auth, implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

  (** {2 def create} *)

  type nonrec create = com_atproto_repo_applywrites_create = {
    collection: string;
    rkey: string option;
    value: Value.t (* unknown *);
  }
  let pp_create = pp_com_atproto_repo_applywrites_create
  let create_of_value = com_atproto_repo_applywrites_create_of_value
  let create_to_value = com_atproto_repo_applywrites_create_to_value


  (** {2 def update} *)

  type nonrec update = com_atproto_repo_applywrites_update = {
    collection: string;
    rkey: string;
    value: Value.t (* unknown *);
  }
  let pp_update = pp_com_atproto_repo_applywrites_update
  let update_of_value = com_atproto_repo_applywrites_update_of_value
  let update_to_value = com_atproto_repo_applywrites_update_to_value


  (** {2 def delete} *)

  type nonrec delete = com_atproto_repo_applywrites_delete = {
    collection: string;
    rkey: string;
  }
  let pp_delete = pp_com_atproto_repo_applywrites_delete
  let delete_of_value = com_atproto_repo_applywrites_delete_of_value
  let delete_to_value = com_atproto_repo_applywrites_delete_to_value


  (** {2 def createResult} *)

  type nonrec createresult = com_atproto_repo_applywrites_createresult = {
    uri: string;
    cid: string;
    validationStatus: string option;
  }
  let pp_createresult = pp_com_atproto_repo_applywrites_createresult
  let createresult_of_value = com_atproto_repo_applywrites_createresult_of_value
  let createresult_to_value = com_atproto_repo_applywrites_createresult_to_value


  (** {2 def updateResult} *)

  type nonrec updateresult = com_atproto_repo_applywrites_updateresult = {
    uri: string;
    cid: string;
    validationStatus: string option;
  }
  let pp_updateresult = pp_com_atproto_repo_applywrites_updateresult
  let updateresult_of_value = com_atproto_repo_applywrites_updateresult_of_value
  let updateresult_to_value = com_atproto_repo_applywrites_updateresult_to_value


  (** {2 def deleteResult} *)

  type nonrec deleteresult = com_atproto_repo_applywrites_deleteresult
  let pp_deleteresult = pp_com_atproto_repo_applywrites_deleteresult
  let deleteresult_of_value = com_atproto_repo_applywrites_deleteresult_of_value
  let deleteresult_to_value = com_atproto_repo_applywrites_deleteresult_to_value


end


(** lexicon "com.atproto.repo.defs"
  *)
module Com_Atproto_Repo_Defs = struct
  (** {2 def commitMeta} *)

  type nonrec commitmeta = com_atproto_repo_defs_commitmeta = {
    cid: string;
    rev: string;
  }
  let pp_commitmeta = pp_com_atproto_repo_defs_commitmeta
  let commitmeta_of_value = com_atproto_repo_defs_commitmeta_of_value
  let commitmeta_to_value = com_atproto_repo_defs_commitmeta_to_value


end


(** lexicon "com.atproto.moderation.createReport"
  *)
module Com_Atproto_Moderation_CreateReport = struct
  (** {2 def main} *)

  type main_input = {
    reasonType: com_atproto_moderation_defs_reasontype;
    reason: string option;
    subject: [
    `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Other of Value.t (** Non closed union *)
    ];
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let reasonType = Value.Util.get_key "reasonType" com_atproto_moderation_defs_reasontype_of_value v in
    let reason = Value.Util.get_key_opt "reason" Value.Util.to_text v in
    let subject = Value.Util.get_key "subject" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "repoRef" -> `Com_atproto_admin_defs_reporef (com_atproto_admin_defs_reporef_of_value v)
    | "main" -> `Com_atproto_repo_strongref_main (com_atproto_repo_strongref_main_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    {reasonType;reason;subject;})

  type main_output = {
    id: int64;
    reasonType: com_atproto_moderation_defs_reasontype;
    reason: string option;
    subject: [
    `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Other of Value.t (** Non closed union *)
    ];
    reportedBy: string;
    createdAt: string;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let id = Value.Util.get_key "id" Value.Util.to_int v in
    let reasonType = Value.Util.get_key "reasonType" com_atproto_moderation_defs_reasontype_of_value v in
    let reason = Value.Util.get_key_opt "reason" Value.Util.to_text v in
    let subject = Value.Util.get_key "subject" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "repoRef" -> `Com_atproto_admin_defs_reporef (com_atproto_admin_defs_reporef_of_value v)
    | "main" -> `Com_atproto_repo_strongref_main (com_atproto_repo_strongref_main_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let reportedBy = Value.Util.get_key "reportedBy" Value.Util.to_text v in
    let createdAt = Value.Util.get_key "createdAt" Value.Util.to_text v in
    {id;reasonType;reason;subject;reportedBy;createdAt;})

  (** Submit a moderation report regarding an atproto account or record. Implemented by moderation services (with PDS proxying), and requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.lexicon.schema"
  *)
module Com_Atproto_Lexicon_Schema = struct
  (** {2 def main} *)

  (** Representation of Lexicon schemas themselves, when published as atproto records. Note that the schema language is not defined in Lexicon; this meta schema currently only includes a single version field ('lexicon'). See the atproto specifications for description of the other expected top-level fields ('id', 'defs', etc). *)
  type main = {
    lexicon: int64;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "com.atproto.label.subscribeLabels"
  *)
module Com_Atproto_Label_SubscribeLabels = struct
  (** {2 def main} *)

  type main_msg = [
    `Com_atproto_label_subscribelabels_labels of com_atproto_label_subscribelabels_labels
    | `Com_atproto_label_subscribelabels_info of com_atproto_label_subscribelabels_info
    | `Other of Value.t (** Non closed union *)
    ]
  [@@deriving show {with_path=false}]

  let main_msg_of_value : main_msg Value.Util.conv = (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "labels" -> `Com_atproto_label_subscribelabels_labels (com_atproto_label_subscribelabels_labels_of_value v)
    | "info" -> `Com_atproto_label_subscribelabels_info (com_atproto_label_subscribelabels_info_of_value v)
    | _ -> `Other v (* Non closed union *)
    ))

  type main_params = {
    cursor: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_int v in
    {cursor;}

  type main_error = [ `FutureCursor [@name "FutureCursor"]]
  [@@deriving show {with_path=false}]

  (** Subscribe to stream of labels (and negations). Public endpoint implemented by mod services. Uses same sequencing scheme as repo event stream. *)
  let main: _ Base.subscription = Base.make_subscription 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) ~message:(Message {
    to_value=main_msg_to_value;
    of_value=main_msg_of_value;
    pp=pp_main_msg}) 
    ~errors:(Errors {pp=pp_main_error})

  (** {2 def labels} *)

  type nonrec labels = com_atproto_label_subscribelabels_labels = {
    seq: int64;
    labels: com_atproto_label_defs_label list;
  }
  let pp_labels = pp_com_atproto_label_subscribelabels_labels
  let labels_of_value = com_atproto_label_subscribelabels_labels_of_value
  let labels_to_value = com_atproto_label_subscribelabels_labels_to_value


  (** {2 def info} *)

  type nonrec info = com_atproto_label_subscribelabels_info = {
    name: string;
    message: string option;
  }
  let pp_info = pp_com_atproto_label_subscribelabels_info
  let info_of_value = com_atproto_label_subscribelabels_info_of_value
  let info_to_value = com_atproto_label_subscribelabels_info_to_value


end


(** lexicon "com.atproto.label.queryLabels"
  *)
module Com_Atproto_Label_QueryLabels = struct
  (** {2 def main} *)

  type main_params = {
    uriPatterns: string list;
    sources: string list option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let uriPatterns = Value.Util.get_key "uriPatterns" (Value.Util.to_array_of Value.Util.to_text) v in
    let sources = Value.Util.get_key_opt "sources" (Value.Util.to_array_of Value.Util.to_text) v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {uriPatterns;sources;limit;cursor;}

  type main_output = {
    cursor: string option;
    labels: com_atproto_label_defs_label list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let labels = Value.Util.get_key "labels" (Value.Util.to_array_of com_atproto_label_defs_label_of_value) v in
    {cursor;labels;})

  (** Find labels relevant to the provided AT-URI patterns. Public endpoint for moderation services, though may return different or additional results with auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.identity.updateHandle"
  *)
module Com_Atproto_Identity_UpdateHandle = struct
  (** {2 def main} *)

  type main_input = {
    handle: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    {handle;})

  (** Updates the current account's handle. Verifies handle validity, and updates did:plc document if necessary. Implemented by PDS, and requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.identity.submitPlcOperation"
  *)
module Com_Atproto_Identity_SubmitPlcOperation = struct
  (** {2 def main} *)

  type main_input = {
    operation: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let operation = Value.Util.get_key "operation" (fun v -> v (* immediate *)) v in
    {operation;})

  (** Validates a PLC operation to ensure that it doesn't violate a service's constraints or get the identity into a bad state, then submits it to the PLC registry *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.identity.signPlcOperation"
  *)
module Com_Atproto_Identity_SignPlcOperation = struct
  (** {2 def main} *)

  type main_input = {
    token: string option;
    rotationKeys: string list option;
    alsoKnownAs: string list option;
    verificationMethods: Value.t (* unknown *) option;
    services: Value.t (* unknown *) option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let token = Value.Util.get_key_opt "token" Value.Util.to_text v in
    let rotationKeys = Value.Util.get_key_opt "rotationKeys" (Value.Util.to_array_of Value.Util.to_text) v in
    let alsoKnownAs = Value.Util.get_key_opt "alsoKnownAs" (Value.Util.to_array_of Value.Util.to_text) v in
    let verificationMethods = Value.Util.get_key_opt "verificationMethods" (fun v -> v (* immediate *)) v in
    let services = Value.Util.get_key_opt "services" (fun v -> v (* immediate *)) v in
    {token;rotationKeys;alsoKnownAs;verificationMethods;services;})

  type main_output = {
    operation: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let operation = Value.Util.get_key "operation" (fun v -> v (* immediate *)) v in
    {operation;})

  (** Signs a PLC operation to update some value(s) in the requesting DID's document. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.identity.resolveIdentity"
  *)
module Com_Atproto_Identity_ResolveIdentity = struct
  (** {2 def main} *)

  type main_params = {
    identifier: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let identifier = Value.Util.get_key "identifier" Value.Util.to_text v in
    {identifier;}

  type main_output = com_atproto_identity_defs_identityinfo
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = com_atproto_identity_defs_identityinfo_of_value

  type main_error = [ `HandleNotFound [@name "HandleNotFound"] | `DidNotFound [@name "DidNotFound"] | `DidDeactivated [@name "DidDeactivated"]]
  [@@deriving show {with_path=false}]

  (** Resolves an identity (DID or Handle) to a full identity (DID document and verified handle). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.identity.resolveHandle"
  *)
module Com_Atproto_Identity_ResolveHandle = struct
  (** {2 def main} *)

  type main_params = {
    handle: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    {handle;}

  type main_output = {
    did: string;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;})

  type main_error = [ `HandleNotFound [@name "HandleNotFound"]]
  [@@deriving show {with_path=false}]

  (** Resolves an atproto handle (hostname) to a DID. Does not necessarily bi-directionally verify against the the DID document. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.identity.resolveDid"
  *)
module Com_Atproto_Identity_ResolveDid = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;}

  type main_output = {
    didDoc: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let didDoc = Value.Util.get_key "didDoc" (fun v -> v (* immediate *)) v in
    {didDoc;})

  type main_error = [ `DidNotFound [@name "DidNotFound"] | `DidDeactivated [@name "DidDeactivated"]]
  [@@deriving show {with_path=false}]

  (** Resolves DID to DID document. Does not bi-directionally verify handle. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.identity.requestPlcOperationSignature"
  *)
module Com_Atproto_Identity_RequestPlcOperationSignature = struct
  (** {2 def main} *)

  (** Request an email with a code to in order to request a signed PLC operation. Requires Auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.identity.refreshIdentity"
  *)
module Com_Atproto_Identity_RefreshIdentity = struct
  (** {2 def main} *)

  type main_input = {
    identifier: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let identifier = Value.Util.get_key "identifier" Value.Util.to_text v in
    {identifier;})

  type main_output = com_atproto_identity_defs_identityinfo
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = com_atproto_identity_defs_identityinfo_of_value

  type main_error = [ `HandleNotFound [@name "HandleNotFound"] | `DidNotFound [@name "DidNotFound"] | `DidDeactivated [@name "DidDeactivated"]]
  [@@deriving show {with_path=false}]

  (** Request that the server re-resolve an identity (DID and handle). The server may ignore this request, or require authentication, depending on the role, implementation, and policy of the server. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "com.atproto.identity.getRecommendedDidCredentials"
  *)
module Com_Atproto_Identity_GetRecommendedDidCredentials = struct
  (** {2 def main} *)

  type main_output = {
    rotationKeys: string list option;
    alsoKnownAs: string list option;
    verificationMethods: Value.t (* unknown *) option;
    services: Value.t (* unknown *) option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let rotationKeys = Value.Util.get_key_opt "rotationKeys" (Value.Util.to_array_of Value.Util.to_text) v in
    let alsoKnownAs = Value.Util.get_key_opt "alsoKnownAs" (Value.Util.to_array_of Value.Util.to_text) v in
    let verificationMethods = Value.Util.get_key_opt "verificationMethods" (fun v -> v (* immediate *)) v in
    let services = Value.Util.get_key_opt "services" (fun v -> v (* immediate *)) v in
    {rotationKeys;alsoKnownAs;verificationMethods;services;})

  (** Describe the credentials that should be included in the DID doc of an account that is migrating to this service. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.identity.defs"
  *)
module Com_Atproto_Identity_Defs = struct
  (** {2 def identityInfo} *)

  type nonrec identityinfo = com_atproto_identity_defs_identityinfo = {
    did: string;
    handle: string;
    didDoc: Value.t (* unknown *);
  }
  let pp_identityinfo = pp_com_atproto_identity_defs_identityinfo
  let identityinfo_of_value = com_atproto_identity_defs_identityinfo_of_value
  let identityinfo_to_value = com_atproto_identity_defs_identityinfo_to_value


end


(** lexicon "com.atproto.admin.updateSubjectStatus"
  *)
module Com_Atproto_Admin_UpdateSubjectStatus = struct
  (** {2 def main} *)

  type main_input = {
    subject: [
    `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Com_atproto_admin_defs_repoblobref of com_atproto_admin_defs_repoblobref
    | `Other of Value.t (** Non closed union *)
    ];
    takedown: com_atproto_admin_defs_statusattr option;
    deactivated: com_atproto_admin_defs_statusattr option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let subject = Value.Util.get_key "subject" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "repoRef" -> `Com_atproto_admin_defs_reporef (com_atproto_admin_defs_reporef_of_value v)
    | "main" -> `Com_atproto_repo_strongref_main (com_atproto_repo_strongref_main_of_value v)
    | "repoBlobRef" -> `Com_atproto_admin_defs_repoblobref (com_atproto_admin_defs_repoblobref_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let takedown = Value.Util.get_key_opt "takedown" com_atproto_admin_defs_statusattr_of_value v in
    let deactivated = Value.Util.get_key_opt "deactivated" com_atproto_admin_defs_statusattr_of_value v in
    {subject;takedown;deactivated;})

  type main_output = {
    subject: [
    `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Com_atproto_admin_defs_repoblobref of com_atproto_admin_defs_repoblobref
    | `Other of Value.t (** Non closed union *)
    ];
    takedown: com_atproto_admin_defs_statusattr option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let subject = Value.Util.get_key "subject" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "repoRef" -> `Com_atproto_admin_defs_reporef (com_atproto_admin_defs_reporef_of_value v)
    | "main" -> `Com_atproto_repo_strongref_main (com_atproto_repo_strongref_main_of_value v)
    | "repoBlobRef" -> `Com_atproto_admin_defs_repoblobref (com_atproto_admin_defs_repoblobref_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let takedown = Value.Util.get_key_opt "takedown" com_atproto_admin_defs_statusattr_of_value v in
    {subject;takedown;})

  (** Update the service-specific admin status of a subject (account, record, or blob). *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.updateAccountSigningKey"
  *)
module Com_Atproto_Admin_UpdateAccountSigningKey = struct
  (** {2 def main} *)

  type main_input = {
    did: string;
    signingKey: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let signingKey = Value.Util.get_key "signingKey" Value.Util.to_text v in
    {did;signingKey;})

  (** Administrative action to update an account's signing key in their Did document. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.updateAccountPassword"
  *)
module Com_Atproto_Admin_UpdateAccountPassword = struct
  (** {2 def main} *)

  type main_input = {
    did: string;
    password: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let password = Value.Util.get_key "password" Value.Util.to_text v in
    {did;password;})

  (** Update the password for a user account as an administrator. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.updateAccountHandle"
  *)
module Com_Atproto_Admin_UpdateAccountHandle = struct
  (** {2 def main} *)

  type main_input = {
    did: string;
    handle: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let handle = Value.Util.get_key "handle" Value.Util.to_text v in
    {did;handle;})

  (** Administrative action to update an account's handle. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.updateAccountEmail"
  *)
module Com_Atproto_Admin_UpdateAccountEmail = struct
  (** {2 def main} *)

  type main_input = {
    account: string;
    email: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let account = Value.Util.get_key "account" Value.Util.to_text v in
    let email = Value.Util.get_key "email" Value.Util.to_text v in
    {account;email;})

  (** Administrative action to update an account's email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.sendEmail"
  *)
module Com_Atproto_Admin_SendEmail = struct
  (** {2 def main} *)

  type main_input = {
    recipientDid: string;
    content: string;
    subject: string option;
    senderDid: string;
    comment: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let recipientDid = Value.Util.get_key "recipientDid" Value.Util.to_text v in
    let content = Value.Util.get_key "content" Value.Util.to_text v in
    let subject = Value.Util.get_key_opt "subject" Value.Util.to_text v in
    let senderDid = Value.Util.get_key "senderDid" Value.Util.to_text v in
    let comment = Value.Util.get_key_opt "comment" Value.Util.to_text v in
    {recipientDid;content;subject;senderDid;comment;})

  type main_output = {
    sent: bool;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let sent = Value.Util.get_key "sent" Value.Util.to_bool v in
    {sent;})

  (** Send email to a user's account email address. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.searchAccounts"
  *)
module Com_Atproto_Admin_SearchAccounts = struct
  (** {2 def main} *)

  type main_params = {
    email: string option;
    cursor: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let email = Value.Util.get_key_opt "email" Value.Util.to_text v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {email;cursor;limit;}

  type main_output = {
    cursor: string option;
    accounts: com_atproto_admin_defs_accountview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let accounts = Value.Util.get_key "accounts" (Value.Util.to_array_of com_atproto_admin_defs_accountview_of_value) v in
    {cursor;accounts;})

  (** Get list of accounts that matches your search query. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.getSubjectStatus"
  *)
module Com_Atproto_Admin_GetSubjectStatus = struct
  (** {2 def main} *)

  type main_params = {
    did: string option;
    uri: string option;
    blob: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key_opt "did" Value.Util.to_text v in
    let uri = Value.Util.get_key_opt "uri" Value.Util.to_text v in
    let blob = Value.Util.get_key_opt "blob" Value.Util.to_text v in
    {did;uri;blob;}

  type main_output = {
    subject: [
    `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Com_atproto_admin_defs_repoblobref of com_atproto_admin_defs_repoblobref
    | `Other of Value.t (** Non closed union *)
    ];
    takedown: com_atproto_admin_defs_statusattr option;
    deactivated: com_atproto_admin_defs_statusattr option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let subject = Value.Util.get_key "subject" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "repoRef" -> `Com_atproto_admin_defs_reporef (com_atproto_admin_defs_reporef_of_value v)
    | "main" -> `Com_atproto_repo_strongref_main (com_atproto_repo_strongref_main_of_value v)
    | "repoBlobRef" -> `Com_atproto_admin_defs_repoblobref (com_atproto_admin_defs_repoblobref_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let takedown = Value.Util.get_key_opt "takedown" com_atproto_admin_defs_statusattr_of_value v in
    let deactivated = Value.Util.get_key_opt "deactivated" com_atproto_admin_defs_statusattr_of_value v in
    {subject;takedown;deactivated;})

  (** Get the service-specific admin status of a subject (account, record, or blob). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.getInviteCodes"
  *)
module Com_Atproto_Admin_GetInviteCodes = struct
  (** {2 def main} *)

  type main_params = {
    sort: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let sort = Value.Util.get_key_opt "sort" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {sort;limit;cursor;}

  type main_output = {
    cursor: string option;
    codes: com_atproto_server_defs_invitecode list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let codes = Value.Util.get_key "codes" (Value.Util.to_array_of com_atproto_server_defs_invitecode_of_value) v in
    {cursor;codes;})

  (** Get an admin view of invite codes. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.getAccountInfos"
  *)
module Com_Atproto_Admin_GetAccountInfos = struct
  (** {2 def main} *)

  type main_params = {
    dids: string list;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let dids = Value.Util.get_key "dids" (Value.Util.to_array_of Value.Util.to_text) v in
    {dids;}

  type main_output = {
    infos: com_atproto_admin_defs_accountview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let infos = Value.Util.get_key "infos" (Value.Util.to_array_of com_atproto_admin_defs_accountview_of_value) v in
    {infos;})

  (** Get details about some accounts. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.getAccountInfo"
  *)
module Com_Atproto_Admin_GetAccountInfo = struct
  (** {2 def main} *)

  type main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;}

  type main_output = com_atproto_admin_defs_accountview
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = com_atproto_admin_defs_accountview_of_value

  (** Get details about an account. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.enableAccountInvites"
  *)
module Com_Atproto_Admin_EnableAccountInvites = struct
  (** {2 def main} *)

  type main_input = {
    account: string;
    note: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let account = Value.Util.get_key "account" Value.Util.to_text v in
    let note = Value.Util.get_key_opt "note" Value.Util.to_text v in
    {account;note;})

  (** Re-enable an account's ability to receive invite codes. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.disableInviteCodes"
  *)
module Com_Atproto_Admin_DisableInviteCodes = struct
  (** {2 def main} *)

  type main_input = {
    codes: string list option;
    accounts: string list option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let codes = Value.Util.get_key_opt "codes" (Value.Util.to_array_of Value.Util.to_text) v in
    let accounts = Value.Util.get_key_opt "accounts" (Value.Util.to_array_of Value.Util.to_text) v in
    {codes;accounts;})

  (** Disable some set of codes and/or all codes associated with a set of users. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.disableAccountInvites"
  *)
module Com_Atproto_Admin_DisableAccountInvites = struct
  (** {2 def main} *)

  type main_input = {
    account: string;
    note: string option;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let account = Value.Util.get_key "account" Value.Util.to_text v in
    let note = Value.Util.get_key_opt "note" Value.Util.to_text v in
    {account;note;})

  (** Disable an account from receiving new invite codes, but does not invalidate existing codes. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.deleteAccount"
  *)
module Com_Atproto_Admin_DeleteAccount = struct
  (** {2 def main} *)

  type main_input = {
    did: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    {did;})

  (** Delete a user account as an administrator. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.defs"
  *)
module Com_Atproto_Admin_Defs = struct
  (** {2 def statusAttr} *)

  type nonrec statusattr = com_atproto_admin_defs_statusattr = {
    applied: bool;
    ref: string option;
  }
  let pp_statusattr = pp_com_atproto_admin_defs_statusattr
  let statusattr_of_value = com_atproto_admin_defs_statusattr_of_value
  let statusattr_to_value = com_atproto_admin_defs_statusattr_to_value


  (** {2 def accountView} *)

  type nonrec accountview = com_atproto_admin_defs_accountview = {
    did: string;
    handle: string;
    email: string option;
    relatedRecords: Value.t (* unknown *) list option;
    indexedAt: string;
    invitedBy: com_atproto_server_defs_invitecode option;
    invites: com_atproto_server_defs_invitecode list option;
    invitesDisabled: bool option;
    emailConfirmedAt: string option;
    inviteNote: string option;
    deactivatedAt: string option;
    threatSignatures: com_atproto_admin_defs_threatsignature list option;
  }
  let pp_accountview = pp_com_atproto_admin_defs_accountview
  let accountview_of_value = com_atproto_admin_defs_accountview_of_value
  let accountview_to_value = com_atproto_admin_defs_accountview_to_value


  (** {2 def repoRef} *)

  type nonrec reporef = com_atproto_admin_defs_reporef = {
    did: string;
  }
  let pp_reporef = pp_com_atproto_admin_defs_reporef
  let reporef_of_value = com_atproto_admin_defs_reporef_of_value
  let reporef_to_value = com_atproto_admin_defs_reporef_to_value


  (** {2 def repoBlobRef} *)

  type nonrec repoblobref = com_atproto_admin_defs_repoblobref = {
    did: string;
    cid: string;
    recordUri: string option;
  }
  let pp_repoblobref = pp_com_atproto_admin_defs_repoblobref
  let repoblobref_of_value = com_atproto_admin_defs_repoblobref_of_value
  let repoblobref_to_value = com_atproto_admin_defs_repoblobref_to_value


  (** {2 def threatSignature} *)

  type nonrec threatsignature = com_atproto_admin_defs_threatsignature = {
    property: string;
    value: string;
  }
  let pp_threatsignature = pp_com_atproto_admin_defs_threatsignature
  let threatsignature_of_value = com_atproto_admin_defs_threatsignature_of_value
  let threatsignature_to_value = com_atproto_admin_defs_threatsignature_to_value


end


(** lexicon "com.atproto.server.defs"
  *)
module Com_Atproto_Server_Defs = struct
  (** {2 def inviteCode} *)

  type nonrec invitecode = com_atproto_server_defs_invitecode = {
    code: string;
    available: int64;
    disabled: bool;
    forAccount: string;
    createdBy: string;
    createdAt: string;
    uses: com_atproto_server_defs_invitecodeuse list;
  }
  let pp_invitecode = pp_com_atproto_server_defs_invitecode
  let invitecode_of_value = com_atproto_server_defs_invitecode_of_value
  let invitecode_to_value = com_atproto_server_defs_invitecode_to_value


  (** {2 def inviteCodeUse} *)

  type nonrec invitecodeuse = com_atproto_server_defs_invitecodeuse = {
    usedBy: string;
    usedAt: string;
  }
  let pp_invitecodeuse = pp_com_atproto_server_defs_invitecodeuse
  let invitecodeuse_of_value = com_atproto_server_defs_invitecodeuse_of_value
  let invitecodeuse_to_value = com_atproto_server_defs_invitecodeuse_to_value


end


(** lexicon "app.bsky.video.uploadVideo"
  *)
module App_Bsky_Video_UploadVideo = struct
  (** {2 def main} *)

  type main_output = {
    jobStatus: app_bsky_video_defs_jobstatus;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let jobStatus = Value.Util.get_key "jobStatus" app_bsky_video_defs_jobstatus_of_value v in
    {jobStatus;})

  (** Upload a video to be processed then stored on the PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_opaque {encoding=(Other "video/mp4")}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.video.getUploadLimits"
  *)
module App_Bsky_Video_GetUploadLimits = struct
  (** {2 def main} *)

  type main_output = {
    canUpload: bool;
    remainingDailyVideos: int64 option;
    remainingDailyBytes: int64 option;
    message: string option;
    error: string option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let canUpload = Value.Util.get_key "canUpload" Value.Util.to_bool v in
    let remainingDailyVideos = Value.Util.get_key_opt "remainingDailyVideos" Value.Util.to_int v in
    let remainingDailyBytes = Value.Util.get_key_opt "remainingDailyBytes" Value.Util.to_int v in
    let message = Value.Util.get_key_opt "message" Value.Util.to_text v in
    let error = Value.Util.get_key_opt "error" Value.Util.to_text v in
    {canUpload;remainingDailyVideos;remainingDailyBytes;message;error;})

  (** Get video upload limits for the authenticated user. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.video.getJobStatus"
  *)
module App_Bsky_Video_GetJobStatus = struct
  (** {2 def main} *)

  type main_params = {
    jobId: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let jobId = Value.Util.get_key "jobId" Value.Util.to_text v in
    {jobId;}

  type main_output = {
    jobStatus: app_bsky_video_defs_jobstatus;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let jobStatus = Value.Util.get_key "jobStatus" app_bsky_video_defs_jobstatus_of_value v in
    {jobStatus;})

  (** Get status details for a video processing job. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.video.defs"
  *)
module App_Bsky_Video_Defs = struct
  (** {2 def jobStatus} *)

  type nonrec jobstatus = app_bsky_video_defs_jobstatus = {
    jobId: string;
    did: string;
    state: string;
    progress: int64 option;
    blob: Blob.t option;
    error: string option;
    message: string option;
  }
  let pp_jobstatus = pp_app_bsky_video_defs_jobstatus
  let jobstatus_of_value = app_bsky_video_defs_jobstatus_of_value
  let jobstatus_to_value = app_bsky_video_defs_jobstatus_to_value


end


(** lexicon "app.bsky.unspecced.searchStarterPacksSkeleton"
  *)
module App_Bsky_Unspecced_SearchStarterPacksSkeleton = struct
  (** {2 def main} *)

  type main_params = {
    q: string;
    viewer: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let q = Value.Util.get_key "q" Value.Util.to_text v in
    let viewer = Value.Util.get_key_opt "viewer" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {q;viewer;limit;cursor;}

  type main_output = {
    cursor: string option;
    hitsTotal: int64 option;
    starterPacks: app_bsky_unspecced_defs_skeletonsearchstarterpack list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let hitsTotal = Value.Util.get_key_opt "hitsTotal" Value.Util.to_int v in
    let starterPacks = Value.Util.get_key "starterPacks" (Value.Util.to_array_of app_bsky_unspecced_defs_skeletonsearchstarterpack_of_value) v in
    {cursor;hitsTotal;starterPacks;})

  type main_error = [ `BadQueryString [@name "BadQueryString"]]
  [@@deriving show {with_path=false}]

  (** Backend Starter Pack search, returns only skeleton. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.unspecced.searchPostsSkeleton"
  *)
module App_Bsky_Unspecced_SearchPostsSkeleton = struct
  (** {2 def main} *)

  type main_params = {
    q: string;
    sort: string option;
    since: string option;
    until: string option;
    mentions: string option;
    author: string option;
    lang: string option;
    domain: string option;
    url: string option;
    tag: string list option;
    viewer: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let q = Value.Util.get_key "q" Value.Util.to_text v in
    let sort = Value.Util.get_key_opt "sort" Value.Util.to_text v in
    let since = Value.Util.get_key_opt "since" Value.Util.to_text v in
    let until = Value.Util.get_key_opt "until" Value.Util.to_text v in
    let mentions = Value.Util.get_key_opt "mentions" Value.Util.to_text v in
    let author = Value.Util.get_key_opt "author" Value.Util.to_text v in
    let lang = Value.Util.get_key_opt "lang" Value.Util.to_text v in
    let domain = Value.Util.get_key_opt "domain" Value.Util.to_text v in
    let url = Value.Util.get_key_opt "url" Value.Util.to_text v in
    let tag = Value.Util.get_key_opt "tag" (Value.Util.to_array_of Value.Util.to_text) v in
    let viewer = Value.Util.get_key_opt "viewer" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {q;sort;since;until;mentions;author;lang;domain;url;tag;viewer;limit;cursor;}

  type main_output = {
    cursor: string option;
    hitsTotal: int64 option;
    posts: app_bsky_unspecced_defs_skeletonsearchpost list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let hitsTotal = Value.Util.get_key_opt "hitsTotal" Value.Util.to_int v in
    let posts = Value.Util.get_key "posts" (Value.Util.to_array_of app_bsky_unspecced_defs_skeletonsearchpost_of_value) v in
    {cursor;hitsTotal;posts;})

  type main_error = [ `BadQueryString [@name "BadQueryString"]]
  [@@deriving show {with_path=false}]

  (** Backend Posts search, returns only skeleton *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.unspecced.searchActorsSkeleton"
  *)
module App_Bsky_Unspecced_SearchActorsSkeleton = struct
  (** {2 def main} *)

  type main_params = {
    q: string;
    viewer: string option;
    typeahead: bool option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let q = Value.Util.get_key "q" Value.Util.to_text v in
    let viewer = Value.Util.get_key_opt "viewer" Value.Util.to_text v in
    let typeahead = Value.Util.get_key_opt "typeahead" Value.Util.to_bool v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {q;viewer;typeahead;limit;cursor;}

  type main_output = {
    cursor: string option;
    hitsTotal: int64 option;
    actors: app_bsky_unspecced_defs_skeletonsearchactor list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let hitsTotal = Value.Util.get_key_opt "hitsTotal" Value.Util.to_int v in
    let actors = Value.Util.get_key "actors" (Value.Util.to_array_of app_bsky_unspecced_defs_skeletonsearchactor_of_value) v in
    {cursor;hitsTotal;actors;})

  type main_error = [ `BadQueryString [@name "BadQueryString"]]
  [@@deriving show {with_path=false}]

  (** Backend Actors (profile) search, returns only skeleton. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.unspecced.getTrendsSkeleton"
  *)
module App_Bsky_Unspecced_GetTrendsSkeleton = struct
  (** {2 def main} *)

  type main_params = {
    viewer: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let viewer = Value.Util.get_key_opt "viewer" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {viewer;limit;}

  type main_output = {
    trends: app_bsky_unspecced_defs_skeletontrend list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let trends = Value.Util.get_key "trends" (Value.Util.to_array_of app_bsky_unspecced_defs_skeletontrend_of_value) v in
    {trends;})

  (** Get the skeleton of trends on the network. Intended to be called and then hydrated through app.bsky.unspecced.getTrends *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getTrends"
  *)
module App_Bsky_Unspecced_GetTrends = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {limit;}

  type main_output = {
    trends: app_bsky_unspecced_defs_trendview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let trends = Value.Util.get_key "trends" (Value.Util.to_array_of app_bsky_unspecced_defs_trendview_of_value) v in
    {trends;})

  (** Get the current trends on the network *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getTrendingTopics"
  *)
module App_Bsky_Unspecced_GetTrendingTopics = struct
  (** {2 def main} *)

  type main_params = {
    viewer: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let viewer = Value.Util.get_key_opt "viewer" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {viewer;limit;}

  type main_output = {
    topics: app_bsky_unspecced_defs_trendingtopic list;
    suggested: app_bsky_unspecced_defs_trendingtopic list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let topics = Value.Util.get_key "topics" (Value.Util.to_array_of app_bsky_unspecced_defs_trendingtopic_of_value) v in
    let suggested = Value.Util.get_key "suggested" (Value.Util.to_array_of app_bsky_unspecced_defs_trendingtopic_of_value) v in
    {topics;suggested;})

  (** Get a list of trending topics *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getTaggedSuggestions"
  *)
module App_Bsky_Unspecced_GetTaggedSuggestions = struct
  (** {2 def main} *)

  type main_output = {
    suggestions: app_bsky_unspecced_gettaggedsuggestions_suggestion list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let suggestions = Value.Util.get_key "suggestions" (Value.Util.to_array_of app_bsky_unspecced_gettaggedsuggestions_suggestion_of_value) v in
    {suggestions;})

  (** Get a list of suggestions (feeds and users) tagged with categories *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def suggestion} *)

  type nonrec suggestion = app_bsky_unspecced_gettaggedsuggestions_suggestion = {
    tag: string;
    subjectType: string;
    subject: string;
  }
  let pp_suggestion = pp_app_bsky_unspecced_gettaggedsuggestions_suggestion
  let suggestion_of_value = app_bsky_unspecced_gettaggedsuggestions_suggestion_of_value
  let suggestion_to_value = app_bsky_unspecced_gettaggedsuggestions_suggestion_to_value


end


(** lexicon "app.bsky.unspecced.getSuggestionsSkeleton"
  *)
module App_Bsky_Unspecced_GetSuggestionsSkeleton = struct
  (** {2 def main} *)

  type main_params = {
    viewer: string option;
    limit: int64 option;
    cursor: string option;
    relativeToDid: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let viewer = Value.Util.get_key_opt "viewer" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let relativeToDid = Value.Util.get_key_opt "relativeToDid" Value.Util.to_text v in
    {viewer;limit;cursor;relativeToDid;}

  type main_output = {
    cursor: string option;
    actors: app_bsky_unspecced_defs_skeletonsearchactor list;
    relativeToDid: string option;
    recId: int64 option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let actors = Value.Util.get_key "actors" (Value.Util.to_array_of app_bsky_unspecced_defs_skeletonsearchactor_of_value) v in
    let relativeToDid = Value.Util.get_key_opt "relativeToDid" Value.Util.to_text v in
    let recId = Value.Util.get_key_opt "recId" Value.Util.to_int v in
    {cursor;actors;relativeToDid;recId;})

  (** Get a skeleton of suggested actors. Intended to be called and then hydrated through app.bsky.actor.getSuggestions *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedUsersSkeleton"
  *)
module App_Bsky_Unspecced_GetSuggestedUsersSkeleton = struct
  (** {2 def main} *)

  type main_params = {
    viewer: string option;
    category: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let viewer = Value.Util.get_key_opt "viewer" Value.Util.to_text v in
    let category = Value.Util.get_key_opt "category" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {viewer;category;limit;}

  type main_output = {
    dids: string list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let dids = Value.Util.get_key "dids" (Value.Util.to_array_of Value.Util.to_text) v in
    {dids;})

  (** Get a skeleton of suggested users. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedUsers *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedUsers"
  *)
module App_Bsky_Unspecced_GetSuggestedUsers = struct
  (** {2 def main} *)

  type main_params = {
    category: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let category = Value.Util.get_key_opt "category" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {category;limit;}

  type main_output = {
    actors: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let actors = Value.Util.get_key "actors" (Value.Util.to_array_of app_bsky_actor_defs_profileview_of_value) v in
    {actors;})

  (** Get a list of suggested users *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedStarterPacksSkeleton"
  *)
module App_Bsky_Unspecced_GetSuggestedStarterPacksSkeleton = struct
  (** {2 def main} *)

  type main_params = {
    viewer: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let viewer = Value.Util.get_key_opt "viewer" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {viewer;limit;}

  type main_output = {
    starterPacks: string list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let starterPacks = Value.Util.get_key "starterPacks" (Value.Util.to_array_of Value.Util.to_text) v in
    {starterPacks;})

  (** Get a skeleton of suggested starterpacks. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedStarterpacks *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedStarterPacks"
  *)
module App_Bsky_Unspecced_GetSuggestedStarterPacks = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {limit;}

  type main_output = {
    starterPacks: app_bsky_graph_defs_starterpackview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let starterPacks = Value.Util.get_key "starterPacks" (Value.Util.to_array_of app_bsky_graph_defs_starterpackview_of_value) v in
    {starterPacks;})

  (** Get a list of suggested starterpacks *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedFeedsSkeleton"
  *)
module App_Bsky_Unspecced_GetSuggestedFeedsSkeleton = struct
  (** {2 def main} *)

  type main_params = {
    viewer: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let viewer = Value.Util.get_key_opt "viewer" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {viewer;limit;}

  type main_output = {
    feeds: string list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let feeds = Value.Util.get_key "feeds" (Value.Util.to_array_of Value.Util.to_text) v in
    {feeds;})

  (** Get a skeleton of suggested feeds. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedFeeds *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedFeeds"
  *)
module App_Bsky_Unspecced_GetSuggestedFeeds = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {limit;}

  type main_output = {
    feeds: app_bsky_feed_defs_generatorview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let feeds = Value.Util.get_key "feeds" (Value.Util.to_array_of app_bsky_feed_defs_generatorview_of_value) v in
    {feeds;})

  (** Get a list of suggested feeds *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getPopularFeedGenerators"
  *)
module App_Bsky_Unspecced_GetPopularFeedGenerators = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
    cursor: string option;
    query: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let query = Value.Util.get_key_opt "query" Value.Util.to_text v in
    {limit;cursor;query;}

  type main_output = {
    cursor: string option;
    feeds: app_bsky_feed_defs_generatorview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let feeds = Value.Util.get_key "feeds" (Value.Util.to_array_of app_bsky_feed_defs_generatorview_of_value) v in
    {cursor;feeds;})

  (** An unspecced view of globally popular feed generators. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getConfig"
  *)
module App_Bsky_Unspecced_GetConfig = struct
  (** {2 def main} *)

  type main_output = {
    checkEmailConfirmed: bool option;
    liveNow: app_bsky_unspecced_getconfig_livenowconfig list option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let checkEmailConfirmed = Value.Util.get_key_opt "checkEmailConfirmed" Value.Util.to_bool v in
    let liveNow = Value.Util.get_key_opt "liveNow" (Value.Util.to_array_of app_bsky_unspecced_getconfig_livenowconfig_of_value) v in
    {checkEmailConfirmed;liveNow;})

  (** Get miscellaneous runtime configuration. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def liveNowConfig} *)

  type nonrec livenowconfig = app_bsky_unspecced_getconfig_livenowconfig = {
    did: string;
    domains: string list;
  }
  let pp_livenowconfig = pp_app_bsky_unspecced_getconfig_livenowconfig
  let livenowconfig_of_value = app_bsky_unspecced_getconfig_livenowconfig_of_value
  let livenowconfig_to_value = app_bsky_unspecced_getconfig_livenowconfig_to_value


end


(** lexicon "app.bsky.unspecced.defs"
  *)
module App_Bsky_Unspecced_Defs = struct
  (** {2 def skeletonSearchPost} *)

  type nonrec skeletonsearchpost = app_bsky_unspecced_defs_skeletonsearchpost = {
    uri: string;
  }
  let pp_skeletonsearchpost = pp_app_bsky_unspecced_defs_skeletonsearchpost
  let skeletonsearchpost_of_value = app_bsky_unspecced_defs_skeletonsearchpost_of_value
  let skeletonsearchpost_to_value = app_bsky_unspecced_defs_skeletonsearchpost_to_value


  (** {2 def skeletonSearchActor} *)

  type nonrec skeletonsearchactor = app_bsky_unspecced_defs_skeletonsearchactor = {
    did: string;
  }
  let pp_skeletonsearchactor = pp_app_bsky_unspecced_defs_skeletonsearchactor
  let skeletonsearchactor_of_value = app_bsky_unspecced_defs_skeletonsearchactor_of_value
  let skeletonsearchactor_to_value = app_bsky_unspecced_defs_skeletonsearchactor_to_value


  (** {2 def skeletonSearchStarterPack} *)

  type nonrec skeletonsearchstarterpack = app_bsky_unspecced_defs_skeletonsearchstarterpack = {
    uri: string;
  }
  let pp_skeletonsearchstarterpack = pp_app_bsky_unspecced_defs_skeletonsearchstarterpack
  let skeletonsearchstarterpack_of_value = app_bsky_unspecced_defs_skeletonsearchstarterpack_of_value
  let skeletonsearchstarterpack_to_value = app_bsky_unspecced_defs_skeletonsearchstarterpack_to_value


  (** {2 def trendingTopic} *)

  type nonrec trendingtopic = app_bsky_unspecced_defs_trendingtopic = {
    topic: string;
    displayName: string option;
    description: string option;
    link: string;
  }
  let pp_trendingtopic = pp_app_bsky_unspecced_defs_trendingtopic
  let trendingtopic_of_value = app_bsky_unspecced_defs_trendingtopic_of_value
  let trendingtopic_to_value = app_bsky_unspecced_defs_trendingtopic_to_value


  (** {2 def skeletonTrend} *)

  type nonrec skeletontrend = app_bsky_unspecced_defs_skeletontrend = {
    topic: string;
    displayName: string;
    link: string;
    startedAt: string;
    postCount: int64;
    status: string option;
    category: string option;
    dids: string list;
  }
  let pp_skeletontrend = pp_app_bsky_unspecced_defs_skeletontrend
  let skeletontrend_of_value = app_bsky_unspecced_defs_skeletontrend_of_value
  let skeletontrend_to_value = app_bsky_unspecced_defs_skeletontrend_to_value


  (** {2 def trendView} *)

  type nonrec trendview = app_bsky_unspecced_defs_trendview = {
    topic: string;
    displayName: string;
    link: string;
    startedAt: string;
    postCount: int64;
    status: string option;
    category: string option;
    actors: app_bsky_actor_defs_profileviewbasic list;
  }
  let pp_trendview = pp_app_bsky_unspecced_defs_trendview
  let trendview_of_value = app_bsky_unspecced_defs_trendview_of_value
  let trendview_to_value = app_bsky_unspecced_defs_trendview_to_value


end


(** lexicon "app.bsky.notification.updateSeen"
  *)
module App_Bsky_Notification_UpdateSeen = struct
  (** {2 def main} *)

  type main_input = {
    seenAt: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let seenAt = Value.Util.get_key "seenAt" Value.Util.to_text v in
    {seenAt;})

  (** Notify server that the requesting account has seen notifications. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.notification.registerPush"
  *)
module App_Bsky_Notification_RegisterPush = struct
  (** {2 def main} *)

  type main_input = {
    serviceDid: string;
    token: string;
    platform: string;
    appId: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let serviceDid = Value.Util.get_key "serviceDid" Value.Util.to_text v in
    let token = Value.Util.get_key "token" Value.Util.to_text v in
    let platform = Value.Util.get_key "platform" Value.Util.to_text v in
    let appId = Value.Util.get_key "appId" Value.Util.to_text v in
    {serviceDid;token;platform;appId;})

  (** Register to receive push notifications, via a specified service, for the requesting account. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.notification.putPreferences"
  *)
module App_Bsky_Notification_PutPreferences = struct
  (** {2 def main} *)

  type main_input = {
    priority: bool;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let priority = Value.Util.get_key "priority" Value.Util.to_bool v in
    {priority;})

  (** Set notification-related preferences for an account. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.notification.listNotifications"
  *)
module App_Bsky_Notification_ListNotifications = struct
  (** {2 def main} *)

  type main_params = {
    reasons: string list option;
    limit: int64 option;
    priority: bool option;
    cursor: string option;
    seenAt: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let reasons = Value.Util.get_key_opt "reasons" (Value.Util.to_array_of Value.Util.to_text) v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let priority = Value.Util.get_key_opt "priority" Value.Util.to_bool v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let seenAt = Value.Util.get_key_opt "seenAt" Value.Util.to_text v in
    {reasons;limit;priority;cursor;seenAt;}

  type main_output = {
    cursor: string option;
    notifications: app_bsky_notification_listnotifications_notification list;
    priority: bool option;
    seenAt: string option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let notifications = Value.Util.get_key "notifications" (Value.Util.to_array_of app_bsky_notification_listnotifications_notification_of_value) v in
    let priority = Value.Util.get_key_opt "priority" Value.Util.to_bool v in
    let seenAt = Value.Util.get_key_opt "seenAt" Value.Util.to_text v in
    {cursor;notifications;priority;seenAt;})

  (** Enumerate notifications for the requesting account. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def notification} *)

  type nonrec notification = app_bsky_notification_listnotifications_notification = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileview;
    reason: string;
    reasonSubject: string option;
    record: Value.t (* unknown *);
    isRead: bool;
    indexedAt: string;
    labels: com_atproto_label_defs_label list option;
  }
  let pp_notification = pp_app_bsky_notification_listnotifications_notification
  let notification_of_value = app_bsky_notification_listnotifications_notification_of_value
  let notification_to_value = app_bsky_notification_listnotifications_notification_to_value


end


(** lexicon "app.bsky.notification.getUnreadCount"
  *)
module App_Bsky_Notification_GetUnreadCount = struct
  (** {2 def main} *)

  type main_params = {
    priority: bool option;
    seenAt: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let priority = Value.Util.get_key_opt "priority" Value.Util.to_bool v in
    let seenAt = Value.Util.get_key_opt "seenAt" Value.Util.to_text v in
    {priority;seenAt;}

  type main_output = {
    count: int64;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let count = Value.Util.get_key "count" Value.Util.to_int v in
    {count;})

  (** Count the number of unread notifications for the requesting account. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.notification.defs"
  *)
module App_Bsky_Notification_Defs = struct
  (** {2 def recordDeleted} *)

  type nonrec recorddeleted = app_bsky_notification_defs_recorddeleted
  let pp_recorddeleted = pp_app_bsky_notification_defs_recorddeleted
  let recorddeleted_of_value = app_bsky_notification_defs_recorddeleted_of_value
  let recorddeleted_to_value = app_bsky_notification_defs_recorddeleted_to_value


end


(** lexicon "app.bsky.labeler.service"
  *)
module App_Bsky_Labeler_Service = struct
  (** {2 def main} *)

  (** A declaration of the existence of labeler service. *)
  type main = {
    policies: app_bsky_labeler_defs_labelerpolicies;
    labels: [
    `Com_atproto_label_defs_selflabels of com_atproto_label_defs_selflabels
    | `Other of Value.t (** Non closed union *)
    ] option;
    createdAt: string;
    reasonTypes: com_atproto_moderation_defs_reasontype list option;
    subjectTypes: com_atproto_moderation_defs_subjecttype list option;
    subjectCollections: string list option;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.labeler.getServices"
  *)
module App_Bsky_Labeler_GetServices = struct
  (** {2 def main} *)

  type main_params = {
    dids: string list;
    detailed: bool option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let dids = Value.Util.get_key "dids" (Value.Util.to_array_of Value.Util.to_text) v in
    let detailed = Value.Util.get_key_opt "detailed" Value.Util.to_bool v in
    {dids;detailed;}

  type main_output = {
    views: [
    `App_bsky_labeler_defs_labelerview of app_bsky_labeler_defs_labelerview
    | `App_bsky_labeler_defs_labelerviewdetailed of app_bsky_labeler_defs_labelerviewdetailed
    | `Other of Value.t (** Non closed union *)
    ] list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let views = Value.Util.get_key "views" (Value.Util.to_array_of (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "labelerView" -> `App_bsky_labeler_defs_labelerview (app_bsky_labeler_defs_labelerview_of_value v)
    | "labelerViewDetailed" -> `App_bsky_labeler_defs_labelerviewdetailed (app_bsky_labeler_defs_labelerviewdetailed_of_value v)
    | _ -> `Other v (* Non closed union *)
    ))) v in
    {views;})

  (** Get information about a list of labeler services. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.verification"
  *)
module App_Bsky_Graph_Verification = struct
  (** {2 def main} *)

  (** Record declaring a verification relationship between two accounts. Verifications are only considered valid by an app if issued by an account the app considers trusted. *)
  type main = {
    subject: string;
    handle: string;
    displayName: string;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.graph.unmuteThread"
  *)
module App_Bsky_Graph_UnmuteThread = struct
  (** {2 def main} *)

  type main_input = {
    root: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let root = Value.Util.get_key "root" Value.Util.to_text v in
    {root;})

  (** Unmutes the specified thread. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.unmuteActorList"
  *)
module App_Bsky_Graph_UnmuteActorList = struct
  (** {2 def main} *)

  type main_input = {
    list: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let list = Value.Util.get_key "list" Value.Util.to_text v in
    {list;})

  (** Unmutes the specified list of accounts. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.unmuteActor"
  *)
module App_Bsky_Graph_UnmuteActor = struct
  (** {2 def main} *)

  type main_input = {
    actor: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    {actor;})

  (** Unmutes the specified account. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.starterpack"
  *)
module App_Bsky_Graph_Starterpack = struct
  (** {2 def main} *)

  (** Record defining a starter pack of actors and feeds for new users. *)
  type main = {
    name: string;
    description: string option;
    descriptionFacets: app_bsky_richtext_facet_main list option;
    list: string;
    feeds: app_bsky_graph_starterpack_feeditem list option;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



  (** {2 def feedItem} *)

  type nonrec feeditem = app_bsky_graph_starterpack_feeditem = {
    uri: string;
  }
  let pp_feeditem = pp_app_bsky_graph_starterpack_feeditem
  let feeditem_of_value = app_bsky_graph_starterpack_feeditem_of_value
  let feeditem_to_value = app_bsky_graph_starterpack_feeditem_to_value


end


(** lexicon "app.bsky.graph.searchStarterPacks"
  *)
module App_Bsky_Graph_SearchStarterPacks = struct
  (** {2 def main} *)

  type main_params = {
    q: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let q = Value.Util.get_key "q" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {q;limit;cursor;}

  type main_output = {
    cursor: string option;
    starterPacks: app_bsky_graph_defs_starterpackviewbasic list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let starterPacks = Value.Util.get_key "starterPacks" (Value.Util.to_array_of app_bsky_graph_defs_starterpackviewbasic_of_value) v in
    {cursor;starterPacks;})

  (** Find starter packs matching search criteria. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.muteThread"
  *)
module App_Bsky_Graph_MuteThread = struct
  (** {2 def main} *)

  type main_input = {
    root: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let root = Value.Util.get_key "root" Value.Util.to_text v in
    {root;})

  (** Mutes a thread preventing notifications from the thread and any of its children. Mutes are private in Bluesky. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.muteActorList"
  *)
module App_Bsky_Graph_MuteActorList = struct
  (** {2 def main} *)

  type main_input = {
    list: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let list = Value.Util.get_key "list" Value.Util.to_text v in
    {list;})

  (** Creates a mute relationship for the specified list of accounts. Mutes are private in Bluesky. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.muteActor"
  *)
module App_Bsky_Graph_MuteActor = struct
  (** {2 def main} *)

  type main_input = {
    actor: string;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    {actor;})

  (** Creates a mute relationship for the specified account. Mutes are private in Bluesky. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.listitem"
  *)
module App_Bsky_Graph_Listitem = struct
  (** {2 def main} *)

  (** Record representing an account's inclusion on a specific list. The AppView will ignore duplicate listitem records. *)
  type main = {
    subject: string;
    list: string;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.graph.listblock"
  *)
module App_Bsky_Graph_Listblock = struct
  (** {2 def main} *)

  (** Record representing a block relationship against an entire an entire list of accounts (actors). *)
  type main = {
    subject: string;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.graph.list"
  *)
module App_Bsky_Graph_List = struct
  (** {2 def main} *)

  (** Record representing a list of accounts (actors). Scope includes both moderation-oriented lists and curration-oriented lists. *)
  type main = {
    purpose: app_bsky_graph_defs_listpurpose;
    name: string;
    description: string option;
    descriptionFacets: app_bsky_richtext_facet_main list option;
    avatar: Blob.t option;
    labels: [
    `Com_atproto_label_defs_selflabels of com_atproto_label_defs_selflabels
    | `Other of Value.t (** Non closed union *)
    ] option;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.graph.getSuggestedFollowsByActor"
  *)
module App_Bsky_Graph_GetSuggestedFollowsByActor = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    {actor;}

  type main_output = {
    suggestions: app_bsky_actor_defs_profileview list;
    isFallback: bool option;
    recId: int64 option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let suggestions = Value.Util.get_key "suggestions" (Value.Util.to_array_of app_bsky_actor_defs_profileview_of_value) v in
    let isFallback = Value.Util.get_key_opt "isFallback" Value.Util.to_bool v in
    let recId = Value.Util.get_key_opt "recId" Value.Util.to_int v in
    {suggestions;isFallback;recId;})

  (** Enumerates follows similar to a given account (actor). Expected use is to recommend additional accounts immediately after following one account. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getStarterPacks"
  *)
module App_Bsky_Graph_GetStarterPacks = struct
  (** {2 def main} *)

  type main_params = {
    uris: string list;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let uris = Value.Util.get_key "uris" (Value.Util.to_array_of Value.Util.to_text) v in
    {uris;}

  type main_output = {
    starterPacks: app_bsky_graph_defs_starterpackviewbasic list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let starterPacks = Value.Util.get_key "starterPacks" (Value.Util.to_array_of app_bsky_graph_defs_starterpackviewbasic_of_value) v in
    {starterPacks;})

  (** Get views for a list of starter packs. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getStarterPack"
  *)
module App_Bsky_Graph_GetStarterPack = struct
  (** {2 def main} *)

  type main_params = {
    starterPack: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let starterPack = Value.Util.get_key "starterPack" Value.Util.to_text v in
    {starterPack;}

  type main_output = {
    starterPack: app_bsky_graph_defs_starterpackview;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let starterPack = Value.Util.get_key "starterPack" app_bsky_graph_defs_starterpackview_of_value v in
    {starterPack;})

  (** Gets a view of a starter pack. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getRelationships"
  *)
module App_Bsky_Graph_GetRelationships = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
    others: string list option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    let others = Value.Util.get_key_opt "others" (Value.Util.to_array_of Value.Util.to_text) v in
    {actor;others;}

  type main_output = {
    actor: string option;
    relationships: [
    `App_bsky_graph_defs_relationship of app_bsky_graph_defs_relationship
    | `App_bsky_graph_defs_notfoundactor of app_bsky_graph_defs_notfoundactor
    | `Other of Value.t (** Non closed union *)
    ] list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let actor = Value.Util.get_key_opt "actor" Value.Util.to_text v in
    let relationships = Value.Util.get_key "relationships" (Value.Util.to_array_of (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "relationship" -> `App_bsky_graph_defs_relationship (app_bsky_graph_defs_relationship_of_value v)
    | "notFoundActor" -> `App_bsky_graph_defs_notfoundactor (app_bsky_graph_defs_notfoundactor_of_value v)
    | _ -> `Other v (* Non closed union *)
    ))) v in
    {actor;relationships;})

  type main_error = [ `ActorNotFound [@name "ActorNotFound"]]
  [@@deriving show {with_path=false}]

  (** Enumerates public relationships between one account, and a list of other accounts. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.graph.getMutes"
  *)
module App_Bsky_Graph_GetMutes = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {limit;cursor;}

  type main_output = {
    cursor: string option;
    mutes: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let mutes = Value.Util.get_key "mutes" (Value.Util.to_array_of app_bsky_actor_defs_profileview_of_value) v in
    {cursor;mutes;})

  (** Enumerates accounts that the requesting account (actor) currently has muted. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getLists"
  *)
module App_Bsky_Graph_GetLists = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {actor;limit;cursor;}

  type main_output = {
    cursor: string option;
    lists: app_bsky_graph_defs_listview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let lists = Value.Util.get_key "lists" (Value.Util.to_array_of app_bsky_graph_defs_listview_of_value) v in
    {cursor;lists;})

  (** Enumerates the lists created by a specified account (actor). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getListMutes"
  *)
module App_Bsky_Graph_GetListMutes = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {limit;cursor;}

  type main_output = {
    cursor: string option;
    lists: app_bsky_graph_defs_listview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let lists = Value.Util.get_key "lists" (Value.Util.to_array_of app_bsky_graph_defs_listview_of_value) v in
    {cursor;lists;})

  (** Enumerates mod lists that the requesting account (actor) currently has muted. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getListBlocks"
  *)
module App_Bsky_Graph_GetListBlocks = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {limit;cursor;}

  type main_output = {
    cursor: string option;
    lists: app_bsky_graph_defs_listview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let lists = Value.Util.get_key "lists" (Value.Util.to_array_of app_bsky_graph_defs_listview_of_value) v in
    {cursor;lists;})

  (** Get mod lists that the requesting account (actor) is blocking. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getList"
  *)
module App_Bsky_Graph_GetList = struct
  (** {2 def main} *)

  type main_params = {
    list: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let list = Value.Util.get_key "list" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {list;limit;cursor;}

  type main_output = {
    cursor: string option;
    list: app_bsky_graph_defs_listview;
    items: app_bsky_graph_defs_listitemview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let list = Value.Util.get_key "list" app_bsky_graph_defs_listview_of_value v in
    let items = Value.Util.get_key "items" (Value.Util.to_array_of app_bsky_graph_defs_listitemview_of_value) v in
    {cursor;list;items;})

  (** Gets a 'view' (with additional context) of a specified list. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getKnownFollowers"
  *)
module App_Bsky_Graph_GetKnownFollowers = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {actor;limit;cursor;}

  type main_output = {
    subject: app_bsky_actor_defs_profileview;
    cursor: string option;
    followers: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let subject = Value.Util.get_key "subject" app_bsky_actor_defs_profileview_of_value v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let followers = Value.Util.get_key "followers" (Value.Util.to_array_of app_bsky_actor_defs_profileview_of_value) v in
    {subject;cursor;followers;})

  (** Enumerates accounts which follow a specified account (actor) and are followed by the viewer. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getFollows"
  *)
module App_Bsky_Graph_GetFollows = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {actor;limit;cursor;}

  type main_output = {
    subject: app_bsky_actor_defs_profileview;
    cursor: string option;
    follows: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let subject = Value.Util.get_key "subject" app_bsky_actor_defs_profileview_of_value v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let follows = Value.Util.get_key "follows" (Value.Util.to_array_of app_bsky_actor_defs_profileview_of_value) v in
    {subject;cursor;follows;})

  (** Enumerates accounts which a specified account (actor) follows. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getFollowers"
  *)
module App_Bsky_Graph_GetFollowers = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {actor;limit;cursor;}

  type main_output = {
    subject: app_bsky_actor_defs_profileview;
    cursor: string option;
    followers: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let subject = Value.Util.get_key "subject" app_bsky_actor_defs_profileview_of_value v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let followers = Value.Util.get_key "followers" (Value.Util.to_array_of app_bsky_actor_defs_profileview_of_value) v in
    {subject;cursor;followers;})

  (** Enumerates accounts which follow a specified account (actor). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getBlocks"
  *)
module App_Bsky_Graph_GetBlocks = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {limit;cursor;}

  type main_output = {
    cursor: string option;
    blocks: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let blocks = Value.Util.get_key "blocks" (Value.Util.to_array_of app_bsky_actor_defs_profileview_of_value) v in
    {cursor;blocks;})

  (** Enumerates which accounts the requesting account is currently blocking. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getActorStarterPacks"
  *)
module App_Bsky_Graph_GetActorStarterPacks = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {actor;limit;cursor;}

  type main_output = {
    cursor: string option;
    starterPacks: app_bsky_graph_defs_starterpackviewbasic list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let starterPacks = Value.Util.get_key "starterPacks" (Value.Util.to_array_of app_bsky_graph_defs_starterpackviewbasic_of_value) v in
    {cursor;starterPacks;})

  (** Get a list of starter packs created by the actor. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.follow"
  *)
module App_Bsky_Graph_Follow = struct
  (** {2 def main} *)

  (** Record declaring a social 'follow' relationship of another account. Duplicate follows will be ignored by the AppView. *)
  type main = {
    subject: string;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.graph.block"
  *)
module App_Bsky_Graph_Block = struct
  (** {2 def main} *)

  (** Record declaring a 'block' relationship against another account. NOTE: blocks are public in Bluesky; see blog posts for details. *)
  type main = {
    subject: string;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.feed.sendInteractions"
  *)
module App_Bsky_Feed_SendInteractions = struct
  (** {2 def main} *)

  type main_input = {
    interactions: app_bsky_feed_defs_interaction list;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let interactions = Value.Util.get_key "interactions" (Value.Util.to_array_of app_bsky_feed_defs_interaction_of_value) v in
    {interactions;})

  type main_output = [`_main_output]
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun _ -> `_main_output)

  (** Send information about interactions with feed items back to the feed generator that served them. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.searchPosts"
  *)
module App_Bsky_Feed_SearchPosts = struct
  (** {2 def main} *)

  type main_params = {
    q: string;
    sort: string option;
    since: string option;
    until: string option;
    mentions: string option;
    author: string option;
    lang: string option;
    domain: string option;
    url: string option;
    tag: string list option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let q = Value.Util.get_key "q" Value.Util.to_text v in
    let sort = Value.Util.get_key_opt "sort" Value.Util.to_text v in
    let since = Value.Util.get_key_opt "since" Value.Util.to_text v in
    let until = Value.Util.get_key_opt "until" Value.Util.to_text v in
    let mentions = Value.Util.get_key_opt "mentions" Value.Util.to_text v in
    let author = Value.Util.get_key_opt "author" Value.Util.to_text v in
    let lang = Value.Util.get_key_opt "lang" Value.Util.to_text v in
    let domain = Value.Util.get_key_opt "domain" Value.Util.to_text v in
    let url = Value.Util.get_key_opt "url" Value.Util.to_text v in
    let tag = Value.Util.get_key_opt "tag" (Value.Util.to_array_of Value.Util.to_text) v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {q;sort;since;until;mentions;author;lang;domain;url;tag;limit;cursor;}

  type main_output = {
    cursor: string option;
    hitsTotal: int64 option;
    posts: app_bsky_feed_defs_postview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let hitsTotal = Value.Util.get_key_opt "hitsTotal" Value.Util.to_int v in
    let posts = Value.Util.get_key "posts" (Value.Util.to_array_of app_bsky_feed_defs_postview_of_value) v in
    {cursor;hitsTotal;posts;})

  type main_error = [ `BadQueryString [@name "BadQueryString"]]
  [@@deriving show {with_path=false}]

  (** Find posts matching search criteria, returning views of those posts. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.feed.repost"
  *)
module App_Bsky_Feed_Repost = struct
  (** {2 def main} *)

  (** Record representing a 'repost' of an existing Bluesky post. *)
  type main = {
    subject: com_atproto_repo_strongref_main;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.feed.post"
  *)
module App_Bsky_Feed_Post = struct
  (** {2 def main} *)

  (** Record containing a Bluesky post. *)
  type main = {
    text: string;
    entities: app_bsky_feed_post_entity list option;
    facets: app_bsky_richtext_facet_main list option;
    reply: app_bsky_feed_post_replyref option;
    embed: [
    `App_bsky_embed_images_main of app_bsky_embed_images_main
    | `App_bsky_embed_video_main of app_bsky_embed_video_main
    | `App_bsky_embed_external_main of app_bsky_embed_external_main
    | `App_bsky_embed_record_main of app_bsky_embed_record_main
    | `App_bsky_embed_recordwithmedia_main of app_bsky_embed_recordwithmedia_main
    | `Other of Value.t (** Non closed union *)
    ] option;
    langs: string list option;
    labels: [
    `Com_atproto_label_defs_selflabels of com_atproto_label_defs_selflabels
    | `Other of Value.t (** Non closed union *)
    ] option;
    tags: string list option;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



  (** {2 def replyRef} *)

  type nonrec replyref = app_bsky_feed_post_replyref = {
    root: com_atproto_repo_strongref_main;
    parent: com_atproto_repo_strongref_main;
  }
  let pp_replyref = pp_app_bsky_feed_post_replyref
  let replyref_of_value = app_bsky_feed_post_replyref_of_value
  let replyref_to_value = app_bsky_feed_post_replyref_to_value


  (** {2 def entity} *)

  type nonrec entity = app_bsky_feed_post_entity = {
    index: app_bsky_feed_post_textslice;
    type_: string;
    value: string;
  }
  let pp_entity = pp_app_bsky_feed_post_entity
  let entity_of_value = app_bsky_feed_post_entity_of_value
  let entity_to_value = app_bsky_feed_post_entity_to_value


  (** {2 def textSlice} *)

  type nonrec textslice = app_bsky_feed_post_textslice = {
    start: int64;
    end_: int64;
  }
  let pp_textslice = pp_app_bsky_feed_post_textslice
  let textslice_of_value = app_bsky_feed_post_textslice_of_value
  let textslice_to_value = app_bsky_feed_post_textslice_to_value


end


(** lexicon "app.bsky.feed.like"
  *)
module App_Bsky_Feed_Like = struct
  (** {2 def main} *)

  (** Record declaring a 'like' of a piece of subject content. *)
  type main = {
    subject: com_atproto_repo_strongref_main;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.feed.getTimeline"
  *)
module App_Bsky_Feed_GetTimeline = struct
  (** {2 def main} *)

  type main_params = {
    algorithm: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let algorithm = Value.Util.get_key_opt "algorithm" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {algorithm;limit;cursor;}

  type main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_feedviewpost list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let feed = Value.Util.get_key "feed" (Value.Util.to_array_of app_bsky_feed_defs_feedviewpost_of_value) v in
    {cursor;feed;})

  (** Get a view of the requesting account's home timeline. This is expected to be some form of reverse-chronological feed. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getSuggestedFeeds"
  *)
module App_Bsky_Feed_GetSuggestedFeeds = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {limit;cursor;}

  type main_output = {
    cursor: string option;
    feeds: app_bsky_feed_defs_generatorview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let feeds = Value.Util.get_key "feeds" (Value.Util.to_array_of app_bsky_feed_defs_generatorview_of_value) v in
    {cursor;feeds;})

  (** Get a list of suggested feeds (feed generators) for the requesting account. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getRepostedBy"
  *)
module App_Bsky_Feed_GetRepostedBy = struct
  (** {2 def main} *)

  type main_params = {
    uri: string;
    cid: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key_opt "cid" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {uri;cid;limit;cursor;}

  type main_output = {
    uri: string;
    cid: string option;
    cursor: string option;
    repostedBy: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key_opt "cid" Value.Util.to_text v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let repostedBy = Value.Util.get_key "repostedBy" (Value.Util.to_array_of app_bsky_actor_defs_profileview_of_value) v in
    {uri;cid;cursor;repostedBy;})

  (** Get a list of reposts for a given post. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getQuotes"
  *)
module App_Bsky_Feed_GetQuotes = struct
  (** {2 def main} *)

  type main_params = {
    uri: string;
    cid: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key_opt "cid" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {uri;cid;limit;cursor;}

  type main_output = {
    uri: string;
    cid: string option;
    cursor: string option;
    posts: app_bsky_feed_defs_postview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key_opt "cid" Value.Util.to_text v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let posts = Value.Util.get_key "posts" (Value.Util.to_array_of app_bsky_feed_defs_postview_of_value) v in
    {uri;cid;cursor;posts;})

  (** Get a list of quotes for a given post. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getPosts"
  *)
module App_Bsky_Feed_GetPosts = struct
  (** {2 def main} *)

  type main_params = {
    uris: string list;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let uris = Value.Util.get_key "uris" (Value.Util.to_array_of Value.Util.to_text) v in
    {uris;}

  type main_output = {
    posts: app_bsky_feed_defs_postview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let posts = Value.Util.get_key "posts" (Value.Util.to_array_of app_bsky_feed_defs_postview_of_value) v in
    {posts;})

  (** Gets post views for a specified list of posts (by AT-URI). This is sometimes referred to as 'hydrating' a 'feed skeleton'. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getPostThread"
  *)
module App_Bsky_Feed_GetPostThread = struct
  (** {2 def main} *)

  type main_params = {
    uri: string;
    depth: int64 option;
    parentHeight: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let depth = Value.Util.get_key_opt "depth" Value.Util.to_int v in
    let parentHeight = Value.Util.get_key_opt "parentHeight" Value.Util.to_int v in
    {uri;depth;parentHeight;}

  type main_output = {
    thread: [
    `App_bsky_feed_defs_threadviewpost of app_bsky_feed_defs_threadviewpost
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ];
    threadgate: app_bsky_feed_defs_threadgateview option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let thread = Value.Util.get_key "thread" (fun v ->
    (match Value.Util.get_key "$type" Value.Util.to_text v with
    | "threadViewPost" -> `App_bsky_feed_defs_threadviewpost (app_bsky_feed_defs_threadviewpost_of_value v)
    | "notFoundPost" -> `App_bsky_feed_defs_notfoundpost (app_bsky_feed_defs_notfoundpost_of_value v)
    | "blockedPost" -> `App_bsky_feed_defs_blockedpost (app_bsky_feed_defs_blockedpost_of_value v)
    | _ -> `Other v (* Non closed union *)
    )) v in
    let threadgate = Value.Util.get_key_opt "threadgate" app_bsky_feed_defs_threadgateview_of_value v in
    {thread;threadgate;})

  type main_error = [ `NotFound [@name "NotFound"]]
  [@@deriving show {with_path=false}]

  (** Get posts in a thread. Does not require auth, but additional metadata and filtering will be applied for authed requests. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.feed.getListFeed"
  *)
module App_Bsky_Feed_GetListFeed = struct
  (** {2 def main} *)

  type main_params = {
    list: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let list = Value.Util.get_key "list" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {list;limit;cursor;}

  type main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_feedviewpost list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let feed = Value.Util.get_key "feed" (Value.Util.to_array_of app_bsky_feed_defs_feedviewpost_of_value) v in
    {cursor;feed;})

  type main_error = [ `UnknownList [@name "UnknownList"]]
  [@@deriving show {with_path=false}]

  (** Get a feed of recent posts from a list (posts and reposts from any actors on the list). Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.feed.getLikes"
  *)
module App_Bsky_Feed_GetLikes = struct
  (** {2 def main} *)

  type main_params = {
    uri: string;
    cid: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key_opt "cid" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {uri;cid;limit;cursor;}

  type main_output = {
    uri: string;
    cid: string option;
    cursor: string option;
    likes: app_bsky_feed_getlikes_like list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let uri = Value.Util.get_key "uri" Value.Util.to_text v in
    let cid = Value.Util.get_key_opt "cid" Value.Util.to_text v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let likes = Value.Util.get_key "likes" (Value.Util.to_array_of app_bsky_feed_getlikes_like_of_value) v in
    {uri;cid;cursor;likes;})

  (** Get like records which reference a subject (by AT-URI and CID). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def like} *)

  type nonrec like = app_bsky_feed_getlikes_like = {
    indexedAt: string;
    createdAt: string;
    actor: app_bsky_actor_defs_profileview;
  }
  let pp_like = pp_app_bsky_feed_getlikes_like
  let like_of_value = app_bsky_feed_getlikes_like_of_value
  let like_to_value = app_bsky_feed_getlikes_like_to_value


end


(** lexicon "app.bsky.feed.getFeedSkeleton"
  *)
module App_Bsky_Feed_GetFeedSkeleton = struct
  (** {2 def main} *)

  type main_params = {
    feed: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let feed = Value.Util.get_key "feed" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {feed;limit;cursor;}

  type main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_skeletonfeedpost list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let feed = Value.Util.get_key "feed" (Value.Util.to_array_of app_bsky_feed_defs_skeletonfeedpost_of_value) v in
    {cursor;feed;})

  type main_error = [ `UnknownFeed [@name "UnknownFeed"]]
  [@@deriving show {with_path=false}]

  (** Get a skeleton of a feed provided by a feed generator. Auth is optional, depending on provider requirements, and provides the DID of the requester. Implemented by Feed Generator Service. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.feed.getFeedGenerators"
  *)
module App_Bsky_Feed_GetFeedGenerators = struct
  (** {2 def main} *)

  type main_params = {
    feeds: string list;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let feeds = Value.Util.get_key "feeds" (Value.Util.to_array_of Value.Util.to_text) v in
    {feeds;}

  type main_output = {
    feeds: app_bsky_feed_defs_generatorview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let feeds = Value.Util.get_key "feeds" (Value.Util.to_array_of app_bsky_feed_defs_generatorview_of_value) v in
    {feeds;})

  (** Get information about a list of feed generators. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getFeedGenerator"
  *)
module App_Bsky_Feed_GetFeedGenerator = struct
  (** {2 def main} *)

  type main_params = {
    feed: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let feed = Value.Util.get_key "feed" Value.Util.to_text v in
    {feed;}

  type main_output = {
    view: app_bsky_feed_defs_generatorview;
    isOnline: bool;
    isValid: bool;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let view = Value.Util.get_key "view" app_bsky_feed_defs_generatorview_of_value v in
    let isOnline = Value.Util.get_key "isOnline" Value.Util.to_bool v in
    let isValid = Value.Util.get_key "isValid" Value.Util.to_bool v in
    {view;isOnline;isValid;})

  (** Get information about a feed generator. Implemented by AppView. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getFeed"
  *)
module App_Bsky_Feed_GetFeed = struct
  (** {2 def main} *)

  type main_params = {
    feed: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let feed = Value.Util.get_key "feed" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {feed;limit;cursor;}

  type main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_feedviewpost list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let feed = Value.Util.get_key "feed" (Value.Util.to_array_of app_bsky_feed_defs_feedviewpost_of_value) v in
    {cursor;feed;})

  type main_error = [ `UnknownFeed [@name "UnknownFeed"]]
  [@@deriving show {with_path=false}]

  (** Get a hydrated feed from an actor's selected feed generator. Implemented by App View. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.feed.getAuthorFeed"
  *)
module App_Bsky_Feed_GetAuthorFeed = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
    filter: string option;
    includePins: bool option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let filter = Value.Util.get_key_opt "filter" Value.Util.to_text v in
    let includePins = Value.Util.get_key_opt "includePins" Value.Util.to_bool v in
    {actor;limit;cursor;filter;includePins;}

  type main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_feedviewpost list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let feed = Value.Util.get_key "feed" (Value.Util.to_array_of app_bsky_feed_defs_feedviewpost_of_value) v in
    {cursor;feed;})

  type main_error = [ `BlockedActor [@name "BlockedActor"] | `BlockedByActor [@name "BlockedByActor"]]
  [@@deriving show {with_path=false}]

  (** Get a view of an actor's 'author feed' (post and reposts by the author). Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.feed.getActorLikes"
  *)
module App_Bsky_Feed_GetActorLikes = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {actor;limit;cursor;}

  type main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_feedviewpost list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let feed = Value.Util.get_key "feed" (Value.Util.to_array_of app_bsky_feed_defs_feedviewpost_of_value) v in
    {cursor;feed;})

  type main_error = [ `BlockedActor [@name "BlockedActor"] | `BlockedByActor [@name "BlockedByActor"]]
  [@@deriving show {with_path=false}]

  (** Get a list of posts liked by an actor. Requires auth, actor must be the requesting account. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) 
    ~errors:(Errors {pp=pp_main_error})

end


(** lexicon "app.bsky.feed.getActorFeeds"
  *)
module App_Bsky_Feed_GetActorFeeds = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {actor;limit;cursor;}

  type main_output = {
    cursor: string option;
    feeds: app_bsky_feed_defs_generatorview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let feeds = Value.Util.get_key "feeds" (Value.Util.to_array_of app_bsky_feed_defs_generatorview_of_value) v in
    {cursor;feeds;})

  (** Get a list of feeds (feed generator records) created by the actor (in the actor's repo). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.generator"
  *)
module App_Bsky_Feed_Generator = struct
  (** {2 def main} *)

  (** Record declaring of the existence of a feed generator, and containing metadata about it. The record can exist in any repository. *)
  type main = {
    did: string;
    displayName: string;
    description: string option;
    descriptionFacets: app_bsky_richtext_facet_main list option;
    avatar: Blob.t option;
    acceptsInteractions: bool option;
    labels: [
    `Com_atproto_label_defs_selflabels of com_atproto_label_defs_selflabels
    | `Other of Value.t (** Non closed union *)
    ] option;
    contentMode: string option;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.feed.describeFeedGenerator"
  *)
module App_Bsky_Feed_DescribeFeedGenerator = struct
  (** {2 def main} *)

  type main_output = {
    did: string;
    feeds: app_bsky_feed_describefeedgenerator_feed list;
    links: app_bsky_feed_describefeedgenerator_links option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let did = Value.Util.get_key "did" Value.Util.to_text v in
    let feeds = Value.Util.get_key "feeds" (Value.Util.to_array_of app_bsky_feed_describefeedgenerator_feed_of_value) v in
    let links = Value.Util.get_key_opt "links" app_bsky_feed_describefeedgenerator_links_of_value v in
    {did;feeds;links;})

  (** Get information about a feed generator, including policies and offered feed URIs. Does not require auth; implemented by Feed Generator services (not App View). *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

  (** {2 def feed} *)

  type nonrec feed = app_bsky_feed_describefeedgenerator_feed = {
    uri: string;
  }
  let pp_feed = pp_app_bsky_feed_describefeedgenerator_feed
  let feed_of_value = app_bsky_feed_describefeedgenerator_feed_of_value
  let feed_to_value = app_bsky_feed_describefeedgenerator_feed_to_value


  (** {2 def links} *)

  type nonrec links = app_bsky_feed_describefeedgenerator_links = {
    privacyPolicy: string option;
    termsOfService: string option;
  }
  let pp_links = pp_app_bsky_feed_describefeedgenerator_links
  let links_of_value = app_bsky_feed_describefeedgenerator_links_of_value
  let links_to_value = app_bsky_feed_describefeedgenerator_links_to_value


end


(** lexicon "app.bsky.actor.status"
  *)
module App_Bsky_Actor_Status = struct
  (** {2 def main} *)

  (** A declaration of a Bluesky account status. *)
  type main = {
    status: string;
    embed: [
    `App_bsky_embed_external_main of app_bsky_embed_external_main
    | `Other of Value.t (** Non closed union *)
    ] option;
    durationMinutes: int64 option;
    createdAt: string;
  }  [@@deriving show {with_path=false}, make]



  (** {2 def live} *)

  type nonrec live = app_bsky_actor_status_live
  let pp_live = pp_app_bsky_actor_status_live
  let live_of_value = app_bsky_actor_status_live_of_value
  let live_to_value = app_bsky_actor_status_live_to_value


end


(** lexicon "app.bsky.actor.searchActorsTypeahead"
  *)
module App_Bsky_Actor_SearchActorsTypeahead = struct
  (** {2 def main} *)

  type main_params = {
    term: string option;
    q: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let term = Value.Util.get_key_opt "term" Value.Util.to_text v in
    let q = Value.Util.get_key_opt "q" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    {term;q;limit;}

  type main_output = {
    actors: app_bsky_actor_defs_profileviewbasic list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let actors = Value.Util.get_key "actors" (Value.Util.to_array_of app_bsky_actor_defs_profileviewbasic_of_value) v in
    {actors;})

  (** Find actor suggestions for a prefix search term. Expected use is for auto-completion during text field entry. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.searchActors"
  *)
module App_Bsky_Actor_SearchActors = struct
  (** {2 def main} *)

  type main_params = {
    term: string option;
    q: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let term = Value.Util.get_key_opt "term" Value.Util.to_text v in
    let q = Value.Util.get_key_opt "q" Value.Util.to_text v in
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {term;q;limit;cursor;}

  type main_output = {
    cursor: string option;
    actors: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let actors = Value.Util.get_key "actors" (Value.Util.to_array_of app_bsky_actor_defs_profileview_of_value) v in
    {cursor;actors;})

  (** Find actors (profiles) matching search criteria. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.putPreferences"
  *)
module App_Bsky_Actor_PutPreferences = struct
  (** {2 def main} *)

  type main_input = {
    preferences: app_bsky_actor_defs_preferences;
  }
  [@@deriving show {with_path=false}]

  let main_input_of_value : main_input Value.Util.conv = (fun v ->
    let preferences = Value.Util.get_key "preferences" app_bsky_actor_defs_preferences_of_value v in
    {preferences;})

  (** Set the private preferences attached to the account. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_encodable {encoding=Json; encode={
    to_value=main_input_to_value;
    of_value=main_input_of_value;
    pp=pp_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.actor.profile"
  *)
module App_Bsky_Actor_Profile = struct
  (** {2 def main} *)

  (** A declaration of a Bluesky account profile. *)
  type main = {
    displayName: string option;
    description: string option;
    avatar: Blob.t option;
    banner: Blob.t option;
    labels: [
    `Com_atproto_label_defs_selflabels of com_atproto_label_defs_selflabels
    | `Other of Value.t (** Non closed union *)
    ] option;
    joinedViaStarterPack: com_atproto_repo_strongref_main option;
    pinnedPost: com_atproto_repo_strongref_main option;
    createdAt: string option;
  }  [@@deriving show {with_path=false}, make]



end


(** lexicon "app.bsky.actor.getSuggestions"
  *)
module App_Bsky_Actor_GetSuggestions = struct
  (** {2 def main} *)

  type main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let limit = Value.Util.get_key_opt "limit" Value.Util.to_int v in
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    {limit;cursor;}

  type main_output = {
    cursor: string option;
    actors: app_bsky_actor_defs_profileview list;
    recId: int64 option;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let cursor = Value.Util.get_key_opt "cursor" Value.Util.to_text v in
    let actors = Value.Util.get_key "actors" (Value.Util.to_array_of app_bsky_actor_defs_profileview_of_value) v in
    let recId = Value.Util.get_key_opt "recId" Value.Util.to_int v in
    {cursor;actors;recId;})

  (** Get a list of suggested actors. Expected use is discovery of accounts to follow during new account onboarding. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.getProfiles"
  *)
module App_Bsky_Actor_GetProfiles = struct
  (** {2 def main} *)

  type main_params = {
    actors: string list;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actors = Value.Util.get_key "actors" (Value.Util.to_array_of Value.Util.to_text) v in
    {actors;}

  type main_output = {
    profiles: app_bsky_actor_defs_profileviewdetailed list;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let profiles = Value.Util.get_key "profiles" (Value.Util.to_array_of app_bsky_actor_defs_profileviewdetailed_of_value) v in
    {profiles;})

  (** Get detailed profile views of multiple actors. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.getProfile"
  *)
module App_Bsky_Actor_GetProfile = struct
  (** {2 def main} *)

  type main_params = {
    actor: string;
  }
  [@@deriving show {with_path=false}, make]

  let main_params_of_value : main_params Value.Util.conv = fun v ->
    let actor = Value.Util.get_key "actor" Value.Util.to_text v in
    {actor;}

  type main_output = app_bsky_actor_defs_profileviewdetailed
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = app_bsky_actor_defs_profileviewdetailed_of_value

  (** Get detailed profile view of an actor. Does not require auth, but contains relevant metadata with auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_value=main_params_to_value;
    of_value=main_params_of_value;
    pp=pp_main_params}) 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.getPreferences"
  *)
module App_Bsky_Actor_GetPreferences = struct
  (** {2 def main} *)

  type main_output = {
    preferences: app_bsky_actor_defs_preferences;
  }
  [@@deriving show {with_path=false}]

  let main_output_of_value : main_output Value.Util.conv = (fun v ->
    let preferences = Value.Util.get_key "preferences" app_bsky_actor_defs_preferences_of_value v in
    {preferences;})

  (** Get private preferences attached to the current account. Expected use is synchronization between multiple devices, and import/export during account migration. Requires auth. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_encodable {encoding=Json; encode={
    to_value=main_output_to_value;
    of_value=main_output_of_value;
    pp=pp_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.defs"
  *)
module App_Bsky_Actor_Defs = struct
  (** {2 def profileViewBasic} *)

  type nonrec profileviewbasic = app_bsky_actor_defs_profileviewbasic = {
    did: string;
    handle: string;
    displayName: string option;
    avatar: string option;
    associated: app_bsky_actor_defs_profileassociated option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    createdAt: string option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }
  let pp_profileviewbasic = pp_app_bsky_actor_defs_profileviewbasic
  let profileviewbasic_of_value = app_bsky_actor_defs_profileviewbasic_of_value
  let profileviewbasic_to_value = app_bsky_actor_defs_profileviewbasic_to_value


  (** {2 def profileView} *)

  type nonrec profileview = app_bsky_actor_defs_profileview = {
    did: string;
    handle: string;
    displayName: string option;
    description: string option;
    avatar: string option;
    associated: app_bsky_actor_defs_profileassociated option;
    indexedAt: string option;
    createdAt: string option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }
  let pp_profileview = pp_app_bsky_actor_defs_profileview
  let profileview_of_value = app_bsky_actor_defs_profileview_of_value
  let profileview_to_value = app_bsky_actor_defs_profileview_to_value


  (** {2 def profileViewDetailed} *)

  type nonrec profileviewdetailed = app_bsky_actor_defs_profileviewdetailed = {
    did: string;
    handle: string;
    displayName: string option;
    description: string option;
    avatar: string option;
    banner: string option;
    followersCount: int64 option;
    followsCount: int64 option;
    postsCount: int64 option;
    associated: app_bsky_actor_defs_profileassociated option;
    joinedViaStarterPack: app_bsky_graph_defs_starterpackviewbasic option;
    indexedAt: string option;
    createdAt: string option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    pinnedPost: com_atproto_repo_strongref_main option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }
  let pp_profileviewdetailed = pp_app_bsky_actor_defs_profileviewdetailed
  let profileviewdetailed_of_value = app_bsky_actor_defs_profileviewdetailed_of_value
  let profileviewdetailed_to_value = app_bsky_actor_defs_profileviewdetailed_to_value


  (** {2 def profileAssociated} *)

  type nonrec profileassociated = app_bsky_actor_defs_profileassociated = {
    lists: int64 option;
    feedgens: int64 option;
    starterPacks: int64 option;
    labeler: bool option;
    chat: app_bsky_actor_defs_profileassociatedchat option;
  }
  let pp_profileassociated = pp_app_bsky_actor_defs_profileassociated
  let profileassociated_of_value = app_bsky_actor_defs_profileassociated_of_value
  let profileassociated_to_value = app_bsky_actor_defs_profileassociated_to_value


  (** {2 def profileAssociatedChat} *)

  type nonrec profileassociatedchat = app_bsky_actor_defs_profileassociatedchat = {
    allowIncoming: string;
  }
  let pp_profileassociatedchat = pp_app_bsky_actor_defs_profileassociatedchat
  let profileassociatedchat_of_value = app_bsky_actor_defs_profileassociatedchat_of_value
  let profileassociatedchat_to_value = app_bsky_actor_defs_profileassociatedchat_to_value


  (** {2 def viewerState} *)

  type nonrec viewerstate = app_bsky_actor_defs_viewerstate = {
    muted: bool option;
    mutedByList: app_bsky_graph_defs_listviewbasic option;
    blockedBy: bool option;
    blocking: string option;
    blockingByList: app_bsky_graph_defs_listviewbasic option;
    following: string option;
    followedBy: string option;
    knownFollowers: app_bsky_actor_defs_knownfollowers option;
  }
  let pp_viewerstate = pp_app_bsky_actor_defs_viewerstate
  let viewerstate_of_value = app_bsky_actor_defs_viewerstate_of_value
  let viewerstate_to_value = app_bsky_actor_defs_viewerstate_to_value


  (** {2 def knownFollowers} *)

  type nonrec knownfollowers = app_bsky_actor_defs_knownfollowers = {
    count: int64;
    followers: app_bsky_actor_defs_profileviewbasic list;
  }
  let pp_knownfollowers = pp_app_bsky_actor_defs_knownfollowers
  let knownfollowers_of_value = app_bsky_actor_defs_knownfollowers_of_value
  let knownfollowers_to_value = app_bsky_actor_defs_knownfollowers_to_value


  (** {2 def verificationState} *)

  type nonrec verificationstate = app_bsky_actor_defs_verificationstate = {
    verifications: app_bsky_actor_defs_verificationview list;
    verifiedStatus: string;
    trustedVerifierStatus: string;
  }
  let pp_verificationstate = pp_app_bsky_actor_defs_verificationstate
  let verificationstate_of_value = app_bsky_actor_defs_verificationstate_of_value
  let verificationstate_to_value = app_bsky_actor_defs_verificationstate_to_value


  (** {2 def verificationView} *)

  type nonrec verificationview = app_bsky_actor_defs_verificationview = {
    issuer: string;
    uri: string;
    isValid: bool;
    createdAt: string;
  }
  let pp_verificationview = pp_app_bsky_actor_defs_verificationview
  let verificationview_of_value = app_bsky_actor_defs_verificationview_of_value
  let verificationview_to_value = app_bsky_actor_defs_verificationview_to_value


  (** {2 def preferences} *)

  type nonrec preferences = app_bsky_actor_defs_preferences
  let pp_preferences = pp_app_bsky_actor_defs_preferences
  let preferences_of_value = app_bsky_actor_defs_preferences_of_value
  let preferences_to_value = app_bsky_actor_defs_preferences_to_value


  (** {2 def adultContentPref} *)

  type nonrec adultcontentpref = app_bsky_actor_defs_adultcontentpref = {
    enabled: bool;
  }
  let pp_adultcontentpref = pp_app_bsky_actor_defs_adultcontentpref
  let adultcontentpref_of_value = app_bsky_actor_defs_adultcontentpref_of_value
  let adultcontentpref_to_value = app_bsky_actor_defs_adultcontentpref_to_value


  (** {2 def contentLabelPref} *)

  type nonrec contentlabelpref = app_bsky_actor_defs_contentlabelpref = {
    labelerDid: string option;
    label: string;
    visibility: string;
  }
  let pp_contentlabelpref = pp_app_bsky_actor_defs_contentlabelpref
  let contentlabelpref_of_value = app_bsky_actor_defs_contentlabelpref_of_value
  let contentlabelpref_to_value = app_bsky_actor_defs_contentlabelpref_to_value


  (** {2 def savedFeed} *)

  type nonrec savedfeed = app_bsky_actor_defs_savedfeed = {
    id: string;
    type_: string;
    value: string;
    pinned: bool;
  }
  let pp_savedfeed = pp_app_bsky_actor_defs_savedfeed
  let savedfeed_of_value = app_bsky_actor_defs_savedfeed_of_value
  let savedfeed_to_value = app_bsky_actor_defs_savedfeed_to_value


  (** {2 def savedFeedsPrefV2} *)

  type nonrec savedfeedsprefv2 = app_bsky_actor_defs_savedfeedsprefv2 = {
    items: app_bsky_actor_defs_savedfeed list;
  }
  let pp_savedfeedsprefv2 = pp_app_bsky_actor_defs_savedfeedsprefv2
  let savedfeedsprefv2_of_value = app_bsky_actor_defs_savedfeedsprefv2_of_value
  let savedfeedsprefv2_to_value = app_bsky_actor_defs_savedfeedsprefv2_to_value


  (** {2 def savedFeedsPref} *)

  type nonrec savedfeedspref = app_bsky_actor_defs_savedfeedspref = {
    pinned: string list;
    saved: string list;
    timelineIndex: int64 option;
  }
  let pp_savedfeedspref = pp_app_bsky_actor_defs_savedfeedspref
  let savedfeedspref_of_value = app_bsky_actor_defs_savedfeedspref_of_value
  let savedfeedspref_to_value = app_bsky_actor_defs_savedfeedspref_to_value


  (** {2 def personalDetailsPref} *)

  type nonrec personaldetailspref = app_bsky_actor_defs_personaldetailspref = {
    birthDate: string option;
  }
  let pp_personaldetailspref = pp_app_bsky_actor_defs_personaldetailspref
  let personaldetailspref_of_value = app_bsky_actor_defs_personaldetailspref_of_value
  let personaldetailspref_to_value = app_bsky_actor_defs_personaldetailspref_to_value


  (** {2 def feedViewPref} *)

  type nonrec feedviewpref = app_bsky_actor_defs_feedviewpref = {
    feed: string;
    hideReplies: bool option;
    hideRepliesByUnfollowed: bool option;
    hideRepliesByLikeCount: int64 option;
    hideReposts: bool option;
    hideQuotePosts: bool option;
  }
  let pp_feedviewpref = pp_app_bsky_actor_defs_feedviewpref
  let feedviewpref_of_value = app_bsky_actor_defs_feedviewpref_of_value
  let feedviewpref_to_value = app_bsky_actor_defs_feedviewpref_to_value


  (** {2 def threadViewPref} *)

  type nonrec threadviewpref = app_bsky_actor_defs_threadviewpref = {
    sort: string option;
    prioritizeFollowedUsers: bool option;
  }
  let pp_threadviewpref = pp_app_bsky_actor_defs_threadviewpref
  let threadviewpref_of_value = app_bsky_actor_defs_threadviewpref_of_value
  let threadviewpref_to_value = app_bsky_actor_defs_threadviewpref_to_value


  (** {2 def interestsPref} *)

  type nonrec interestspref = app_bsky_actor_defs_interestspref = {
    tags: string list;
  }
  let pp_interestspref = pp_app_bsky_actor_defs_interestspref
  let interestspref_of_value = app_bsky_actor_defs_interestspref_of_value
  let interestspref_to_value = app_bsky_actor_defs_interestspref_to_value


  (** {2 def mutedWordTarget} *)

  type nonrec mutedwordtarget = app_bsky_actor_defs_mutedwordtarget
  let pp_mutedwordtarget = pp_app_bsky_actor_defs_mutedwordtarget
  let mutedwordtarget_of_value = app_bsky_actor_defs_mutedwordtarget_of_value
  let mutedwordtarget_to_value = app_bsky_actor_defs_mutedwordtarget_to_value


  (** {2 def mutedWord} *)

  type nonrec mutedword = app_bsky_actor_defs_mutedword = {
    id: string option;
    value: string;
    targets: app_bsky_actor_defs_mutedwordtarget list;
    actorTarget: string option;
    expiresAt: string option;
  }
  let pp_mutedword = pp_app_bsky_actor_defs_mutedword
  let mutedword_of_value = app_bsky_actor_defs_mutedword_of_value
  let mutedword_to_value = app_bsky_actor_defs_mutedword_to_value


  (** {2 def mutedWordsPref} *)

  type nonrec mutedwordspref = app_bsky_actor_defs_mutedwordspref = {
    items: app_bsky_actor_defs_mutedword list;
  }
  let pp_mutedwordspref = pp_app_bsky_actor_defs_mutedwordspref
  let mutedwordspref_of_value = app_bsky_actor_defs_mutedwordspref_of_value
  let mutedwordspref_to_value = app_bsky_actor_defs_mutedwordspref_to_value


  (** {2 def hiddenPostsPref} *)

  type nonrec hiddenpostspref = app_bsky_actor_defs_hiddenpostspref = {
    items: string list;
  }
  let pp_hiddenpostspref = pp_app_bsky_actor_defs_hiddenpostspref
  let hiddenpostspref_of_value = app_bsky_actor_defs_hiddenpostspref_of_value
  let hiddenpostspref_to_value = app_bsky_actor_defs_hiddenpostspref_to_value


  (** {2 def labelersPref} *)

  type nonrec labelerspref = app_bsky_actor_defs_labelerspref = {
    labelers: app_bsky_actor_defs_labelerprefitem list;
  }
  let pp_labelerspref = pp_app_bsky_actor_defs_labelerspref
  let labelerspref_of_value = app_bsky_actor_defs_labelerspref_of_value
  let labelerspref_to_value = app_bsky_actor_defs_labelerspref_to_value


  (** {2 def labelerPrefItem} *)

  type nonrec labelerprefitem = app_bsky_actor_defs_labelerprefitem = {
    did: string;
  }
  let pp_labelerprefitem = pp_app_bsky_actor_defs_labelerprefitem
  let labelerprefitem_of_value = app_bsky_actor_defs_labelerprefitem_of_value
  let labelerprefitem_to_value = app_bsky_actor_defs_labelerprefitem_to_value


  (** {2 def bskyAppStatePref} *)

  type nonrec bskyappstatepref = app_bsky_actor_defs_bskyappstatepref = {
    activeProgressGuide: app_bsky_actor_defs_bskyappprogressguide option;
    queuedNudges: string list option;
    nuxs: app_bsky_actor_defs_nux list option;
  }
  let pp_bskyappstatepref = pp_app_bsky_actor_defs_bskyappstatepref
  let bskyappstatepref_of_value = app_bsky_actor_defs_bskyappstatepref_of_value
  let bskyappstatepref_to_value = app_bsky_actor_defs_bskyappstatepref_to_value


  (** {2 def bskyAppProgressGuide} *)

  type nonrec bskyappprogressguide = app_bsky_actor_defs_bskyappprogressguide = {
    guide: string;
  }
  let pp_bskyappprogressguide = pp_app_bsky_actor_defs_bskyappprogressguide
  let bskyappprogressguide_of_value = app_bsky_actor_defs_bskyappprogressguide_of_value
  let bskyappprogressguide_to_value = app_bsky_actor_defs_bskyappprogressguide_to_value


  (** {2 def nux} *)

  type nonrec nux = app_bsky_actor_defs_nux = {
    id: string;
    completed: bool;
    data: string option;
    expiresAt: string option;
  }
  let pp_nux = pp_app_bsky_actor_defs_nux
  let nux_of_value = app_bsky_actor_defs_nux_of_value
  let nux_to_value = app_bsky_actor_defs_nux_to_value


  (** {2 def verificationPrefs} *)

  type nonrec verificationprefs = app_bsky_actor_defs_verificationprefs = {
    hideBadges: bool option;
  }
  let pp_verificationprefs = pp_app_bsky_actor_defs_verificationprefs
  let verificationprefs_of_value = app_bsky_actor_defs_verificationprefs_of_value
  let verificationprefs_to_value = app_bsky_actor_defs_verificationprefs_to_value


  (** {2 def postInteractionSettingsPref} *)

  type nonrec postinteractionsettingspref = app_bsky_actor_defs_postinteractionsettingspref = {
    threadgateAllowRules: [
    `App_bsky_feed_threadgate_mentionrule of app_bsky_feed_threadgate_mentionrule
    | `App_bsky_feed_threadgate_followerrule of app_bsky_feed_threadgate_followerrule
    | `App_bsky_feed_threadgate_followingrule of app_bsky_feed_threadgate_followingrule
    | `App_bsky_feed_threadgate_listrule of app_bsky_feed_threadgate_listrule
    | `Other of Value.t (** Non closed union *)
    ] list option;
    postgateEmbeddingRules: [
    `App_bsky_feed_postgate_disablerule of app_bsky_feed_postgate_disablerule
    | `Other of Value.t (** Non closed union *)
    ] list option;
  }
  let pp_postinteractionsettingspref = pp_app_bsky_actor_defs_postinteractionsettingspref
  let postinteractionsettingspref_of_value = app_bsky_actor_defs_postinteractionsettingspref_of_value
  let postinteractionsettingspref_to_value = app_bsky_actor_defs_postinteractionsettingspref_to_value


  (** {2 def statusView} *)

  type nonrec statusview = app_bsky_actor_defs_statusview = {
    status: string;
    record: Value.t (* unknown *);
    embed: [
    `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    expiresAt: string option;
    isActive: bool option;
  }
  let pp_statusview = pp_app_bsky_actor_defs_statusview
  let statusview_of_value = app_bsky_actor_defs_statusview_of_value
  let statusview_to_value = app_bsky_actor_defs_statusview_to_value


end


(** lexicon "app.bsky.graph.defs"
  *)
module App_Bsky_Graph_Defs = struct
  (** {2 def listViewBasic} *)

  type nonrec listviewbasic = app_bsky_graph_defs_listviewbasic = {
    uri: string;
    cid: string;
    name: string;
    purpose: app_bsky_graph_defs_listpurpose;
    avatar: string option;
    listItemCount: int64 option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_graph_defs_listviewerstate option;
    indexedAt: string option;
  }
  let pp_listviewbasic = pp_app_bsky_graph_defs_listviewbasic
  let listviewbasic_of_value = app_bsky_graph_defs_listviewbasic_of_value
  let listviewbasic_to_value = app_bsky_graph_defs_listviewbasic_to_value


  (** {2 def listView} *)

  type nonrec listview = app_bsky_graph_defs_listview = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    name: string;
    purpose: app_bsky_graph_defs_listpurpose;
    description: string option;
    descriptionFacets: app_bsky_richtext_facet_main list option;
    avatar: string option;
    listItemCount: int64 option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_graph_defs_listviewerstate option;
    indexedAt: string;
  }
  let pp_listview = pp_app_bsky_graph_defs_listview
  let listview_of_value = app_bsky_graph_defs_listview_of_value
  let listview_to_value = app_bsky_graph_defs_listview_to_value


  (** {2 def listItemView} *)

  type nonrec listitemview = app_bsky_graph_defs_listitemview = {
    uri: string;
    subject: app_bsky_actor_defs_profileview;
  }
  let pp_listitemview = pp_app_bsky_graph_defs_listitemview
  let listitemview_of_value = app_bsky_graph_defs_listitemview_of_value
  let listitemview_to_value = app_bsky_graph_defs_listitemview_to_value


  (** {2 def starterPackView} *)

  type nonrec starterpackview = app_bsky_graph_defs_starterpackview = {
    uri: string;
    cid: string;
    record: Value.t (* unknown *);
    creator: app_bsky_actor_defs_profileviewbasic;
    list: app_bsky_graph_defs_listviewbasic option;
    listItemsSample: app_bsky_graph_defs_listitemview list option;
    feeds: app_bsky_feed_defs_generatorview list option;
    joinedWeekCount: int64 option;
    joinedAllTimeCount: int64 option;
    labels: com_atproto_label_defs_label list option;
    indexedAt: string;
  }
  let pp_starterpackview = pp_app_bsky_graph_defs_starterpackview
  let starterpackview_of_value = app_bsky_graph_defs_starterpackview_of_value
  let starterpackview_to_value = app_bsky_graph_defs_starterpackview_to_value


  (** {2 def starterPackViewBasic} *)

  type nonrec starterpackviewbasic = app_bsky_graph_defs_starterpackviewbasic = {
    uri: string;
    cid: string;
    record: Value.t (* unknown *);
    creator: app_bsky_actor_defs_profileviewbasic;
    listItemCount: int64 option;
    joinedWeekCount: int64 option;
    joinedAllTimeCount: int64 option;
    labels: com_atproto_label_defs_label list option;
    indexedAt: string;
  }
  let pp_starterpackviewbasic = pp_app_bsky_graph_defs_starterpackviewbasic
  let starterpackviewbasic_of_value = app_bsky_graph_defs_starterpackviewbasic_of_value
  let starterpackviewbasic_to_value = app_bsky_graph_defs_starterpackviewbasic_to_value


  (** {2 def listPurpose} *)

  type nonrec listpurpose = app_bsky_graph_defs_listpurpose
  let pp_listpurpose = pp_app_bsky_graph_defs_listpurpose
  let listpurpose_of_value = app_bsky_graph_defs_listpurpose_of_value
  let listpurpose_to_value = app_bsky_graph_defs_listpurpose_to_value


  (** {2 def modlist} *)

  type nonrec modlist = app_bsky_graph_defs_modlist
  let pp_modlist = pp_app_bsky_graph_defs_modlist
  let modlist_of_value = app_bsky_graph_defs_modlist_of_value
  let modlist_to_value = app_bsky_graph_defs_modlist_to_value


  (** {2 def curatelist} *)

  type nonrec curatelist = app_bsky_graph_defs_curatelist
  let pp_curatelist = pp_app_bsky_graph_defs_curatelist
  let curatelist_of_value = app_bsky_graph_defs_curatelist_of_value
  let curatelist_to_value = app_bsky_graph_defs_curatelist_to_value


  (** {2 def referencelist} *)

  type nonrec referencelist = app_bsky_graph_defs_referencelist
  let pp_referencelist = pp_app_bsky_graph_defs_referencelist
  let referencelist_of_value = app_bsky_graph_defs_referencelist_of_value
  let referencelist_to_value = app_bsky_graph_defs_referencelist_to_value


  (** {2 def listViewerState} *)

  type nonrec listviewerstate = app_bsky_graph_defs_listviewerstate = {
    muted: bool option;
    blocked: string option;
  }
  let pp_listviewerstate = pp_app_bsky_graph_defs_listviewerstate
  let listviewerstate_of_value = app_bsky_graph_defs_listviewerstate_of_value
  let listviewerstate_to_value = app_bsky_graph_defs_listviewerstate_to_value


  (** {2 def notFoundActor} *)

  type nonrec notfoundactor = app_bsky_graph_defs_notfoundactor = {
    actor: string;
    notFound: bool;
  }
  let pp_notfoundactor = pp_app_bsky_graph_defs_notfoundactor
  let notfoundactor_of_value = app_bsky_graph_defs_notfoundactor_of_value
  let notfoundactor_to_value = app_bsky_graph_defs_notfoundactor_to_value


  (** {2 def relationship} *)

  type nonrec relationship = app_bsky_graph_defs_relationship = {
    did: string;
    following: string option;
    followedBy: string option;
  }
  let pp_relationship = pp_app_bsky_graph_defs_relationship
  let relationship_of_value = app_bsky_graph_defs_relationship_of_value
  let relationship_to_value = app_bsky_graph_defs_relationship_to_value


end


(** lexicon "app.bsky.feed.defs"
  *)
module App_Bsky_Feed_Defs = struct
  (** {2 def postView} *)

  type nonrec postview = app_bsky_feed_defs_postview = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileviewbasic;
    record: Value.t (* unknown *);
    embed: [
    `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `App_bsky_embed_recordwithmedia_view of app_bsky_embed_recordwithmedia_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    replyCount: int64 option;
    repostCount: int64 option;
    likeCount: int64 option;
    quoteCount: int64 option;
    indexedAt: string;
    viewer: app_bsky_feed_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    threadgate: app_bsky_feed_defs_threadgateview option;
  }
  let pp_postview = pp_app_bsky_feed_defs_postview
  let postview_of_value = app_bsky_feed_defs_postview_of_value
  let postview_to_value = app_bsky_feed_defs_postview_to_value


  (** {2 def viewerState} *)

  type nonrec viewerstate = app_bsky_feed_defs_viewerstate = {
    repost: string option;
    like: string option;
    threadMuted: bool option;
    replyDisabled: bool option;
    embeddingDisabled: bool option;
    pinned: bool option;
  }
  let pp_viewerstate = pp_app_bsky_feed_defs_viewerstate
  let viewerstate_of_value = app_bsky_feed_defs_viewerstate_of_value
  let viewerstate_to_value = app_bsky_feed_defs_viewerstate_to_value


  (** {2 def threadContext} *)

  type nonrec threadcontext = app_bsky_feed_defs_threadcontext = {
    rootAuthorLike: string option;
  }
  let pp_threadcontext = pp_app_bsky_feed_defs_threadcontext
  let threadcontext_of_value = app_bsky_feed_defs_threadcontext_of_value
  let threadcontext_to_value = app_bsky_feed_defs_threadcontext_to_value


  (** {2 def feedViewPost} *)

  type nonrec feedviewpost = app_bsky_feed_defs_feedviewpost = {
    post: app_bsky_feed_defs_postview;
    reply: app_bsky_feed_defs_replyref option;
    reason: [
    `App_bsky_feed_defs_reasonrepost of app_bsky_feed_defs_reasonrepost
    | `App_bsky_feed_defs_reasonpin of app_bsky_feed_defs_reasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedContext: string option;
  }
  let pp_feedviewpost = pp_app_bsky_feed_defs_feedviewpost
  let feedviewpost_of_value = app_bsky_feed_defs_feedviewpost_of_value
  let feedviewpost_to_value = app_bsky_feed_defs_feedviewpost_to_value


  (** {2 def replyRef} *)

  type nonrec replyref = app_bsky_feed_defs_replyref = {
    root: [
    `App_bsky_feed_defs_postview of app_bsky_feed_defs_postview
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ];
    parent: [
    `App_bsky_feed_defs_postview of app_bsky_feed_defs_postview
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ];
    grandparentAuthor: app_bsky_actor_defs_profileviewbasic option;
  }
  let pp_replyref = pp_app_bsky_feed_defs_replyref
  let replyref_of_value = app_bsky_feed_defs_replyref_of_value
  let replyref_to_value = app_bsky_feed_defs_replyref_to_value


  (** {2 def reasonRepost} *)

  type nonrec reasonrepost = app_bsky_feed_defs_reasonrepost = {
    by: app_bsky_actor_defs_profileviewbasic;
    indexedAt: string;
  }
  let pp_reasonrepost = pp_app_bsky_feed_defs_reasonrepost
  let reasonrepost_of_value = app_bsky_feed_defs_reasonrepost_of_value
  let reasonrepost_to_value = app_bsky_feed_defs_reasonrepost_to_value


  (** {2 def reasonPin} *)

  type nonrec reasonpin = app_bsky_feed_defs_reasonpin
  let pp_reasonpin = pp_app_bsky_feed_defs_reasonpin
  let reasonpin_of_value = app_bsky_feed_defs_reasonpin_of_value
  let reasonpin_to_value = app_bsky_feed_defs_reasonpin_to_value


  (** {2 def threadViewPost} *)

  type nonrec threadviewpost = app_bsky_feed_defs_threadviewpost = {
    post: app_bsky_feed_defs_postview;
    parent: [
    `App_bsky_feed_defs_threadviewpost of app_bsky_feed_defs_threadviewpost
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ] option;
    replies: [
    `App_bsky_feed_defs_threadviewpost of app_bsky_feed_defs_threadviewpost
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ] list option;
    threadContext: app_bsky_feed_defs_threadcontext option;
  }
  let pp_threadviewpost = pp_app_bsky_feed_defs_threadviewpost
  let threadviewpost_of_value = app_bsky_feed_defs_threadviewpost_of_value
  let threadviewpost_to_value = app_bsky_feed_defs_threadviewpost_to_value


  (** {2 def notFoundPost} *)

  type nonrec notfoundpost = app_bsky_feed_defs_notfoundpost = {
    uri: string;
    notFound: bool;
  }
  let pp_notfoundpost = pp_app_bsky_feed_defs_notfoundpost
  let notfoundpost_of_value = app_bsky_feed_defs_notfoundpost_of_value
  let notfoundpost_to_value = app_bsky_feed_defs_notfoundpost_to_value


  (** {2 def blockedPost} *)

  type nonrec blockedpost = app_bsky_feed_defs_blockedpost = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }
  let pp_blockedpost = pp_app_bsky_feed_defs_blockedpost
  let blockedpost_of_value = app_bsky_feed_defs_blockedpost_of_value
  let blockedpost_to_value = app_bsky_feed_defs_blockedpost_to_value


  (** {2 def blockedAuthor} *)

  type nonrec blockedauthor = app_bsky_feed_defs_blockedauthor = {
    did: string;
    viewer: app_bsky_actor_defs_viewerstate option;
  }
  let pp_blockedauthor = pp_app_bsky_feed_defs_blockedauthor
  let blockedauthor_of_value = app_bsky_feed_defs_blockedauthor_of_value
  let blockedauthor_to_value = app_bsky_feed_defs_blockedauthor_to_value


  (** {2 def generatorView} *)

  type nonrec generatorview = app_bsky_feed_defs_generatorview = {
    uri: string;
    cid: string;
    did: string;
    creator: app_bsky_actor_defs_profileview;
    displayName: string;
    description: string option;
    descriptionFacets: app_bsky_richtext_facet_main list option;
    avatar: string option;
    likeCount: int64 option;
    acceptsInteractions: bool option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_feed_defs_generatorviewerstate option;
    contentMode: string option;
    indexedAt: string;
  }
  let pp_generatorview = pp_app_bsky_feed_defs_generatorview
  let generatorview_of_value = app_bsky_feed_defs_generatorview_of_value
  let generatorview_to_value = app_bsky_feed_defs_generatorview_to_value


  (** {2 def generatorViewerState} *)

  type nonrec generatorviewerstate = app_bsky_feed_defs_generatorviewerstate = {
    like: string option;
  }
  let pp_generatorviewerstate = pp_app_bsky_feed_defs_generatorviewerstate
  let generatorviewerstate_of_value = app_bsky_feed_defs_generatorviewerstate_of_value
  let generatorviewerstate_to_value = app_bsky_feed_defs_generatorviewerstate_to_value


  (** {2 def skeletonFeedPost} *)

  type nonrec skeletonfeedpost = app_bsky_feed_defs_skeletonfeedpost = {
    post: string;
    reason: [
    `App_bsky_feed_defs_skeletonreasonrepost of app_bsky_feed_defs_skeletonreasonrepost
    | `App_bsky_feed_defs_skeletonreasonpin of app_bsky_feed_defs_skeletonreasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedContext: string option;
  }
  let pp_skeletonfeedpost = pp_app_bsky_feed_defs_skeletonfeedpost
  let skeletonfeedpost_of_value = app_bsky_feed_defs_skeletonfeedpost_of_value
  let skeletonfeedpost_to_value = app_bsky_feed_defs_skeletonfeedpost_to_value


  (** {2 def skeletonReasonRepost} *)

  type nonrec skeletonreasonrepost = app_bsky_feed_defs_skeletonreasonrepost = {
    repost: string;
  }
  let pp_skeletonreasonrepost = pp_app_bsky_feed_defs_skeletonreasonrepost
  let skeletonreasonrepost_of_value = app_bsky_feed_defs_skeletonreasonrepost_of_value
  let skeletonreasonrepost_to_value = app_bsky_feed_defs_skeletonreasonrepost_to_value


  (** {2 def skeletonReasonPin} *)

  type nonrec skeletonreasonpin = app_bsky_feed_defs_skeletonreasonpin
  let pp_skeletonreasonpin = pp_app_bsky_feed_defs_skeletonreasonpin
  let skeletonreasonpin_of_value = app_bsky_feed_defs_skeletonreasonpin_of_value
  let skeletonreasonpin_to_value = app_bsky_feed_defs_skeletonreasonpin_to_value


  (** {2 def threadgateView} *)

  type nonrec threadgateview = app_bsky_feed_defs_threadgateview = {
    uri: string option;
    cid: string option;
    record: Value.t (* unknown *) option;
    lists: app_bsky_graph_defs_listviewbasic list option;
  }
  let pp_threadgateview = pp_app_bsky_feed_defs_threadgateview
  let threadgateview_of_value = app_bsky_feed_defs_threadgateview_of_value
  let threadgateview_to_value = app_bsky_feed_defs_threadgateview_to_value


  (** {2 def interaction} *)

  type nonrec interaction = app_bsky_feed_defs_interaction = {
    item: string option;
    event: string option;
    feedContext: string option;
  }
  let pp_interaction = pp_app_bsky_feed_defs_interaction
  let interaction_of_value = app_bsky_feed_defs_interaction_of_value
  let interaction_to_value = app_bsky_feed_defs_interaction_to_value


  (** {2 def requestLess} *)

  type nonrec requestless = app_bsky_feed_defs_requestless
  let pp_requestless = pp_app_bsky_feed_defs_requestless
  let requestless_of_value = app_bsky_feed_defs_requestless_of_value
  let requestless_to_value = app_bsky_feed_defs_requestless_to_value


  (** {2 def requestMore} *)

  type nonrec requestmore = app_bsky_feed_defs_requestmore
  let pp_requestmore = pp_app_bsky_feed_defs_requestmore
  let requestmore_of_value = app_bsky_feed_defs_requestmore_of_value
  let requestmore_to_value = app_bsky_feed_defs_requestmore_to_value


  (** {2 def clickthroughItem} *)

  type nonrec clickthroughitem = app_bsky_feed_defs_clickthroughitem
  let pp_clickthroughitem = pp_app_bsky_feed_defs_clickthroughitem
  let clickthroughitem_of_value = app_bsky_feed_defs_clickthroughitem_of_value
  let clickthroughitem_to_value = app_bsky_feed_defs_clickthroughitem_to_value


  (** {2 def clickthroughAuthor} *)

  type nonrec clickthroughauthor = app_bsky_feed_defs_clickthroughauthor
  let pp_clickthroughauthor = pp_app_bsky_feed_defs_clickthroughauthor
  let clickthroughauthor_of_value = app_bsky_feed_defs_clickthroughauthor_of_value
  let clickthroughauthor_to_value = app_bsky_feed_defs_clickthroughauthor_to_value


  (** {2 def clickthroughReposter} *)

  type nonrec clickthroughreposter = app_bsky_feed_defs_clickthroughreposter
  let pp_clickthroughreposter = pp_app_bsky_feed_defs_clickthroughreposter
  let clickthroughreposter_of_value = app_bsky_feed_defs_clickthroughreposter_of_value
  let clickthroughreposter_to_value = app_bsky_feed_defs_clickthroughreposter_to_value


  (** {2 def clickthroughEmbed} *)

  type nonrec clickthroughembed = app_bsky_feed_defs_clickthroughembed
  let pp_clickthroughembed = pp_app_bsky_feed_defs_clickthroughembed
  let clickthroughembed_of_value = app_bsky_feed_defs_clickthroughembed_of_value
  let clickthroughembed_to_value = app_bsky_feed_defs_clickthroughembed_to_value


  (** {2 def contentModeUnspecified} *)

  type nonrec contentmodeunspecified = app_bsky_feed_defs_contentmodeunspecified
  let pp_contentmodeunspecified = pp_app_bsky_feed_defs_contentmodeunspecified
  let contentmodeunspecified_of_value = app_bsky_feed_defs_contentmodeunspecified_of_value
  let contentmodeunspecified_to_value = app_bsky_feed_defs_contentmodeunspecified_to_value


  (** {2 def contentModeVideo} *)

  type nonrec contentmodevideo = app_bsky_feed_defs_contentmodevideo
  let pp_contentmodevideo = pp_app_bsky_feed_defs_contentmodevideo
  let contentmodevideo_of_value = app_bsky_feed_defs_contentmodevideo_of_value
  let contentmodevideo_to_value = app_bsky_feed_defs_contentmodevideo_to_value


  (** {2 def interactionSeen} *)

  type nonrec interactionseen = app_bsky_feed_defs_interactionseen
  let pp_interactionseen = pp_app_bsky_feed_defs_interactionseen
  let interactionseen_of_value = app_bsky_feed_defs_interactionseen_of_value
  let interactionseen_to_value = app_bsky_feed_defs_interactionseen_to_value


  (** {2 def interactionLike} *)

  type nonrec interactionlike = app_bsky_feed_defs_interactionlike
  let pp_interactionlike = pp_app_bsky_feed_defs_interactionlike
  let interactionlike_of_value = app_bsky_feed_defs_interactionlike_of_value
  let interactionlike_to_value = app_bsky_feed_defs_interactionlike_to_value


  (** {2 def interactionRepost} *)

  type nonrec interactionrepost = app_bsky_feed_defs_interactionrepost
  let pp_interactionrepost = pp_app_bsky_feed_defs_interactionrepost
  let interactionrepost_of_value = app_bsky_feed_defs_interactionrepost_of_value
  let interactionrepost_to_value = app_bsky_feed_defs_interactionrepost_to_value


  (** {2 def interactionReply} *)

  type nonrec interactionreply = app_bsky_feed_defs_interactionreply
  let pp_interactionreply = pp_app_bsky_feed_defs_interactionreply
  let interactionreply_of_value = app_bsky_feed_defs_interactionreply_of_value
  let interactionreply_to_value = app_bsky_feed_defs_interactionreply_to_value


  (** {2 def interactionQuote} *)

  type nonrec interactionquote = app_bsky_feed_defs_interactionquote
  let pp_interactionquote = pp_app_bsky_feed_defs_interactionquote
  let interactionquote_of_value = app_bsky_feed_defs_interactionquote_of_value
  let interactionquote_to_value = app_bsky_feed_defs_interactionquote_to_value


  (** {2 def interactionShare} *)

  type nonrec interactionshare = app_bsky_feed_defs_interactionshare
  let pp_interactionshare = pp_app_bsky_feed_defs_interactionshare
  let interactionshare_of_value = app_bsky_feed_defs_interactionshare_of_value
  let interactionshare_to_value = app_bsky_feed_defs_interactionshare_to_value


end


(** lexicon "app.bsky.embed.recordWithMedia"
  A representation of a record embedded in a Bluesky record (eg, a post), alongside other compatible embeds. For example, a quote post and image, or a quote post and external URL card.
  *)
module App_Bsky_Embed_RecordWithMedia = struct
  (** {2 def main} *)

  type nonrec main = app_bsky_embed_recordwithmedia_main = {
    record: app_bsky_embed_record_main;
    media: [
    `App_bsky_embed_images_main of app_bsky_embed_images_main
    | `App_bsky_embed_video_main of app_bsky_embed_video_main
    | `App_bsky_embed_external_main of app_bsky_embed_external_main
    | `Other of Value.t (** Non closed union *)
    ];
  }
  let pp_main = pp_app_bsky_embed_recordwithmedia_main
  let main_of_value = app_bsky_embed_recordwithmedia_main_of_value
  let main_to_value = app_bsky_embed_recordwithmedia_main_to_value


  (** {2 def view} *)

  type nonrec view = app_bsky_embed_recordwithmedia_view = {
    record: app_bsky_embed_record_view;
    media: [
    `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `Other of Value.t (** Non closed union *)
    ];
  }
  let pp_view = pp_app_bsky_embed_recordwithmedia_view
  let view_of_value = app_bsky_embed_recordwithmedia_view_of_value
  let view_to_value = app_bsky_embed_recordwithmedia_view_to_value


end


(** lexicon "app.bsky.embed.record"
  A representation of a record embedded in a Bluesky record (eg, a post). For example, a quote-post, or sharing a feed generator record.
  *)
module App_Bsky_Embed_Record = struct
  (** {2 def main} *)

  type nonrec main = app_bsky_embed_record_main = {
    record: com_atproto_repo_strongref_main;
  }
  let pp_main = pp_app_bsky_embed_record_main
  let main_of_value = app_bsky_embed_record_main_of_value
  let main_to_value = app_bsky_embed_record_main_to_value


  (** {2 def view} *)

  type nonrec view = app_bsky_embed_record_view = {
    record: [
    `App_bsky_embed_record_viewrecord of app_bsky_embed_record_viewrecord
    | `App_bsky_embed_record_viewnotfound of app_bsky_embed_record_viewnotfound
    | `App_bsky_embed_record_viewblocked of app_bsky_embed_record_viewblocked
    | `App_bsky_embed_record_viewdetached of app_bsky_embed_record_viewdetached
    | `App_bsky_feed_defs_generatorview of app_bsky_feed_defs_generatorview
    | `App_bsky_graph_defs_listview of app_bsky_graph_defs_listview
    | `App_bsky_labeler_defs_labelerview of app_bsky_labeler_defs_labelerview
    | `App_bsky_graph_defs_starterpackviewbasic of app_bsky_graph_defs_starterpackviewbasic
    | `Other of Value.t (** Non closed union *)
    ];
  }
  let pp_view = pp_app_bsky_embed_record_view
  let view_of_value = app_bsky_embed_record_view_of_value
  let view_to_value = app_bsky_embed_record_view_to_value


  (** {2 def viewRecord} *)

  type nonrec viewrecord = app_bsky_embed_record_viewrecord = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileviewbasic;
    value: Value.t (* unknown *);
    labels: com_atproto_label_defs_label list option;
    replyCount: int64 option;
    repostCount: int64 option;
    likeCount: int64 option;
    quoteCount: int64 option;
    embeds: [
    `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `App_bsky_embed_recordwithmedia_view of app_bsky_embed_recordwithmedia_view
    | `Other of Value.t (** Non closed union *)
    ] list option;
    indexedAt: string;
  }
  let pp_viewrecord = pp_app_bsky_embed_record_viewrecord
  let viewrecord_of_value = app_bsky_embed_record_viewrecord_of_value
  let viewrecord_to_value = app_bsky_embed_record_viewrecord_to_value


  (** {2 def viewNotFound} *)

  type nonrec viewnotfound = app_bsky_embed_record_viewnotfound = {
    uri: string;
    notFound: bool;
  }
  let pp_viewnotfound = pp_app_bsky_embed_record_viewnotfound
  let viewnotfound_of_value = app_bsky_embed_record_viewnotfound_of_value
  let viewnotfound_to_value = app_bsky_embed_record_viewnotfound_to_value


  (** {2 def viewBlocked} *)

  type nonrec viewblocked = app_bsky_embed_record_viewblocked = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }
  let pp_viewblocked = pp_app_bsky_embed_record_viewblocked
  let viewblocked_of_value = app_bsky_embed_record_viewblocked_of_value
  let viewblocked_to_value = app_bsky_embed_record_viewblocked_to_value


  (** {2 def viewDetached} *)

  type nonrec viewdetached = app_bsky_embed_record_viewdetached = {
    uri: string;
    detached: bool;
  }
  let pp_viewdetached = pp_app_bsky_embed_record_viewdetached
  let viewdetached_of_value = app_bsky_embed_record_viewdetached_of_value
  let viewdetached_to_value = app_bsky_embed_record_viewdetached_to_value


end


(** lexicon "app.bsky.labeler.defs"
  *)
module App_Bsky_Labeler_Defs = struct
  (** {2 def labelerView} *)

  type nonrec labelerview = app_bsky_labeler_defs_labelerview = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    likeCount: int64 option;
    viewer: app_bsky_labeler_defs_labelerviewerstate option;
    indexedAt: string;
    labels: com_atproto_label_defs_label list option;
  }
  let pp_labelerview = pp_app_bsky_labeler_defs_labelerview
  let labelerview_of_value = app_bsky_labeler_defs_labelerview_of_value
  let labelerview_to_value = app_bsky_labeler_defs_labelerview_to_value


  (** {2 def labelerViewDetailed} *)

  type nonrec labelerviewdetailed = app_bsky_labeler_defs_labelerviewdetailed = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    policies: app_bsky_labeler_defs_labelerpolicies;
    likeCount: int64 option;
    viewer: app_bsky_labeler_defs_labelerviewerstate option;
    indexedAt: string;
    labels: com_atproto_label_defs_label list option;
    reasonTypes: com_atproto_moderation_defs_reasontype list option;
    subjectTypes: com_atproto_moderation_defs_subjecttype list option;
    subjectCollections: string list option;
  }
  let pp_labelerviewdetailed = pp_app_bsky_labeler_defs_labelerviewdetailed
  let labelerviewdetailed_of_value = app_bsky_labeler_defs_labelerviewdetailed_of_value
  let labelerviewdetailed_to_value = app_bsky_labeler_defs_labelerviewdetailed_to_value


  (** {2 def labelerViewerState} *)

  type nonrec labelerviewerstate = app_bsky_labeler_defs_labelerviewerstate = {
    like: string option;
  }
  let pp_labelerviewerstate = pp_app_bsky_labeler_defs_labelerviewerstate
  let labelerviewerstate_of_value = app_bsky_labeler_defs_labelerviewerstate_of_value
  let labelerviewerstate_to_value = app_bsky_labeler_defs_labelerviewerstate_to_value


  (** {2 def labelerPolicies} *)

  type nonrec labelerpolicies = app_bsky_labeler_defs_labelerpolicies = {
    labelValues: com_atproto_label_defs_labelvalue list;
    labelValueDefinitions: com_atproto_label_defs_labelvaluedefinition list option;
  }
  let pp_labelerpolicies = pp_app_bsky_labeler_defs_labelerpolicies
  let labelerpolicies_of_value = app_bsky_labeler_defs_labelerpolicies_of_value
  let labelerpolicies_to_value = app_bsky_labeler_defs_labelerpolicies_to_value


end


(** lexicon "com.atproto.repo.strongRef"
  A URI with a content-hash fingerprint.
  *)
module Com_Atproto_Repo_StrongRef = struct
  (** {2 def main} *)

  type nonrec main = com_atproto_repo_strongref_main = {
    uri: string;
    cid: string;
  }
  let pp_main = pp_com_atproto_repo_strongref_main
  let main_of_value = com_atproto_repo_strongref_main_of_value
  let main_to_value = com_atproto_repo_strongref_main_to_value


end


(** lexicon "com.atproto.moderation.defs"
  *)
module Com_Atproto_Moderation_Defs = struct
  (** {2 def reasonType} *)

  type nonrec reasontype = com_atproto_moderation_defs_reasontype
  let pp_reasontype = pp_com_atproto_moderation_defs_reasontype
  let reasontype_of_value = com_atproto_moderation_defs_reasontype_of_value
  let reasontype_to_value = com_atproto_moderation_defs_reasontype_to_value


  (** {2 def reasonSpam} *)

  type nonrec reasonspam = com_atproto_moderation_defs_reasonspam
  let pp_reasonspam = pp_com_atproto_moderation_defs_reasonspam
  let reasonspam_of_value = com_atproto_moderation_defs_reasonspam_of_value
  let reasonspam_to_value = com_atproto_moderation_defs_reasonspam_to_value


  (** {2 def reasonViolation} *)

  type nonrec reasonviolation = com_atproto_moderation_defs_reasonviolation
  let pp_reasonviolation = pp_com_atproto_moderation_defs_reasonviolation
  let reasonviolation_of_value = com_atproto_moderation_defs_reasonviolation_of_value
  let reasonviolation_to_value = com_atproto_moderation_defs_reasonviolation_to_value


  (** {2 def reasonMisleading} *)

  type nonrec reasonmisleading = com_atproto_moderation_defs_reasonmisleading
  let pp_reasonmisleading = pp_com_atproto_moderation_defs_reasonmisleading
  let reasonmisleading_of_value = com_atproto_moderation_defs_reasonmisleading_of_value
  let reasonmisleading_to_value = com_atproto_moderation_defs_reasonmisleading_to_value


  (** {2 def reasonSexual} *)

  type nonrec reasonsexual = com_atproto_moderation_defs_reasonsexual
  let pp_reasonsexual = pp_com_atproto_moderation_defs_reasonsexual
  let reasonsexual_of_value = com_atproto_moderation_defs_reasonsexual_of_value
  let reasonsexual_to_value = com_atproto_moderation_defs_reasonsexual_to_value


  (** {2 def reasonRude} *)

  type nonrec reasonrude = com_atproto_moderation_defs_reasonrude
  let pp_reasonrude = pp_com_atproto_moderation_defs_reasonrude
  let reasonrude_of_value = com_atproto_moderation_defs_reasonrude_of_value
  let reasonrude_to_value = com_atproto_moderation_defs_reasonrude_to_value


  (** {2 def reasonOther} *)

  type nonrec reasonother = com_atproto_moderation_defs_reasonother
  let pp_reasonother = pp_com_atproto_moderation_defs_reasonother
  let reasonother_of_value = com_atproto_moderation_defs_reasonother_of_value
  let reasonother_to_value = com_atproto_moderation_defs_reasonother_to_value


  (** {2 def reasonAppeal} *)

  type nonrec reasonappeal = com_atproto_moderation_defs_reasonappeal
  let pp_reasonappeal = pp_com_atproto_moderation_defs_reasonappeal
  let reasonappeal_of_value = com_atproto_moderation_defs_reasonappeal_of_value
  let reasonappeal_to_value = com_atproto_moderation_defs_reasonappeal_to_value


  (** {2 def subjectType} *)

  type nonrec subjecttype = com_atproto_moderation_defs_subjecttype
  let pp_subjecttype = pp_com_atproto_moderation_defs_subjecttype
  let subjecttype_of_value = com_atproto_moderation_defs_subjecttype_of_value
  let subjecttype_to_value = com_atproto_moderation_defs_subjecttype_to_value


end


(** lexicon "app.bsky.embed.images"
  A set of images embedded in a Bluesky record (eg, a post).
  *)
module App_Bsky_Embed_Images = struct
  (** {2 def main} *)

  type nonrec main = app_bsky_embed_images_main = {
    images: app_bsky_embed_images_image list;
  }
  let pp_main = pp_app_bsky_embed_images_main
  let main_of_value = app_bsky_embed_images_main_of_value
  let main_to_value = app_bsky_embed_images_main_to_value


  (** {2 def image} *)

  type nonrec image = app_bsky_embed_images_image = {
    image: Blob.t;
    alt: string;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  let pp_image = pp_app_bsky_embed_images_image
  let image_of_value = app_bsky_embed_images_image_of_value
  let image_to_value = app_bsky_embed_images_image_to_value


  (** {2 def view} *)

  type nonrec view = app_bsky_embed_images_view = {
    images: app_bsky_embed_images_viewimage list;
  }
  let pp_view = pp_app_bsky_embed_images_view
  let view_of_value = app_bsky_embed_images_view_of_value
  let view_to_value = app_bsky_embed_images_view_to_value


  (** {2 def viewImage} *)

  type nonrec viewimage = app_bsky_embed_images_viewimage = {
    thumb: string;
    fullsize: string;
    alt: string;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  let pp_viewimage = pp_app_bsky_embed_images_viewimage
  let viewimage_of_value = app_bsky_embed_images_viewimage_of_value
  let viewimage_to_value = app_bsky_embed_images_viewimage_to_value


end


(** lexicon "app.bsky.embed.video"
  A video embedded in a Bluesky record (eg, a post).
  *)
module App_Bsky_Embed_Video = struct
  (** {2 def main} *)

  type nonrec main = app_bsky_embed_video_main = {
    video: Blob.t;
    captions: app_bsky_embed_video_caption list option;
    alt: string option;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  let pp_main = pp_app_bsky_embed_video_main
  let main_of_value = app_bsky_embed_video_main_of_value
  let main_to_value = app_bsky_embed_video_main_to_value


  (** {2 def caption} *)

  type nonrec caption = app_bsky_embed_video_caption = {
    lang: string;
    file: Blob.t;
  }
  let pp_caption = pp_app_bsky_embed_video_caption
  let caption_of_value = app_bsky_embed_video_caption_of_value
  let caption_to_value = app_bsky_embed_video_caption_to_value


  (** {2 def view} *)

  type nonrec view = app_bsky_embed_video_view = {
    cid: string;
    playlist: string;
    thumbnail: string option;
    alt: string option;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  let pp_view = pp_app_bsky_embed_video_view
  let view_of_value = app_bsky_embed_video_view_of_value
  let view_to_value = app_bsky_embed_video_view_to_value


end


(** lexicon "app.bsky.embed.defs"
  *)
module App_Bsky_Embed_Defs = struct
  (** {2 def aspectRatio} *)

  type nonrec aspectratio = app_bsky_embed_defs_aspectratio = {
    width: int64;
    height: int64;
  }
  let pp_aspectratio = pp_app_bsky_embed_defs_aspectratio
  let aspectratio_of_value = app_bsky_embed_defs_aspectratio_of_value
  let aspectratio_to_value = app_bsky_embed_defs_aspectratio_to_value


end


(** lexicon "app.bsky.richtext.facet"
  *)
module App_Bsky_Richtext_Facet = struct
  (** {2 def main} *)

  type nonrec main = app_bsky_richtext_facet_main = {
    index: app_bsky_richtext_facet_byteslice;
    features: [
    `App_bsky_richtext_facet_mention of app_bsky_richtext_facet_mention
    | `App_bsky_richtext_facet_link of app_bsky_richtext_facet_link
    | `App_bsky_richtext_facet_tag of app_bsky_richtext_facet_tag
    | `Other of Value.t (** Non closed union *)
    ] list;
  }
  let pp_main = pp_app_bsky_richtext_facet_main
  let main_of_value = app_bsky_richtext_facet_main_of_value
  let main_to_value = app_bsky_richtext_facet_main_to_value


  (** {2 def mention} *)

  type nonrec mention = app_bsky_richtext_facet_mention = {
    did: string;
  }
  let pp_mention = pp_app_bsky_richtext_facet_mention
  let mention_of_value = app_bsky_richtext_facet_mention_of_value
  let mention_to_value = app_bsky_richtext_facet_mention_to_value


  (** {2 def link} *)

  type nonrec link = app_bsky_richtext_facet_link = {
    uri: string;
  }
  let pp_link = pp_app_bsky_richtext_facet_link
  let link_of_value = app_bsky_richtext_facet_link_of_value
  let link_to_value = app_bsky_richtext_facet_link_to_value


  (** {2 def tag} *)

  type nonrec tag = app_bsky_richtext_facet_tag = {
    tag: string;
  }
  let pp_tag = pp_app_bsky_richtext_facet_tag
  let tag_of_value = app_bsky_richtext_facet_tag_of_value
  let tag_to_value = app_bsky_richtext_facet_tag_to_value


  (** {2 def byteSlice} *)

  type nonrec byteslice = app_bsky_richtext_facet_byteslice = {
    byteStart: int64;
    byteEnd: int64;
  }
  let pp_byteslice = pp_app_bsky_richtext_facet_byteslice
  let byteslice_of_value = app_bsky_richtext_facet_byteslice_of_value
  let byteslice_to_value = app_bsky_richtext_facet_byteslice_to_value


end


(** lexicon "com.atproto.label.defs"
  *)
module Com_Atproto_Label_Defs = struct
  (** {2 def label} *)

  type nonrec label = com_atproto_label_defs_label = {
    ver: int64 option;
    src: string;
    uri: string;
    cid: string option;
    val_: string;
    neg: bool option;
    cts: string;
    exp: string option;
    sig_: bytes option;
  }
  let pp_label = pp_com_atproto_label_defs_label
  let label_of_value = com_atproto_label_defs_label_of_value
  let label_to_value = com_atproto_label_defs_label_to_value


  (** {2 def selfLabels} *)

  type nonrec selflabels = com_atproto_label_defs_selflabels = {
    values: com_atproto_label_defs_selflabel list;
  }
  let pp_selflabels = pp_com_atproto_label_defs_selflabels
  let selflabels_of_value = com_atproto_label_defs_selflabels_of_value
  let selflabels_to_value = com_atproto_label_defs_selflabels_to_value


  (** {2 def selfLabel} *)

  type nonrec selflabel = com_atproto_label_defs_selflabel = {
    val_: string;
  }
  let pp_selflabel = pp_com_atproto_label_defs_selflabel
  let selflabel_of_value = com_atproto_label_defs_selflabel_of_value
  let selflabel_to_value = com_atproto_label_defs_selflabel_to_value


  (** {2 def labelValueDefinition} *)

  type nonrec labelvaluedefinition = com_atproto_label_defs_labelvaluedefinition = {
    identifier: string;
    severity: string;
    blurs: string;
    defaultSetting: string option;
    adultOnly: bool option;
    locales: com_atproto_label_defs_labelvaluedefinitionstrings list;
  }
  let pp_labelvaluedefinition = pp_com_atproto_label_defs_labelvaluedefinition
  let labelvaluedefinition_of_value = com_atproto_label_defs_labelvaluedefinition_of_value
  let labelvaluedefinition_to_value = com_atproto_label_defs_labelvaluedefinition_to_value


  (** {2 def labelValueDefinitionStrings} *)

  type nonrec labelvaluedefinitionstrings = com_atproto_label_defs_labelvaluedefinitionstrings = {
    lang: string;
    name: string;
    description: string;
  }
  let pp_labelvaluedefinitionstrings = pp_com_atproto_label_defs_labelvaluedefinitionstrings
  let labelvaluedefinitionstrings_of_value = com_atproto_label_defs_labelvaluedefinitionstrings_of_value
  let labelvaluedefinitionstrings_to_value = com_atproto_label_defs_labelvaluedefinitionstrings_to_value


  (** {2 def labelValue} *)

  type nonrec labelvalue = com_atproto_label_defs_labelvalue
  let pp_labelvalue = pp_com_atproto_label_defs_labelvalue
  let labelvalue_of_value = com_atproto_label_defs_labelvalue_of_value
  let labelvalue_to_value = com_atproto_label_defs_labelvalue_to_value


end


(** lexicon "app.bsky.feed.threadgate"
  *)
module App_Bsky_Feed_Threadgate = struct
  (** {2 def main} *)

  (** Record defining interaction gating rules for a thread (aka, reply controls). The record key (rkey) of the threadgate record must match the record key of the thread's root post, and that record must be in the same repository. *)
  type main = {
    post: string;
    allow: [
    `App_bsky_feed_threadgate_mentionrule of app_bsky_feed_threadgate_mentionrule
    | `App_bsky_feed_threadgate_followerrule of app_bsky_feed_threadgate_followerrule
    | `App_bsky_feed_threadgate_followingrule of app_bsky_feed_threadgate_followingrule
    | `App_bsky_feed_threadgate_listrule of app_bsky_feed_threadgate_listrule
    | `Other of Value.t (** Non closed union *)
    ] list option;
    createdAt: string;
    hiddenReplies: string list option;
  }  [@@deriving show {with_path=false}, make]



  (** {2 def mentionRule} *)

  type nonrec mentionrule = app_bsky_feed_threadgate_mentionrule
  let pp_mentionrule = pp_app_bsky_feed_threadgate_mentionrule
  let mentionrule_of_value = app_bsky_feed_threadgate_mentionrule_of_value
  let mentionrule_to_value = app_bsky_feed_threadgate_mentionrule_to_value


  (** {2 def followerRule} *)

  type nonrec followerrule = app_bsky_feed_threadgate_followerrule
  let pp_followerrule = pp_app_bsky_feed_threadgate_followerrule
  let followerrule_of_value = app_bsky_feed_threadgate_followerrule_of_value
  let followerrule_to_value = app_bsky_feed_threadgate_followerrule_to_value


  (** {2 def followingRule} *)

  type nonrec followingrule = app_bsky_feed_threadgate_followingrule
  let pp_followingrule = pp_app_bsky_feed_threadgate_followingrule
  let followingrule_of_value = app_bsky_feed_threadgate_followingrule_of_value
  let followingrule_to_value = app_bsky_feed_threadgate_followingrule_to_value


  (** {2 def listRule} *)

  type nonrec listrule = app_bsky_feed_threadgate_listrule = {
    list: string;
  }
  let pp_listrule = pp_app_bsky_feed_threadgate_listrule
  let listrule_of_value = app_bsky_feed_threadgate_listrule_of_value
  let listrule_to_value = app_bsky_feed_threadgate_listrule_to_value


end


(** lexicon "app.bsky.feed.postgate"
  *)
module App_Bsky_Feed_Postgate = struct
  (** {2 def main} *)

  (** Record defining interaction rules for a post. The record key (rkey) of the postgate record must match the record key of the post, and that record must be in the same repository. *)
  type main = {
    createdAt: string;
    post: string;
    detachedEmbeddingUris: string list option;
    embeddingRules: [
    `App_bsky_feed_postgate_disablerule of app_bsky_feed_postgate_disablerule
    | `Other of Value.t (** Non closed union *)
    ] list option;
  }  [@@deriving show {with_path=false}, make]



  (** {2 def disableRule} *)

  type nonrec disablerule = app_bsky_feed_postgate_disablerule
  let pp_disablerule = pp_app_bsky_feed_postgate_disablerule
  let disablerule_of_value = app_bsky_feed_postgate_disablerule_of_value
  let disablerule_to_value = app_bsky_feed_postgate_disablerule_to_value


end


(** lexicon "app.bsky.embed.external"
  *)
module App_Bsky_Embed_External = struct
  (** {2 def main} *)

  type nonrec main = app_bsky_embed_external_main = {
    external_: app_bsky_embed_external_external;
  }
  let pp_main = pp_app_bsky_embed_external_main
  let main_of_value = app_bsky_embed_external_main_of_value
  let main_to_value = app_bsky_embed_external_main_to_value


  (** {2 def external} *)

  type nonrec external_ = app_bsky_embed_external_external = {
    uri: string;
    title: string;
    description: string;
    thumb: Blob.t option;
  }
  let pp_external_ = pp_app_bsky_embed_external_external
  let external__of_value = app_bsky_embed_external_external_of_value
  let external__to_value = app_bsky_embed_external_external_to_value


  (** {2 def view} *)

  type nonrec view = app_bsky_embed_external_view = {
    external_: app_bsky_embed_external_viewexternal;
  }
  let pp_view = pp_app_bsky_embed_external_view
  let view_of_value = app_bsky_embed_external_view_of_value
  let view_to_value = app_bsky_embed_external_view_to_value


  (** {2 def viewExternal} *)

  type nonrec viewexternal = app_bsky_embed_external_viewexternal = {
    uri: string;
    title: string;
    description: string;
    thumb: string option;
  }
  let pp_viewexternal = pp_app_bsky_embed_external_viewexternal
  let viewexternal_of_value = app_bsky_embed_external_viewexternal_of_value
  let viewexternal_to_value = app_bsky_embed_external_viewexternal_to_value


end


(* geherated by Cephalopod_lexicon's codegen tool, do not modify *)
open Cephalopod_dasl


(** Type definitions *)
module Types = struct
  (** def "com.atproto.admin.defs#repoRef" *)
  type com_atproto_admin_defs_reporef = {
    did: string;
  }

  (** def "com.atproto.repo.strongRef#main" *)
  type com_atproto_repo_strongref_main = {
    uri: string;
    cid: string;
  }

  (** def "tools.ozone.moderation.defs#accountHosting" *)
  type tools_ozone_moderation_defs_accounthosting = {
    status: string;
    updatedat: string option;
    createdat: string option;
    deletedat: string option;
    deactivatedat: string option;
    reactivatedat: string option;
  }

  (** def "tools.ozone.moderation.defs#recordHosting" *)
  type tools_ozone_moderation_defs_recordhosting = {
    status: string;
    updatedat: string option;
    createdat: string option;
    deletedat: string option;
  }

  (** def "tools.ozone.moderation.defs#subjectReviewState" *)
  type tools_ozone_moderation_defs_subjectreviewstate = string

  (** def "tools.ozone.moderation.defs#accountStats" *)
  type tools_ozone_moderation_defs_accountstats = {
    reportcount: int64;
    appealcount: int64;
    suspendcount: int64;
    escalatecount: int64;
    takedowncount: int64;
  }

  (** def "tools.ozone.moderation.defs#recordsStats" *)
  type tools_ozone_moderation_defs_recordsstats = {
    totalreports: int64;
    reportedcount: int64;
    escalatedcount: int64;
    appealedcount: int64;
    subjectcount: int64;
    pendingcount: int64;
    processedcount: int64;
    takendowncount: int64;
  }

  (** def "tools.ozone.moderation.defs#subjectStatusView" *)
  type tools_ozone_moderation_defs_subjectstatusview = {
    id: int64;
    subject: [
    | `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Other of Value.t (** Non closed union *)
    ];
    hosting: [
    | `Tools_ozone_moderation_defs_accounthosting of tools_ozone_moderation_defs_accounthosting
    | `Tools_ozone_moderation_defs_recordhosting of tools_ozone_moderation_defs_recordhosting
    | `Other of Value.t (** Non closed union *)
    ] option;
    subjectblobcids: string list option;
    subjectrepohandle: string option;
    updatedat: string;
    createdat: string;
    reviewstate: tools_ozone_moderation_defs_subjectreviewstate;
    comment: string option;
    priorityscore: int64 option;
    muteuntil: string option;
    mutereportinguntil: string option;
    lastreviewedby: string option;
    lastreviewedat: string option;
    lastreportedat: string option;
    lastappealedat: string option;
    takendown: bool option;
    appealed: bool option;
    suspenduntil: string option;
    tags: string list option;
    accountstats: tools_ozone_moderation_defs_accountstats option;
    recordsstats: tools_ozone_moderation_defs_recordsstats option;
  }

  (** def "tools.ozone.moderation.defs#moderationDetail" *)
  type tools_ozone_moderation_defs_moderationdetail = {
    subjectstatus: tools_ozone_moderation_defs_subjectstatusview;
  }

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

  (** def "com.atproto.server.defs#inviteCodeUse" *)
  type com_atproto_server_defs_invitecodeuse = {
    usedby: string;
    usedat: string;
  }

  (** def "com.atproto.server.defs#inviteCode" *)
  type com_atproto_server_defs_invitecode = {
    code: string;
    available: int64;
    disabled: bool;
    foraccount: string;
    createdby: string;
    createdat: string;
    uses: com_atproto_server_defs_invitecodeuse list;
  }

  (** def "com.atproto.admin.defs#threatSignature" *)
  type com_atproto_admin_defs_threatsignature = {
    property: string;
    value: string;
  }

  (** def "tools.ozone.moderation.defs#repoViewDetail" *)
  type tools_ozone_moderation_defs_repoviewdetail = {
    did: string;
    handle: string;
    email: string option;
    relatedrecords: Value.t (* unknown *) list;
    indexedat: string;
    moderation: tools_ozone_moderation_defs_moderationdetail;
    labels: com_atproto_label_defs_label list option;
    invitedby: com_atproto_server_defs_invitecode option;
    invites: com_atproto_server_defs_invitecode list option;
    invitesdisabled: bool option;
    invitenote: string option;
    emailconfirmedat: string option;
    deactivatedat: string option;
    threatsignatures: com_atproto_admin_defs_threatsignature list option;
  }

  (** def "chat.bsky.convo.defs#logBeginConvo" *)
  type chat_bsky_convo_defs_logbeginconvo = {
    rev: string;
    convoid: string;
  }

  (** def "app.bsky.actor.defs#profileAssociatedChat" *)
  type app_bsky_actor_defs_profileassociatedchat = {
    allowincoming: string;
  }

  (** def "app.bsky.actor.defs#profileAssociated" *)
  type app_bsky_actor_defs_profileassociated = {
    lists: int64;
    feedgens: int64;
    starterpacks: int64;
    labeler: bool;
    chat: app_bsky_actor_defs_profileassociatedchat;
  }

  (** def "app.bsky.graph.defs#listPurpose" *)
  type app_bsky_graph_defs_listpurpose = string

  (** def "app.bsky.graph.defs#listViewerState" *)
  type app_bsky_graph_defs_listviewerstate = {
    muted: bool;
    blocked: string;
  }

  (** def "app.bsky.graph.defs#listViewBasic" *)
  type app_bsky_graph_defs_listviewbasic = {
    uri: string;
    cid: string;
    name: string;
    purpose: app_bsky_graph_defs_listpurpose;
    avatar: string option;
    listitemcount: int64 option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_graph_defs_listviewerstate option;
    indexedat: string option;
  }

  (** def "app.bsky.actor.defs#verificationView" *)
  type app_bsky_actor_defs_verificationview = {
    issuer: string;
    uri: string;
    isvalid: bool;
    createdat: string;
  }

  (** def "app.bsky.actor.defs#verificationState" *)
  type app_bsky_actor_defs_verificationstate = {
    verifications: app_bsky_actor_defs_verificationview list;
    verifiedstatus: string;
    trustedverifierstatus: string;
  }

  (** def "app.bsky.embed.external#viewExternal" *)
  type app_bsky_embed_external_viewexternal = {
    uri: string;
    title: string;
    description: string;
    thumb: string option;
  }

  (** def "app.bsky.embed.external#view" *)
  type app_bsky_embed_external_view = {
    external_: app_bsky_embed_external_viewexternal;
  }

  (** def "app.bsky.actor.defs#statusView" *)
  type app_bsky_actor_defs_statusview = {
    status: string;
    record: Value.t (* unknown *);
    embed: [
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    expiresat: string option;
    isactive: bool option;
  }

  (** def "app.bsky.actor.defs#profileViewBasic" *)
  type app_bsky_actor_defs_profileviewbasic = {
    did: string;
    handle: string;
    displayname: string option;
    avatar: string option;
    associated: app_bsky_actor_defs_profileassociated option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    createdat: string option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }

  (** def "app.bsky.actor.defs#viewerState" *)
  and app_bsky_actor_defs_viewerstate = {
    muted: bool;
    mutedbylist: app_bsky_graph_defs_listviewbasic;
    blockedby: bool;
    blocking: string;
    blockingbylist: app_bsky_graph_defs_listviewbasic;
    following: string;
    followedby: string;
    knownfollowers: app_bsky_actor_defs_knownfollowers;
  }

  (** def "app.bsky.actor.defs#knownFollowers" *)
  and app_bsky_actor_defs_knownfollowers = {
    count: int64;
    followers: app_bsky_actor_defs_profileviewbasic list;
  }

  (** def "app.bsky.graph.defs#starterPackViewBasic" *)
  type app_bsky_graph_defs_starterpackviewbasic = {
    uri: string;
    cid: string;
    record: Value.t (* unknown *);
    creator: app_bsky_actor_defs_profileviewbasic;
    listitemcount: int64 option;
    joinedweekcount: int64 option;
    joinedalltimecount: int64 option;
    labels: com_atproto_label_defs_label list option;
    indexedat: string;
  }

  (** def "app.bsky.actor.defs#profileViewDetailed" *)
  type app_bsky_actor_defs_profileviewdetailed = {
    did: string;
    handle: string;
    displayname: string option;
    description: string option;
    avatar: string option;
    banner: string option;
    followerscount: int64 option;
    followscount: int64 option;
    postscount: int64 option;
    associated: app_bsky_actor_defs_profileassociated option;
    joinedviastarterpack: app_bsky_graph_defs_starterpackviewbasic option;
    indexedat: string option;
    createdat: string option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    pinnedpost: com_atproto_repo_strongref_main option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }

  (** def "app.bsky.actor.defs#profileView" *)
  type app_bsky_actor_defs_profileview = {
    did: string;
    handle: string;
    displayname: string option;
    description: string option;
    avatar: string option;
    associated: app_bsky_actor_defs_profileassociated option;
    indexedat: string option;
    createdat: string option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }

  (** def "app.bsky.richtext.facet#byteSlice" *)
  type app_bsky_richtext_facet_byteslice = {
    bytestart: int64;
    byteend: int64;
  }

  (** def "app.bsky.richtext.facet#mention" *)
  type app_bsky_richtext_facet_mention = {
    did: string;
  }

  (** def "app.bsky.richtext.facet#link" *)
  type app_bsky_richtext_facet_link = {
    uri: string;
  }

  (** def "app.bsky.richtext.facet#tag" *)
  type app_bsky_richtext_facet_tag = {
    tag: string;
  }

  (** def "app.bsky.richtext.facet#main" *)
  type app_bsky_richtext_facet_main = {
    index: app_bsky_richtext_facet_byteslice;
    features: [
    | `App_bsky_richtext_facet_mention of app_bsky_richtext_facet_mention
    | `App_bsky_richtext_facet_link of app_bsky_richtext_facet_link
    | `App_bsky_richtext_facet_tag of app_bsky_richtext_facet_tag
    | `Other of Value.t (** Non closed union *)
    ] list;
  }

  (** def "app.bsky.feed.defs#generatorViewerState" *)
  type app_bsky_feed_defs_generatorviewerstate = {
    like: string;
  }

  (** def "app.bsky.feed.defs#generatorView" *)
  type app_bsky_feed_defs_generatorview = {
    uri: string;
    cid: string;
    did: string;
    creator: app_bsky_actor_defs_profileview;
    displayname: string;
    description: string option;
    descriptionfacets: app_bsky_richtext_facet_main list option;
    avatar: string option;
    likecount: int64 option;
    acceptsinteractions: bool option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_feed_defs_generatorviewerstate option;
    contentmode: string option;
    indexedat: string;
  }

  (** def "app.bsky.embed.defs#aspectRatio" *)
  type app_bsky_embed_defs_aspectratio = {
    width: int64;
    height: int64;
  }

  (** def "app.bsky.embed.images#viewImage" *)
  type app_bsky_embed_images_viewimage = {
    thumb: string;
    fullsize: string;
    alt: string;
    aspectratio: app_bsky_embed_defs_aspectratio option;
  }

  (** def "app.bsky.embed.images#view" *)
  type app_bsky_embed_images_view = {
    images: app_bsky_embed_images_viewimage list;
  }

  (** def "app.bsky.embed.video#view" *)
  type app_bsky_embed_video_view = {
    cid: string;
    playlist: string;
    thumbnail: string option;
    alt: string option;
    aspectratio: app_bsky_embed_defs_aspectratio option;
  }

  (** def "app.bsky.embed.record#viewNotFound" *)
  type app_bsky_embed_record_viewnotfound = {
    uri: string;
    notfound: bool;
  }

  (** def "app.bsky.feed.defs#blockedAuthor" *)
  type app_bsky_feed_defs_blockedauthor = {
    did: string;
    viewer: app_bsky_actor_defs_viewerstate option;
  }

  (** def "app.bsky.embed.record#viewBlocked" *)
  type app_bsky_embed_record_viewblocked = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }

  (** def "app.bsky.embed.record#viewDetached" *)
  type app_bsky_embed_record_viewdetached = {
    uri: string;
    detached: bool;
  }

  (** def "app.bsky.graph.defs#listView" *)
  type app_bsky_graph_defs_listview = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    name: string;
    purpose: app_bsky_graph_defs_listpurpose;
    description: string option;
    descriptionfacets: app_bsky_richtext_facet_main list option;
    avatar: string option;
    listitemcount: int64 option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_graph_defs_listviewerstate option;
    indexedat: string;
  }

  (** def "app.bsky.labeler.defs#labelerViewerState" *)
  type app_bsky_labeler_defs_labelerviewerstate = {
    like: string;
  }

  (** def "app.bsky.labeler.defs#labelerView" *)
  type app_bsky_labeler_defs_labelerview = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    likecount: int64 option;
    viewer: app_bsky_labeler_defs_labelerviewerstate option;
    indexedat: string;
    labels: com_atproto_label_defs_label list option;
  }

  (** def "app.bsky.embed.record#view" *)
  type app_bsky_embed_record_view = {
    record: [
    | `App_bsky_embed_record_viewrecord of app_bsky_embed_record_viewrecord
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

  (** def "app.bsky.embed.record#viewRecord" *)
  and app_bsky_embed_record_viewrecord = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileviewbasic;
    value: Value.t (* unknown *);
    labels: com_atproto_label_defs_label list option;
    replycount: int64 option;
    repostcount: int64 option;
    likecount: int64 option;
    quotecount: int64 option;
    embeds: [
    | `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `App_bsky_embed_recordwithmedia_view of app_bsky_embed_recordwithmedia_view
    | `Other of Value.t (** Non closed union *)
    ] list option;
    indexedat: string;
  }

  (** def "app.bsky.embed.recordWithMedia#view" *)
  and app_bsky_embed_recordwithmedia_view = {
    record: app_bsky_embed_record_view;
    media: [
    | `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `Other of Value.t (** Non closed union *)
    ];
  }

  (** def "chat.bsky.convo.defs#reactionViewSender" *)
  type chat_bsky_convo_defs_reactionviewsender = {
    did: string;
  }

  (** def "chat.bsky.convo.defs#reactionView" *)
  type chat_bsky_convo_defs_reactionview = {
    value: string;
    sender: chat_bsky_convo_defs_reactionviewsender;
    createdat: string;
  }

  (** def "chat.bsky.convo.defs#messageViewSender" *)
  type chat_bsky_convo_defs_messageviewsender = {
    did: string;
  }

  (** def "chat.bsky.convo.defs#messageView" *)
  type chat_bsky_convo_defs_messageview = {
    id: string;
    rev: string;
    text: string;
    facets: app_bsky_richtext_facet_main list option;
    embed: [
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    reactions: chat_bsky_convo_defs_reactionview list option;
    sender: chat_bsky_convo_defs_messageviewsender;
    sentat: string;
  }

  (** def "chat.bsky.convo.defs#messageAndReactionView" *)
  type chat_bsky_convo_defs_messageandreactionview = {
    message: chat_bsky_convo_defs_messageview;
    reaction: chat_bsky_convo_defs_reactionview;
  }

  (** def "com.atproto.repo.applyWrites#create" *)
  type com_atproto_repo_applywrites_create = {
    collection: string;
    rkey: string option;
    value: Value.t (* unknown *);
  }

  (** def "com.atproto.sync.defs#hostStatus" *)
  type com_atproto_sync_defs_hoststatus = string

  (** def "com.atproto.sync.subscribeRepos#account" *)
  type com_atproto_sync_subscriberepos_account = {
    seq: int64;
    did: string;
    time: string;
    active: bool;
    status: string option;
  }

  (** def "tools.ozone.moderation.defs#reviewOpen" *)
  type tools_ozone_moderation_defs_reviewopen = [`Tools_ozone_moderation_defs_reviewopen]

  (** def "com.atproto.moderation.defs#reasonType" *)
  type com_atproto_moderation_defs_reasontype = string

  (** def "tools.ozone.moderation.defs#recordViewNotFound" *)
  type tools_ozone_moderation_defs_recordviewnotfound = {
    uri: string;
  }

  (** def "tools.ozone.moderation.defs#reporterStats" *)
  type tools_ozone_moderation_defs_reporterstats = {
    did: string;
    accountreportcount: int64;
    recordreportcount: int64;
    reportedaccountcount: int64;
    reportedrecordcount: int64;
    takendownaccountcount: int64;
    takendownrecordcount: int64;
    labeledaccountcount: int64;
    labeledrecordcount: int64;
  }

  (** def "app.bsky.feed.defs#requestMore" *)
  type app_bsky_feed_defs_requestmore = [`App_bsky_feed_defs_requestmore]

  (** def "app.bsky.feed.defs#interactionSeen" *)
  type app_bsky_feed_defs_interactionseen = [`App_bsky_feed_defs_interactionseen]

  (** def "com.atproto.repo.defs#commitMeta" *)
  type com_atproto_repo_defs_commitmeta = {
    cid: string;
    rev: string;
  }

  (** def "tools.ozone.moderation.defs#modEventLabel" *)
  type tools_ozone_moderation_defs_modeventlabel = {
    comment: string option;
    createlabelvals: string list;
    negatelabelvals: string list;
    durationinhours: int64 option;
  }

  (** def "app.bsky.actor.defs#hiddenPostsPref" *)
  type app_bsky_actor_defs_hiddenpostspref = {
    items: string list;
  }

  (** def "com.atproto.label.subscribeLabels#info" *)
  type com_atproto_label_subscribelabels_info = {
    name: string;
    message: string option;
  }

  (** def "app.bsky.feed.describeFeedGenerator#feed" *)
  type app_bsky_feed_describefeedgenerator_feed = {
    uri: string;
  }

  (** def "chat.bsky.convo.defs#deletedMessageView" *)
  type chat_bsky_convo_defs_deletedmessageview = {
    id: string;
    rev: string;
    sender: chat_bsky_convo_defs_messageviewsender;
    sentat: string;
  }

  (** def "tools.ozone.moderation.defs#modEventComment" *)
  type tools_ozone_moderation_defs_modeventcomment = {
    comment: string;
    sticky: bool;
  }

  (** def "tools.ozone.moderation.defs#modEventTag" *)
  type tools_ozone_moderation_defs_modeventtag = {
    add: string list;
    remove: string list;
    comment: string option;
  }

  (** def "app.bsky.actor.defs#labelerPrefItem" *)
  type app_bsky_actor_defs_labelerprefitem = {
    did: string;
  }

  (** def "app.bsky.unspecced.getTaggedSuggestions#suggestion" *)
  type app_bsky_unspecced_gettaggedsuggestions_suggestion = {
    tag: string;
    subjecttype: string;
    subject: string;
  }

  (** def "tools.ozone.moderation.defs#imageDetails" *)
  type tools_ozone_moderation_defs_imagedetails = {
    width: int64;
    height: int64;
  }

  (** def "tools.ozone.moderation.defs#videoDetails" *)
  type tools_ozone_moderation_defs_videodetails = {
    width: int64;
    height: int64;
    length: int64;
  }

  (** def "tools.ozone.moderation.defs#moderation" *)
  type tools_ozone_moderation_defs_moderation = {
    subjectstatus: tools_ozone_moderation_defs_subjectstatusview;
  }

  (** def "tools.ozone.moderation.defs#blobView" *)
  type tools_ozone_moderation_defs_blobview = {
    cid: string;
    mimetype: string;
    size: int64;
    createdat: string;
    details: [
    | `Tools_ozone_moderation_defs_imagedetails of tools_ozone_moderation_defs_imagedetails
    | `Tools_ozone_moderation_defs_videodetails of tools_ozone_moderation_defs_videodetails
    | `Other of Value.t (** Non closed union *)
    ] option;
    moderation: tools_ozone_moderation_defs_moderation option;
  }

  (** def "tools.ozone.moderation.defs#repoView" *)
  type tools_ozone_moderation_defs_repoview = {
    did: string;
    handle: string;
    email: string option;
    relatedrecords: Value.t (* unknown *) list;
    indexedat: string;
    moderation: tools_ozone_moderation_defs_moderation;
    invitedby: com_atproto_server_defs_invitecode option;
    invitesdisabled: bool option;
    invitenote: string option;
    deactivatedat: string option;
    threatsignatures: com_atproto_admin_defs_threatsignature list option;
  }

  (** def "tools.ozone.moderation.defs#recordViewDetail" *)
  type tools_ozone_moderation_defs_recordviewdetail = {
    uri: string;
    cid: string;
    value: Value.t (* unknown *);
    blobs: tools_ozone_moderation_defs_blobview list;
    labels: com_atproto_label_defs_label list option;
    indexedat: string;
    moderation: tools_ozone_moderation_defs_moderationdetail;
    repo: tools_ozone_moderation_defs_repoview;
  }

  (** def "tools.ozone.team.defs#roleModerator" *)
  type tools_ozone_team_defs_rolemoderator = [`Tools_ozone_team_defs_rolemoderator]

  (** def "app.bsky.embed.external#external" *)
  type app_bsky_embed_external_external = {
    uri: string;
    title: string;
    description: string;
    thumb: Blob.t option;
  }

  (** def "com.atproto.label.defs#labelValueDefinitionStrings" *)
  type com_atproto_label_defs_labelvaluedefinitionstrings = {
    lang: string;
    name: string;
    description: string;
  }

  (** def "com.atproto.label.defs#labelValueDefinition" *)
  type com_atproto_label_defs_labelvaluedefinition = {
    identifier: string;
    severity: string;
    blurs: string;
    defaultsetting: string option;
    adultonly: bool option;
    locales: com_atproto_label_defs_labelvaluedefinitionstrings list;
  }

  (** def "com.atproto.label.defs#labelValue" *)
  type com_atproto_label_defs_labelvalue = string

  (** def "app.bsky.feed.defs#interaction" *)
  type app_bsky_feed_defs_interaction = {
    item: string;
    event: string;
    feedcontext: string;
  }

  (** def "chat.bsky.convo.defs#logReadMessage" *)
  type chat_bsky_convo_defs_logreadmessage = {
    rev: string;
    convoid: string;
    message: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ];
  }

  (** def "app.bsky.embed.video#caption" *)
  type app_bsky_embed_video_caption = {
    lang: string;
    file: Blob.t;
  }

  (** def "com.atproto.repo.applyWrites#createResult" *)
  type com_atproto_repo_applywrites_createresult = {
    uri: string;
    cid: string;
    validationstatus: string option;
  }

  (** def "tools.ozone.server.getConfig#viewerConfig" *)
  type tools_ozone_server_getconfig_viewerconfig = {
    role: string;
  }

  (** def "com.atproto.admin.defs#statusAttr" *)
  type com_atproto_admin_defs_statusattr = {
    applied: bool;
    ref: string option;
  }

  (** def "com.atproto.server.createAppPassword#appPassword" *)
  type com_atproto_server_createapppassword_apppassword = {
    name: string;
    password: string;
    createdat: string;
    privileged: bool option;
  }

  (** def "app.bsky.feed.defs#viewerState" *)
  type app_bsky_feed_defs_viewerstate = {
    repost: string;
    like: string;
    threadmuted: bool;
    replydisabled: bool;
    embeddingdisabled: bool;
    pinned: bool;
  }

  (** def "app.bsky.feed.defs#threadgateView" *)
  type app_bsky_feed_defs_threadgateview = {
    uri: string;
    cid: string;
    record: Value.t (* unknown *);
    lists: app_bsky_graph_defs_listviewbasic list;
  }

  (** def "app.bsky.feed.defs#postView" *)
  type app_bsky_feed_defs_postview = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileviewbasic;
    record: Value.t (* unknown *);
    embed: [
    | `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `App_bsky_embed_recordwithmedia_view of app_bsky_embed_recordwithmedia_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    replycount: int64 option;
    repostcount: int64 option;
    likecount: int64 option;
    quotecount: int64 option;
    indexedat: string;
    viewer: app_bsky_feed_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    threadgate: app_bsky_feed_defs_threadgateview option;
  }

  (** def "app.bsky.feed.defs#notFoundPost" *)
  type app_bsky_feed_defs_notfoundpost = {
    uri: string;
    notfound: bool;
  }

  (** def "app.bsky.feed.defs#blockedPost" *)
  type app_bsky_feed_defs_blockedpost = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }

  (** def "app.bsky.feed.defs#replyRef" *)
  type app_bsky_feed_defs_replyref = {
    root: [
    | `App_bsky_feed_defs_postview of app_bsky_feed_defs_postview
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ];
    parent: [
    | `App_bsky_feed_defs_postview of app_bsky_feed_defs_postview
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ];
    grandparentauthor: app_bsky_actor_defs_profileviewbasic option;
  }

  (** def "app.bsky.unspecced.getConfig#liveNowConfig" *)
  type app_bsky_unspecced_getconfig_livenowconfig = {
    did: string;
    domains: string list;
  }

  (** def "com.atproto.repo.applyWrites#update" *)
  type com_atproto_repo_applywrites_update = {
    collection: string;
    rkey: string;
    value: Value.t (* unknown *);
  }

  (** def "app.bsky.actor.defs#personalDetailsPref" *)
  type app_bsky_actor_defs_personaldetailspref = {
    birthdate: string;
  }

  (** def "tools.ozone.moderation.defs#modEventTakedown" *)
  type tools_ozone_moderation_defs_modeventtakedown = {
    comment: string;
    durationinhours: int64;
    acknowledgeaccountsubjects: bool;
    policies: string list;
  }

  (** def "tools.ozone.moderation.defs#modEventReverseTakedown" *)
  type tools_ozone_moderation_defs_modeventreversetakedown = {
    comment: string;
  }

  (** def "tools.ozone.moderation.defs#modEventReport" *)
  type tools_ozone_moderation_defs_modeventreport = {
    comment: string option;
    isreportermuted: bool option;
    reporttype: com_atproto_moderation_defs_reasontype;
  }

  (** def "tools.ozone.moderation.defs#modEventAcknowledge" *)
  type tools_ozone_moderation_defs_modeventacknowledge = {
    comment: string;
    acknowledgeaccountsubjects: bool;
  }

  (** def "tools.ozone.moderation.defs#modEventEscalate" *)
  type tools_ozone_moderation_defs_modeventescalate = {
    comment: string;
  }

  (** def "tools.ozone.moderation.defs#modEventMute" *)
  type tools_ozone_moderation_defs_modeventmute = {
    comment: string option;
    durationinhours: int64;
  }

  (** def "tools.ozone.moderation.defs#modEventUnmute" *)
  type tools_ozone_moderation_defs_modeventunmute = {
    comment: string;
  }

  (** def "tools.ozone.moderation.defs#modEventMuteReporter" *)
  type tools_ozone_moderation_defs_modeventmutereporter = {
    comment: string;
    durationinhours: int64;
  }

  (** def "tools.ozone.moderation.defs#modEventUnmuteReporter" *)
  type tools_ozone_moderation_defs_modeventunmutereporter = {
    comment: string;
  }

  (** def "tools.ozone.moderation.defs#modEventEmail" *)
  type tools_ozone_moderation_defs_modeventemail = {
    subjectline: string;
    content: string option;
    comment: string option;
  }

  (** def "tools.ozone.moderation.defs#modEventResolveAppeal" *)
  type tools_ozone_moderation_defs_modeventresolveappeal = {
    comment: string;
  }

  (** def "tools.ozone.moderation.defs#modEventDivert" *)
  type tools_ozone_moderation_defs_modeventdivert = {
    comment: string;
  }

  (** def "tools.ozone.moderation.defs#accountEvent" *)
  type tools_ozone_moderation_defs_accountevent = {
    comment: string option;
    active: bool;
    status: string option;
    timestamp: string;
  }

  (** def "tools.ozone.moderation.defs#identityEvent" *)
  type tools_ozone_moderation_defs_identityevent = {
    comment: string option;
    handle: string option;
    pdshost: string option;
    tombstone: bool option;
    timestamp: string;
  }

  (** def "tools.ozone.moderation.defs#recordEvent" *)
  type tools_ozone_moderation_defs_recordevent = {
    comment: string option;
    op: string;
    cid: string option;
    timestamp: string;
  }

  (** def "tools.ozone.moderation.defs#modEventPriorityScore" *)
  type tools_ozone_moderation_defs_modeventpriorityscore = {
    comment: string option;
    score: int64;
  }

  (** def "chat.bsky.convo.defs#messageRef" *)
  type chat_bsky_convo_defs_messageref = {
    did: string;
    convoid: string;
    messageid: string;
  }

  (** def "tools.ozone.moderation.defs#modEventView" *)
  type tools_ozone_moderation_defs_modeventview = {
    id: int64;
    event: [
    | `Tools_ozone_moderation_defs_modeventtakedown of tools_ozone_moderation_defs_modeventtakedown
    | `Tools_ozone_moderation_defs_modeventreversetakedown of tools_ozone_moderation_defs_modeventreversetakedown
    | `Tools_ozone_moderation_defs_modeventcomment of tools_ozone_moderation_defs_modeventcomment
    | `Tools_ozone_moderation_defs_modeventreport of tools_ozone_moderation_defs_modeventreport
    | `Tools_ozone_moderation_defs_modeventlabel of tools_ozone_moderation_defs_modeventlabel
    | `Tools_ozone_moderation_defs_modeventacknowledge of tools_ozone_moderation_defs_modeventacknowledge
    | `Tools_ozone_moderation_defs_modeventescalate of tools_ozone_moderation_defs_modeventescalate
    | `Tools_ozone_moderation_defs_modeventmute of tools_ozone_moderation_defs_modeventmute
    | `Tools_ozone_moderation_defs_modeventunmute of tools_ozone_moderation_defs_modeventunmute
    | `Tools_ozone_moderation_defs_modeventmutereporter of tools_ozone_moderation_defs_modeventmutereporter
    | `Tools_ozone_moderation_defs_modeventunmutereporter of tools_ozone_moderation_defs_modeventunmutereporter
    | `Tools_ozone_moderation_defs_modeventemail of tools_ozone_moderation_defs_modeventemail
    | `Tools_ozone_moderation_defs_modeventresolveappeal of tools_ozone_moderation_defs_modeventresolveappeal
    | `Tools_ozone_moderation_defs_modeventdivert of tools_ozone_moderation_defs_modeventdivert
    | `Tools_ozone_moderation_defs_modeventtag of tools_ozone_moderation_defs_modeventtag
    | `Tools_ozone_moderation_defs_accountevent of tools_ozone_moderation_defs_accountevent
    | `Tools_ozone_moderation_defs_identityevent of tools_ozone_moderation_defs_identityevent
    | `Tools_ozone_moderation_defs_recordevent of tools_ozone_moderation_defs_recordevent
    | `Tools_ozone_moderation_defs_modeventpriorityscore of tools_ozone_moderation_defs_modeventpriorityscore
    | `Other of Value.t (** Non closed union *)
    ];
    subject: [
    | `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Chat_bsky_convo_defs_messageref of chat_bsky_convo_defs_messageref
    | `Other of Value.t (** Non closed union *)
    ];
    subjectblobcids: string list;
    createdby: string;
    createdat: string;
    creatorhandle: string option;
    subjecthandle: string option;
  }

  (** def "app.bsky.feed.defs#reasonRepost" *)
  type app_bsky_feed_defs_reasonrepost = {
    by: app_bsky_actor_defs_profileviewbasic;
    indexedat: string;
  }

  (** def "app.bsky.actor.defs#mutedWordTarget" *)
  type app_bsky_actor_defs_mutedwordtarget = string

  (** def "app.bsky.actor.defs#mutedWord" *)
  type app_bsky_actor_defs_mutedword = {
    id: string option;
    value: string;
    targets: app_bsky_actor_defs_mutedwordtarget list;
    actortarget: string option;
    expiresat: string option;
  }

  (** def "tools.ozone.moderation.defs#recordView" *)
  type tools_ozone_moderation_defs_recordview = {
    uri: string;
    cid: string;
    value: Value.t (* unknown *);
    blobcids: string list;
    indexedat: string;
    moderation: tools_ozone_moderation_defs_moderation;
    repo: tools_ozone_moderation_defs_repoview;
  }

  (** def "app.bsky.feed.defs#clickthroughEmbed" *)
  type app_bsky_feed_defs_clickthroughembed = [`App_bsky_feed_defs_clickthroughembed]

  (** def "app.bsky.feed.defs#interactionLike" *)
  type app_bsky_feed_defs_interactionlike = [`App_bsky_feed_defs_interactionlike]

  (** def "app.bsky.labeler.defs#labelerPolicies" *)
  type app_bsky_labeler_defs_labelerpolicies = {
    labelvalues: com_atproto_label_defs_labelvalue list;
    labelvaluedefinitions: com_atproto_label_defs_labelvaluedefinition list option;
  }

  (** def "com.atproto.moderation.defs#subjectType" *)
  type com_atproto_moderation_defs_subjecttype = string

  (** def "app.bsky.labeler.defs#labelerViewDetailed" *)
  type app_bsky_labeler_defs_labelerviewdetailed = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    policies: app_bsky_labeler_defs_labelerpolicies;
    likecount: int64 option;
    viewer: app_bsky_labeler_defs_labelerviewerstate option;
    indexedat: string;
    labels: com_atproto_label_defs_label list option;
    reasontypes: com_atproto_moderation_defs_reasontype list option;
    subjecttypes: com_atproto_moderation_defs_subjecttype list option;
    subjectcollections: string list option;
  }

  (** def "app.bsky.graph.defs#referencelist" *)
  type app_bsky_graph_defs_referencelist = [`App_bsky_graph_defs_referencelist]

  (** def "tools.ozone.moderation.defs#reviewClosed" *)
  type tools_ozone_moderation_defs_reviewclosed = [`Tools_ozone_moderation_defs_reviewclosed]

  (** def "app.bsky.actor.defs#verificationPrefs" *)
  type app_bsky_actor_defs_verificationprefs = {
    hidebadges: bool option;
  }

  (** def "app.bsky.feed.post#replyRef" *)
  type app_bsky_feed_post_replyref = {
    root: com_atproto_repo_strongref_main;
    parent: com_atproto_repo_strongref_main;
  }

  (** def "app.bsky.unspecced.defs#skeletonTrend" *)
  type app_bsky_unspecced_defs_skeletontrend = {
    topic: string;
    displayname: string;
    link: string;
    startedat: string;
    postcount: int64;
    status: string option;
    category: string option;
    dids: string list;
  }

  (** def "com.atproto.sync.listReposByCollection#repo" *)
  type com_atproto_sync_listreposbycollection_repo = {
    did: string;
  }

  (** def "tools.ozone.set.defs#setView" *)
  type tools_ozone_set_defs_setview = {
    name: string;
    description: string option;
    setsize: int64;
    createdat: string;
    updatedat: string;
  }

  (** def "chat.bsky.convo.defs#logUnmuteConvo" *)
  type chat_bsky_convo_defs_logunmuteconvo = {
    rev: string;
    convoid: string;
  }

  (** def "app.bsky.feed.threadgate#followingRule" *)
  type app_bsky_feed_threadgate_followingrule = [`App_bsky_feed_threadgate_followingrule]

  (** def "com.atproto.moderation.defs#reasonSexual" *)
  type com_atproto_moderation_defs_reasonsexual = [`Com_atproto_moderation_defs_reasonsexual]

  (** def "tools.ozone.moderation.defs#reviewEscalated" *)
  type tools_ozone_moderation_defs_reviewescalated = [`Tools_ozone_moderation_defs_reviewescalated]

  (** def "app.bsky.graph.defs#curatelist" *)
  type app_bsky_graph_defs_curatelist = [`App_bsky_graph_defs_curatelist]

  (** def "app.bsky.graph.defs#relationship" *)
  type app_bsky_graph_defs_relationship = {
    did: string;
    following: string option;
    followedby: string option;
  }

  (** def "tools.ozone.hosting.getAccountHistory#handleUpdated" *)
  type tools_ozone_hosting_getaccounthistory_handleupdated = {
    handle: string;
  }

  (** def "tools.ozone.team.defs#member" *)
  type tools_ozone_team_defs_member = {
    did: string;
    disabled: bool option;
    profile: app_bsky_actor_defs_profileviewdetailed option;
    createdat: string option;
    updatedat: string option;
    lastupdatedby: string option;
    role: string;
  }

  (** def "com.atproto.repo.listMissingBlobs#recordBlob" *)
  type com_atproto_repo_listmissingblobs_recordblob = {
    cid: string;
    recorduri: string;
  }

  (** def "app.bsky.actor.defs#savedFeed" *)
  type app_bsky_actor_defs_savedfeed = {
    id: string;
    type_: string;
    value: string;
    pinned: bool;
  }

  (** def "com.atproto.label.defs#selfLabel" *)
  type com_atproto_label_defs_selflabel = {
    val_: string;
  }

  (** def "com.atproto.sync.subscribeRepos#repoOp" *)
  type com_atproto_sync_subscriberepos_repoop = {
    action: string;
    path: string;
    cid: Cid.t;
    prev: Cid.t option;
  }

  (** def "chat.bsky.convo.defs#logRemoveReaction" *)
  type chat_bsky_convo_defs_logremovereaction = {
    rev: string;
    convoid: string;
    message: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ];
    reaction: chat_bsky_convo_defs_reactionview;
  }

  (** def "com.atproto.moderation.defs#reasonRude" *)
  type com_atproto_moderation_defs_reasonrude = [`Com_atproto_moderation_defs_reasonrude]

  (** def "com.atproto.sync.subscribeRepos#sync" *)
  type com_atproto_sync_subscriberepos_sync = {
    seq: int64;
    did: string;
    blocks: bytes;
    rev: string;
    time: string;
  }

  (** def "tools.ozone.hosting.getAccountHistory#accountCreated" *)
  type tools_ozone_hosting_getaccounthistory_accountcreated = {
    email: string option;
    handle: string option;
  }

  (** def "tools.ozone.hosting.getAccountHistory#emailUpdated" *)
  type tools_ozone_hosting_getaccounthistory_emailupdated = {
    email: string;
  }

  (** def "tools.ozone.hosting.getAccountHistory#emailConfirmed" *)
  type tools_ozone_hosting_getaccounthistory_emailconfirmed = {
    email: string;
  }

  (** def "tools.ozone.hosting.getAccountHistory#passwordUpdated" *)
  type tools_ozone_hosting_getaccounthistory_passwordupdated = [`Tools_ozone_hosting_getaccounthistory_passwordupdated]

  (** def "tools.ozone.hosting.getAccountHistory#event" *)
  type tools_ozone_hosting_getaccounthistory_event = {
    details: [
    | `Tools_ozone_hosting_getaccounthistory_accountcreated of tools_ozone_hosting_getaccounthistory_accountcreated
    | `Tools_ozone_hosting_getaccounthistory_emailupdated of tools_ozone_hosting_getaccounthistory_emailupdated
    | `Tools_ozone_hosting_getaccounthistory_emailconfirmed of tools_ozone_hosting_getaccounthistory_emailconfirmed
    | `Tools_ozone_hosting_getaccounthistory_passwordupdated of tools_ozone_hosting_getaccounthistory_passwordupdated
    | `Tools_ozone_hosting_getaccounthistory_handleupdated of tools_ozone_hosting_getaccounthistory_handleupdated
    | `Other of Value.t (** Non closed union *)
    ];
    createdby: string;
    createdat: string;
  }

  (** def "app.bsky.graph.defs#listItemView" *)
  type app_bsky_graph_defs_listitemview = {
    uri: string;
    subject: app_bsky_actor_defs_profileview;
  }

  (** def "app.bsky.graph.defs#starterPackView" *)
  type app_bsky_graph_defs_starterpackview = {
    uri: string;
    cid: string;
    record: Value.t (* unknown *);
    creator: app_bsky_actor_defs_profileviewbasic;
    list: app_bsky_graph_defs_listviewbasic option;
    listitemssample: app_bsky_graph_defs_listitemview list option;
    feeds: app_bsky_feed_defs_generatorview list option;
    joinedweekcount: int64 option;
    joinedalltimecount: int64 option;
    labels: com_atproto_label_defs_label list option;
    indexedat: string;
  }

  (** def "app.bsky.feed.defs#interactionQuote" *)
  type app_bsky_feed_defs_interactionquote = [`App_bsky_feed_defs_interactionquote]

  (** def "com.atproto.repo.applyWrites#deleteResult" *)
  type com_atproto_repo_applywrites_deleteresult = [`Com_atproto_repo_applywrites_deleteresult]

  (** def "app.bsky.unspecced.defs#trendView" *)
  type app_bsky_unspecced_defs_trendview = {
    topic: string;
    displayname: string;
    link: string;
    startedat: string;
    postcount: int64;
    status: string option;
    category: string option;
    actors: app_bsky_actor_defs_profileviewbasic list;
  }

  (** def "app.bsky.embed.external#main" *)
  type app_bsky_embed_external_main = {
    external_: app_bsky_embed_external_external;
  }

  (** def "app.bsky.notification.listNotifications#notification" *)
  type app_bsky_notification_listnotifications_notification = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileview;
    reason: string;
    reasonsubject: string option;
    record: Value.t (* unknown *);
    isread: bool;
    indexedat: string;
    labels: com_atproto_label_defs_label list option;
  }

  (** def "app.bsky.feed.defs#threadContext" *)
  type app_bsky_feed_defs_threadcontext = {
    rootauthorlike: string;
  }

  (** def "app.bsky.unspecced.defs#skeletonSearchStarterPack" *)
  type app_bsky_unspecced_defs_skeletonsearchstarterpack = {
    uri: string;
  }

  (** def "app.bsky.actor.defs#threadViewPref" *)
  type app_bsky_actor_defs_threadviewpref = {
    sort: string;
    prioritizefollowedusers: bool;
  }

  (** def "com.atproto.admin.defs#accountView" *)
  type com_atproto_admin_defs_accountview = {
    did: string;
    handle: string;
    email: string option;
    relatedrecords: Value.t (* unknown *) list option;
    indexedat: string;
    invitedby: com_atproto_server_defs_invitecode option;
    invites: com_atproto_server_defs_invitecode list option;
    invitesdisabled: bool option;
    emailconfirmedat: string option;
    invitenote: string option;
    deactivatedat: string option;
    threatsignatures: com_atproto_admin_defs_threatsignature list option;
  }

  (** def "tools.ozone.communication.defs#templateView" *)
  type tools_ozone_communication_defs_templateview = {
    id: string;
    name: string;
    subject: string option;
    contentmarkdown: string;
    disabled: bool;
    lang: string option;
    lastupdatedby: string;
    createdat: string;
    updatedat: string;
  }

  (** def "com.atproto.moderation.defs#reasonSpam" *)
  type com_atproto_moderation_defs_reasonspam = [`Com_atproto_moderation_defs_reasonspam]

  (** def "app.bsky.actor.defs#bskyAppProgressGuide" *)
  type app_bsky_actor_defs_bskyappprogressguide = {
    guide: string;
  }

  (** def "app.bsky.actor.defs#nux" *)
  type app_bsky_actor_defs_nux = {
    id: string;
    completed: bool;
    data: string option;
    expiresat: string option;
  }

  (** def "app.bsky.actor.defs#bskyAppStatePref" *)
  type app_bsky_actor_defs_bskyappstatepref = {
    activeprogressguide: app_bsky_actor_defs_bskyappprogressguide;
    queuednudges: string list;
    nuxs: app_bsky_actor_defs_nux list;
  }

  (** def "app.bsky.feed.defs#clickthroughAuthor" *)
  type app_bsky_feed_defs_clickthroughauthor = [`App_bsky_feed_defs_clickthroughauthor]

  (** def "app.bsky.feed.defs#skeletonReasonRepost" *)
  type app_bsky_feed_defs_skeletonreasonrepost = {
    repost: string;
  }

  (** def "app.bsky.feed.defs#skeletonReasonPin" *)
  type app_bsky_feed_defs_skeletonreasonpin = [`App_bsky_feed_defs_skeletonreasonpin]

  (** def "app.bsky.feed.defs#skeletonFeedPost" *)
  type app_bsky_feed_defs_skeletonfeedpost = {
    post: string;
    reason: [
    | `App_bsky_feed_defs_skeletonreasonrepost of app_bsky_feed_defs_skeletonreasonrepost
    | `App_bsky_feed_defs_skeletonreasonpin of app_bsky_feed_defs_skeletonreasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedcontext: string option;
  }

  (** def "chat.bsky.convo.defs#logDeleteMessage" *)
  type chat_bsky_convo_defs_logdeletemessage = {
    rev: string;
    convoid: string;
    message: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ];
  }

  (** def "chat.bsky.moderation.getActorMetadata#metadata" *)
  type chat_bsky_moderation_getactormetadata_metadata = {
    messagessent: int64;
    messagesreceived: int64;
    convos: int64;
    convosstarted: int64;
  }

  (** def "app.bsky.embed.record#main" *)
  type app_bsky_embed_record_main = {
    record: com_atproto_repo_strongref_main;
  }

  (** def "chat.bsky.convo.defs#messageInput" *)
  type chat_bsky_convo_defs_messageinput = {
    text: string;
    facets: app_bsky_richtext_facet_main list option;
    embed: [
    | `App_bsky_embed_record_main of app_bsky_embed_record_main
    | `Other of Value.t (** Non closed union *)
    ] option;
  }

  (** def "chat.bsky.convo.sendMessageBatch#batchItem" *)
  type chat_bsky_convo_sendmessagebatch_batchitem = {
    convoid: string;
    message: chat_bsky_convo_defs_messageinput;
  }

  (** def "app.bsky.feed.defs#contentModeUnspecified" *)
  type app_bsky_feed_defs_contentmodeunspecified = [`App_bsky_feed_defs_contentmodeunspecified]

  (** def "app.bsky.feed.threadgate#mentionRule" *)
  type app_bsky_feed_threadgate_mentionrule = [`App_bsky_feed_threadgate_mentionrule]

  (** def "com.atproto.server.listAppPasswords#appPassword" *)
  type com_atproto_server_listapppasswords_apppassword = {
    name: string;
    createdat: string;
    privileged: bool option;
  }

  (** def "com.atproto.sync.listHosts#host" *)
  type com_atproto_sync_listhosts_host = {
    hostname: string;
    seq: int64 option;
    accountcount: int64 option;
    status: com_atproto_sync_defs_hoststatus option;
  }

  (** def "app.bsky.embed.images#image" *)
  type app_bsky_embed_images_image = {
    image: Blob.t;
    alt: string;
    aspectratio: app_bsky_embed_defs_aspectratio option;
  }

  (** def "app.bsky.embed.images#main" *)
  type app_bsky_embed_images_main = {
    images: app_bsky_embed_images_image list;
  }

  (** def "app.bsky.embed.video#main" *)
  type app_bsky_embed_video_main = {
    video: Blob.t;
    captions: app_bsky_embed_video_caption list option;
    alt: string option;
    aspectratio: app_bsky_embed_defs_aspectratio option;
  }

  (** def "app.bsky.embed.recordWithMedia#main" *)
  type app_bsky_embed_recordwithmedia_main = {
    record: app_bsky_embed_record_main;
    media: [
    | `App_bsky_embed_images_main of app_bsky_embed_images_main
    | `App_bsky_embed_video_main of app_bsky_embed_video_main
    | `App_bsky_embed_external_main of app_bsky_embed_external_main
    | `Other of Value.t (** Non closed union *)
    ];
  }

  (** def "app.bsky.actor.defs#adultContentPref" *)
  type app_bsky_actor_defs_adultcontentpref = {
    enabled: bool;
  }

  (** def "com.atproto.label.subscribeLabels#labels" *)
  type com_atproto_label_subscribelabels_labels = {
    seq: int64;
    labels: com_atproto_label_defs_label list;
  }

  (** def "tools.ozone.verification.grantVerifications#grantError" *)
  type tools_ozone_verification_grantverifications_granterror = {
    error: string;
    subject: string;
  }

  (** def "app.bsky.feed.describeFeedGenerator#links" *)
  type app_bsky_feed_describefeedgenerator_links = {
    privacypolicy: string;
    termsofservice: string;
  }

  (** def "chat.bsky.convo.defs#logMuteConvo" *)
  type chat_bsky_convo_defs_logmuteconvo = {
    rev: string;
    convoid: string;
  }

  (** def "app.bsky.actor.defs#contentLabelPref" *)
  type app_bsky_actor_defs_contentlabelpref = {
    labelerdid: string option;
    label: string;
    visibility: string;
  }

  (** def "app.bsky.actor.defs#savedFeedsPref" *)
  type app_bsky_actor_defs_savedfeedspref = {
    pinned: string list;
    saved: string list;
    timelineindex: int64 option;
  }

  (** def "app.bsky.actor.defs#savedFeedsPrefV2" *)
  type app_bsky_actor_defs_savedfeedsprefv2 = {
    items: app_bsky_actor_defs_savedfeed list;
  }

  (** def "app.bsky.actor.defs#feedViewPref" *)
  type app_bsky_actor_defs_feedviewpref = {
    feed: string;
    hidereplies: bool option;
    hiderepliesbyunfollowed: bool option;
    hiderepliesbylikecount: int64 option;
    hidereposts: bool option;
    hidequoteposts: bool option;
  }

  (** def "app.bsky.actor.defs#interestsPref" *)
  type app_bsky_actor_defs_interestspref = {
    tags: string list;
  }

  (** def "app.bsky.actor.defs#mutedWordsPref" *)
  type app_bsky_actor_defs_mutedwordspref = {
    items: app_bsky_actor_defs_mutedword list;
  }

  (** def "app.bsky.actor.defs#labelersPref" *)
  type app_bsky_actor_defs_labelerspref = {
    labelers: app_bsky_actor_defs_labelerprefitem list;
  }

  (** def "app.bsky.feed.threadgate#followerRule" *)
  type app_bsky_feed_threadgate_followerrule = [`App_bsky_feed_threadgate_followerrule]

  (** def "app.bsky.feed.threadgate#listRule" *)
  type app_bsky_feed_threadgate_listrule = {
    list: string;
  }

  (** def "app.bsky.feed.postgate#disableRule" *)
  type app_bsky_feed_postgate_disablerule = [`App_bsky_feed_postgate_disablerule]

  (** def "app.bsky.actor.defs#postInteractionSettingsPref" *)
  type app_bsky_actor_defs_postinteractionsettingspref = {
    threadgateallowrules: [
    | `App_bsky_feed_threadgate_mentionrule of app_bsky_feed_threadgate_mentionrule
    | `App_bsky_feed_threadgate_followerrule of app_bsky_feed_threadgate_followerrule
    | `App_bsky_feed_threadgate_followingrule of app_bsky_feed_threadgate_followingrule
    | `App_bsky_feed_threadgate_listrule of app_bsky_feed_threadgate_listrule
    | `Other of Value.t (** Non closed union *)
    ] list option;
    postgateembeddingrules: [
    | `App_bsky_feed_postgate_disablerule of app_bsky_feed_postgate_disablerule
    | `Other of Value.t (** Non closed union *)
    ] list option;
  }

  (** def "app.bsky.actor.defs#preferences" *)
  type app_bsky_actor_defs_preferences = [
    | `App_bsky_actor_defs_adultcontentpref of app_bsky_actor_defs_adultcontentpref
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

  (** def "tools.ozone.verification.grantVerifications#verificationInput" *)
  type tools_ozone_verification_grantverifications_verificationinput = {
    subject: string;
    handle: string;
    displayname: string;
    createdat: string option;
  }

  (** def "tools.ozone.moderation.defs#subjectView" *)
  type tools_ozone_moderation_defs_subjectview = {
    type_: com_atproto_moderation_defs_subjecttype;
    subject: string;
    status: tools_ozone_moderation_defs_subjectstatusview option;
    repo: tools_ozone_moderation_defs_repoviewdetail option;
    profile: [
    | `Other of Value.t (** Non closed union *)
    ] option;
    record: tools_ozone_moderation_defs_recordviewdetail option;
  }

  (** def "com.atproto.repo.applyWrites#delete" *)
  type com_atproto_repo_applywrites_delete = {
    collection: string;
    rkey: string;
  }

  (** def "com.atproto.server.describeServer#links" *)
  type com_atproto_server_describeserver_links = {
    privacypolicy: string;
    termsofservice: string;
  }

  (** def "tools.ozone.signature.defs#sigDetail" *)
  type tools_ozone_signature_defs_sigdetail = {
    property: string;
    value: string;
  }

  (** def "tools.ozone.signature.findRelatedAccounts#relatedAccount" *)
  type tools_ozone_signature_findrelatedaccounts_relatedaccount = {
    account: com_atproto_admin_defs_accountview;
    similarities: tools_ozone_signature_defs_sigdetail list option;
  }

  (** def "app.bsky.feed.defs#requestLess" *)
  type app_bsky_feed_defs_requestless = [`App_bsky_feed_defs_requestless]

  (** def "app.bsky.video.defs#jobStatus" *)
  type app_bsky_video_defs_jobstatus = {
    jobid: string;
    did: string;
    state: string;
    progress: int64 option;
    blob: Blob.t option;
    error: string option;
    message: string option;
  }

  (** def "tools.ozone.team.defs#roleAdmin" *)
  type tools_ozone_team_defs_roleadmin = [`Tools_ozone_team_defs_roleadmin]

  (** def "app.bsky.feed.defs#interactionReply" *)
  type app_bsky_feed_defs_interactionreply = [`App_bsky_feed_defs_interactionreply]

  (** def "app.bsky.feed.defs#reasonPin" *)
  type app_bsky_feed_defs_reasonpin = [`App_bsky_feed_defs_reasonpin]

  (** def "app.bsky.notification.defs#recordDeleted" *)
  type app_bsky_notification_defs_recorddeleted = [`App_bsky_notification_defs_recorddeleted]

  (** def "app.bsky.feed.getLikes#like" *)
  type app_bsky_feed_getlikes_like = {
    indexedat: string;
    createdat: string;
    actor: app_bsky_actor_defs_profileview;
  }

  (** def "chat.bsky.actor.defs#profileViewBasic" *)
  type chat_bsky_actor_defs_profileviewbasic = {
    did: string;
    handle: string;
    displayname: string option;
    avatar: string option;
    associated: app_bsky_actor_defs_profileassociated option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    chatdisabled: bool option;
    verification: app_bsky_actor_defs_verificationstate option;
  }

  (** def "chat.bsky.convo.defs#convoView" *)
  type chat_bsky_convo_defs_convoview = {
    id: string;
    rev: string;
    members: chat_bsky_actor_defs_profileviewbasic list;
    lastmessage: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ] option;
    lastreaction: [
    | `Chat_bsky_convo_defs_messageandreactionview of chat_bsky_convo_defs_messageandreactionview
    | `Other of Value.t (** Non closed union *)
    ] option;
    muted: bool;
    status: string option;
    unreadcount: int64;
  }

  (** def "app.bsky.feed.post#textSlice" *)
  type app_bsky_feed_post_textslice = {
    start: int64;
    end_: int64;
  }

  (** def "com.atproto.moderation.defs#reasonAppeal" *)
  type com_atproto_moderation_defs_reasonappeal = [`Com_atproto_moderation_defs_reasonappeal]

  (** def "com.atproto.moderation.defs#reasonViolation" *)
  type com_atproto_moderation_defs_reasonviolation = [`Com_atproto_moderation_defs_reasonviolation]

  (** def "com.atproto.sync.subscribeRepos#commit" *)
  type com_atproto_sync_subscriberepos_commit = {
    seq: int64;
    rebase: bool;
    toobig: bool;
    repo: string;
    commit: Cid.t;
    rev: string;
    since: string;
    blocks: bytes;
    ops: com_atproto_sync_subscriberepos_repoop list;
    blobs: Cid.t list;
    prevdata: Cid.t option;
    time: string;
  }

  (** def "app.bsky.actor.status#live" *)
  type app_bsky_actor_status_live = [`App_bsky_actor_status_live]

  (** def "tools.ozone.moderation.defs#repoViewNotFound" *)
  type tools_ozone_moderation_defs_repoviewnotfound = {
    did: string;
  }

  (** def "tools.ozone.verification.defs#verificationView" *)
  type tools_ozone_verification_defs_verificationview = {
    issuer: string;
    uri: string;
    subject: string;
    handle: string;
    displayname: string;
    createdat: string;
    revokereason: string option;
    revokedat: string option;
    revokedby: string option;
    subjectprofile: [
    | `Other of Value.t (** Non closed union *)
    ] option;
    issuerprofile: [
    | `Other of Value.t (** Non closed union *)
    ] option;
    subjectrepo: [
    | `Tools_ozone_moderation_defs_repoviewdetail of tools_ozone_moderation_defs_repoviewdetail
    | `Tools_ozone_moderation_defs_repoviewnotfound of tools_ozone_moderation_defs_repoviewnotfound
    | `Other of Value.t (** Non closed union *)
    ] option;
    issuerrepo: [
    | `Tools_ozone_moderation_defs_repoviewdetail of tools_ozone_moderation_defs_repoviewdetail
    | `Tools_ozone_moderation_defs_repoviewnotfound of tools_ozone_moderation_defs_repoviewnotfound
    | `Other of Value.t (** Non closed union *)
    ] option;
  }

  (** def "app.bsky.feed.defs#feedViewPost" *)
  type app_bsky_feed_defs_feedviewpost = {
    post: app_bsky_feed_defs_postview;
    reply: app_bsky_feed_defs_replyref option;
    reason: [
    | `App_bsky_feed_defs_reasonrepost of app_bsky_feed_defs_reasonrepost
    | `App_bsky_feed_defs_reasonpin of app_bsky_feed_defs_reasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedcontext: string option;
  }

  (** def "com.atproto.sync.subscribeRepos#identity" *)
  type com_atproto_sync_subscriberepos_identity = {
    seq: int64;
    did: string;
    time: string;
    handle: string option;
  }

  (** def "chat.bsky.convo.defs#logAcceptConvo" *)
  type chat_bsky_convo_defs_logacceptconvo = {
    rev: string;
    convoid: string;
  }

  (** def "app.bsky.unspecced.defs#skeletonSearchActor" *)
  type app_bsky_unspecced_defs_skeletonsearchactor = {
    did: string;
  }

  (** def "com.atproto.identity.defs#identityInfo" *)
  type com_atproto_identity_defs_identityinfo = {
    did: string;
    handle: string;
    diddoc: Value.t (* unknown *);
  }

  (** def "tools.ozone.moderation.defs#reviewNone" *)
  type tools_ozone_moderation_defs_reviewnone = [`Tools_ozone_moderation_defs_reviewnone]

  (** def "com.atproto.server.describeServer#contact" *)
  type com_atproto_server_describeserver_contact = {
    email: string;
  }

  (** def "com.atproto.repo.listRecords#record" *)
  type com_atproto_repo_listrecords_record = {
    uri: string;
    cid: string;
    value: Value.t (* unknown *);
  }

  (** def "com.atproto.moderation.defs#reasonOther" *)
  type com_atproto_moderation_defs_reasonother = [`Com_atproto_moderation_defs_reasonother]

  (** def "chat.bsky.convo.defs#logCreateMessage" *)
  type chat_bsky_convo_defs_logcreatemessage = {
    rev: string;
    convoid: string;
    message: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ];
  }

  (** def "app.bsky.graph.defs#notFoundActor" *)
  type app_bsky_graph_defs_notfoundactor = {
    actor: string;
    notfound: bool;
  }

  (** def "tools.ozone.set.defs#set" *)
  type tools_ozone_set_defs_set = {
    name: string;
    description: string option;
  }

  (** def "com.atproto.admin.defs#repoBlobRef" *)
  type com_atproto_admin_defs_repoblobref = {
    did: string;
    cid: string;
    recorduri: string option;
  }

  (** def "tools.ozone.team.defs#roleTriage" *)
  type tools_ozone_team_defs_roletriage = [`Tools_ozone_team_defs_roletriage]

  (** def "com.atproto.repo.applyWrites#updateResult" *)
  type com_atproto_repo_applywrites_updateresult = {
    uri: string;
    cid: string;
    validationstatus: string option;
  }

  (** def "tools.ozone.team.defs#roleVerifier" *)
  type tools_ozone_team_defs_roleverifier = [`Tools_ozone_team_defs_roleverifier]

  (** def "app.bsky.feed.defs#clickthroughItem" *)
  type app_bsky_feed_defs_clickthroughitem = [`App_bsky_feed_defs_clickthroughitem]

  (** def "app.bsky.graph.starterpack#feedItem" *)
  type app_bsky_graph_starterpack_feeditem = {
    uri: string;
  }

  (** def "app.bsky.unspecced.defs#skeletonSearchPost" *)
  type app_bsky_unspecced_defs_skeletonsearchpost = {
    uri: string;
  }

  (** def "chat.bsky.convo.defs#logLeaveConvo" *)
  type chat_bsky_convo_defs_logleaveconvo = {
    rev: string;
    convoid: string;
  }

  (** def "com.atproto.sync.subscribeRepos#info" *)
  type com_atproto_sync_subscriberepos_info = {
    name: string;
    message: string option;
  }

  (** def "tools.ozone.verification.revokeVerifications#revokeError" *)
  type tools_ozone_verification_revokeverifications_revokeerror = {
    uri: string;
    error: string;
  }

  (** def "app.bsky.feed.defs#interactionRepost" *)
  type app_bsky_feed_defs_interactionrepost = [`App_bsky_feed_defs_interactionrepost]

  (** def "com.atproto.server.createInviteCodes#accountCodes" *)
  type com_atproto_server_createinvitecodes_accountcodes = {
    account: string;
    codes: string list;
  }

  (** def "app.bsky.feed.defs#interactionShare" *)
  type app_bsky_feed_defs_interactionshare = [`App_bsky_feed_defs_interactionshare]

  (** def "app.bsky.unspecced.defs#trendingTopic" *)
  type app_bsky_unspecced_defs_trendingtopic = {
    topic: string;
    displayname: string option;
    description: string option;
    link: string;
  }

  (** def "com.atproto.label.defs#selfLabels" *)
  type com_atproto_label_defs_selflabels = {
    values: com_atproto_label_defs_selflabel list;
  }

  (** def "tools.ozone.server.getConfig#serviceConfig" *)
  type tools_ozone_server_getconfig_serviceconfig = {
    url: string;
  }

  (** def "chat.bsky.convo.defs#logAddReaction" *)
  type chat_bsky_convo_defs_logaddreaction = {
    rev: string;
    convoid: string;
    message: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ];
    reaction: chat_bsky_convo_defs_reactionview;
  }

  (** def "app.bsky.feed.defs#threadViewPost" *)
  type app_bsky_feed_defs_threadviewpost = {
    post: app_bsky_feed_defs_postview;
    parent: [
    | `App_bsky_feed_defs_threadviewpost of app_bsky_feed_defs_threadviewpost
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ] option;
    replies: [
    | `App_bsky_feed_defs_threadviewpost of app_bsky_feed_defs_threadviewpost
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ] list option;
    threadcontext: app_bsky_feed_defs_threadcontext option;
  }

  (** def "app.bsky.feed.post#entity" *)
  type app_bsky_feed_post_entity = {
    index: app_bsky_feed_post_textslice;
    type_: string;
    value: string;
  }

  (** def "com.atproto.sync.listRepos#repo" *)
  type com_atproto_sync_listrepos_repo = {
    did: string;
    head: string;
    rev: string;
    active: bool option;
    status: string option;
  }

  (** def "com.atproto.moderation.defs#reasonMisleading" *)
  type com_atproto_moderation_defs_reasonmisleading = [`Com_atproto_moderation_defs_reasonmisleading]

  (** def "app.bsky.feed.defs#contentModeVideo" *)
  type app_bsky_feed_defs_contentmodevideo = [`App_bsky_feed_defs_contentmodevideo]

  (** def "tools.ozone.setting.defs#option" *)
  type tools_ozone_setting_defs_option = {
    key: string;
    did: string;
    value: Value.t (* unknown *);
    description: string option;
    createdat: string option;
    updatedat: string option;
    managerrole: string option;
    scope: string;
    createdby: string;
    lastupdatedby: string;
  }

  (** def "app.bsky.graph.defs#modlist" *)
  type app_bsky_graph_defs_modlist = [`App_bsky_graph_defs_modlist]

  (** def "tools.ozone.moderation.defs#modEventViewDetail" *)
  type tools_ozone_moderation_defs_modeventviewdetail = {
    id: int64;
    event: [
    | `Tools_ozone_moderation_defs_modeventtakedown of tools_ozone_moderation_defs_modeventtakedown
    | `Tools_ozone_moderation_defs_modeventreversetakedown of tools_ozone_moderation_defs_modeventreversetakedown
    | `Tools_ozone_moderation_defs_modeventcomment of tools_ozone_moderation_defs_modeventcomment
    | `Tools_ozone_moderation_defs_modeventreport of tools_ozone_moderation_defs_modeventreport
    | `Tools_ozone_moderation_defs_modeventlabel of tools_ozone_moderation_defs_modeventlabel
    | `Tools_ozone_moderation_defs_modeventacknowledge of tools_ozone_moderation_defs_modeventacknowledge
    | `Tools_ozone_moderation_defs_modeventescalate of tools_ozone_moderation_defs_modeventescalate
    | `Tools_ozone_moderation_defs_modeventmute of tools_ozone_moderation_defs_modeventmute
    | `Tools_ozone_moderation_defs_modeventunmute of tools_ozone_moderation_defs_modeventunmute
    | `Tools_ozone_moderation_defs_modeventmutereporter of tools_ozone_moderation_defs_modeventmutereporter
    | `Tools_ozone_moderation_defs_modeventunmutereporter of tools_ozone_moderation_defs_modeventunmutereporter
    | `Tools_ozone_moderation_defs_modeventemail of tools_ozone_moderation_defs_modeventemail
    | `Tools_ozone_moderation_defs_modeventresolveappeal of tools_ozone_moderation_defs_modeventresolveappeal
    | `Tools_ozone_moderation_defs_modeventdivert of tools_ozone_moderation_defs_modeventdivert
    | `Tools_ozone_moderation_defs_modeventtag of tools_ozone_moderation_defs_modeventtag
    | `Tools_ozone_moderation_defs_accountevent of tools_ozone_moderation_defs_accountevent
    | `Tools_ozone_moderation_defs_identityevent of tools_ozone_moderation_defs_identityevent
    | `Tools_ozone_moderation_defs_recordevent of tools_ozone_moderation_defs_recordevent
    | `Tools_ozone_moderation_defs_modeventpriorityscore of tools_ozone_moderation_defs_modeventpriorityscore
    | `Other of Value.t (** Non closed union *)
    ];
    subject: [
    | `Tools_ozone_moderation_defs_repoview of tools_ozone_moderation_defs_repoview
    | `Tools_ozone_moderation_defs_repoviewnotfound of tools_ozone_moderation_defs_repoviewnotfound
    | `Tools_ozone_moderation_defs_recordview of tools_ozone_moderation_defs_recordview
    | `Tools_ozone_moderation_defs_recordviewnotfound of tools_ozone_moderation_defs_recordviewnotfound
    | `Other of Value.t (** Non closed union *)
    ];
    subjectblobs: tools_ozone_moderation_defs_blobview list;
    createdby: string;
    createdat: string;
  }

  (** def "app.bsky.feed.defs#clickthroughReposter" *)
  type app_bsky_feed_defs_clickthroughreposter = [`App_bsky_feed_defs_clickthroughreposter]

end



open Types

(** lexicon tools.ozone.verification.revokeVerifications
  *)

module Tools_Ozone_Verification_RevokeVerifications = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def revokeError *)
  type nonrec revokeerror = tools_ozone_verification_revokeverifications_revokeerror = {
    uri: string;
    error: string;
  }

end

(** lexicon tools.ozone.verification.listVerifications
  *)

module Tools_Ozone_Verification_ListVerifications = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.verification.grantVerifications
  *)

module Tools_Ozone_Verification_GrantVerifications = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def verificationInput *)
  type nonrec verificationinput = tools_ozone_verification_grantverifications_verificationinput = {
    subject: string;
    handle: string;
    displayname: string;
    createdat: string option;
  }

  (** def grantError *)
  type nonrec granterror = tools_ozone_verification_grantverifications_granterror = {
    error: string;
    subject: string;
  }

end

(** lexicon tools.ozone.verification.defs
  *)

module Tools_Ozone_Verification_Defs = struct
  (** def verificationView *)
  type nonrec verificationview = tools_ozone_verification_defs_verificationview = {
    issuer: string;
    uri: string;
    subject: string;
    handle: string;
    displayname: string;
    createdat: string;
    revokereason: string option;
    revokedat: string option;
    revokedby: string option;
    subjectprofile: [
    | `Other of Value.t (** Non closed union *)
    ] option;
    issuerprofile: [
    | `Other of Value.t (** Non closed union *)
    ] option;
    subjectrepo: [
    | `Tools_ozone_moderation_defs_repoviewdetail of tools_ozone_moderation_defs_repoviewdetail
    | `Tools_ozone_moderation_defs_repoviewnotfound of tools_ozone_moderation_defs_repoviewnotfound
    | `Other of Value.t (** Non closed union *)
    ] option;
    issuerrepo: [
    | `Tools_ozone_moderation_defs_repoviewdetail of tools_ozone_moderation_defs_repoviewdetail
    | `Tools_ozone_moderation_defs_repoviewnotfound of tools_ozone_moderation_defs_repoviewnotfound
    | `Other of Value.t (** Non closed union *)
    ] option;
  }

end

(** lexicon tools.ozone.team.updateMember
  *)

module Tools_Ozone_Team_UpdateMember = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.team.listMembers
  *)

module Tools_Ozone_Team_ListMembers = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.team.deleteMember
  *)

module Tools_Ozone_Team_DeleteMember = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.team.addMember
  *)

module Tools_Ozone_Team_AddMember = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.team.defs
  *)

module Tools_Ozone_Team_Defs = struct
  (** def member *)
  type nonrec member = tools_ozone_team_defs_member = {
    did: string;
    disabled: bool option;
    profile: app_bsky_actor_defs_profileviewdetailed option;
    createdat: string option;
    updatedat: string option;
    lastupdatedby: string option;
    role: string;
  }

  (** def roleAdmin *)
  type nonrec roleadmin = tools_ozone_team_defs_roleadmin

  (** def roleModerator *)
  type nonrec rolemoderator = tools_ozone_team_defs_rolemoderator

  (** def roleTriage *)
  type nonrec roletriage = tools_ozone_team_defs_roletriage

  (** def roleVerifier *)
  type nonrec roleverifier = tools_ozone_team_defs_roleverifier

end

(** lexicon tools.ozone.signature.searchAccounts
  *)

module Tools_Ozone_Signature_SearchAccounts = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.signature.findRelatedAccounts
  *)

module Tools_Ozone_Signature_FindRelatedAccounts = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def relatedAccount *)
  type nonrec relatedaccount = tools_ozone_signature_findrelatedaccounts_relatedaccount = {
    account: com_atproto_admin_defs_accountview;
    similarities: tools_ozone_signature_defs_sigdetail list option;
  }

end

(** lexicon tools.ozone.signature.findCorrelation
  *)

module Tools_Ozone_Signature_FindCorrelation = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.signature.defs
  *)

module Tools_Ozone_Signature_Defs = struct
  (** def sigDetail *)
  type nonrec sigdetail = tools_ozone_signature_defs_sigdetail = {
    property: string;
    value: string;
  }

end

(** lexicon tools.ozone.setting.upsertOption
  *)

module Tools_Ozone_Setting_UpsertOption = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.setting.removeOptions
  *)

module Tools_Ozone_Setting_RemoveOptions = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.setting.listOptions
  *)

module Tools_Ozone_Setting_ListOptions = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.setting.defs
  *)

module Tools_Ozone_Setting_Defs = struct
  (** def option *)
  type nonrec option = tools_ozone_setting_defs_option = {
    key: string;
    did: string;
    value: Value.t (* unknown *);
    description: string option;
    createdat: string option;
    updatedat: string option;
    managerrole: string option;
    scope: string;
    createdby: string;
    lastupdatedby: string;
  }

end

(** lexicon tools.ozone.set.upsertSet
  *)

module Tools_Ozone_Set_UpsertSet = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.set.querySets
  *)

module Tools_Ozone_Set_QuerySets = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.set.getValues
  *)

module Tools_Ozone_Set_GetValues = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.set.deleteValues
  *)

module Tools_Ozone_Set_DeleteValues = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.set.deleteSet
  *)

module Tools_Ozone_Set_DeleteSet = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.set.defs
  *)

module Tools_Ozone_Set_Defs = struct
  (** def set *)
  type nonrec set = tools_ozone_set_defs_set = {
    name: string;
    description: string option;
  }

  (** def setView *)
  type nonrec setview = tools_ozone_set_defs_setview = {
    name: string;
    description: string option;
    setsize: int64;
    createdat: string;
    updatedat: string;
  }

end

(** lexicon tools.ozone.set.addValues
  *)

module Tools_Ozone_Set_AddValues = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.server.getConfig
  *)

module Tools_Ozone_Server_GetConfig = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def serviceConfig *)
  type nonrec serviceconfig = tools_ozone_server_getconfig_serviceconfig = {
    url: string;
  }

  (** def viewerConfig *)
  type nonrec viewerconfig = tools_ozone_server_getconfig_viewerconfig = {
    role: string;
  }

end

(** lexicon tools.ozone.moderation.searchRepos
  *)

module Tools_Ozone_Moderation_SearchRepos = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.queryStatuses
  *)

module Tools_Ozone_Moderation_QueryStatuses = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.queryEvents
  *)

module Tools_Ozone_Moderation_QueryEvents = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.getSubjects
  *)

module Tools_Ozone_Moderation_GetSubjects = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.getRepos
  *)

module Tools_Ozone_Moderation_GetRepos = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.getReporterStats
  *)

module Tools_Ozone_Moderation_GetReporterStats = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.getRepo
  *)

module Tools_Ozone_Moderation_GetRepo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.getRecords
  *)

module Tools_Ozone_Moderation_GetRecords = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.getRecord
  *)

module Tools_Ozone_Moderation_GetRecord = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.getEvent
  *)

module Tools_Ozone_Moderation_GetEvent = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.emitEvent
  *)

module Tools_Ozone_Moderation_EmitEvent = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.moderation.defs
  *)

module Tools_Ozone_Moderation_Defs = struct
  (** def modEventView *)
  type nonrec modeventview = tools_ozone_moderation_defs_modeventview = {
    id: int64;
    event: [
    | `Tools_ozone_moderation_defs_modeventtakedown of tools_ozone_moderation_defs_modeventtakedown
    | `Tools_ozone_moderation_defs_modeventreversetakedown of tools_ozone_moderation_defs_modeventreversetakedown
    | `Tools_ozone_moderation_defs_modeventcomment of tools_ozone_moderation_defs_modeventcomment
    | `Tools_ozone_moderation_defs_modeventreport of tools_ozone_moderation_defs_modeventreport
    | `Tools_ozone_moderation_defs_modeventlabel of tools_ozone_moderation_defs_modeventlabel
    | `Tools_ozone_moderation_defs_modeventacknowledge of tools_ozone_moderation_defs_modeventacknowledge
    | `Tools_ozone_moderation_defs_modeventescalate of tools_ozone_moderation_defs_modeventescalate
    | `Tools_ozone_moderation_defs_modeventmute of tools_ozone_moderation_defs_modeventmute
    | `Tools_ozone_moderation_defs_modeventunmute of tools_ozone_moderation_defs_modeventunmute
    | `Tools_ozone_moderation_defs_modeventmutereporter of tools_ozone_moderation_defs_modeventmutereporter
    | `Tools_ozone_moderation_defs_modeventunmutereporter of tools_ozone_moderation_defs_modeventunmutereporter
    | `Tools_ozone_moderation_defs_modeventemail of tools_ozone_moderation_defs_modeventemail
    | `Tools_ozone_moderation_defs_modeventresolveappeal of tools_ozone_moderation_defs_modeventresolveappeal
    | `Tools_ozone_moderation_defs_modeventdivert of tools_ozone_moderation_defs_modeventdivert
    | `Tools_ozone_moderation_defs_modeventtag of tools_ozone_moderation_defs_modeventtag
    | `Tools_ozone_moderation_defs_accountevent of tools_ozone_moderation_defs_accountevent
    | `Tools_ozone_moderation_defs_identityevent of tools_ozone_moderation_defs_identityevent
    | `Tools_ozone_moderation_defs_recordevent of tools_ozone_moderation_defs_recordevent
    | `Tools_ozone_moderation_defs_modeventpriorityscore of tools_ozone_moderation_defs_modeventpriorityscore
    | `Other of Value.t (** Non closed union *)
    ];
    subject: [
    | `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Chat_bsky_convo_defs_messageref of chat_bsky_convo_defs_messageref
    | `Other of Value.t (** Non closed union *)
    ];
    subjectblobcids: string list;
    createdby: string;
    createdat: string;
    creatorhandle: string option;
    subjecthandle: string option;
  }

  (** def modEventViewDetail *)
  type nonrec modeventviewdetail = tools_ozone_moderation_defs_modeventviewdetail = {
    id: int64;
    event: [
    | `Tools_ozone_moderation_defs_modeventtakedown of tools_ozone_moderation_defs_modeventtakedown
    | `Tools_ozone_moderation_defs_modeventreversetakedown of tools_ozone_moderation_defs_modeventreversetakedown
    | `Tools_ozone_moderation_defs_modeventcomment of tools_ozone_moderation_defs_modeventcomment
    | `Tools_ozone_moderation_defs_modeventreport of tools_ozone_moderation_defs_modeventreport
    | `Tools_ozone_moderation_defs_modeventlabel of tools_ozone_moderation_defs_modeventlabel
    | `Tools_ozone_moderation_defs_modeventacknowledge of tools_ozone_moderation_defs_modeventacknowledge
    | `Tools_ozone_moderation_defs_modeventescalate of tools_ozone_moderation_defs_modeventescalate
    | `Tools_ozone_moderation_defs_modeventmute of tools_ozone_moderation_defs_modeventmute
    | `Tools_ozone_moderation_defs_modeventunmute of tools_ozone_moderation_defs_modeventunmute
    | `Tools_ozone_moderation_defs_modeventmutereporter of tools_ozone_moderation_defs_modeventmutereporter
    | `Tools_ozone_moderation_defs_modeventunmutereporter of tools_ozone_moderation_defs_modeventunmutereporter
    | `Tools_ozone_moderation_defs_modeventemail of tools_ozone_moderation_defs_modeventemail
    | `Tools_ozone_moderation_defs_modeventresolveappeal of tools_ozone_moderation_defs_modeventresolveappeal
    | `Tools_ozone_moderation_defs_modeventdivert of tools_ozone_moderation_defs_modeventdivert
    | `Tools_ozone_moderation_defs_modeventtag of tools_ozone_moderation_defs_modeventtag
    | `Tools_ozone_moderation_defs_accountevent of tools_ozone_moderation_defs_accountevent
    | `Tools_ozone_moderation_defs_identityevent of tools_ozone_moderation_defs_identityevent
    | `Tools_ozone_moderation_defs_recordevent of tools_ozone_moderation_defs_recordevent
    | `Tools_ozone_moderation_defs_modeventpriorityscore of tools_ozone_moderation_defs_modeventpriorityscore
    | `Other of Value.t (** Non closed union *)
    ];
    subject: [
    | `Tools_ozone_moderation_defs_repoview of tools_ozone_moderation_defs_repoview
    | `Tools_ozone_moderation_defs_repoviewnotfound of tools_ozone_moderation_defs_repoviewnotfound
    | `Tools_ozone_moderation_defs_recordview of tools_ozone_moderation_defs_recordview
    | `Tools_ozone_moderation_defs_recordviewnotfound of tools_ozone_moderation_defs_recordviewnotfound
    | `Other of Value.t (** Non closed union *)
    ];
    subjectblobs: tools_ozone_moderation_defs_blobview list;
    createdby: string;
    createdat: string;
  }

  (** def subjectStatusView *)
  type nonrec subjectstatusview = tools_ozone_moderation_defs_subjectstatusview = {
    id: int64;
    subject: [
    | `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Other of Value.t (** Non closed union *)
    ];
    hosting: [
    | `Tools_ozone_moderation_defs_accounthosting of tools_ozone_moderation_defs_accounthosting
    | `Tools_ozone_moderation_defs_recordhosting of tools_ozone_moderation_defs_recordhosting
    | `Other of Value.t (** Non closed union *)
    ] option;
    subjectblobcids: string list option;
    subjectrepohandle: string option;
    updatedat: string;
    createdat: string;
    reviewstate: tools_ozone_moderation_defs_subjectreviewstate;
    comment: string option;
    priorityscore: int64 option;
    muteuntil: string option;
    mutereportinguntil: string option;
    lastreviewedby: string option;
    lastreviewedat: string option;
    lastreportedat: string option;
    lastappealedat: string option;
    takendown: bool option;
    appealed: bool option;
    suspenduntil: string option;
    tags: string list option;
    accountstats: tools_ozone_moderation_defs_accountstats option;
    recordsstats: tools_ozone_moderation_defs_recordsstats option;
  }

  (** def subjectView *)
  type nonrec subjectview = tools_ozone_moderation_defs_subjectview = {
    type_: com_atproto_moderation_defs_subjecttype;
    subject: string;
    status: tools_ozone_moderation_defs_subjectstatusview option;
    repo: tools_ozone_moderation_defs_repoviewdetail option;
    profile: [
    | `Other of Value.t (** Non closed union *)
    ] option;
    record: tools_ozone_moderation_defs_recordviewdetail option;
  }

  (** def accountStats *)
  type nonrec accountstats = tools_ozone_moderation_defs_accountstats = {
    reportcount: int64;
    appealcount: int64;
    suspendcount: int64;
    escalatecount: int64;
    takedowncount: int64;
  }

  (** def recordsStats *)
  type nonrec recordsstats = tools_ozone_moderation_defs_recordsstats = {
    totalreports: int64;
    reportedcount: int64;
    escalatedcount: int64;
    appealedcount: int64;
    subjectcount: int64;
    pendingcount: int64;
    processedcount: int64;
    takendowncount: int64;
  }

  (** def subjectReviewState *)
  type nonrec subjectreviewstate = tools_ozone_moderation_defs_subjectreviewstate

  (** def reviewOpen *)
  type nonrec reviewopen = tools_ozone_moderation_defs_reviewopen

  (** def reviewEscalated *)
  type nonrec reviewescalated = tools_ozone_moderation_defs_reviewescalated

  (** def reviewClosed *)
  type nonrec reviewclosed = tools_ozone_moderation_defs_reviewclosed

  (** def reviewNone *)
  type nonrec reviewnone = tools_ozone_moderation_defs_reviewnone

  (** def modEventTakedown *)
  type nonrec modeventtakedown = tools_ozone_moderation_defs_modeventtakedown = {
    comment: string;
    durationinhours: int64;
    acknowledgeaccountsubjects: bool;
    policies: string list;
  }

  (** def modEventReverseTakedown *)
  type nonrec modeventreversetakedown = tools_ozone_moderation_defs_modeventreversetakedown = {
    comment: string;
  }

  (** def modEventResolveAppeal *)
  type nonrec modeventresolveappeal = tools_ozone_moderation_defs_modeventresolveappeal = {
    comment: string;
  }

  (** def modEventComment *)
  type nonrec modeventcomment = tools_ozone_moderation_defs_modeventcomment = {
    comment: string;
    sticky: bool;
  }

  (** def modEventReport *)
  type nonrec modeventreport = tools_ozone_moderation_defs_modeventreport = {
    comment: string option;
    isreportermuted: bool option;
    reporttype: com_atproto_moderation_defs_reasontype;
  }

  (** def modEventLabel *)
  type nonrec modeventlabel = tools_ozone_moderation_defs_modeventlabel = {
    comment: string option;
    createlabelvals: string list;
    negatelabelvals: string list;
    durationinhours: int64 option;
  }

  (** def modEventPriorityScore *)
  type nonrec modeventpriorityscore = tools_ozone_moderation_defs_modeventpriorityscore = {
    comment: string option;
    score: int64;
  }

  (** def modEventAcknowledge *)
  type nonrec modeventacknowledge = tools_ozone_moderation_defs_modeventacknowledge = {
    comment: string;
    acknowledgeaccountsubjects: bool;
  }

  (** def modEventEscalate *)
  type nonrec modeventescalate = tools_ozone_moderation_defs_modeventescalate = {
    comment: string;
  }

  (** def modEventMute *)
  type nonrec modeventmute = tools_ozone_moderation_defs_modeventmute = {
    comment: string option;
    durationinhours: int64;
  }

  (** def modEventUnmute *)
  type nonrec modeventunmute = tools_ozone_moderation_defs_modeventunmute = {
    comment: string;
  }

  (** def modEventMuteReporter *)
  type nonrec modeventmutereporter = tools_ozone_moderation_defs_modeventmutereporter = {
    comment: string;
    durationinhours: int64;
  }

  (** def modEventUnmuteReporter *)
  type nonrec modeventunmutereporter = tools_ozone_moderation_defs_modeventunmutereporter = {
    comment: string;
  }

  (** def modEventEmail *)
  type nonrec modeventemail = tools_ozone_moderation_defs_modeventemail = {
    subjectline: string;
    content: string option;
    comment: string option;
  }

  (** def modEventDivert *)
  type nonrec modeventdivert = tools_ozone_moderation_defs_modeventdivert = {
    comment: string;
  }

  (** def modEventTag *)
  type nonrec modeventtag = tools_ozone_moderation_defs_modeventtag = {
    add: string list;
    remove: string list;
    comment: string option;
  }

  (** def accountEvent *)
  type nonrec accountevent = tools_ozone_moderation_defs_accountevent = {
    comment: string option;
    active: bool;
    status: string option;
    timestamp: string;
  }

  (** def identityEvent *)
  type nonrec identityevent = tools_ozone_moderation_defs_identityevent = {
    comment: string option;
    handle: string option;
    pdshost: string option;
    tombstone: bool option;
    timestamp: string;
  }

  (** def recordEvent *)
  type nonrec recordevent = tools_ozone_moderation_defs_recordevent = {
    comment: string option;
    op: string;
    cid: string option;
    timestamp: string;
  }

  (** def repoView *)
  type nonrec repoview = tools_ozone_moderation_defs_repoview = {
    did: string;
    handle: string;
    email: string option;
    relatedrecords: Value.t (* unknown *) list;
    indexedat: string;
    moderation: tools_ozone_moderation_defs_moderation;
    invitedby: com_atproto_server_defs_invitecode option;
    invitesdisabled: bool option;
    invitenote: string option;
    deactivatedat: string option;
    threatsignatures: com_atproto_admin_defs_threatsignature list option;
  }

  (** def repoViewDetail *)
  type nonrec repoviewdetail = tools_ozone_moderation_defs_repoviewdetail = {
    did: string;
    handle: string;
    email: string option;
    relatedrecords: Value.t (* unknown *) list;
    indexedat: string;
    moderation: tools_ozone_moderation_defs_moderationdetail;
    labels: com_atproto_label_defs_label list option;
    invitedby: com_atproto_server_defs_invitecode option;
    invites: com_atproto_server_defs_invitecode list option;
    invitesdisabled: bool option;
    invitenote: string option;
    emailconfirmedat: string option;
    deactivatedat: string option;
    threatsignatures: com_atproto_admin_defs_threatsignature list option;
  }

  (** def repoViewNotFound *)
  type nonrec repoviewnotfound = tools_ozone_moderation_defs_repoviewnotfound = {
    did: string;
  }

  (** def recordView *)
  type nonrec recordview = tools_ozone_moderation_defs_recordview = {
    uri: string;
    cid: string;
    value: Value.t (* unknown *);
    blobcids: string list;
    indexedat: string;
    moderation: tools_ozone_moderation_defs_moderation;
    repo: tools_ozone_moderation_defs_repoview;
  }

  (** def recordViewDetail *)
  type nonrec recordviewdetail = tools_ozone_moderation_defs_recordviewdetail = {
    uri: string;
    cid: string;
    value: Value.t (* unknown *);
    blobs: tools_ozone_moderation_defs_blobview list;
    labels: com_atproto_label_defs_label list option;
    indexedat: string;
    moderation: tools_ozone_moderation_defs_moderationdetail;
    repo: tools_ozone_moderation_defs_repoview;
  }

  (** def recordViewNotFound *)
  type nonrec recordviewnotfound = tools_ozone_moderation_defs_recordviewnotfound = {
    uri: string;
  }

  (** def moderation *)
  type nonrec moderation = tools_ozone_moderation_defs_moderation = {
    subjectstatus: tools_ozone_moderation_defs_subjectstatusview;
  }

  (** def moderationDetail *)
  type nonrec moderationdetail = tools_ozone_moderation_defs_moderationdetail = {
    subjectstatus: tools_ozone_moderation_defs_subjectstatusview;
  }

  (** def blobView *)
  type nonrec blobview = tools_ozone_moderation_defs_blobview = {
    cid: string;
    mimetype: string;
    size: int64;
    createdat: string;
    details: [
    | `Tools_ozone_moderation_defs_imagedetails of tools_ozone_moderation_defs_imagedetails
    | `Tools_ozone_moderation_defs_videodetails of tools_ozone_moderation_defs_videodetails
    | `Other of Value.t (** Non closed union *)
    ] option;
    moderation: tools_ozone_moderation_defs_moderation option;
  }

  (** def imageDetails *)
  type nonrec imagedetails = tools_ozone_moderation_defs_imagedetails = {
    width: int64;
    height: int64;
  }

  (** def videoDetails *)
  type nonrec videodetails = tools_ozone_moderation_defs_videodetails = {
    width: int64;
    height: int64;
    length: int64;
  }

  (** def accountHosting *)
  type nonrec accounthosting = tools_ozone_moderation_defs_accounthosting = {
    status: string;
    updatedat: string option;
    createdat: string option;
    deletedat: string option;
    deactivatedat: string option;
    reactivatedat: string option;
  }

  (** def recordHosting *)
  type nonrec recordhosting = tools_ozone_moderation_defs_recordhosting = {
    status: string;
    updatedat: string option;
    createdat: string option;
    deletedat: string option;
  }

  (** def reporterStats *)
  type nonrec reporterstats = tools_ozone_moderation_defs_reporterstats = {
    did: string;
    accountreportcount: int64;
    recordreportcount: int64;
    reportedaccountcount: int64;
    reportedrecordcount: int64;
    takendownaccountcount: int64;
    takendownrecordcount: int64;
    labeledaccountcount: int64;
    labeledrecordcount: int64;
  }

end

(** lexicon tools.ozone.hosting.getAccountHistory
  *)

module Tools_Ozone_Hosting_GetAccountHistory = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def event *)
  type nonrec event = tools_ozone_hosting_getaccounthistory_event = {
    details: [
    | `Tools_ozone_hosting_getaccounthistory_accountcreated of tools_ozone_hosting_getaccounthistory_accountcreated
    | `Tools_ozone_hosting_getaccounthistory_emailupdated of tools_ozone_hosting_getaccounthistory_emailupdated
    | `Tools_ozone_hosting_getaccounthistory_emailconfirmed of tools_ozone_hosting_getaccounthistory_emailconfirmed
    | `Tools_ozone_hosting_getaccounthistory_passwordupdated of tools_ozone_hosting_getaccounthistory_passwordupdated
    | `Tools_ozone_hosting_getaccounthistory_handleupdated of tools_ozone_hosting_getaccounthistory_handleupdated
    | `Other of Value.t (** Non closed union *)
    ];
    createdby: string;
    createdat: string;
  }

  (** def accountCreated *)
  type nonrec accountcreated = tools_ozone_hosting_getaccounthistory_accountcreated = {
    email: string option;
    handle: string option;
  }

  (** def emailUpdated *)
  type nonrec emailupdated = tools_ozone_hosting_getaccounthistory_emailupdated = {
    email: string;
  }

  (** def emailConfirmed *)
  type nonrec emailconfirmed = tools_ozone_hosting_getaccounthistory_emailconfirmed = {
    email: string;
  }

  (** def passwordUpdated *)
  type nonrec passwordupdated = tools_ozone_hosting_getaccounthistory_passwordupdated

  (** def handleUpdated *)
  type nonrec handleupdated = tools_ozone_hosting_getaccounthistory_handleupdated = {
    handle: string;
  }

end

(** lexicon tools.ozone.communication.updateTemplate
  *)

module Tools_Ozone_Communication_UpdateTemplate = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.communication.listTemplates
  *)

module Tools_Ozone_Communication_ListTemplates = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.communication.deleteTemplate
  *)

module Tools_Ozone_Communication_DeleteTemplate = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.communication.createTemplate
  *)

module Tools_Ozone_Communication_CreateTemplate = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon tools.ozone.communication.defs
  *)

module Tools_Ozone_Communication_Defs = struct
  (** def templateView *)
  type nonrec templateview = tools_ozone_communication_defs_templateview = {
    id: string;
    name: string;
    subject: string option;
    contentmarkdown: string;
    disabled: bool;
    lang: string option;
    lastupdatedby: string;
    createdat: string;
    updatedat: string;
  }

end

(** lexicon com.atproto.temp.requestPhoneVerification
  *)

module Com_Atproto_Temp_RequestPhoneVerification = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.temp.fetchLabels
  *)

module Com_Atproto_Temp_FetchLabels = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.temp.checkSignupQueue
  *)

module Com_Atproto_Temp_CheckSignupQueue = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.temp.addReservedHandle
  *)

module Com_Atproto_Temp_AddReservedHandle = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.subscribeRepos
  *)

module Com_Atproto_Sync_SubscribeRepos = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def commit *)
  type nonrec commit = com_atproto_sync_subscriberepos_commit = {
    seq: int64;
    rebase: bool;
    toobig: bool;
    repo: string;
    commit: Cid.t;
    rev: string;
    since: string;
    blocks: bytes;
    ops: com_atproto_sync_subscriberepos_repoop list;
    blobs: Cid.t list;
    prevdata: Cid.t option;
    time: string;
  }

  (** def sync *)
  type nonrec sync = com_atproto_sync_subscriberepos_sync = {
    seq: int64;
    did: string;
    blocks: bytes;
    rev: string;
    time: string;
  }

  (** def identity *)
  type nonrec identity = com_atproto_sync_subscriberepos_identity = {
    seq: int64;
    did: string;
    time: string;
    handle: string option;
  }

  (** def account *)
  type nonrec account = com_atproto_sync_subscriberepos_account = {
    seq: int64;
    did: string;
    time: string;
    active: bool;
    status: string option;
  }

  (** def info *)
  type nonrec info = com_atproto_sync_subscriberepos_info = {
    name: string;
    message: string option;
  }

  (** def repoOp *)
  type nonrec repoop = com_atproto_sync_subscriberepos_repoop = {
    action: string;
    path: string;
    cid: Cid.t;
    prev: Cid.t option;
  }

end

(** lexicon com.atproto.sync.requestCrawl
  *)

module Com_Atproto_Sync_RequestCrawl = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.notifyOfUpdate
  *)

module Com_Atproto_Sync_NotifyOfUpdate = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.listReposByCollection
  *)

module Com_Atproto_Sync_ListReposByCollection = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def repo *)
  type nonrec repo = com_atproto_sync_listreposbycollection_repo = {
    did: string;
  }

end

(** lexicon com.atproto.sync.listRepos
  *)

module Com_Atproto_Sync_ListRepos = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def repo *)
  type nonrec repo = com_atproto_sync_listrepos_repo = {
    did: string;
    head: string;
    rev: string;
    active: bool option;
    status: string option;
  }

end

(** lexicon com.atproto.sync.listHosts
  *)

module Com_Atproto_Sync_ListHosts = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def host *)
  type nonrec host = com_atproto_sync_listhosts_host = {
    hostname: string;
    seq: int64 option;
    accountcount: int64 option;
    status: com_atproto_sync_defs_hoststatus option;
  }

end

(** lexicon com.atproto.sync.listBlobs
  *)

module Com_Atproto_Sync_ListBlobs = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.getRepoStatus
  *)

module Com_Atproto_Sync_GetRepoStatus = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.getRepo
  *)

module Com_Atproto_Sync_GetRepo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.getRecord
  *)

module Com_Atproto_Sync_GetRecord = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.getLatestCommit
  *)

module Com_Atproto_Sync_GetLatestCommit = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.getHostStatus
  *)

module Com_Atproto_Sync_GetHostStatus = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.getHead
  *)

module Com_Atproto_Sync_GetHead = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.getCheckout
  *)

module Com_Atproto_Sync_GetCheckout = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.getBlocks
  *)

module Com_Atproto_Sync_GetBlocks = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.getBlob
  *)

module Com_Atproto_Sync_GetBlob = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.sync.defs
  *)

module Com_Atproto_Sync_Defs = struct
  (** def hostStatus *)
  type nonrec hoststatus = com_atproto_sync_defs_hoststatus

end

(** lexicon com.atproto.server.updateEmail
  *)

module Com_Atproto_Server_UpdateEmail = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.revokeAppPassword
  *)

module Com_Atproto_Server_RevokeAppPassword = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.resetPassword
  *)

module Com_Atproto_Server_ResetPassword = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.reserveSigningKey
  *)

module Com_Atproto_Server_ReserveSigningKey = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.requestPasswordReset
  *)

module Com_Atproto_Server_RequestPasswordReset = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.requestEmailUpdate
  *)

module Com_Atproto_Server_RequestEmailUpdate = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.requestEmailConfirmation
  *)

module Com_Atproto_Server_RequestEmailConfirmation = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.requestAccountDelete
  *)

module Com_Atproto_Server_RequestAccountDelete = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.refreshSession
  *)

module Com_Atproto_Server_RefreshSession = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.listAppPasswords
  *)

module Com_Atproto_Server_ListAppPasswords = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def appPassword *)
  type nonrec apppassword = com_atproto_server_listapppasswords_apppassword = {
    name: string;
    createdat: string;
    privileged: bool option;
  }

end

(** lexicon com.atproto.server.getSession
  *)

module Com_Atproto_Server_GetSession = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.getServiceAuth
  *)

module Com_Atproto_Server_GetServiceAuth = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.getAccountInviteCodes
  *)

module Com_Atproto_Server_GetAccountInviteCodes = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.describeServer
  *)

module Com_Atproto_Server_DescribeServer = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def links *)
  type nonrec links = com_atproto_server_describeserver_links = {
    privacypolicy: string;
    termsofservice: string;
  }

  (** def contact *)
  type nonrec contact = com_atproto_server_describeserver_contact = {
    email: string;
  }

end

(** lexicon com.atproto.server.deleteSession
  *)

module Com_Atproto_Server_DeleteSession = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.deleteAccount
  *)

module Com_Atproto_Server_DeleteAccount = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.deactivateAccount
  *)

module Com_Atproto_Server_DeactivateAccount = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.createSession
  *)

module Com_Atproto_Server_CreateSession = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.createInviteCodes
  *)

module Com_Atproto_Server_CreateInviteCodes = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def accountCodes *)
  type nonrec accountcodes = com_atproto_server_createinvitecodes_accountcodes = {
    account: string;
    codes: string list;
  }

end

(** lexicon com.atproto.server.createInviteCode
  *)

module Com_Atproto_Server_CreateInviteCode = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.createAppPassword
  *)

module Com_Atproto_Server_CreateAppPassword = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def appPassword *)
  type nonrec apppassword = com_atproto_server_createapppassword_apppassword = {
    name: string;
    password: string;
    createdat: string;
    privileged: bool option;
  }

end

(** lexicon com.atproto.server.createAccount
  *)

module Com_Atproto_Server_CreateAccount = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.confirmEmail
  *)

module Com_Atproto_Server_ConfirmEmail = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.checkAccountStatus
  *)

module Com_Atproto_Server_CheckAccountStatus = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.server.activateAccount
  *)

module Com_Atproto_Server_ActivateAccount = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.repo.uploadBlob
  *)

module Com_Atproto_Repo_UploadBlob = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.repo.putRecord
  *)

module Com_Atproto_Repo_PutRecord = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.repo.listRecords
  *)

module Com_Atproto_Repo_ListRecords = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def record *)
  type nonrec record = com_atproto_repo_listrecords_record = {
    uri: string;
    cid: string;
    value: Value.t (* unknown *);
  }

end

(** lexicon com.atproto.repo.listMissingBlobs
  *)

module Com_Atproto_Repo_ListMissingBlobs = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def recordBlob *)
  type nonrec recordblob = com_atproto_repo_listmissingblobs_recordblob = {
    cid: string;
    recorduri: string;
  }

end

(** lexicon com.atproto.repo.importRepo
  *)

module Com_Atproto_Repo_ImportRepo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.repo.getRecord
  *)

module Com_Atproto_Repo_GetRecord = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.repo.describeRepo
  *)

module Com_Atproto_Repo_DescribeRepo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.repo.deleteRecord
  *)

module Com_Atproto_Repo_DeleteRecord = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.repo.createRecord
  *)

module Com_Atproto_Repo_CreateRecord = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.repo.applyWrites
  *)

module Com_Atproto_Repo_ApplyWrites = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def create *)
  type nonrec create = com_atproto_repo_applywrites_create = {
    collection: string;
    rkey: string option;
    value: Value.t (* unknown *);
  }

  (** def update *)
  type nonrec update = com_atproto_repo_applywrites_update = {
    collection: string;
    rkey: string;
    value: Value.t (* unknown *);
  }

  (** def delete *)
  type nonrec delete = com_atproto_repo_applywrites_delete = {
    collection: string;
    rkey: string;
  }

  (** def createResult *)
  type nonrec createresult = com_atproto_repo_applywrites_createresult = {
    uri: string;
    cid: string;
    validationstatus: string option;
  }

  (** def updateResult *)
  type nonrec updateresult = com_atproto_repo_applywrites_updateresult = {
    uri: string;
    cid: string;
    validationstatus: string option;
  }

  (** def deleteResult *)
  type nonrec deleteresult = com_atproto_repo_applywrites_deleteresult

end

(** lexicon com.atproto.repo.defs
  *)

module Com_Atproto_Repo_Defs = struct
  (** def commitMeta *)
  type nonrec commitmeta = com_atproto_repo_defs_commitmeta = {
    cid: string;
    rev: string;
  }

end

(** lexicon com.atproto.moderation.createReport
  *)

module Com_Atproto_Moderation_CreateReport = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.lexicon.schema
  *)

module Com_Atproto_Lexicon_Schema = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.label.subscribeLabels
  *)

module Com_Atproto_Label_SubscribeLabels = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def labels *)
  type nonrec labels = com_atproto_label_subscribelabels_labels = {
    seq: int64;
    labels: com_atproto_label_defs_label list;
  }

  (** def info *)
  type nonrec info = com_atproto_label_subscribelabels_info = {
    name: string;
    message: string option;
  }

end

(** lexicon com.atproto.label.queryLabels
  *)

module Com_Atproto_Label_QueryLabels = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.identity.updateHandle
  *)

module Com_Atproto_Identity_UpdateHandle = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.identity.submitPlcOperation
  *)

module Com_Atproto_Identity_SubmitPlcOperation = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.identity.signPlcOperation
  *)

module Com_Atproto_Identity_SignPlcOperation = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.identity.resolveIdentity
  *)

module Com_Atproto_Identity_ResolveIdentity = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.identity.resolveHandle
  *)

module Com_Atproto_Identity_ResolveHandle = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.identity.resolveDid
  *)

module Com_Atproto_Identity_ResolveDid = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.identity.requestPlcOperationSignature
  *)

module Com_Atproto_Identity_RequestPlcOperationSignature = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.identity.refreshIdentity
  *)

module Com_Atproto_Identity_RefreshIdentity = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.identity.getRecommendedDidCredentials
  *)

module Com_Atproto_Identity_GetRecommendedDidCredentials = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.identity.defs
  *)

module Com_Atproto_Identity_Defs = struct
  (** def identityInfo *)
  type nonrec identityinfo = com_atproto_identity_defs_identityinfo = {
    did: string;
    handle: string;
    diddoc: Value.t (* unknown *);
  }

end

(** lexicon com.atproto.admin.updateSubjectStatus
  *)

module Com_Atproto_Admin_UpdateSubjectStatus = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.updateAccountSigningKey
  *)

module Com_Atproto_Admin_UpdateAccountSigningKey = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.updateAccountPassword
  *)

module Com_Atproto_Admin_UpdateAccountPassword = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.updateAccountHandle
  *)

module Com_Atproto_Admin_UpdateAccountHandle = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.updateAccountEmail
  *)

module Com_Atproto_Admin_UpdateAccountEmail = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.sendEmail
  *)

module Com_Atproto_Admin_SendEmail = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.searchAccounts
  *)

module Com_Atproto_Admin_SearchAccounts = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.getSubjectStatus
  *)

module Com_Atproto_Admin_GetSubjectStatus = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.getInviteCodes
  *)

module Com_Atproto_Admin_GetInviteCodes = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.getAccountInfos
  *)

module Com_Atproto_Admin_GetAccountInfos = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.getAccountInfo
  *)

module Com_Atproto_Admin_GetAccountInfo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.enableAccountInvites
  *)

module Com_Atproto_Admin_EnableAccountInvites = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.disableInviteCodes
  *)

module Com_Atproto_Admin_DisableInviteCodes = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.disableAccountInvites
  *)

module Com_Atproto_Admin_DisableAccountInvites = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.deleteAccount
  *)

module Com_Atproto_Admin_DeleteAccount = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon com.atproto.admin.defs
  *)

module Com_Atproto_Admin_Defs = struct
  (** def statusAttr *)
  type nonrec statusattr = com_atproto_admin_defs_statusattr = {
    applied: bool;
    ref: string option;
  }

  (** def accountView *)
  type nonrec accountview = com_atproto_admin_defs_accountview = {
    did: string;
    handle: string;
    email: string option;
    relatedrecords: Value.t (* unknown *) list option;
    indexedat: string;
    invitedby: com_atproto_server_defs_invitecode option;
    invites: com_atproto_server_defs_invitecode list option;
    invitesdisabled: bool option;
    emailconfirmedat: string option;
    invitenote: string option;
    deactivatedat: string option;
    threatsignatures: com_atproto_admin_defs_threatsignature list option;
  }

  (** def repoRef *)
  type nonrec reporef = com_atproto_admin_defs_reporef = {
    did: string;
  }

  (** def repoBlobRef *)
  type nonrec repoblobref = com_atproto_admin_defs_repoblobref = {
    did: string;
    cid: string;
    recorduri: string option;
  }

  (** def threatSignature *)
  type nonrec threatsignature = com_atproto_admin_defs_threatsignature = {
    property: string;
    value: string;
  }

end

(** lexicon com.atproto.server.defs
  *)

module Com_Atproto_Server_Defs = struct
  (** def inviteCode *)
  type nonrec invitecode = com_atproto_server_defs_invitecode = {
    code: string;
    available: int64;
    disabled: bool;
    foraccount: string;
    createdby: string;
    createdat: string;
    uses: com_atproto_server_defs_invitecodeuse list;
  }

  (** def inviteCodeUse *)
  type nonrec invitecodeuse = com_atproto_server_defs_invitecodeuse = {
    usedby: string;
    usedat: string;
  }

end

(** lexicon chat.bsky.moderation.updateActorAccess
  *)

module Chat_Bsky_Moderation_UpdateActorAccess = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.moderation.getMessageContext
  *)

module Chat_Bsky_Moderation_GetMessageContext = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.moderation.getActorMetadata
  *)

module Chat_Bsky_Moderation_GetActorMetadata = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def metadata *)
  type nonrec metadata = chat_bsky_moderation_getactormetadata_metadata = {
    messagessent: int64;
    messagesreceived: int64;
    convos: int64;
    convosstarted: int64;
  }

end

(** lexicon chat.bsky.convo.updateRead
  *)

module Chat_Bsky_Convo_UpdateRead = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.updateAllRead
  *)

module Chat_Bsky_Convo_UpdateAllRead = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.unmuteConvo
  *)

module Chat_Bsky_Convo_UnmuteConvo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.sendMessageBatch
  *)

module Chat_Bsky_Convo_SendMessageBatch = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def batchItem *)
  type nonrec batchitem = chat_bsky_convo_sendmessagebatch_batchitem = {
    convoid: string;
    message: chat_bsky_convo_defs_messageinput;
  }

end

(** lexicon chat.bsky.convo.sendMessage
  *)

module Chat_Bsky_Convo_SendMessage = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.removeReaction
  *)

module Chat_Bsky_Convo_RemoveReaction = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.muteConvo
  *)

module Chat_Bsky_Convo_MuteConvo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.listConvos
  *)

module Chat_Bsky_Convo_ListConvos = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.leaveConvo
  *)

module Chat_Bsky_Convo_LeaveConvo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.getMessages
  *)

module Chat_Bsky_Convo_GetMessages = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.getLog
  *)

module Chat_Bsky_Convo_GetLog = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.getConvoForMembers
  *)

module Chat_Bsky_Convo_GetConvoForMembers = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.getConvoAvailability
  *)

module Chat_Bsky_Convo_GetConvoAvailability = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.getConvo
  *)

module Chat_Bsky_Convo_GetConvo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.deleteMessageForSelf
  *)

module Chat_Bsky_Convo_DeleteMessageForSelf = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.addReaction
  *)

module Chat_Bsky_Convo_AddReaction = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.convo.defs
  *)

module Chat_Bsky_Convo_Defs = struct
  (** def messageRef *)
  type nonrec messageref = chat_bsky_convo_defs_messageref = {
    did: string;
    convoid: string;
    messageid: string;
  }

  (** def messageInput *)
  type nonrec messageinput = chat_bsky_convo_defs_messageinput = {
    text: string;
    facets: app_bsky_richtext_facet_main list option;
    embed: [
    | `App_bsky_embed_record_main of app_bsky_embed_record_main
    | `Other of Value.t (** Non closed union *)
    ] option;
  }

  (** def messageView *)
  type nonrec messageview = chat_bsky_convo_defs_messageview = {
    id: string;
    rev: string;
    text: string;
    facets: app_bsky_richtext_facet_main list option;
    embed: [
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    reactions: chat_bsky_convo_defs_reactionview list option;
    sender: chat_bsky_convo_defs_messageviewsender;
    sentat: string;
  }

  (** def deletedMessageView *)
  type nonrec deletedmessageview = chat_bsky_convo_defs_deletedmessageview = {
    id: string;
    rev: string;
    sender: chat_bsky_convo_defs_messageviewsender;
    sentat: string;
  }

  (** def messageViewSender *)
  type nonrec messageviewsender = chat_bsky_convo_defs_messageviewsender = {
    did: string;
  }

  (** def reactionView *)
  type nonrec reactionview = chat_bsky_convo_defs_reactionview = {
    value: string;
    sender: chat_bsky_convo_defs_reactionviewsender;
    createdat: string;
  }

  (** def reactionViewSender *)
  type nonrec reactionviewsender = chat_bsky_convo_defs_reactionviewsender = {
    did: string;
  }

  (** def messageAndReactionView *)
  type nonrec messageandreactionview = chat_bsky_convo_defs_messageandreactionview = {
    message: chat_bsky_convo_defs_messageview;
    reaction: chat_bsky_convo_defs_reactionview;
  }

  (** def convoView *)
  type nonrec convoview = chat_bsky_convo_defs_convoview = {
    id: string;
    rev: string;
    members: chat_bsky_actor_defs_profileviewbasic list;
    lastmessage: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ] option;
    lastreaction: [
    | `Chat_bsky_convo_defs_messageandreactionview of chat_bsky_convo_defs_messageandreactionview
    | `Other of Value.t (** Non closed union *)
    ] option;
    muted: bool;
    status: string option;
    unreadcount: int64;
  }

  (** def logBeginConvo *)
  type nonrec logbeginconvo = chat_bsky_convo_defs_logbeginconvo = {
    rev: string;
    convoid: string;
  }

  (** def logAcceptConvo *)
  type nonrec logacceptconvo = chat_bsky_convo_defs_logacceptconvo = {
    rev: string;
    convoid: string;
  }

  (** def logLeaveConvo *)
  type nonrec logleaveconvo = chat_bsky_convo_defs_logleaveconvo = {
    rev: string;
    convoid: string;
  }

  (** def logMuteConvo *)
  type nonrec logmuteconvo = chat_bsky_convo_defs_logmuteconvo = {
    rev: string;
    convoid: string;
  }

  (** def logUnmuteConvo *)
  type nonrec logunmuteconvo = chat_bsky_convo_defs_logunmuteconvo = {
    rev: string;
    convoid: string;
  }

  (** def logCreateMessage *)
  type nonrec logcreatemessage = chat_bsky_convo_defs_logcreatemessage = {
    rev: string;
    convoid: string;
    message: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ];
  }

  (** def logDeleteMessage *)
  type nonrec logdeletemessage = chat_bsky_convo_defs_logdeletemessage = {
    rev: string;
    convoid: string;
    message: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ];
  }

  (** def logReadMessage *)
  type nonrec logreadmessage = chat_bsky_convo_defs_logreadmessage = {
    rev: string;
    convoid: string;
    message: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ];
  }

  (** def logAddReaction *)
  type nonrec logaddreaction = chat_bsky_convo_defs_logaddreaction = {
    rev: string;
    convoid: string;
    message: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ];
    reaction: chat_bsky_convo_defs_reactionview;
  }

  (** def logRemoveReaction *)
  type nonrec logremovereaction = chat_bsky_convo_defs_logremovereaction = {
    rev: string;
    convoid: string;
    message: [
    | `Chat_bsky_convo_defs_messageview of chat_bsky_convo_defs_messageview
    | `Chat_bsky_convo_defs_deletedmessageview of chat_bsky_convo_defs_deletedmessageview
    | `Other of Value.t (** Non closed union *)
    ];
    reaction: chat_bsky_convo_defs_reactionview;
  }

end

(** lexicon chat.bsky.convo.acceptConvo
  *)

module Chat_Bsky_Convo_AcceptConvo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.actor.exportAccountData
  *)

module Chat_Bsky_Actor_ExportAccountData = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.actor.deleteAccount
  *)

module Chat_Bsky_Actor_DeleteAccount = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon chat.bsky.actor.defs
  *)

module Chat_Bsky_Actor_Defs = struct
  (** def profileViewBasic *)
  type nonrec profileviewbasic = chat_bsky_actor_defs_profileviewbasic = {
    did: string;
    handle: string;
    displayname: string option;
    avatar: string option;
    associated: app_bsky_actor_defs_profileassociated option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    chatdisabled: bool option;
    verification: app_bsky_actor_defs_verificationstate option;
  }

end

(** lexicon chat.bsky.actor.declaration
  *)

module Chat_Bsky_Actor_Declaration = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.video.uploadVideo
  *)

module App_Bsky_Video_UploadVideo = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.video.getUploadLimits
  *)

module App_Bsky_Video_GetUploadLimits = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.video.getJobStatus
  *)

module App_Bsky_Video_GetJobStatus = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.video.defs
  *)

module App_Bsky_Video_Defs = struct
  (** def jobStatus *)
  type nonrec jobstatus = app_bsky_video_defs_jobstatus = {
    jobid: string;
    did: string;
    state: string;
    progress: int64 option;
    blob: Blob.t option;
    error: string option;
    message: string option;
  }

end

(** lexicon app.bsky.unspecced.searchStarterPacksSkeleton
  *)

module App_Bsky_Unspecced_SearchStarterPacksSkeleton = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.searchPostsSkeleton
  *)

module App_Bsky_Unspecced_SearchPostsSkeleton = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.searchActorsSkeleton
  *)

module App_Bsky_Unspecced_SearchActorsSkeleton = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getTrendsSkeleton
  *)

module App_Bsky_Unspecced_GetTrendsSkeleton = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getTrends
  *)

module App_Bsky_Unspecced_GetTrends = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getTrendingTopics
  *)

module App_Bsky_Unspecced_GetTrendingTopics = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getTaggedSuggestions
  *)

module App_Bsky_Unspecced_GetTaggedSuggestions = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def suggestion *)
  type nonrec suggestion = app_bsky_unspecced_gettaggedsuggestions_suggestion = {
    tag: string;
    subjecttype: string;
    subject: string;
  }

end

(** lexicon app.bsky.unspecced.getSuggestionsSkeleton
  *)

module App_Bsky_Unspecced_GetSuggestionsSkeleton = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getSuggestedUsersSkeleton
  *)

module App_Bsky_Unspecced_GetSuggestedUsersSkeleton = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getSuggestedUsers
  *)

module App_Bsky_Unspecced_GetSuggestedUsers = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getSuggestedStarterPacksSkeleton
  *)

module App_Bsky_Unspecced_GetSuggestedStarterPacksSkeleton = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getSuggestedStarterPacks
  *)

module App_Bsky_Unspecced_GetSuggestedStarterPacks = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getSuggestedFeedsSkeleton
  *)

module App_Bsky_Unspecced_GetSuggestedFeedsSkeleton = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getSuggestedFeeds
  *)

module App_Bsky_Unspecced_GetSuggestedFeeds = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getPopularFeedGenerators
  *)

module App_Bsky_Unspecced_GetPopularFeedGenerators = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.unspecced.getConfig
  *)

module App_Bsky_Unspecced_GetConfig = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def liveNowConfig *)
  type nonrec livenowconfig = app_bsky_unspecced_getconfig_livenowconfig = {
    did: string;
    domains: string list;
  }

end

(** lexicon app.bsky.unspecced.defs
  *)

module App_Bsky_Unspecced_Defs = struct
  (** def skeletonSearchPost *)
  type nonrec skeletonsearchpost = app_bsky_unspecced_defs_skeletonsearchpost = {
    uri: string;
  }

  (** def skeletonSearchActor *)
  type nonrec skeletonsearchactor = app_bsky_unspecced_defs_skeletonsearchactor = {
    did: string;
  }

  (** def skeletonSearchStarterPack *)
  type nonrec skeletonsearchstarterpack = app_bsky_unspecced_defs_skeletonsearchstarterpack = {
    uri: string;
  }

  (** def trendingTopic *)
  type nonrec trendingtopic = app_bsky_unspecced_defs_trendingtopic = {
    topic: string;
    displayname: string option;
    description: string option;
    link: string;
  }

  (** def skeletonTrend *)
  type nonrec skeletontrend = app_bsky_unspecced_defs_skeletontrend = {
    topic: string;
    displayname: string;
    link: string;
    startedat: string;
    postcount: int64;
    status: string option;
    category: string option;
    dids: string list;
  }

  (** def trendView *)
  type nonrec trendview = app_bsky_unspecced_defs_trendview = {
    topic: string;
    displayname: string;
    link: string;
    startedat: string;
    postcount: int64;
    status: string option;
    category: string option;
    actors: app_bsky_actor_defs_profileviewbasic list;
  }

end

(** lexicon app.bsky.notification.updateSeen
  *)

module App_Bsky_Notification_UpdateSeen = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.notification.registerPush
  *)

module App_Bsky_Notification_RegisterPush = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.notification.putPreferences
  *)

module App_Bsky_Notification_PutPreferences = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.notification.listNotifications
  *)

module App_Bsky_Notification_ListNotifications = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def notification *)
  type nonrec notification = app_bsky_notification_listnotifications_notification = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileview;
    reason: string;
    reasonsubject: string option;
    record: Value.t (* unknown *);
    isread: bool;
    indexedat: string;
    labels: com_atproto_label_defs_label list option;
  }

end

(** lexicon app.bsky.notification.getUnreadCount
  *)

module App_Bsky_Notification_GetUnreadCount = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.notification.defs
  *)

module App_Bsky_Notification_Defs = struct
  (** def recordDeleted *)
  type nonrec recorddeleted = app_bsky_notification_defs_recorddeleted

end

(** lexicon app.bsky.labeler.service
  *)

module App_Bsky_Labeler_Service = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.labeler.getServices
  *)

module App_Bsky_Labeler_GetServices = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.verification
  *)

module App_Bsky_Graph_Verification = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.unmuteThread
  *)

module App_Bsky_Graph_UnmuteThread = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.unmuteActorList
  *)

module App_Bsky_Graph_UnmuteActorList = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.unmuteActor
  *)

module App_Bsky_Graph_UnmuteActor = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.starterpack
  *)

module App_Bsky_Graph_Starterpack = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def feedItem *)
  type nonrec feeditem = app_bsky_graph_starterpack_feeditem = {
    uri: string;
  }

end

(** lexicon app.bsky.graph.searchStarterPacks
  *)

module App_Bsky_Graph_SearchStarterPacks = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.muteThread
  *)

module App_Bsky_Graph_MuteThread = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.muteActorList
  *)

module App_Bsky_Graph_MuteActorList = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.muteActor
  *)

module App_Bsky_Graph_MuteActor = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.listitem
  *)

module App_Bsky_Graph_Listitem = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.listblock
  *)

module App_Bsky_Graph_Listblock = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.list
  *)

module App_Bsky_Graph_List = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getSuggestedFollowsByActor
  *)

module App_Bsky_Graph_GetSuggestedFollowsByActor = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getStarterPacks
  *)

module App_Bsky_Graph_GetStarterPacks = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getStarterPack
  *)

module App_Bsky_Graph_GetStarterPack = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getRelationships
  *)

module App_Bsky_Graph_GetRelationships = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getMutes
  *)

module App_Bsky_Graph_GetMutes = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getLists
  *)

module App_Bsky_Graph_GetLists = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getListMutes
  *)

module App_Bsky_Graph_GetListMutes = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getListBlocks
  *)

module App_Bsky_Graph_GetListBlocks = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getList
  *)

module App_Bsky_Graph_GetList = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getKnownFollowers
  *)

module App_Bsky_Graph_GetKnownFollowers = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getFollows
  *)

module App_Bsky_Graph_GetFollows = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getFollowers
  *)

module App_Bsky_Graph_GetFollowers = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getBlocks
  *)

module App_Bsky_Graph_GetBlocks = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.getActorStarterPacks
  *)

module App_Bsky_Graph_GetActorStarterPacks = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.follow
  *)

module App_Bsky_Graph_Follow = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.graph.block
  *)

module App_Bsky_Graph_Block = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.sendInteractions
  *)

module App_Bsky_Feed_SendInteractions = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.searchPosts
  *)

module App_Bsky_Feed_SearchPosts = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.repost
  *)

module App_Bsky_Feed_Repost = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.post
  *)

module App_Bsky_Feed_Post = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def replyRef *)
  type nonrec replyref = app_bsky_feed_post_replyref = {
    root: com_atproto_repo_strongref_main;
    parent: com_atproto_repo_strongref_main;
  }

  (** def entity *)
  type nonrec entity = app_bsky_feed_post_entity = {
    index: app_bsky_feed_post_textslice;
    type_: string;
    value: string;
  }

  (** def textSlice *)
  type nonrec textslice = app_bsky_feed_post_textslice = {
    start: int64;
    end_: int64;
  }

end

(** lexicon app.bsky.feed.like
  *)

module App_Bsky_Feed_Like = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getTimeline
  *)

module App_Bsky_Feed_GetTimeline = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getSuggestedFeeds
  *)

module App_Bsky_Feed_GetSuggestedFeeds = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getRepostedBy
  *)

module App_Bsky_Feed_GetRepostedBy = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getQuotes
  *)

module App_Bsky_Feed_GetQuotes = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getPosts
  *)

module App_Bsky_Feed_GetPosts = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getPostThread
  *)

module App_Bsky_Feed_GetPostThread = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getListFeed
  *)

module App_Bsky_Feed_GetListFeed = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getLikes
  *)

module App_Bsky_Feed_GetLikes = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def like *)
  type nonrec like = app_bsky_feed_getlikes_like = {
    indexedat: string;
    createdat: string;
    actor: app_bsky_actor_defs_profileview;
  }

end

(** lexicon app.bsky.feed.getFeedSkeleton
  *)

module App_Bsky_Feed_GetFeedSkeleton = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getFeedGenerators
  *)

module App_Bsky_Feed_GetFeedGenerators = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getFeedGenerator
  *)

module App_Bsky_Feed_GetFeedGenerator = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getFeed
  *)

module App_Bsky_Feed_GetFeed = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getAuthorFeed
  *)

module App_Bsky_Feed_GetAuthorFeed = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getActorLikes
  *)

module App_Bsky_Feed_GetActorLikes = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.getActorFeeds
  *)

module App_Bsky_Feed_GetActorFeeds = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.generator
  *)

module App_Bsky_Feed_Generator = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.feed.describeFeedGenerator
  *)

module App_Bsky_Feed_DescribeFeedGenerator = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def feed *)
  type nonrec feed = app_bsky_feed_describefeedgenerator_feed = {
    uri: string;
  }

  (** def links *)
  type nonrec links = app_bsky_feed_describefeedgenerator_links = {
    privacypolicy: string;
    termsofservice: string;
  }

end

(** lexicon app.bsky.actor.status
  *)

module App_Bsky_Actor_Status = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def live *)
  type nonrec live = app_bsky_actor_status_live

end

(** lexicon app.bsky.actor.searchActorsTypeahead
  *)

module App_Bsky_Actor_SearchActorsTypeahead = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.actor.searchActors
  *)

module App_Bsky_Actor_SearchActors = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.actor.putPreferences
  *)

module App_Bsky_Actor_PutPreferences = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.actor.profile
  *)

module App_Bsky_Actor_Profile = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.actor.getSuggestions
  *)

module App_Bsky_Actor_GetSuggestions = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.actor.getProfiles
  *)

module App_Bsky_Actor_GetProfiles = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.actor.getProfile
  *)

module App_Bsky_Actor_GetProfile = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.actor.getPreferences
  *)

module App_Bsky_Actor_GetPreferences = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


end

(** lexicon app.bsky.actor.defs
  *)

module App_Bsky_Actor_Defs = struct
  (** def profileViewBasic *)
  type nonrec profileviewbasic = app_bsky_actor_defs_profileviewbasic = {
    did: string;
    handle: string;
    displayname: string option;
    avatar: string option;
    associated: app_bsky_actor_defs_profileassociated option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    createdat: string option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }

  (** def profileView *)
  type nonrec profileview = app_bsky_actor_defs_profileview = {
    did: string;
    handle: string;
    displayname: string option;
    description: string option;
    avatar: string option;
    associated: app_bsky_actor_defs_profileassociated option;
    indexedat: string option;
    createdat: string option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }

  (** def profileViewDetailed *)
  type nonrec profileviewdetailed = app_bsky_actor_defs_profileviewdetailed = {
    did: string;
    handle: string;
    displayname: string option;
    description: string option;
    avatar: string option;
    banner: string option;
    followerscount: int64 option;
    followscount: int64 option;
    postscount: int64 option;
    associated: app_bsky_actor_defs_profileassociated option;
    joinedviastarterpack: app_bsky_graph_defs_starterpackviewbasic option;
    indexedat: string option;
    createdat: string option;
    viewer: app_bsky_actor_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    pinnedpost: com_atproto_repo_strongref_main option;
    verification: app_bsky_actor_defs_verificationstate option;
    status: app_bsky_actor_defs_statusview option;
  }

  (** def profileAssociated *)
  type nonrec profileassociated = app_bsky_actor_defs_profileassociated = {
    lists: int64;
    feedgens: int64;
    starterpacks: int64;
    labeler: bool;
    chat: app_bsky_actor_defs_profileassociatedchat;
  }

  (** def profileAssociatedChat *)
  type nonrec profileassociatedchat = app_bsky_actor_defs_profileassociatedchat = {
    allowincoming: string;
  }

  (** def viewerState *)
  type nonrec viewerstate = app_bsky_actor_defs_viewerstate = {
    muted: bool;
    mutedbylist: app_bsky_graph_defs_listviewbasic;
    blockedby: bool;
    blocking: string;
    blockingbylist: app_bsky_graph_defs_listviewbasic;
    following: string;
    followedby: string;
    knownfollowers: app_bsky_actor_defs_knownfollowers;
  }

  (** def knownFollowers *)
  type nonrec knownfollowers = app_bsky_actor_defs_knownfollowers = {
    count: int64;
    followers: app_bsky_actor_defs_profileviewbasic list;
  }

  (** def verificationState *)
  type nonrec verificationstate = app_bsky_actor_defs_verificationstate = {
    verifications: app_bsky_actor_defs_verificationview list;
    verifiedstatus: string;
    trustedverifierstatus: string;
  }

  (** def verificationView *)
  type nonrec verificationview = app_bsky_actor_defs_verificationview = {
    issuer: string;
    uri: string;
    isvalid: bool;
    createdat: string;
  }

  (** def preferences *)
  type nonrec preferences = app_bsky_actor_defs_preferences

  (** def adultContentPref *)
  type nonrec adultcontentpref = app_bsky_actor_defs_adultcontentpref = {
    enabled: bool;
  }

  (** def contentLabelPref *)
  type nonrec contentlabelpref = app_bsky_actor_defs_contentlabelpref = {
    labelerdid: string option;
    label: string;
    visibility: string;
  }

  (** def savedFeed *)
  type nonrec savedfeed = app_bsky_actor_defs_savedfeed = {
    id: string;
    type_: string;
    value: string;
    pinned: bool;
  }

  (** def savedFeedsPrefV2 *)
  type nonrec savedfeedsprefv2 = app_bsky_actor_defs_savedfeedsprefv2 = {
    items: app_bsky_actor_defs_savedfeed list;
  }

  (** def savedFeedsPref *)
  type nonrec savedfeedspref = app_bsky_actor_defs_savedfeedspref = {
    pinned: string list;
    saved: string list;
    timelineindex: int64 option;
  }

  (** def personalDetailsPref *)
  type nonrec personaldetailspref = app_bsky_actor_defs_personaldetailspref = {
    birthdate: string;
  }

  (** def feedViewPref *)
  type nonrec feedviewpref = app_bsky_actor_defs_feedviewpref = {
    feed: string;
    hidereplies: bool option;
    hiderepliesbyunfollowed: bool option;
    hiderepliesbylikecount: int64 option;
    hidereposts: bool option;
    hidequoteposts: bool option;
  }

  (** def threadViewPref *)
  type nonrec threadviewpref = app_bsky_actor_defs_threadviewpref = {
    sort: string;
    prioritizefollowedusers: bool;
  }

  (** def interestsPref *)
  type nonrec interestspref = app_bsky_actor_defs_interestspref = {
    tags: string list;
  }

  (** def mutedWordTarget *)
  type nonrec mutedwordtarget = app_bsky_actor_defs_mutedwordtarget

  (** def mutedWord *)
  type nonrec mutedword = app_bsky_actor_defs_mutedword = {
    id: string option;
    value: string;
    targets: app_bsky_actor_defs_mutedwordtarget list;
    actortarget: string option;
    expiresat: string option;
  }

  (** def mutedWordsPref *)
  type nonrec mutedwordspref = app_bsky_actor_defs_mutedwordspref = {
    items: app_bsky_actor_defs_mutedword list;
  }

  (** def hiddenPostsPref *)
  type nonrec hiddenpostspref = app_bsky_actor_defs_hiddenpostspref = {
    items: string list;
  }

  (** def labelersPref *)
  type nonrec labelerspref = app_bsky_actor_defs_labelerspref = {
    labelers: app_bsky_actor_defs_labelerprefitem list;
  }

  (** def labelerPrefItem *)
  type nonrec labelerprefitem = app_bsky_actor_defs_labelerprefitem = {
    did: string;
  }

  (** def bskyAppStatePref *)
  type nonrec bskyappstatepref = app_bsky_actor_defs_bskyappstatepref = {
    activeprogressguide: app_bsky_actor_defs_bskyappprogressguide;
    queuednudges: string list;
    nuxs: app_bsky_actor_defs_nux list;
  }

  (** def bskyAppProgressGuide *)
  type nonrec bskyappprogressguide = app_bsky_actor_defs_bskyappprogressguide = {
    guide: string;
  }

  (** def nux *)
  type nonrec nux = app_bsky_actor_defs_nux = {
    id: string;
    completed: bool;
    data: string option;
    expiresat: string option;
  }

  (** def verificationPrefs *)
  type nonrec verificationprefs = app_bsky_actor_defs_verificationprefs = {
    hidebadges: bool option;
  }

  (** def postInteractionSettingsPref *)
  type nonrec postinteractionsettingspref = app_bsky_actor_defs_postinteractionsettingspref = {
    threadgateallowrules: [
    | `App_bsky_feed_threadgate_mentionrule of app_bsky_feed_threadgate_mentionrule
    | `App_bsky_feed_threadgate_followerrule of app_bsky_feed_threadgate_followerrule
    | `App_bsky_feed_threadgate_followingrule of app_bsky_feed_threadgate_followingrule
    | `App_bsky_feed_threadgate_listrule of app_bsky_feed_threadgate_listrule
    | `Other of Value.t (** Non closed union *)
    ] list option;
    postgateembeddingrules: [
    | `App_bsky_feed_postgate_disablerule of app_bsky_feed_postgate_disablerule
    | `Other of Value.t (** Non closed union *)
    ] list option;
  }

  (** def statusView *)
  type nonrec statusview = app_bsky_actor_defs_statusview = {
    status: string;
    record: Value.t (* unknown *);
    embed: [
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    expiresat: string option;
    isactive: bool option;
  }

end

(** lexicon app.bsky.graph.defs
  *)

module App_Bsky_Graph_Defs = struct
  (** def listViewBasic *)
  type nonrec listviewbasic = app_bsky_graph_defs_listviewbasic = {
    uri: string;
    cid: string;
    name: string;
    purpose: app_bsky_graph_defs_listpurpose;
    avatar: string option;
    listitemcount: int64 option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_graph_defs_listviewerstate option;
    indexedat: string option;
  }

  (** def listView *)
  type nonrec listview = app_bsky_graph_defs_listview = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    name: string;
    purpose: app_bsky_graph_defs_listpurpose;
    description: string option;
    descriptionfacets: app_bsky_richtext_facet_main list option;
    avatar: string option;
    listitemcount: int64 option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_graph_defs_listviewerstate option;
    indexedat: string;
  }

  (** def listItemView *)
  type nonrec listitemview = app_bsky_graph_defs_listitemview = {
    uri: string;
    subject: app_bsky_actor_defs_profileview;
  }

  (** def starterPackView *)
  type nonrec starterpackview = app_bsky_graph_defs_starterpackview = {
    uri: string;
    cid: string;
    record: Value.t (* unknown *);
    creator: app_bsky_actor_defs_profileviewbasic;
    list: app_bsky_graph_defs_listviewbasic option;
    listitemssample: app_bsky_graph_defs_listitemview list option;
    feeds: app_bsky_feed_defs_generatorview list option;
    joinedweekcount: int64 option;
    joinedalltimecount: int64 option;
    labels: com_atproto_label_defs_label list option;
    indexedat: string;
  }

  (** def starterPackViewBasic *)
  type nonrec starterpackviewbasic = app_bsky_graph_defs_starterpackviewbasic = {
    uri: string;
    cid: string;
    record: Value.t (* unknown *);
    creator: app_bsky_actor_defs_profileviewbasic;
    listitemcount: int64 option;
    joinedweekcount: int64 option;
    joinedalltimecount: int64 option;
    labels: com_atproto_label_defs_label list option;
    indexedat: string;
  }

  (** def listPurpose *)
  type nonrec listpurpose = app_bsky_graph_defs_listpurpose

  (** def modlist *)
  type nonrec modlist = app_bsky_graph_defs_modlist

  (** def curatelist *)
  type nonrec curatelist = app_bsky_graph_defs_curatelist

  (** def referencelist *)
  type nonrec referencelist = app_bsky_graph_defs_referencelist

  (** def listViewerState *)
  type nonrec listviewerstate = app_bsky_graph_defs_listviewerstate = {
    muted: bool;
    blocked: string;
  }

  (** def notFoundActor *)
  type nonrec notfoundactor = app_bsky_graph_defs_notfoundactor = {
    actor: string;
    notfound: bool;
  }

  (** def relationship *)
  type nonrec relationship = app_bsky_graph_defs_relationship = {
    did: string;
    following: string option;
    followedby: string option;
  }

end

(** lexicon app.bsky.feed.defs
  *)

module App_Bsky_Feed_Defs = struct
  (** def postView *)
  type nonrec postview = app_bsky_feed_defs_postview = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileviewbasic;
    record: Value.t (* unknown *);
    embed: [
    | `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `App_bsky_embed_recordwithmedia_view of app_bsky_embed_recordwithmedia_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    replycount: int64 option;
    repostcount: int64 option;
    likecount: int64 option;
    quotecount: int64 option;
    indexedat: string;
    viewer: app_bsky_feed_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    threadgate: app_bsky_feed_defs_threadgateview option;
  }

  (** def viewerState *)
  type nonrec viewerstate = app_bsky_feed_defs_viewerstate = {
    repost: string;
    like: string;
    threadmuted: bool;
    replydisabled: bool;
    embeddingdisabled: bool;
    pinned: bool;
  }

  (** def threadContext *)
  type nonrec threadcontext = app_bsky_feed_defs_threadcontext = {
    rootauthorlike: string;
  }

  (** def feedViewPost *)
  type nonrec feedviewpost = app_bsky_feed_defs_feedviewpost = {
    post: app_bsky_feed_defs_postview;
    reply: app_bsky_feed_defs_replyref option;
    reason: [
    | `App_bsky_feed_defs_reasonrepost of app_bsky_feed_defs_reasonrepost
    | `App_bsky_feed_defs_reasonpin of app_bsky_feed_defs_reasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedcontext: string option;
  }

  (** def replyRef *)
  type nonrec replyref = app_bsky_feed_defs_replyref = {
    root: [
    | `App_bsky_feed_defs_postview of app_bsky_feed_defs_postview
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ];
    parent: [
    | `App_bsky_feed_defs_postview of app_bsky_feed_defs_postview
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ];
    grandparentauthor: app_bsky_actor_defs_profileviewbasic option;
  }

  (** def reasonRepost *)
  type nonrec reasonrepost = app_bsky_feed_defs_reasonrepost = {
    by: app_bsky_actor_defs_profileviewbasic;
    indexedat: string;
  }

  (** def reasonPin *)
  type nonrec reasonpin = app_bsky_feed_defs_reasonpin

  (** def threadViewPost *)
  type nonrec threadviewpost = app_bsky_feed_defs_threadviewpost = {
    post: app_bsky_feed_defs_postview;
    parent: [
    | `App_bsky_feed_defs_threadviewpost of app_bsky_feed_defs_threadviewpost
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ] option;
    replies: [
    | `App_bsky_feed_defs_threadviewpost of app_bsky_feed_defs_threadviewpost
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ] list option;
    threadcontext: app_bsky_feed_defs_threadcontext option;
  }

  (** def notFoundPost *)
  type nonrec notfoundpost = app_bsky_feed_defs_notfoundpost = {
    uri: string;
    notfound: bool;
  }

  (** def blockedPost *)
  type nonrec blockedpost = app_bsky_feed_defs_blockedpost = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }

  (** def blockedAuthor *)
  type nonrec blockedauthor = app_bsky_feed_defs_blockedauthor = {
    did: string;
    viewer: app_bsky_actor_defs_viewerstate option;
  }

  (** def generatorView *)
  type nonrec generatorview = app_bsky_feed_defs_generatorview = {
    uri: string;
    cid: string;
    did: string;
    creator: app_bsky_actor_defs_profileview;
    displayname: string;
    description: string option;
    descriptionfacets: app_bsky_richtext_facet_main list option;
    avatar: string option;
    likecount: int64 option;
    acceptsinteractions: bool option;
    labels: com_atproto_label_defs_label list option;
    viewer: app_bsky_feed_defs_generatorviewerstate option;
    contentmode: string option;
    indexedat: string;
  }

  (** def generatorViewerState *)
  type nonrec generatorviewerstate = app_bsky_feed_defs_generatorviewerstate = {
    like: string;
  }

  (** def skeletonFeedPost *)
  type nonrec skeletonfeedpost = app_bsky_feed_defs_skeletonfeedpost = {
    post: string;
    reason: [
    | `App_bsky_feed_defs_skeletonreasonrepost of app_bsky_feed_defs_skeletonreasonrepost
    | `App_bsky_feed_defs_skeletonreasonpin of app_bsky_feed_defs_skeletonreasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedcontext: string option;
  }

  (** def skeletonReasonRepost *)
  type nonrec skeletonreasonrepost = app_bsky_feed_defs_skeletonreasonrepost = {
    repost: string;
  }

  (** def skeletonReasonPin *)
  type nonrec skeletonreasonpin = app_bsky_feed_defs_skeletonreasonpin

  (** def threadgateView *)
  type nonrec threadgateview = app_bsky_feed_defs_threadgateview = {
    uri: string;
    cid: string;
    record: Value.t (* unknown *);
    lists: app_bsky_graph_defs_listviewbasic list;
  }

  (** def interaction *)
  type nonrec interaction = app_bsky_feed_defs_interaction = {
    item: string;
    event: string;
    feedcontext: string;
  }

  (** def requestLess *)
  type nonrec requestless = app_bsky_feed_defs_requestless

  (** def requestMore *)
  type nonrec requestmore = app_bsky_feed_defs_requestmore

  (** def clickthroughItem *)
  type nonrec clickthroughitem = app_bsky_feed_defs_clickthroughitem

  (** def clickthroughAuthor *)
  type nonrec clickthroughauthor = app_bsky_feed_defs_clickthroughauthor

  (** def clickthroughReposter *)
  type nonrec clickthroughreposter = app_bsky_feed_defs_clickthroughreposter

  (** def clickthroughEmbed *)
  type nonrec clickthroughembed = app_bsky_feed_defs_clickthroughembed

  (** def contentModeUnspecified *)
  type nonrec contentmodeunspecified = app_bsky_feed_defs_contentmodeunspecified

  (** def contentModeVideo *)
  type nonrec contentmodevideo = app_bsky_feed_defs_contentmodevideo

  (** def interactionSeen *)
  type nonrec interactionseen = app_bsky_feed_defs_interactionseen

  (** def interactionLike *)
  type nonrec interactionlike = app_bsky_feed_defs_interactionlike

  (** def interactionRepost *)
  type nonrec interactionrepost = app_bsky_feed_defs_interactionrepost

  (** def interactionReply *)
  type nonrec interactionreply = app_bsky_feed_defs_interactionreply

  (** def interactionQuote *)
  type nonrec interactionquote = app_bsky_feed_defs_interactionquote

  (** def interactionShare *)
  type nonrec interactionshare = app_bsky_feed_defs_interactionshare

end

(** lexicon app.bsky.embed.recordWithMedia
  A representation of a record embedded in a Bluesky record (eg, a post), alongside other compatible embeds. For example, a quote post and image, or a quote post and external URL card.
  *)

module App_Bsky_Embed_RecordWithMedia = struct
  (** def main *)
  type nonrec main = app_bsky_embed_recordwithmedia_main = {
    record: app_bsky_embed_record_main;
    media: [
    | `App_bsky_embed_images_main of app_bsky_embed_images_main
    | `App_bsky_embed_video_main of app_bsky_embed_video_main
    | `App_bsky_embed_external_main of app_bsky_embed_external_main
    | `Other of Value.t (** Non closed union *)
    ];
  }

  (** def view *)
  type nonrec view = app_bsky_embed_recordwithmedia_view = {
    record: app_bsky_embed_record_view;
    media: [
    | `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `Other of Value.t (** Non closed union *)
    ];
  }

end

(** lexicon app.bsky.embed.record
  A representation of a record embedded in a Bluesky record (eg, a post). For example, a quote-post, or sharing a feed generator record.
  *)

module App_Bsky_Embed_Record = struct
  (** def main *)
  type nonrec main = app_bsky_embed_record_main = {
    record: com_atproto_repo_strongref_main;
  }

  (** def view *)
  type nonrec view = app_bsky_embed_record_view = {
    record: [
    | `App_bsky_embed_record_viewrecord of app_bsky_embed_record_viewrecord
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

  (** def viewRecord *)
  type nonrec viewrecord = app_bsky_embed_record_viewrecord = {
    uri: string;
    cid: string;
    author: app_bsky_actor_defs_profileviewbasic;
    value: Value.t (* unknown *);
    labels: com_atproto_label_defs_label list option;
    replycount: int64 option;
    repostcount: int64 option;
    likecount: int64 option;
    quotecount: int64 option;
    embeds: [
    | `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `App_bsky_embed_recordwithmedia_view of app_bsky_embed_recordwithmedia_view
    | `Other of Value.t (** Non closed union *)
    ] list option;
    indexedat: string;
  }

  (** def viewNotFound *)
  type nonrec viewnotfound = app_bsky_embed_record_viewnotfound = {
    uri: string;
    notfound: bool;
  }

  (** def viewBlocked *)
  type nonrec viewblocked = app_bsky_embed_record_viewblocked = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }

  (** def viewDetached *)
  type nonrec viewdetached = app_bsky_embed_record_viewdetached = {
    uri: string;
    detached: bool;
  }

end

(** lexicon app.bsky.labeler.defs
  *)

module App_Bsky_Labeler_Defs = struct
  (** def labelerView *)
  type nonrec labelerview = app_bsky_labeler_defs_labelerview = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    likecount: int64 option;
    viewer: app_bsky_labeler_defs_labelerviewerstate option;
    indexedat: string;
    labels: com_atproto_label_defs_label list option;
  }

  (** def labelerViewDetailed *)
  type nonrec labelerviewdetailed = app_bsky_labeler_defs_labelerviewdetailed = {
    uri: string;
    cid: string;
    creator: app_bsky_actor_defs_profileview;
    policies: app_bsky_labeler_defs_labelerpolicies;
    likecount: int64 option;
    viewer: app_bsky_labeler_defs_labelerviewerstate option;
    indexedat: string;
    labels: com_atproto_label_defs_label list option;
    reasontypes: com_atproto_moderation_defs_reasontype list option;
    subjecttypes: com_atproto_moderation_defs_subjecttype list option;
    subjectcollections: string list option;
  }

  (** def labelerViewerState *)
  type nonrec labelerviewerstate = app_bsky_labeler_defs_labelerviewerstate = {
    like: string;
  }

  (** def labelerPolicies *)
  type nonrec labelerpolicies = app_bsky_labeler_defs_labelerpolicies = {
    labelvalues: com_atproto_label_defs_labelvalue list;
    labelvaluedefinitions: com_atproto_label_defs_labelvaluedefinition list option;
  }

end

(** lexicon com.atproto.repo.strongRef
  A URI with a content-hash fingerprint.
  *)

module Com_Atproto_Repo_StrongRef = struct
  (** def main *)
  type nonrec main = com_atproto_repo_strongref_main = {
    uri: string;
    cid: string;
  }

end

(** lexicon com.atproto.moderation.defs
  *)

module Com_Atproto_Moderation_Defs = struct
  (** def reasonType *)
  type nonrec reasontype = com_atproto_moderation_defs_reasontype

  (** def reasonSpam *)
  type nonrec reasonspam = com_atproto_moderation_defs_reasonspam

  (** def reasonViolation *)
  type nonrec reasonviolation = com_atproto_moderation_defs_reasonviolation

  (** def reasonMisleading *)
  type nonrec reasonmisleading = com_atproto_moderation_defs_reasonmisleading

  (** def reasonSexual *)
  type nonrec reasonsexual = com_atproto_moderation_defs_reasonsexual

  (** def reasonRude *)
  type nonrec reasonrude = com_atproto_moderation_defs_reasonrude

  (** def reasonOther *)
  type nonrec reasonother = com_atproto_moderation_defs_reasonother

  (** def reasonAppeal *)
  type nonrec reasonappeal = com_atproto_moderation_defs_reasonappeal

  (** def subjectType *)
  type nonrec subjecttype = com_atproto_moderation_defs_subjecttype

end

(** lexicon app.bsky.embed.images
  A set of images embedded in a Bluesky record (eg, a post).
  *)

module App_Bsky_Embed_Images = struct
  (** def main *)
  type nonrec main = app_bsky_embed_images_main = {
    images: app_bsky_embed_images_image list;
  }

  (** def image *)
  type nonrec image = app_bsky_embed_images_image = {
    image: Blob.t;
    alt: string;
    aspectratio: app_bsky_embed_defs_aspectratio option;
  }

  (** def view *)
  type nonrec view = app_bsky_embed_images_view = {
    images: app_bsky_embed_images_viewimage list;
  }

  (** def viewImage *)
  type nonrec viewimage = app_bsky_embed_images_viewimage = {
    thumb: string;
    fullsize: string;
    alt: string;
    aspectratio: app_bsky_embed_defs_aspectratio option;
  }

end

(** lexicon app.bsky.embed.video
  A video embedded in a Bluesky record (eg, a post).
  *)

module App_Bsky_Embed_Video = struct
  (** def main *)
  type nonrec main = app_bsky_embed_video_main = {
    video: Blob.t;
    captions: app_bsky_embed_video_caption list option;
    alt: string option;
    aspectratio: app_bsky_embed_defs_aspectratio option;
  }

  (** def caption *)
  type nonrec caption = app_bsky_embed_video_caption = {
    lang: string;
    file: Blob.t;
  }

  (** def view *)
  type nonrec view = app_bsky_embed_video_view = {
    cid: string;
    playlist: string;
    thumbnail: string option;
    alt: string option;
    aspectratio: app_bsky_embed_defs_aspectratio option;
  }

end

(** lexicon app.bsky.embed.defs
  *)

module App_Bsky_Embed_Defs = struct
  (** def aspectRatio *)
  type nonrec aspectratio = app_bsky_embed_defs_aspectratio = {
    width: int64;
    height: int64;
  }

end

(** lexicon app.bsky.richtext.facet
  *)

module App_Bsky_Richtext_Facet = struct
  (** def main *)
  type nonrec main = app_bsky_richtext_facet_main = {
    index: app_bsky_richtext_facet_byteslice;
    features: [
    | `App_bsky_richtext_facet_mention of app_bsky_richtext_facet_mention
    | `App_bsky_richtext_facet_link of app_bsky_richtext_facet_link
    | `App_bsky_richtext_facet_tag of app_bsky_richtext_facet_tag
    | `Other of Value.t (** Non closed union *)
    ] list;
  }

  (** def mention *)
  type nonrec mention = app_bsky_richtext_facet_mention = {
    did: string;
  }

  (** def link *)
  type nonrec link = app_bsky_richtext_facet_link = {
    uri: string;
  }

  (** def tag *)
  type nonrec tag = app_bsky_richtext_facet_tag = {
    tag: string;
  }

  (** def byteSlice *)
  type nonrec byteslice = app_bsky_richtext_facet_byteslice = {
    bytestart: int64;
    byteend: int64;
  }

end

(** lexicon com.atproto.label.defs
  *)

module Com_Atproto_Label_Defs = struct
  (** def label *)
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

  (** def selfLabels *)
  type nonrec selflabels = com_atproto_label_defs_selflabels = {
    values: com_atproto_label_defs_selflabel list;
  }

  (** def selfLabel *)
  type nonrec selflabel = com_atproto_label_defs_selflabel = {
    val_: string;
  }

  (** def labelValueDefinition *)
  type nonrec labelvaluedefinition = com_atproto_label_defs_labelvaluedefinition = {
    identifier: string;
    severity: string;
    blurs: string;
    defaultsetting: string option;
    adultonly: bool option;
    locales: com_atproto_label_defs_labelvaluedefinitionstrings list;
  }

  (** def labelValueDefinitionStrings *)
  type nonrec labelvaluedefinitionstrings = com_atproto_label_defs_labelvaluedefinitionstrings = {
    lang: string;
    name: string;
    description: string;
  }

  (** def labelValue *)
  type nonrec labelvalue = com_atproto_label_defs_labelvalue

end

(** lexicon app.bsky.feed.threadgate
  *)

module App_Bsky_Feed_Threadgate = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def mentionRule *)
  type nonrec mentionrule = app_bsky_feed_threadgate_mentionrule

  (** def followerRule *)
  type nonrec followerrule = app_bsky_feed_threadgate_followerrule

  (** def followingRule *)
  type nonrec followingrule = app_bsky_feed_threadgate_followingrule

  (** def listRule *)
  type nonrec listrule = app_bsky_feed_threadgate_listrule = {
    list: string;
  }

end

(** lexicon app.bsky.feed.postgate
  *)

module App_Bsky_Feed_Postgate = struct
  (** def main *)
  type main = [`Todo] (* TODO *)


  (** def disableRule *)
  type nonrec disablerule = app_bsky_feed_postgate_disablerule

end

(** lexicon app.bsky.embed.external
  *)

module App_Bsky_Embed_External = struct
  (** def main *)
  type nonrec main = app_bsky_embed_external_main = {
    external_: app_bsky_embed_external_external;
  }

  (** def external *)
  type nonrec external_ = app_bsky_embed_external_external = {
    uri: string;
    title: string;
    description: string;
    thumb: Blob.t option;
  }

  (** def view *)
  type nonrec view = app_bsky_embed_external_view = {
    external_: app_bsky_embed_external_viewexternal;
  }

  (** def viewExternal *)
  type nonrec viewexternal = app_bsky_embed_external_viewexternal = {
    uri: string;
    title: string;
    description: string;
    thumb: string option;
  }

end


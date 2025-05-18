(* geherated by Cephalopod_lexicon's codegen tool, do not modify *)
open Cephalopod_dasl


(** Type definitions *)
module Types = struct

  (** def "app.bsky.feed.describeFeedGenerator#links" *)
  type app_bsky_feed_describefeedgenerator_links = {
    privacyPolicy: string option;
    termsOfService: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#profileAssociatedChat" *)
  type app_bsky_actor_defs_profileassociatedchat = {
    allowIncoming: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#profileAssociated" *)
  type app_bsky_actor_defs_profileassociated = {
    lists: int64 option;
    feedgens: int64 option;
    starterPacks: int64 option;
    labeler: bool option;
    chat: app_bsky_actor_defs_profileassociatedchat option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.graph.defs#listPurpose" *)
  type app_bsky_graph_defs_listpurpose = string
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.label.defs#label" *)
  type com_atproto_label_defs_label = {
    ver: int64 option;
    src: string;
    uri: string;
    cid: string option;
    val_: string; [@key "val"]
    neg: bool option;
    cts: string;
    exp: string option;
    sig_: bytes option; [@key "sig"]
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.graph.defs#listViewerState" *)
  type app_bsky_graph_defs_listviewerstate = {
    muted: bool option;
    blocked: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#verificationView" *)
  type app_bsky_actor_defs_verificationview = {
    issuer: string;
    uri: string;
    isValid: bool;
    createdAt: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#verificationState" *)
  type app_bsky_actor_defs_verificationstate = {
    verifications: app_bsky_actor_defs_verificationview list;
    verifiedStatus: string;
    trustedVerifierStatus: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.external#viewExternal" *)
  type app_bsky_embed_external_viewexternal = {
    uri: string;
    title: string;
    description: string;
    thumb: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.external#view" *)
  type app_bsky_embed_external_view = {
    external_: app_bsky_embed_external_viewexternal; [@key "external"]
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#statusView" *)
  type app_bsky_actor_defs_statusview = {
    status: string;
    record: Value.t (* unknown *);
    embed: [
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    expiresAt: string option;
    isActive: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.repo.strongRef#main" *)
  type com_atproto_repo_strongref_main = {
    uri: string;
    cid: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.richtext.facet#byteSlice" *)
  type app_bsky_richtext_facet_byteslice = {
    byteStart: int64;
    byteEnd: int64;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.richtext.facet#mention" *)
  type app_bsky_richtext_facet_mention = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.richtext.facet#link" *)
  type app_bsky_richtext_facet_link = {
    uri: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.richtext.facet#tag" *)
  type app_bsky_richtext_facet_tag = {
    tag: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#generatorViewerState" *)
  type app_bsky_feed_defs_generatorviewerstate = {
    like: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.defs#aspectRatio" *)
  type app_bsky_embed_defs_aspectratio = {
    width: int64;
    height: int64;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.images#viewImage" *)
  type app_bsky_embed_images_viewimage = {
    thumb: string;
    fullsize: string;
    alt: string;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.repo.applyWrites#create" *)
  type com_atproto_repo_applywrites_create = {
    collection: string;
    rkey: string option;
    value: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.sync.defs#hostStatus" *)
  type com_atproto_sync_defs_hoststatus = string
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.images#image" *)
  type app_bsky_embed_images_image = {
    image: Blob.t;
    alt: string;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.images#main" *)
  type app_bsky_embed_images_main = {
    images: app_bsky_embed_images_image list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.sync.subscribeRepos#account" *)
  type com_atproto_sync_subscriberepos_account = {
    seq: int64;
    did: string;
    time: string;
    active: bool;
    status: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#adultContentPref" *)
  type app_bsky_actor_defs_adultcontentpref = {
    enabled: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#contentLabelPref" *)
  type app_bsky_actor_defs_contentlabelpref = {
    labelerDid: string option;
    label: string;
    visibility: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#savedFeedsPref" *)
  type app_bsky_actor_defs_savedfeedspref = {
    pinned: string list;
    saved: string list;
    timelineIndex: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#savedFeed" *)
  type app_bsky_actor_defs_savedfeed = {
    id: string;
    type_: string; [@key "type"]
    value: string;
    pinned: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#savedFeedsPrefV2" *)
  type app_bsky_actor_defs_savedfeedsprefv2 = {
    items: app_bsky_actor_defs_savedfeed list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#personalDetailsPref" *)
  type app_bsky_actor_defs_personaldetailspref = {
    birthDate: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#feedViewPref" *)
  type app_bsky_actor_defs_feedviewpref = {
    feed: string;
    hideReplies: bool option;
    hideRepliesByUnfollowed: bool option;
    hideRepliesByLikeCount: int64 option;
    hideReposts: bool option;
    hideQuotePosts: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#threadViewPref" *)
  type app_bsky_actor_defs_threadviewpref = {
    sort: string option;
    prioritizeFollowedUsers: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#interestsPref" *)
  type app_bsky_actor_defs_interestspref = {
    tags: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#mutedWordTarget" *)
  type app_bsky_actor_defs_mutedwordtarget = string
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#mutedWord" *)
  type app_bsky_actor_defs_mutedword = {
    id: string option;
    value: string;
    targets: app_bsky_actor_defs_mutedwordtarget list;
    actorTarget: string option;
    expiresAt: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#mutedWordsPref" *)
  type app_bsky_actor_defs_mutedwordspref = {
    items: app_bsky_actor_defs_mutedword list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#hiddenPostsPref" *)
  type app_bsky_actor_defs_hiddenpostspref = {
    items: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#bskyAppProgressGuide" *)
  type app_bsky_actor_defs_bskyappprogressguide = {
    guide: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#nux" *)
  type app_bsky_actor_defs_nux = {
    id: string;
    completed: bool;
    data: string option;
    expiresAt: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#bskyAppStatePref" *)
  type app_bsky_actor_defs_bskyappstatepref = {
    activeProgressGuide: app_bsky_actor_defs_bskyappprogressguide option;
    queuedNudges: string list option;
    nuxs: app_bsky_actor_defs_nux list option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#labelerPrefItem" *)
  type app_bsky_actor_defs_labelerprefitem = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#labelersPref" *)
  type app_bsky_actor_defs_labelerspref = {
    labelers: app_bsky_actor_defs_labelerprefitem list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.threadgate#mentionRule" *)
  type app_bsky_feed_threadgate_mentionrule = [`App_bsky_feed_threadgate_mentionrule]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.threadgate#followerRule" *)
  type app_bsky_feed_threadgate_followerrule = [`App_bsky_feed_threadgate_followerrule]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.threadgate#followingRule" *)
  type app_bsky_feed_threadgate_followingrule = [`App_bsky_feed_threadgate_followingrule]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.threadgate#listRule" *)
  type app_bsky_feed_threadgate_listrule = {
    list: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.postgate#disableRule" *)
  type app_bsky_feed_postgate_disablerule = [`App_bsky_feed_postgate_disablerule]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#postInteractionSettingsPref" *)
  type app_bsky_actor_defs_postinteractionsettingspref = {
    threadgateAllowRules: [
    | `App_bsky_feed_threadgate_mentionrule of app_bsky_feed_threadgate_mentionrule
    | `App_bsky_feed_threadgate_followerrule of app_bsky_feed_threadgate_followerrule
    | `App_bsky_feed_threadgate_followingrule of app_bsky_feed_threadgate_followingrule
    | `App_bsky_feed_threadgate_listrule of app_bsky_feed_threadgate_listrule
    | `Other of Value.t (** Non closed union *)
    ] list option;
    postgateEmbeddingRules: [
    | `App_bsky_feed_postgate_disablerule of app_bsky_feed_postgate_disablerule
    | `Other of Value.t (** Non closed union *)
    ] list option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.defs#verificationPrefs" *)
  type app_bsky_actor_defs_verificationprefs = {
    hideBadges: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.moderation.defs#reasonType" *)
  type com_atproto_moderation_defs_reasontype = string
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.images#view" *)
  type app_bsky_embed_images_view = {
    images: app_bsky_embed_images_viewimage list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.video#view" *)
  type app_bsky_embed_video_view = {
    cid: string;
    playlist: string;
    thumbnail: string option;
    alt: string option;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.record#viewNotFound" *)
  type app_bsky_embed_record_viewnotfound = {
    uri: string;
    notFound: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#blockedAuthor" *)
  type app_bsky_feed_defs_blockedauthor = {
    did: string;
    viewer: app_bsky_actor_defs_viewerstate option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.record#viewBlocked" *)
  type app_bsky_embed_record_viewblocked = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.record#viewDetached" *)
  type app_bsky_embed_record_viewdetached = {
    uri: string;
    detached: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.labeler.defs#labelerViewerState" *)
  type app_bsky_labeler_defs_labelerviewerstate = {
    like: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
    | `App_bsky_embed_images_view of app_bsky_embed_images_view
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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#requestMore" *)
  type app_bsky_feed_defs_requestmore = [`App_bsky_feed_defs_requestmore]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#interactionSeen" *)
  type app_bsky_feed_defs_interactionseen = [`App_bsky_feed_defs_interactionseen]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.repo.applyWrites#delete" *)
  type com_atproto_repo_applywrites_delete = {
    collection: string;
    rkey: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.repo.defs#commitMeta" *)
  type com_atproto_repo_defs_commitmeta = {
    cid: string;
    rev: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.server.describeServer#links" *)
  type com_atproto_server_describeserver_links = {
    privacyPolicy: string option;
    termsOfService: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.label.subscribeLabels#info" *)
  type com_atproto_label_subscribelabels_info = {
    name: string;
    message: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.video#caption" *)
  type app_bsky_embed_video_caption = {
    lang: string;
    file: Blob.t;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.video#main" *)
  type app_bsky_embed_video_main = {
    video: Blob.t;
    captions: app_bsky_embed_video_caption list option;
    alt: string option;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.describeFeedGenerator#feed" *)
  type app_bsky_feed_describefeedgenerator_feed = {
    uri: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#requestLess" *)
  type app_bsky_feed_defs_requestless = [`App_bsky_feed_defs_requestless]
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#interactionReply" *)
  type app_bsky_feed_defs_interactionreply = [`App_bsky_feed_defs_interactionreply]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#reasonPin" *)
  type app_bsky_feed_defs_reasonpin = [`App_bsky_feed_defs_reasonpin]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.notification.defs#recordDeleted" *)
  type app_bsky_notification_defs_recorddeleted = [`App_bsky_notification_defs_recorddeleted]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.unspecced.getTaggedSuggestions#suggestion" *)
  type app_bsky_unspecced_gettaggedsuggestions_suggestion = {
    tag: string;
    subjectType: string;
    subject: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#skeletonReasonPin" *)
  type app_bsky_feed_defs_skeletonreasonpin = [`App_bsky_feed_defs_skeletonreasonpin]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.admin.defs#repoRef" *)
  type com_atproto_admin_defs_reporef = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.server.defs#inviteCodeUse" *)
  type com_atproto_server_defs_invitecodeuse = {
    usedBy: string;
    usedAt: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.getLikes#like" *)
  type app_bsky_feed_getlikes_like = {
    indexedAt: string;
    createdAt: string;
    actor: app_bsky_actor_defs_profileview;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.external#external" *)
  type app_bsky_embed_external_external = {
    uri: string;
    title: string;
    description: string;
    thumb: Blob.t option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.label.defs#labelValueDefinitionStrings" *)
  type com_atproto_label_defs_labelvaluedefinitionstrings = {
    lang: string;
    name: string;
    description: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.label.defs#labelValueDefinition" *)
  type com_atproto_label_defs_labelvaluedefinition = {
    identifier: string;
    severity: string;
    blurs: string;
    defaultSetting: string option;
    adultOnly: bool option;
    locales: com_atproto_label_defs_labelvaluedefinitionstrings list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.post#textSlice" *)
  type app_bsky_feed_post_textslice = {
    start: int64;
    end_: int64; [@key "end"]
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.label.defs#labelValue" *)
  type com_atproto_label_defs_labelvalue = string
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.moderation.defs#reasonAppeal" *)
  type com_atproto_moderation_defs_reasonappeal = [`Com_atproto_moderation_defs_reasonappeal]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.graph.defs#listItemView" *)
  type app_bsky_graph_defs_listitemview = {
    uri: string;
    subject: app_bsky_actor_defs_profileview;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.admin.defs#threatSignature" *)
  type com_atproto_admin_defs_threatsignature = {
    property: string;
    value: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#skeletonReasonRepost" *)
  type app_bsky_feed_defs_skeletonreasonrepost = {
    repost: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#interaction" *)
  type app_bsky_feed_defs_interaction = {
    item: string option;
    event: string option;
    feedContext: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.moderation.defs#reasonViolation" *)
  type com_atproto_moderation_defs_reasonviolation = [`Com_atproto_moderation_defs_reasonviolation]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.sync.subscribeRepos#repoOp" *)
  type com_atproto_sync_subscriberepos_repoop = {
    action: string;
    path: string;
    cid: Cid.t;
    prev: Cid.t option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.actor.status#live" *)
  type app_bsky_actor_status_live = [`App_bsky_actor_status_live]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#viewerState" *)
  type app_bsky_feed_defs_viewerstate = {
    repost: string option;
    like: string option;
    threadMuted: bool option;
    replyDisabled: bool option;
    embeddingDisabled: bool option;
    pinned: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#threadgateView" *)
  type app_bsky_feed_defs_threadgateview = {
    uri: string option;
    cid: string option;
    record: Value.t (* unknown *) option;
    lists: app_bsky_graph_defs_listviewbasic list option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
    replyCount: int64 option;
    repostCount: int64 option;
    likeCount: int64 option;
    quoteCount: int64 option;
    indexedAt: string;
    viewer: app_bsky_feed_defs_viewerstate option;
    labels: com_atproto_label_defs_label list option;
    threadgate: app_bsky_feed_defs_threadgateview option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#notFoundPost" *)
  type app_bsky_feed_defs_notfoundpost = {
    uri: string;
    notFound: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#blockedPost" *)
  type app_bsky_feed_defs_blockedpost = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
    grandparentAuthor: app_bsky_actor_defs_profileviewbasic option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#reasonRepost" *)
  type app_bsky_feed_defs_reasonrepost = {
    by: app_bsky_actor_defs_profileviewbasic;
    indexedAt: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#feedViewPost" *)
  type app_bsky_feed_defs_feedviewpost = {
    post: app_bsky_feed_defs_postview;
    reply: app_bsky_feed_defs_replyref option;
    reason: [
    | `App_bsky_feed_defs_reasonrepost of app_bsky_feed_defs_reasonrepost
    | `App_bsky_feed_defs_reasonpin of app_bsky_feed_defs_reasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedContext: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.repo.applyWrites#createResult" *)
  type com_atproto_repo_applywrites_createresult = {
    uri: string;
    cid: string;
    validationStatus: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.sync.subscribeRepos#identity" *)
  type com_atproto_sync_subscriberepos_identity = {
    seq: int64;
    did: string;
    time: string;
    handle: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.admin.defs#statusAttr" *)
  type com_atproto_admin_defs_statusattr = {
    applied: bool;
    ref: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.server.createAppPassword#appPassword" *)
  type com_atproto_server_createapppassword_apppassword = {
    name: string;
    password: string;
    createdAt: string;
    privileged: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.unspecced.getConfig#liveNowConfig" *)
  type app_bsky_unspecced_getconfig_livenowconfig = {
    did: string;
    domains: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.repo.applyWrites#update" *)
  type com_atproto_repo_applywrites_update = {
    collection: string;
    rkey: string;
    value: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#clickthroughEmbed" *)
  type app_bsky_feed_defs_clickthroughembed = [`App_bsky_feed_defs_clickthroughembed]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#interactionLike" *)
  type app_bsky_feed_defs_interactionlike = [`App_bsky_feed_defs_interactionlike]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.labeler.defs#labelerPolicies" *)
  type app_bsky_labeler_defs_labelerpolicies = {
    labelValues: com_atproto_label_defs_labelvalue list;
    labelValueDefinitions: com_atproto_label_defs_labelvaluedefinition list option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.moderation.defs#subjectType" *)
  type com_atproto_moderation_defs_subjecttype = string
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.record#main" *)
  type app_bsky_embed_record_main = {
    record: com_atproto_repo_strongref_main;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.unspecced.defs#skeletonSearchActor" *)
  type app_bsky_unspecced_defs_skeletonsearchactor = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.identity.defs#identityInfo" *)
  type com_atproto_identity_defs_identityinfo = {
    did: string;
    handle: string;
    didDoc: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.graph.defs#referencelist" *)
  type app_bsky_graph_defs_referencelist = [`App_bsky_graph_defs_referencelist]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.post#replyRef" *)
  type app_bsky_feed_post_replyref = {
    root: com_atproto_repo_strongref_main;
    parent: com_atproto_repo_strongref_main;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.server.describeServer#contact" *)
  type com_atproto_server_describeserver_contact = {
    email: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.sync.listReposByCollection#repo" *)
  type com_atproto_sync_listreposbycollection_repo = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.repo.listRecords#record" *)
  type com_atproto_repo_listrecords_record = {
    uri: string;
    cid: string;
    value: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.moderation.defs#reasonSexual" *)
  type com_atproto_moderation_defs_reasonsexual = [`Com_atproto_moderation_defs_reasonsexual]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.moderation.defs#reasonOther" *)
  type com_atproto_moderation_defs_reasonother = [`Com_atproto_moderation_defs_reasonother]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.graph.defs#curatelist" *)
  type app_bsky_graph_defs_curatelist = [`App_bsky_graph_defs_curatelist]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.graph.defs#relationship" *)
  type app_bsky_graph_defs_relationship = {
    did: string;
    following: string option;
    followedBy: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.graph.defs#notFoundActor" *)
  type app_bsky_graph_defs_notfoundactor = {
    actor: string;
    notFound: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.repo.listMissingBlobs#recordBlob" *)
  type com_atproto_repo_listmissingblobs_recordblob = {
    cid: string;
    recordUri: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.label.defs#selfLabel" *)
  type com_atproto_label_defs_selflabel = {
    val_: string; [@key "val"]
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.admin.defs#repoBlobRef" *)
  type com_atproto_admin_defs_repoblobref = {
    did: string;
    cid: string;
    recordUri: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.moderation.defs#reasonRude" *)
  type com_atproto_moderation_defs_reasonrude = [`Com_atproto_moderation_defs_reasonrude]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.sync.subscribeRepos#sync" *)
  type com_atproto_sync_subscriberepos_sync = {
    seq: int64;
    did: string;
    blocks: bytes;
    rev: string;
    time: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#interactionQuote" *)
  type app_bsky_feed_defs_interactionquote = [`App_bsky_feed_defs_interactionquote]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.repo.applyWrites#deleteResult" *)
  type com_atproto_repo_applywrites_deleteresult = [`Com_atproto_repo_applywrites_deleteresult]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.repo.applyWrites#updateResult" *)
  type com_atproto_repo_applywrites_updateresult = {
    uri: string;
    cid: string;
    validationStatus: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#clickthroughItem" *)
  type app_bsky_feed_defs_clickthroughitem = [`App_bsky_feed_defs_clickthroughitem]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.graph.starterpack#feedItem" *)
  type app_bsky_graph_starterpack_feeditem = {
    uri: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.unspecced.defs#skeletonSearchPost" *)
  type app_bsky_unspecced_defs_skeletonsearchpost = {
    uri: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.embed.external#main" *)
  type app_bsky_embed_external_main = {
    external_: app_bsky_embed_external_external; [@key "external"]
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#threadContext" *)
  type app_bsky_feed_defs_threadcontext = {
    rootAuthorLike: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.unspecced.defs#skeletonSearchStarterPack" *)
  type app_bsky_unspecced_defs_skeletonsearchstarterpack = {
    uri: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.sync.subscribeRepos#info" *)
  type com_atproto_sync_subscriberepos_info = {
    name: string;
    message: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#interactionRepost" *)
  type app_bsky_feed_defs_interactionrepost = [`App_bsky_feed_defs_interactionrepost]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.server.createInviteCodes#accountCodes" *)
  type com_atproto_server_createinvitecodes_accountcodes = {
    account: string;
    codes: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#interactionShare" *)
  type app_bsky_feed_defs_interactionshare = [`App_bsky_feed_defs_interactionshare]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.moderation.defs#reasonSpam" *)
  type com_atproto_moderation_defs_reasonspam = [`Com_atproto_moderation_defs_reasonspam]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.unspecced.defs#trendingTopic" *)
  type app_bsky_unspecced_defs_trendingtopic = {
    topic: string;
    displayName: string option;
    description: string option;
    link: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#clickthroughAuthor" *)
  type app_bsky_feed_defs_clickthroughauthor = [`App_bsky_feed_defs_clickthroughauthor]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.label.defs#selfLabels" *)
  type com_atproto_label_defs_selflabels = {
    values: com_atproto_label_defs_selflabel list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#skeletonFeedPost" *)
  type app_bsky_feed_defs_skeletonfeedpost = {
    post: string;
    reason: [
    | `App_bsky_feed_defs_skeletonreasonrepost of app_bsky_feed_defs_skeletonreasonrepost
    | `App_bsky_feed_defs_skeletonreasonpin of app_bsky_feed_defs_skeletonreasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedContext: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
    threadContext: app_bsky_feed_defs_threadcontext option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#contentModeUnspecified" *)
  type app_bsky_feed_defs_contentmodeunspecified = [`App_bsky_feed_defs_contentmodeunspecified]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.post#entity" *)
  type app_bsky_feed_post_entity = {
    index: app_bsky_feed_post_textslice;
    type_: string; [@key "type"]
    value: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.sync.listRepos#repo" *)
  type com_atproto_sync_listrepos_repo = {
    did: string;
    head: string;
    rev: string;
    active: bool option;
    status: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.server.listAppPasswords#appPassword" *)
  type com_atproto_server_listapppasswords_apppassword = {
    name: string;
    createdAt: string;
    privileged: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.moderation.defs#reasonMisleading" *)
  type com_atproto_moderation_defs_reasonmisleading = [`Com_atproto_moderation_defs_reasonmisleading]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.sync.listHosts#host" *)
  type com_atproto_sync_listhosts_host = {
    hostname: string;
    seq: int64 option;
    accountCount: int64 option;
    status: com_atproto_sync_defs_hoststatus option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#contentModeVideo" *)
  type app_bsky_feed_defs_contentmodevideo = [`App_bsky_feed_defs_contentmodevideo]
  [@@deriving show {with_path=false}, yojson {strict=false}]


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
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.graph.defs#modlist" *)
  type app_bsky_graph_defs_modlist = [`App_bsky_graph_defs_modlist]
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "com.atproto.label.subscribeLabels#labels" *)
  type com_atproto_label_subscribelabels_labels = {
    seq: int64;
    labels: com_atproto_label_defs_label list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]


  (** def "app.bsky.feed.defs#clickthroughReposter" *)
  type app_bsky_feed_defs_clickthroughreposter = [`App_bsky_feed_defs_clickthroughreposter]
  [@@deriving show {with_path=false}, yojson {strict=false}]

end



open Types


(** lexicon "com.atproto.temp.requestPhoneVerification"
  *)
module Com_Atproto_Temp_RequestPhoneVerification = struct
  (** def main *)
  type com_atproto_temp_requestphoneverification_main_input = {
    phoneNumber: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Request a verification code to be sent to the supplied phone number *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_temp_requestphoneverification_main_input_to_yojson;
    of_yojson=com_atproto_temp_requestphoneverification_main_input_of_yojson;
    pp=pp_com_atproto_temp_requestphoneverification_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.temp.fetchLabels"
  *)
module Com_Atproto_Temp_FetchLabels = struct
  (** def main *)
  type com_atproto_temp_fetchlabels_main_params = {
    since: int64 option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_temp_fetchlabels_main_output = {
    labels: com_atproto_label_defs_label list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** DEPRECATED: use queryLabels or subscribeLabels instead -- Fetch all labels from a labeler created after a certain date. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_temp_fetchlabels_main_params_to_yojson;
    of_yojson=com_atproto_temp_fetchlabels_main_params_of_yojson;
    pp=pp_com_atproto_temp_fetchlabels_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_temp_fetchlabels_main_output_to_yojson;
    of_yojson=com_atproto_temp_fetchlabels_main_output_of_yojson;
    pp=pp_com_atproto_temp_fetchlabels_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.temp.checkSignupQueue"
  *)
module Com_Atproto_Temp_CheckSignupQueue = struct
  (** def main *)
  type com_atproto_temp_checksignupqueue_main_output = {
    activated: bool;
    placeInQueue: int64 option;
    estimatedTimeMs: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Check accounts location in signup queue. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_temp_checksignupqueue_main_output_to_yojson;
    of_yojson=com_atproto_temp_checksignupqueue_main_output_of_yojson;
    pp=pp_com_atproto_temp_checksignupqueue_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.temp.addReservedHandle"
  *)
module Com_Atproto_Temp_AddReservedHandle = struct
  (** def main *)
  type com_atproto_temp_addreservedhandle_main_input = {
    handle: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_temp_addreservedhandle_main_output = [`_com_atproto_temp_addreservedhandle_main_output]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Add a handle to the set of reserved handles. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_temp_addreservedhandle_main_input_to_yojson;
    of_yojson=com_atproto_temp_addreservedhandle_main_input_of_yojson;
    pp=pp_com_atproto_temp_addreservedhandle_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_temp_addreservedhandle_main_output_to_yojson;
    of_yojson=com_atproto_temp_addreservedhandle_main_output_of_yojson;
    pp=pp_com_atproto_temp_addreservedhandle_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.sync.subscribeRepos"
  *)
module Com_Atproto_Sync_SubscribeRepos = struct
  (** def main *)
  type com_atproto_sync_subscriberepos_main_msg = [
    | `Com_atproto_sync_subscriberepos_commit of com_atproto_sync_subscriberepos_commit
    | `Com_atproto_sync_subscriberepos_sync of com_atproto_sync_subscriberepos_sync
    | `Com_atproto_sync_subscriberepos_identity of com_atproto_sync_subscriberepos_identity
    | `Com_atproto_sync_subscriberepos_account of com_atproto_sync_subscriberepos_account
    | `Com_atproto_sync_subscriberepos_info of com_atproto_sync_subscriberepos_info
    | `Other of Value.t (** Non closed union *)
    ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_sync_subscriberepos_main_params = {
    cursor: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_subscriberepos_main_error = [ | `FutureCursor  | `ConsumerTooSlow ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Repository event stream, aka Firehose endpoint. Outputs repo commits with diff data, and identity update events, for all repositories on the current server. See the atproto specifications for details around stream sequencing, repo versioning, CAR diff format, and more. Public and does not require auth; implemented by PDS and Relay. *)
  let main: _ Base.subscription = Base.make_subscription 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_subscriberepos_main_params_to_yojson;
    of_yojson=com_atproto_sync_subscriberepos_main_params_of_yojson;
    pp=pp_com_atproto_sync_subscriberepos_main_params}) ~message:(Message {
    to_yojson=com_atproto_sync_subscriberepos_main_msg_to_yojson;
    of_yojson=com_atproto_sync_subscriberepos_main_msg_of_yojson;
    pp=pp_com_atproto_sync_subscriberepos_main_msg}) 
    ~errors:(Errors {pp=pp_com_atproto_sync_subscriberepos_main_error})

  (** def commit *)
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
  let commit_of_yojson = com_atproto_sync_subscriberepos_commit_of_yojson
  let commit_to_yojson = com_atproto_sync_subscriberepos_commit_to_yojson


  (** def sync *)
  type nonrec sync = com_atproto_sync_subscriberepos_sync = {
    seq: int64;
    did: string;
    blocks: bytes;
    rev: string;
    time: string;
  }
  let pp_sync = pp_com_atproto_sync_subscriberepos_sync
  let sync_of_yojson = com_atproto_sync_subscriberepos_sync_of_yojson
  let sync_to_yojson = com_atproto_sync_subscriberepos_sync_to_yojson


  (** def identity *)
  type nonrec identity = com_atproto_sync_subscriberepos_identity = {
    seq: int64;
    did: string;
    time: string;
    handle: string option;
  }
  let pp_identity = pp_com_atproto_sync_subscriberepos_identity
  let identity_of_yojson = com_atproto_sync_subscriberepos_identity_of_yojson
  let identity_to_yojson = com_atproto_sync_subscriberepos_identity_to_yojson


  (** def account *)
  type nonrec account = com_atproto_sync_subscriberepos_account = {
    seq: int64;
    did: string;
    time: string;
    active: bool;
    status: string option;
  }
  let pp_account = pp_com_atproto_sync_subscriberepos_account
  let account_of_yojson = com_atproto_sync_subscriberepos_account_of_yojson
  let account_to_yojson = com_atproto_sync_subscriberepos_account_to_yojson


  (** def info *)
  type nonrec info = com_atproto_sync_subscriberepos_info = {
    name: string;
    message: string option;
  }
  let pp_info = pp_com_atproto_sync_subscriberepos_info
  let info_of_yojson = com_atproto_sync_subscriberepos_info_of_yojson
  let info_to_yojson = com_atproto_sync_subscriberepos_info_to_yojson


  (** def repoOp *)
  type nonrec repoop = com_atproto_sync_subscriberepos_repoop = {
    action: string;
    path: string;
    cid: Cid.t;
    prev: Cid.t option;
  }
  let pp_repoop = pp_com_atproto_sync_subscriberepos_repoop
  let repoop_of_yojson = com_atproto_sync_subscriberepos_repoop_of_yojson
  let repoop_to_yojson = com_atproto_sync_subscriberepos_repoop_to_yojson


end


(** lexicon "com.atproto.sync.requestCrawl"
  *)
module Com_Atproto_Sync_RequestCrawl = struct
  (** def main *)
  type com_atproto_sync_requestcrawl_main_input = {
    hostname: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_sync_requestcrawl_main_error = [ | `HostBanned ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Request a service to persistently crawl hosted repos. Expected use is new PDS instances declaring their existence to Relays. Does not require auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_sync_requestcrawl_main_input_to_yojson;
    of_yojson=com_atproto_sync_requestcrawl_main_input_of_yojson;
    pp=pp_com_atproto_sync_requestcrawl_main_input}}) ~output:No_io 
    ~errors:(Errors {pp=pp_com_atproto_sync_requestcrawl_main_error})

end


(** lexicon "com.atproto.sync.notifyOfUpdate"
  *)
module Com_Atproto_Sync_NotifyOfUpdate = struct
  (** def main *)
  type com_atproto_sync_notifyofupdate_main_input = {
    hostname: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Notify a crawling service of a recent update, and that crawling should resume. Intended use is after a gap between repo stream events caused the crawling service to disconnect. Does not require auth; implemented by Relay. DEPRECATED: just use com.atproto.sync.requestCrawl *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_sync_notifyofupdate_main_input_to_yojson;
    of_yojson=com_atproto_sync_notifyofupdate_main_input_of_yojson;
    pp=pp_com_atproto_sync_notifyofupdate_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.sync.listReposByCollection"
  *)
module Com_Atproto_Sync_ListReposByCollection = struct
  (** def main *)
  type com_atproto_sync_listreposbycollection_main_params = {
    collection: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_listreposbycollection_main_output = {
    cursor: string option;
    repos: com_atproto_sync_listreposbycollection_repo list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates all the DIDs which have records with the given collection NSID. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_listreposbycollection_main_params_to_yojson;
    of_yojson=com_atproto_sync_listreposbycollection_main_params_of_yojson;
    pp=pp_com_atproto_sync_listreposbycollection_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_sync_listreposbycollection_main_output_to_yojson;
    of_yojson=com_atproto_sync_listreposbycollection_main_output_of_yojson;
    pp=pp_com_atproto_sync_listreposbycollection_main_output}}) ~errors:No_errors

  (** def repo *)
  type nonrec repo = com_atproto_sync_listreposbycollection_repo = {
    did: string;
  }
  let pp_repo = pp_com_atproto_sync_listreposbycollection_repo
  let repo_of_yojson = com_atproto_sync_listreposbycollection_repo_of_yojson
  let repo_to_yojson = com_atproto_sync_listreposbycollection_repo_to_yojson


end


(** lexicon "com.atproto.sync.listRepos"
  *)
module Com_Atproto_Sync_ListRepos = struct
  (** def main *)
  type com_atproto_sync_listrepos_main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_listrepos_main_output = {
    cursor: string option;
    repos: com_atproto_sync_listrepos_repo list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates all the DID, rev, and commit CID for all repos hosted by this service. Does not require auth; implemented by PDS and Relay. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_listrepos_main_params_to_yojson;
    of_yojson=com_atproto_sync_listrepos_main_params_of_yojson;
    pp=pp_com_atproto_sync_listrepos_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_sync_listrepos_main_output_to_yojson;
    of_yojson=com_atproto_sync_listrepos_main_output_of_yojson;
    pp=pp_com_atproto_sync_listrepos_main_output}}) ~errors:No_errors

  (** def repo *)
  type nonrec repo = com_atproto_sync_listrepos_repo = {
    did: string;
    head: string;
    rev: string;
    active: bool option;
    status: string option;
  }
  let pp_repo = pp_com_atproto_sync_listrepos_repo
  let repo_of_yojson = com_atproto_sync_listrepos_repo_of_yojson
  let repo_to_yojson = com_atproto_sync_listrepos_repo_to_yojson


end


(** lexicon "com.atproto.sync.listHosts"
  *)
module Com_Atproto_Sync_ListHosts = struct
  (** def main *)
  type com_atproto_sync_listhosts_main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_listhosts_main_output = {
    cursor: string option;
    hosts: com_atproto_sync_listhosts_host list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates upstream hosts (eg, PDS or relay instances) that this service consumes from. Implemented by relays. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_listhosts_main_params_to_yojson;
    of_yojson=com_atproto_sync_listhosts_main_params_of_yojson;
    pp=pp_com_atproto_sync_listhosts_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_sync_listhosts_main_output_to_yojson;
    of_yojson=com_atproto_sync_listhosts_main_output_of_yojson;
    pp=pp_com_atproto_sync_listhosts_main_output}}) ~errors:No_errors

  (** def host *)
  type nonrec host = com_atproto_sync_listhosts_host = {
    hostname: string;
    seq: int64 option;
    accountCount: int64 option;
    status: com_atproto_sync_defs_hoststatus option;
  }
  let pp_host = pp_com_atproto_sync_listhosts_host
  let host_of_yojson = com_atproto_sync_listhosts_host_of_yojson
  let host_to_yojson = com_atproto_sync_listhosts_host_to_yojson


end


(** lexicon "com.atproto.sync.listBlobs"
  *)
module Com_Atproto_Sync_ListBlobs = struct
  (** def main *)
  type com_atproto_sync_listblobs_main_params = {
    did: string;
    since: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_listblobs_main_output = {
    cursor: string option;
    cids: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_sync_listblobs_main_error = [ | `RepoNotFound  | `RepoTakendown  | `RepoSuspended  | `RepoDeactivated ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** List blob CIDs for an account, since some repo revision. Does not require auth; implemented by PDS. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_listblobs_main_params_to_yojson;
    of_yojson=com_atproto_sync_listblobs_main_params_of_yojson;
    pp=pp_com_atproto_sync_listblobs_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_sync_listblobs_main_output_to_yojson;
    of_yojson=com_atproto_sync_listblobs_main_output_of_yojson;
    pp=pp_com_atproto_sync_listblobs_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_sync_listblobs_main_error})

end


(** lexicon "com.atproto.sync.getRepoStatus"
  *)
module Com_Atproto_Sync_GetRepoStatus = struct
  (** def main *)
  type com_atproto_sync_getrepostatus_main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_getrepostatus_main_output = {
    did: string;
    active: bool;
    status: string option;
    rev: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_sync_getrepostatus_main_error = [ | `RepoNotFound ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get the hosting status for a repository, on this server. Expected to be implemented by PDS and Relay. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_getrepostatus_main_params_to_yojson;
    of_yojson=com_atproto_sync_getrepostatus_main_params_of_yojson;
    pp=pp_com_atproto_sync_getrepostatus_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_sync_getrepostatus_main_output_to_yojson;
    of_yojson=com_atproto_sync_getrepostatus_main_output_of_yojson;
    pp=pp_com_atproto_sync_getrepostatus_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_sync_getrepostatus_main_error})

end


(** lexicon "com.atproto.sync.getRepo"
  *)
module Com_Atproto_Sync_GetRepo = struct
  (** def main *)
  type com_atproto_sync_getrepo_main_params = {
    did: string;
    since: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_getrepo_main_error = [ | `RepoNotFound  | `RepoTakendown  | `RepoSuspended  | `RepoDeactivated ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Download a repository export as CAR file. Optionally only a 'diff' since a previous revision. Does not require auth; implemented by PDS. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_getrepo_main_params_to_yojson;
    of_yojson=com_atproto_sync_getrepo_main_params_of_yojson;
    pp=pp_com_atproto_sync_getrepo_main_params}) 
    ~output:(IO_opaque {encoding=CAR}) 
    ~errors:(Errors {pp=pp_com_atproto_sync_getrepo_main_error})

end


(** lexicon "com.atproto.sync.getRecord"
  *)
module Com_Atproto_Sync_GetRecord = struct
  (** def main *)
  type com_atproto_sync_getrecord_main_params = {
    did: string;
    collection: string;
    rkey: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_getrecord_main_error = [ | `RecordNotFound  | `RepoNotFound  | `RepoTakendown  | `RepoSuspended  | `RepoDeactivated ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get data blocks needed to prove the existence or non-existence of record in the current version of repo. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_getrecord_main_params_to_yojson;
    of_yojson=com_atproto_sync_getrecord_main_params_of_yojson;
    pp=pp_com_atproto_sync_getrecord_main_params}) 
    ~output:(IO_opaque {encoding=CAR}) 
    ~errors:(Errors {pp=pp_com_atproto_sync_getrecord_main_error})

end


(** lexicon "com.atproto.sync.getLatestCommit"
  *)
module Com_Atproto_Sync_GetLatestCommit = struct
  (** def main *)
  type com_atproto_sync_getlatestcommit_main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_getlatestcommit_main_output = {
    cid: string;
    rev: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_sync_getlatestcommit_main_error = [ | `RepoNotFound  | `RepoTakendown  | `RepoSuspended  | `RepoDeactivated ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get the current commit CID & revision of the specified repo. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_getlatestcommit_main_params_to_yojson;
    of_yojson=com_atproto_sync_getlatestcommit_main_params_of_yojson;
    pp=pp_com_atproto_sync_getlatestcommit_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_sync_getlatestcommit_main_output_to_yojson;
    of_yojson=com_atproto_sync_getlatestcommit_main_output_of_yojson;
    pp=pp_com_atproto_sync_getlatestcommit_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_sync_getlatestcommit_main_error})

end


(** lexicon "com.atproto.sync.getHostStatus"
  *)
module Com_Atproto_Sync_GetHostStatus = struct
  (** def main *)
  type com_atproto_sync_gethoststatus_main_params = {
    hostname: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_gethoststatus_main_output = {
    hostname: string;
    seq: int64 option;
    accountCount: int64 option;
    status: com_atproto_sync_defs_hoststatus option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_sync_gethoststatus_main_error = [ | `HostNotFound ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Returns information about a specified upstream host, as consumed by the server. Implemented by relays. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_gethoststatus_main_params_to_yojson;
    of_yojson=com_atproto_sync_gethoststatus_main_params_of_yojson;
    pp=pp_com_atproto_sync_gethoststatus_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_sync_gethoststatus_main_output_to_yojson;
    of_yojson=com_atproto_sync_gethoststatus_main_output_of_yojson;
    pp=pp_com_atproto_sync_gethoststatus_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_sync_gethoststatus_main_error})

end


(** lexicon "com.atproto.sync.getHead"
  *)
module Com_Atproto_Sync_GetHead = struct
  (** def main *)
  type com_atproto_sync_gethead_main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_gethead_main_output = {
    root: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_sync_gethead_main_error = [ | `HeadNotFound ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** DEPRECATED - please use com.atproto.sync.getLatestCommit instead *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_gethead_main_params_to_yojson;
    of_yojson=com_atproto_sync_gethead_main_params_of_yojson;
    pp=pp_com_atproto_sync_gethead_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_sync_gethead_main_output_to_yojson;
    of_yojson=com_atproto_sync_gethead_main_output_of_yojson;
    pp=pp_com_atproto_sync_gethead_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_sync_gethead_main_error})

end


(** lexicon "com.atproto.sync.getCheckout"
  *)
module Com_Atproto_Sync_GetCheckout = struct
  (** def main *)
  type com_atproto_sync_getcheckout_main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  (** DEPRECATED - please use com.atproto.sync.getRepo instead *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_getcheckout_main_params_to_yojson;
    of_yojson=com_atproto_sync_getcheckout_main_params_of_yojson;
    pp=pp_com_atproto_sync_getcheckout_main_params}) 
    ~output:(IO_opaque {encoding=CAR}) ~errors:No_errors

end


(** lexicon "com.atproto.sync.getBlocks"
  *)
module Com_Atproto_Sync_GetBlocks = struct
  (** def main *)
  type com_atproto_sync_getblocks_main_params = {
    did: string;
    cids: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_getblocks_main_error = [ | `BlockNotFound  | `RepoNotFound  | `RepoTakendown  | `RepoSuspended  | `RepoDeactivated ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get data blocks from a given repo, by CID. For example, intermediate MST nodes, or records. Does not require auth; implemented by PDS. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_getblocks_main_params_to_yojson;
    of_yojson=com_atproto_sync_getblocks_main_params_of_yojson;
    pp=pp_com_atproto_sync_getblocks_main_params}) 
    ~output:(IO_opaque {encoding=CAR}) 
    ~errors:(Errors {pp=pp_com_atproto_sync_getblocks_main_error})

end


(** lexicon "com.atproto.sync.getBlob"
  *)
module Com_Atproto_Sync_GetBlob = struct
  (** def main *)
  type com_atproto_sync_getblob_main_params = {
    did: string;
    cid: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_sync_getblob_main_error = [ | `BlobNotFound  | `RepoNotFound  | `RepoTakendown  | `RepoSuspended  | `RepoDeactivated ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a blob associated with a given account. Returns the full blob as originally uploaded. Does not require auth; implemented by PDS. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_sync_getblob_main_params_to_yojson;
    of_yojson=com_atproto_sync_getblob_main_params_of_yojson;
    pp=pp_com_atproto_sync_getblob_main_params}) 
    ~output:(IO_opaque {encoding=(Other "*/*")}) 
    ~errors:(Errors {pp=pp_com_atproto_sync_getblob_main_error})

end


(** lexicon "com.atproto.sync.defs"
  *)
module Com_Atproto_Sync_Defs = struct
  (** def hostStatus *)
  type nonrec hoststatus = com_atproto_sync_defs_hoststatus
  let pp_hoststatus = pp_com_atproto_sync_defs_hoststatus
  let hoststatus_of_yojson = com_atproto_sync_defs_hoststatus_of_yojson
  let hoststatus_to_yojson = com_atproto_sync_defs_hoststatus_to_yojson


end


(** lexicon "com.atproto.server.updateEmail"
  *)
module Com_Atproto_Server_UpdateEmail = struct
  (** def main *)
  type com_atproto_server_updateemail_main_input = {
    email: string;
    emailAuthFactor: bool option;
    token: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_updateemail_main_error = [ | `ExpiredToken  | `InvalidToken  | `TokenRequired ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Update an account's email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_updateemail_main_input_to_yojson;
    of_yojson=com_atproto_server_updateemail_main_input_of_yojson;
    pp=pp_com_atproto_server_updateemail_main_input}}) ~output:No_io 
    ~errors:(Errors {pp=pp_com_atproto_server_updateemail_main_error})

end


(** lexicon "com.atproto.server.revokeAppPassword"
  *)
module Com_Atproto_Server_RevokeAppPassword = struct
  (** def main *)
  type com_atproto_server_revokeapppassword_main_input = {
    name: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Revoke an App Password by name. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_revokeapppassword_main_input_to_yojson;
    of_yojson=com_atproto_server_revokeapppassword_main_input_of_yojson;
    pp=pp_com_atproto_server_revokeapppassword_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.resetPassword"
  *)
module Com_Atproto_Server_ResetPassword = struct
  (** def main *)
  type com_atproto_server_resetpassword_main_input = {
    token: string;
    password: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_resetpassword_main_error = [ | `ExpiredToken  | `InvalidToken ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Reset a user account password using a token. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_resetpassword_main_input_to_yojson;
    of_yojson=com_atproto_server_resetpassword_main_input_of_yojson;
    pp=pp_com_atproto_server_resetpassword_main_input}}) ~output:No_io 
    ~errors:(Errors {pp=pp_com_atproto_server_resetpassword_main_error})

end


(** lexicon "com.atproto.server.reserveSigningKey"
  *)
module Com_Atproto_Server_ReserveSigningKey = struct
  (** def main *)
  type com_atproto_server_reservesigningkey_main_input = {
    did: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_reservesigningkey_main_output = {
    signingKey: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Reserve a repo signing key, for use with account creation. Necessary so that a DID PLC update operation can be constructed during an account migraiton. Public and does not require auth; implemented by PDS. NOTE: this endpoint may change when full account migration is implemented. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_reservesigningkey_main_input_to_yojson;
    of_yojson=com_atproto_server_reservesigningkey_main_input_of_yojson;
    pp=pp_com_atproto_server_reservesigningkey_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_reservesigningkey_main_output_to_yojson;
    of_yojson=com_atproto_server_reservesigningkey_main_output_of_yojson;
    pp=pp_com_atproto_server_reservesigningkey_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.server.requestPasswordReset"
  *)
module Com_Atproto_Server_RequestPasswordReset = struct
  (** def main *)
  type com_atproto_server_requestpasswordreset_main_input = {
    email: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Initiate a user account password reset via email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_requestpasswordreset_main_input_to_yojson;
    of_yojson=com_atproto_server_requestpasswordreset_main_input_of_yojson;
    pp=pp_com_atproto_server_requestpasswordreset_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.requestEmailUpdate"
  *)
module Com_Atproto_Server_RequestEmailUpdate = struct
  (** def main *)
  type com_atproto_server_requestemailupdate_main_output = {
    tokenRequired: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Request a token in order to update email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_requestemailupdate_main_output_to_yojson;
    of_yojson=com_atproto_server_requestemailupdate_main_output_of_yojson;
    pp=pp_com_atproto_server_requestemailupdate_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.server.requestEmailConfirmation"
  *)
module Com_Atproto_Server_RequestEmailConfirmation = struct
  (** def main *)
  (** Request an email with a code to confirm ownership of email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.requestAccountDelete"
  *)
module Com_Atproto_Server_RequestAccountDelete = struct
  (** def main *)
  (** Initiate a user account deletion via email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.refreshSession"
  *)
module Com_Atproto_Server_RefreshSession = struct
  (** def main *)
  type com_atproto_server_refreshsession_main_output = {
    accessJwt: string;
    refreshJwt: string;
    handle: string;
    did: string;
    didDoc: Value.t (* unknown *) option;
    active: bool option;
    status: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_refreshsession_main_error = [ | `AccountTakedown ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Refresh an authentication session. Requires auth using the 'refreshJwt' (not the 'accessJwt'). *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_refreshsession_main_output_to_yojson;
    of_yojson=com_atproto_server_refreshsession_main_output_of_yojson;
    pp=pp_com_atproto_server_refreshsession_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_server_refreshsession_main_error})

end


(** lexicon "com.atproto.server.listAppPasswords"
  *)
module Com_Atproto_Server_ListAppPasswords = struct
  (** def main *)
  type com_atproto_server_listapppasswords_main_output = {
    passwords: com_atproto_server_listapppasswords_apppassword list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_listapppasswords_main_error = [ | `AccountTakedown ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** List all App Passwords. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_listapppasswords_main_output_to_yojson;
    of_yojson=com_atproto_server_listapppasswords_main_output_of_yojson;
    pp=pp_com_atproto_server_listapppasswords_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_server_listapppasswords_main_error})

  (** def appPassword *)
  type nonrec apppassword = com_atproto_server_listapppasswords_apppassword = {
    name: string;
    createdAt: string;
    privileged: bool option;
  }
  let pp_apppassword = pp_com_atproto_server_listapppasswords_apppassword
  let apppassword_of_yojson = com_atproto_server_listapppasswords_apppassword_of_yojson
  let apppassword_to_yojson = com_atproto_server_listapppasswords_apppassword_to_yojson


end


(** lexicon "com.atproto.server.getSession"
  *)
module Com_Atproto_Server_GetSession = struct
  (** def main *)
  type com_atproto_server_getsession_main_output = {
    handle: string;
    did: string;
    email: string option;
    emailConfirmed: bool option;
    emailAuthFactor: bool option;
    didDoc: Value.t (* unknown *) option;
    active: bool option;
    status: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get information about the current auth session. Requires auth. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_getsession_main_output_to_yojson;
    of_yojson=com_atproto_server_getsession_main_output_of_yojson;
    pp=pp_com_atproto_server_getsession_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.server.getServiceAuth"
  *)
module Com_Atproto_Server_GetServiceAuth = struct
  (** def main *)
  type com_atproto_server_getserviceauth_main_params = {
    aud: string;
    exp: int64 option;
    lxm: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_server_getserviceauth_main_output = {
    token: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_getserviceauth_main_error = [ | `BadExpiration ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a signed token on behalf of the requesting DID for the requested service. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_server_getserviceauth_main_params_to_yojson;
    of_yojson=com_atproto_server_getserviceauth_main_params_of_yojson;
    pp=pp_com_atproto_server_getserviceauth_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_getserviceauth_main_output_to_yojson;
    of_yojson=com_atproto_server_getserviceauth_main_output_of_yojson;
    pp=pp_com_atproto_server_getserviceauth_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_server_getserviceauth_main_error})

end


(** lexicon "com.atproto.server.getAccountInviteCodes"
  *)
module Com_Atproto_Server_GetAccountInviteCodes = struct
  (** def main *)
  type com_atproto_server_getaccountinvitecodes_main_params = {
    includeUsed: bool option;
    createAvailable: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_server_getaccountinvitecodes_main_output = {
    codes: com_atproto_server_defs_invitecode list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_getaccountinvitecodes_main_error = [ | `DuplicateCreate ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get all invite codes for the current account. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_server_getaccountinvitecodes_main_params_to_yojson;
    of_yojson=com_atproto_server_getaccountinvitecodes_main_params_of_yojson;
    pp=pp_com_atproto_server_getaccountinvitecodes_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_getaccountinvitecodes_main_output_to_yojson;
    of_yojson=com_atproto_server_getaccountinvitecodes_main_output_of_yojson;
    pp=pp_com_atproto_server_getaccountinvitecodes_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_server_getaccountinvitecodes_main_error})

end


(** lexicon "com.atproto.server.describeServer"
  *)
module Com_Atproto_Server_DescribeServer = struct
  (** def main *)
  type com_atproto_server_describeserver_main_output = {
    inviteCodeRequired: bool option;
    phoneVerificationRequired: bool option;
    availableUserDomains: string list;
    links: com_atproto_server_describeserver_links option;
    contact: com_atproto_server_describeserver_contact option;
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Describes the server's account creation requirements and capabilities. Implemented by PDS. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_describeserver_main_output_to_yojson;
    of_yojson=com_atproto_server_describeserver_main_output_of_yojson;
    pp=pp_com_atproto_server_describeserver_main_output}}) ~errors:No_errors

  (** def links *)
  type nonrec links = com_atproto_server_describeserver_links = {
    privacyPolicy: string option;
    termsOfService: string option;
  }
  let pp_links = pp_com_atproto_server_describeserver_links
  let links_of_yojson = com_atproto_server_describeserver_links_of_yojson
  let links_to_yojson = com_atproto_server_describeserver_links_to_yojson


  (** def contact *)
  type nonrec contact = com_atproto_server_describeserver_contact = {
    email: string option;
  }
  let pp_contact = pp_com_atproto_server_describeserver_contact
  let contact_of_yojson = com_atproto_server_describeserver_contact_of_yojson
  let contact_to_yojson = com_atproto_server_describeserver_contact_to_yojson


end


(** lexicon "com.atproto.server.deleteSession"
  *)
module Com_Atproto_Server_DeleteSession = struct
  (** def main *)
  (** Delete the current session. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.deleteAccount"
  *)
module Com_Atproto_Server_DeleteAccount = struct
  (** def main *)
  type com_atproto_server_deleteaccount_main_input = {
    did: string;
    password: string;
    token: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_deleteaccount_main_error = [ | `ExpiredToken  | `InvalidToken ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Delete an actor's account with a token and password. Can only be called after requesting a deletion token. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_deleteaccount_main_input_to_yojson;
    of_yojson=com_atproto_server_deleteaccount_main_input_of_yojson;
    pp=pp_com_atproto_server_deleteaccount_main_input}}) ~output:No_io 
    ~errors:(Errors {pp=pp_com_atproto_server_deleteaccount_main_error})

end


(** lexicon "com.atproto.server.deactivateAccount"
  *)
module Com_Atproto_Server_DeactivateAccount = struct
  (** def main *)
  type com_atproto_server_deactivateaccount_main_input = {
    deleteAfter: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Deactivates a currently active account. Stops serving of repo, and future writes to repo until reactivated. Used to finalize account migration with the old host after the account has been activated on the new host. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_deactivateaccount_main_input_to_yojson;
    of_yojson=com_atproto_server_deactivateaccount_main_input_of_yojson;
    pp=pp_com_atproto_server_deactivateaccount_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.server.createSession"
  *)
module Com_Atproto_Server_CreateSession = struct
  (** def main *)
  type com_atproto_server_createsession_main_input = {
    identifier: string;
    password: string;
    authFactorToken: string option;
    allowTakendown: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_createsession_main_output = {
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
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_createsession_main_error = [ | `AccountTakedown  | `AuthFactorTokenRequired ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Create an authentication session. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_createsession_main_input_to_yojson;
    of_yojson=com_atproto_server_createsession_main_input_of_yojson;
    pp=pp_com_atproto_server_createsession_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_createsession_main_output_to_yojson;
    of_yojson=com_atproto_server_createsession_main_output_of_yojson;
    pp=pp_com_atproto_server_createsession_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_server_createsession_main_error})

end


(** lexicon "com.atproto.server.createInviteCodes"
  *)
module Com_Atproto_Server_CreateInviteCodes = struct
  (** def main *)
  type com_atproto_server_createinvitecodes_main_input = {
    codeCount: int64;
    useCount: int64;
    forAccounts: string list option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_createinvitecodes_main_output = {
    codes: com_atproto_server_createinvitecodes_accountcodes list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Create invite codes. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_createinvitecodes_main_input_to_yojson;
    of_yojson=com_atproto_server_createinvitecodes_main_input_of_yojson;
    pp=pp_com_atproto_server_createinvitecodes_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_createinvitecodes_main_output_to_yojson;
    of_yojson=com_atproto_server_createinvitecodes_main_output_of_yojson;
    pp=pp_com_atproto_server_createinvitecodes_main_output}}) ~errors:No_errors

  (** def accountCodes *)
  type nonrec accountcodes = com_atproto_server_createinvitecodes_accountcodes = {
    account: string;
    codes: string list;
  }
  let pp_accountcodes = pp_com_atproto_server_createinvitecodes_accountcodes
  let accountcodes_of_yojson = com_atproto_server_createinvitecodes_accountcodes_of_yojson
  let accountcodes_to_yojson = com_atproto_server_createinvitecodes_accountcodes_to_yojson


end


(** lexicon "com.atproto.server.createInviteCode"
  *)
module Com_Atproto_Server_CreateInviteCode = struct
  (** def main *)
  type com_atproto_server_createinvitecode_main_input = {
    useCount: int64;
    forAccount: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_createinvitecode_main_output = {
    code: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Create an invite code. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_createinvitecode_main_input_to_yojson;
    of_yojson=com_atproto_server_createinvitecode_main_input_of_yojson;
    pp=pp_com_atproto_server_createinvitecode_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_createinvitecode_main_output_to_yojson;
    of_yojson=com_atproto_server_createinvitecode_main_output_of_yojson;
    pp=pp_com_atproto_server_createinvitecode_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.server.createAppPassword"
  *)
module Com_Atproto_Server_CreateAppPassword = struct
  (** def main *)
  type com_atproto_server_createapppassword_main_input = {
    name: string;
    privileged: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_createapppassword_main_output = com_atproto_server_createapppassword_apppassword
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_createapppassword_main_error = [ | `AccountTakedown ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Create an App Password. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_createapppassword_main_input_to_yojson;
    of_yojson=com_atproto_server_createapppassword_main_input_of_yojson;
    pp=pp_com_atproto_server_createapppassword_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_createapppassword_main_output_to_yojson;
    of_yojson=com_atproto_server_createapppassword_main_output_of_yojson;
    pp=pp_com_atproto_server_createapppassword_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_server_createapppassword_main_error})

  (** def appPassword *)
  type nonrec apppassword = com_atproto_server_createapppassword_apppassword = {
    name: string;
    password: string;
    createdAt: string;
    privileged: bool option;
  }
  let pp_apppassword = pp_com_atproto_server_createapppassword_apppassword
  let apppassword_of_yojson = com_atproto_server_createapppassword_apppassword_of_yojson
  let apppassword_to_yojson = com_atproto_server_createapppassword_apppassword_to_yojson


end


(** lexicon "com.atproto.server.createAccount"
  *)
module Com_Atproto_Server_CreateAccount = struct
  (** def main *)
  type com_atproto_server_createaccount_main_input = {
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
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_createaccount_main_output = {
    accessJwt: string;
    refreshJwt: string;
    handle: string;
    did: string;
    didDoc: Value.t (* unknown *) option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_createaccount_main_error = [ | `InvalidHandle  | `InvalidPassword  | `InvalidInviteCode  | `HandleNotAvailable  | `UnsupportedDomain  | `UnresolvableDid  | `IncompatibleDidDoc ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Create an account. Implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_createaccount_main_input_to_yojson;
    of_yojson=com_atproto_server_createaccount_main_input_of_yojson;
    pp=pp_com_atproto_server_createaccount_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_createaccount_main_output_to_yojson;
    of_yojson=com_atproto_server_createaccount_main_output_of_yojson;
    pp=pp_com_atproto_server_createaccount_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_server_createaccount_main_error})

end


(** lexicon "com.atproto.server.confirmEmail"
  *)
module Com_Atproto_Server_ConfirmEmail = struct
  (** def main *)
  type com_atproto_server_confirmemail_main_input = {
    email: string;
    token: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_server_confirmemail_main_error = [ | `AccountNotFound  | `ExpiredToken  | `InvalidToken  | `InvalidEmail ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Confirm an email using a token from com.atproto.server.requestEmailConfirmation. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_confirmemail_main_input_to_yojson;
    of_yojson=com_atproto_server_confirmemail_main_input_of_yojson;
    pp=pp_com_atproto_server_confirmemail_main_input}}) ~output:No_io 
    ~errors:(Errors {pp=pp_com_atproto_server_confirmemail_main_error})

end


(** lexicon "com.atproto.server.checkAccountStatus"
  *)
module Com_Atproto_Server_CheckAccountStatus = struct
  (** def main *)
  type com_atproto_server_checkaccountstatus_main_output = {
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
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Returns the status of an account, especially as pertaining to import or recovery. Can be called many times over the course of an account migration. Requires auth and can only be called pertaining to oneself. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_server_checkaccountstatus_main_output_to_yojson;
    of_yojson=com_atproto_server_checkaccountstatus_main_output_of_yojson;
    pp=pp_com_atproto_server_checkaccountstatus_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.server.activateAccount"
  *)
module Com_Atproto_Server_ActivateAccount = struct
  (** def main *)
  (** Activates a currently deactivated account. Used to finalize account migration after the account's repo is imported and identity is setup. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.repo.uploadBlob"
  *)
module Com_Atproto_Repo_UploadBlob = struct
  (** def main *)
  type com_atproto_repo_uploadblob_main_output = {
    blob: Blob.t;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Upload a new blob, to be referenced from a repository record. The blob will be deleted if it is not referenced within a time window (eg, minutes). Blob restrictions (mimetype, size, etc) are enforced when the reference is created. Requires auth, implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_opaque {encoding=(Other "*/*")}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_uploadblob_main_output_to_yojson;
    of_yojson=com_atproto_repo_uploadblob_main_output_of_yojson;
    pp=pp_com_atproto_repo_uploadblob_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.repo.putRecord"
  *)
module Com_Atproto_Repo_PutRecord = struct
  (** def main *)
  type com_atproto_repo_putrecord_main_input = {
    repo: string;
    collection: string;
    rkey: string;
    validate: bool option;
    record: Value.t (* unknown *);
    swapRecord: string option;
    swapCommit: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_repo_putrecord_main_output = {
    uri: string;
    cid: string;
    commit: com_atproto_repo_defs_commitmeta option;
    validationStatus: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_repo_putrecord_main_error = [ | `InvalidSwap ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Write a repository record, creating or updating it as needed. Requires auth, implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_putrecord_main_input_to_yojson;
    of_yojson=com_atproto_repo_putrecord_main_input_of_yojson;
    pp=pp_com_atproto_repo_putrecord_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_putrecord_main_output_to_yojson;
    of_yojson=com_atproto_repo_putrecord_main_output_of_yojson;
    pp=pp_com_atproto_repo_putrecord_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_repo_putrecord_main_error})

end


(** lexicon "com.atproto.repo.listRecords"
  *)
module Com_Atproto_Repo_ListRecords = struct
  (** def main *)
  type com_atproto_repo_listrecords_main_params = {
    repo: string;
    collection: string;
    limit: int64 option;
    cursor: string option;
    reverse: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_repo_listrecords_main_output = {
    cursor: string option;
    records: com_atproto_repo_listrecords_record list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** List a range of records in a repository, matching a specific collection. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_repo_listrecords_main_params_to_yojson;
    of_yojson=com_atproto_repo_listrecords_main_params_of_yojson;
    pp=pp_com_atproto_repo_listrecords_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_listrecords_main_output_to_yojson;
    of_yojson=com_atproto_repo_listrecords_main_output_of_yojson;
    pp=pp_com_atproto_repo_listrecords_main_output}}) ~errors:No_errors

  (** def record *)
  type nonrec record = com_atproto_repo_listrecords_record = {
    uri: string;
    cid: string;
    value: Value.t (* unknown *);
  }
  let pp_record = pp_com_atproto_repo_listrecords_record
  let record_of_yojson = com_atproto_repo_listrecords_record_of_yojson
  let record_to_yojson = com_atproto_repo_listrecords_record_to_yojson


end


(** lexicon "com.atproto.repo.listMissingBlobs"
  *)
module Com_Atproto_Repo_ListMissingBlobs = struct
  (** def main *)
  type com_atproto_repo_listmissingblobs_main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_repo_listmissingblobs_main_output = {
    cursor: string option;
    blobs: com_atproto_repo_listmissingblobs_recordblob list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Returns a list of missing blobs for the requesting account. Intended to be used in the account migration flow. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_repo_listmissingblobs_main_params_to_yojson;
    of_yojson=com_atproto_repo_listmissingblobs_main_params_of_yojson;
    pp=pp_com_atproto_repo_listmissingblobs_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_listmissingblobs_main_output_to_yojson;
    of_yojson=com_atproto_repo_listmissingblobs_main_output_of_yojson;
    pp=pp_com_atproto_repo_listmissingblobs_main_output}}) ~errors:No_errors

  (** def recordBlob *)
  type nonrec recordblob = com_atproto_repo_listmissingblobs_recordblob = {
    cid: string;
    recordUri: string;
  }
  let pp_recordblob = pp_com_atproto_repo_listmissingblobs_recordblob
  let recordblob_of_yojson = com_atproto_repo_listmissingblobs_recordblob_of_yojson
  let recordblob_to_yojson = com_atproto_repo_listmissingblobs_recordblob_to_yojson


end


(** lexicon "com.atproto.repo.importRepo"
  *)
module Com_Atproto_Repo_ImportRepo = struct
  (** def main *)
  (** Import a repo in the form of a CAR file. Requires Content-Length HTTP header to be set. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_opaque {encoding=CAR}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.repo.getRecord"
  *)
module Com_Atproto_Repo_GetRecord = struct
  (** def main *)
  type com_atproto_repo_getrecord_main_params = {
    repo: string;
    collection: string;
    rkey: string;
    cid: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_repo_getrecord_main_output = {
    uri: string;
    cid: string option;
    value: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_repo_getrecord_main_error = [ | `RecordNotFound ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a single record from a repository. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_repo_getrecord_main_params_to_yojson;
    of_yojson=com_atproto_repo_getrecord_main_params_of_yojson;
    pp=pp_com_atproto_repo_getrecord_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_getrecord_main_output_to_yojson;
    of_yojson=com_atproto_repo_getrecord_main_output_of_yojson;
    pp=pp_com_atproto_repo_getrecord_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_repo_getrecord_main_error})

end


(** lexicon "com.atproto.repo.describeRepo"
  *)
module Com_Atproto_Repo_DescribeRepo = struct
  (** def main *)
  type com_atproto_repo_describerepo_main_params = {
    repo: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_repo_describerepo_main_output = {
    handle: string;
    did: string;
    didDoc: Value.t (* unknown *);
    collections: string list;
    handleIsCorrect: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get information about an account and repository, including the list of collections. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_repo_describerepo_main_params_to_yojson;
    of_yojson=com_atproto_repo_describerepo_main_params_of_yojson;
    pp=pp_com_atproto_repo_describerepo_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_describerepo_main_output_to_yojson;
    of_yojson=com_atproto_repo_describerepo_main_output_of_yojson;
    pp=pp_com_atproto_repo_describerepo_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.repo.deleteRecord"
  *)
module Com_Atproto_Repo_DeleteRecord = struct
  (** def main *)
  type com_atproto_repo_deleterecord_main_input = {
    repo: string;
    collection: string;
    rkey: string;
    swapRecord: string option;
    swapCommit: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_repo_deleterecord_main_output = {
    commit: com_atproto_repo_defs_commitmeta option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_repo_deleterecord_main_error = [ | `InvalidSwap ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Delete a repository record, or ensure it doesn't exist. Requires auth, implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_deleterecord_main_input_to_yojson;
    of_yojson=com_atproto_repo_deleterecord_main_input_of_yojson;
    pp=pp_com_atproto_repo_deleterecord_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_deleterecord_main_output_to_yojson;
    of_yojson=com_atproto_repo_deleterecord_main_output_of_yojson;
    pp=pp_com_atproto_repo_deleterecord_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_repo_deleterecord_main_error})

end


(** lexicon "com.atproto.repo.createRecord"
  *)
module Com_Atproto_Repo_CreateRecord = struct
  (** def main *)
  type com_atproto_repo_createrecord_main_input = {
    repo: string;
    collection: string;
    rkey: string option;
    validate: bool option;
    record: Value.t (* unknown *);
    swapCommit: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_repo_createrecord_main_output = {
    uri: string;
    cid: string;
    commit: com_atproto_repo_defs_commitmeta option;
    validationStatus: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_repo_createrecord_main_error = [ | `InvalidSwap ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Create a single new repository record. Requires auth, implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_createrecord_main_input_to_yojson;
    of_yojson=com_atproto_repo_createrecord_main_input_of_yojson;
    pp=pp_com_atproto_repo_createrecord_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_createrecord_main_output_to_yojson;
    of_yojson=com_atproto_repo_createrecord_main_output_of_yojson;
    pp=pp_com_atproto_repo_createrecord_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_repo_createrecord_main_error})

end


(** lexicon "com.atproto.repo.applyWrites"
  *)
module Com_Atproto_Repo_ApplyWrites = struct
  (** def main *)
  type com_atproto_repo_applywrites_main_input = {
    repo: string;
    validate: bool option;
    writes: [
    | `Com_atproto_repo_applywrites_create of com_atproto_repo_applywrites_create
    | `Com_atproto_repo_applywrites_update of com_atproto_repo_applywrites_update
    | `Com_atproto_repo_applywrites_delete of com_atproto_repo_applywrites_delete
    ] list;
    swapCommit: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_repo_applywrites_main_output = {
    commit: com_atproto_repo_defs_commitmeta option;
    results: [
    | `Com_atproto_repo_applywrites_createresult of com_atproto_repo_applywrites_createresult
    | `Com_atproto_repo_applywrites_updateresult of com_atproto_repo_applywrites_updateresult
    | `Com_atproto_repo_applywrites_deleteresult of com_atproto_repo_applywrites_deleteresult
    ] list option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_repo_applywrites_main_error = [ | `InvalidSwap ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Apply a batch transaction of repository creates, updates, and deletes. Requires auth, implemented by PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_applywrites_main_input_to_yojson;
    of_yojson=com_atproto_repo_applywrites_main_input_of_yojson;
    pp=pp_com_atproto_repo_applywrites_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_repo_applywrites_main_output_to_yojson;
    of_yojson=com_atproto_repo_applywrites_main_output_of_yojson;
    pp=pp_com_atproto_repo_applywrites_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_repo_applywrites_main_error})

  (** def create *)
  type nonrec create = com_atproto_repo_applywrites_create = {
    collection: string;
    rkey: string option;
    value: Value.t (* unknown *);
  }
  let pp_create = pp_com_atproto_repo_applywrites_create
  let create_of_yojson = com_atproto_repo_applywrites_create_of_yojson
  let create_to_yojson = com_atproto_repo_applywrites_create_to_yojson


  (** def update *)
  type nonrec update = com_atproto_repo_applywrites_update = {
    collection: string;
    rkey: string;
    value: Value.t (* unknown *);
  }
  let pp_update = pp_com_atproto_repo_applywrites_update
  let update_of_yojson = com_atproto_repo_applywrites_update_of_yojson
  let update_to_yojson = com_atproto_repo_applywrites_update_to_yojson


  (** def delete *)
  type nonrec delete = com_atproto_repo_applywrites_delete = {
    collection: string;
    rkey: string;
  }
  let pp_delete = pp_com_atproto_repo_applywrites_delete
  let delete_of_yojson = com_atproto_repo_applywrites_delete_of_yojson
  let delete_to_yojson = com_atproto_repo_applywrites_delete_to_yojson


  (** def createResult *)
  type nonrec createresult = com_atproto_repo_applywrites_createresult = {
    uri: string;
    cid: string;
    validationStatus: string option;
  }
  let pp_createresult = pp_com_atproto_repo_applywrites_createresult
  let createresult_of_yojson = com_atproto_repo_applywrites_createresult_of_yojson
  let createresult_to_yojson = com_atproto_repo_applywrites_createresult_to_yojson


  (** def updateResult *)
  type nonrec updateresult = com_atproto_repo_applywrites_updateresult = {
    uri: string;
    cid: string;
    validationStatus: string option;
  }
  let pp_updateresult = pp_com_atproto_repo_applywrites_updateresult
  let updateresult_of_yojson = com_atproto_repo_applywrites_updateresult_of_yojson
  let updateresult_to_yojson = com_atproto_repo_applywrites_updateresult_to_yojson


  (** def deleteResult *)
  type nonrec deleteresult = com_atproto_repo_applywrites_deleteresult
  let pp_deleteresult = pp_com_atproto_repo_applywrites_deleteresult
  let deleteresult_of_yojson = com_atproto_repo_applywrites_deleteresult_of_yojson
  let deleteresult_to_yojson = com_atproto_repo_applywrites_deleteresult_to_yojson


end


(** lexicon "com.atproto.repo.defs"
  *)
module Com_Atproto_Repo_Defs = struct
  (** def commitMeta *)
  type nonrec commitmeta = com_atproto_repo_defs_commitmeta = {
    cid: string;
    rev: string;
  }
  let pp_commitmeta = pp_com_atproto_repo_defs_commitmeta
  let commitmeta_of_yojson = com_atproto_repo_defs_commitmeta_of_yojson
  let commitmeta_to_yojson = com_atproto_repo_defs_commitmeta_to_yojson


end


(** lexicon "com.atproto.moderation.createReport"
  *)
module Com_Atproto_Moderation_CreateReport = struct
  (** def main *)
  type com_atproto_moderation_createreport_main_input = {
    reasonType: com_atproto_moderation_defs_reasontype;
    reason: string option;
    subject: [
    | `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Other of Value.t (** Non closed union *)
    ];
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_moderation_createreport_main_output = {
    id: int64;
    reasonType: com_atproto_moderation_defs_reasontype;
    reason: string option;
    subject: [
    | `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Other of Value.t (** Non closed union *)
    ];
    reportedBy: string;
    createdAt: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Submit a moderation report regarding an atproto account or record. Implemented by moderation services (with PDS proxying), and requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_moderation_createreport_main_input_to_yojson;
    of_yojson=com_atproto_moderation_createreport_main_input_of_yojson;
    pp=pp_com_atproto_moderation_createreport_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_moderation_createreport_main_output_to_yojson;
    of_yojson=com_atproto_moderation_createreport_main_output_of_yojson;
    pp=pp_com_atproto_moderation_createreport_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.lexicon.schema"
  *)
module Com_Atproto_Lexicon_Schema = struct
  (** def main *)
  (** Representation of Lexicon schemas themselves, when published as atproto records. Note that the schema language is not defined in Lexicon; this meta schema currently only includes a single version field ('lexicon'). See the atproto specifications for description of the other expected top-level fields ('id', 'defs', etc). *)
  type main = {
    lexicon: int64;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "com.atproto.label.subscribeLabels"
  *)
module Com_Atproto_Label_SubscribeLabels = struct
  (** def main *)
  type com_atproto_label_subscribelabels_main_msg = [
    | `Com_atproto_label_subscribelabels_labels of com_atproto_label_subscribelabels_labels
    | `Com_atproto_label_subscribelabels_info of com_atproto_label_subscribelabels_info
    | `Other of Value.t (** Non closed union *)
    ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_label_subscribelabels_main_params = {
    cursor: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_label_subscribelabels_main_error = [ | `FutureCursor ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Subscribe to stream of labels (and negations). Public endpoint implemented by mod services. Uses same sequencing scheme as repo event stream. *)
  let main: _ Base.subscription = Base.make_subscription 
    ~parameters:(Params {
    to_yojson=com_atproto_label_subscribelabels_main_params_to_yojson;
    of_yojson=com_atproto_label_subscribelabels_main_params_of_yojson;
    pp=pp_com_atproto_label_subscribelabels_main_params}) ~message:(Message {
    to_yojson=com_atproto_label_subscribelabels_main_msg_to_yojson;
    of_yojson=com_atproto_label_subscribelabels_main_msg_of_yojson;
    pp=pp_com_atproto_label_subscribelabels_main_msg}) 
    ~errors:(Errors {pp=pp_com_atproto_label_subscribelabels_main_error})

  (** def labels *)
  type nonrec labels = com_atproto_label_subscribelabels_labels = {
    seq: int64;
    labels: com_atproto_label_defs_label list;
  }
  let pp_labels = pp_com_atproto_label_subscribelabels_labels
  let labels_of_yojson = com_atproto_label_subscribelabels_labels_of_yojson
  let labels_to_yojson = com_atproto_label_subscribelabels_labels_to_yojson


  (** def info *)
  type nonrec info = com_atproto_label_subscribelabels_info = {
    name: string;
    message: string option;
  }
  let pp_info = pp_com_atproto_label_subscribelabels_info
  let info_of_yojson = com_atproto_label_subscribelabels_info_of_yojson
  let info_to_yojson = com_atproto_label_subscribelabels_info_to_yojson


end


(** lexicon "com.atproto.label.queryLabels"
  *)
module Com_Atproto_Label_QueryLabels = struct
  (** def main *)
  type com_atproto_label_querylabels_main_params = {
    uriPatterns: string list;
    sources: string list option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_label_querylabels_main_output = {
    cursor: string option;
    labels: com_atproto_label_defs_label list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Find labels relevant to the provided AT-URI patterns. Public endpoint for moderation services, though may return different or additional results with auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_label_querylabels_main_params_to_yojson;
    of_yojson=com_atproto_label_querylabels_main_params_of_yojson;
    pp=pp_com_atproto_label_querylabels_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_label_querylabels_main_output_to_yojson;
    of_yojson=com_atproto_label_querylabels_main_output_of_yojson;
    pp=pp_com_atproto_label_querylabels_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.identity.updateHandle"
  *)
module Com_Atproto_Identity_UpdateHandle = struct
  (** def main *)
  type com_atproto_identity_updatehandle_main_input = {
    handle: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Updates the current account's handle. Verifies handle validity, and updates did:plc document if necessary. Implemented by PDS, and requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_identity_updatehandle_main_input_to_yojson;
    of_yojson=com_atproto_identity_updatehandle_main_input_of_yojson;
    pp=pp_com_atproto_identity_updatehandle_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.identity.submitPlcOperation"
  *)
module Com_Atproto_Identity_SubmitPlcOperation = struct
  (** def main *)
  type com_atproto_identity_submitplcoperation_main_input = {
    operation: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Validates a PLC operation to ensure that it doesn't violate a service's constraints or get the identity into a bad state, then submits it to the PLC registry *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_identity_submitplcoperation_main_input_to_yojson;
    of_yojson=com_atproto_identity_submitplcoperation_main_input_of_yojson;
    pp=pp_com_atproto_identity_submitplcoperation_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.identity.signPlcOperation"
  *)
module Com_Atproto_Identity_SignPlcOperation = struct
  (** def main *)
  type com_atproto_identity_signplcoperation_main_input = {
    token: string option;
    rotationKeys: string list option;
    alsoKnownAs: string list option;
    verificationMethods: Value.t (* unknown *) option;
    services: Value.t (* unknown *) option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_identity_signplcoperation_main_output = {
    operation: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Signs a PLC operation to update some value(s) in the requesting DID's document. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_identity_signplcoperation_main_input_to_yojson;
    of_yojson=com_atproto_identity_signplcoperation_main_input_of_yojson;
    pp=pp_com_atproto_identity_signplcoperation_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_identity_signplcoperation_main_output_to_yojson;
    of_yojson=com_atproto_identity_signplcoperation_main_output_of_yojson;
    pp=pp_com_atproto_identity_signplcoperation_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.identity.resolveIdentity"
  *)
module Com_Atproto_Identity_ResolveIdentity = struct
  (** def main *)
  type com_atproto_identity_resolveidentity_main_params = {
    identifier: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_identity_resolveidentity_main_output = com_atproto_identity_defs_identityinfo
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_identity_resolveidentity_main_error = [ | `HandleNotFound  | `DidNotFound  | `DidDeactivated ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Resolves an identity (DID or Handle) to a full identity (DID document and verified handle). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_identity_resolveidentity_main_params_to_yojson;
    of_yojson=com_atproto_identity_resolveidentity_main_params_of_yojson;
    pp=pp_com_atproto_identity_resolveidentity_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_identity_resolveidentity_main_output_to_yojson;
    of_yojson=com_atproto_identity_resolveidentity_main_output_of_yojson;
    pp=pp_com_atproto_identity_resolveidentity_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_identity_resolveidentity_main_error})

end


(** lexicon "com.atproto.identity.resolveHandle"
  *)
module Com_Atproto_Identity_ResolveHandle = struct
  (** def main *)
  type com_atproto_identity_resolvehandle_main_params = {
    handle: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_identity_resolvehandle_main_output = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_identity_resolvehandle_main_error = [ | `HandleNotFound ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Resolves an atproto handle (hostname) to a DID. Does not necessarily bi-directionally verify against the the DID document. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_identity_resolvehandle_main_params_to_yojson;
    of_yojson=com_atproto_identity_resolvehandle_main_params_of_yojson;
    pp=pp_com_atproto_identity_resolvehandle_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_identity_resolvehandle_main_output_to_yojson;
    of_yojson=com_atproto_identity_resolvehandle_main_output_of_yojson;
    pp=pp_com_atproto_identity_resolvehandle_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_identity_resolvehandle_main_error})

end


(** lexicon "com.atproto.identity.resolveDid"
  *)
module Com_Atproto_Identity_ResolveDid = struct
  (** def main *)
  type com_atproto_identity_resolvedid_main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_identity_resolvedid_main_output = {
    didDoc: Value.t (* unknown *);
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_identity_resolvedid_main_error = [ | `DidNotFound  | `DidDeactivated ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Resolves DID to DID document. Does not bi-directionally verify handle. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_identity_resolvedid_main_params_to_yojson;
    of_yojson=com_atproto_identity_resolvedid_main_params_of_yojson;
    pp=pp_com_atproto_identity_resolvedid_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_identity_resolvedid_main_output_to_yojson;
    of_yojson=com_atproto_identity_resolvedid_main_output_of_yojson;
    pp=pp_com_atproto_identity_resolvedid_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_identity_resolvedid_main_error})

end


(** lexicon "com.atproto.identity.requestPlcOperationSignature"
  *)
module Com_Atproto_Identity_RequestPlcOperationSignature = struct
  (** def main *)
  (** Request an email with a code to in order to request a signed PLC operation. Requires Auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params ~input:No_io ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.identity.refreshIdentity"
  *)
module Com_Atproto_Identity_RefreshIdentity = struct
  (** def main *)
  type com_atproto_identity_refreshidentity_main_input = {
    identifier: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_identity_refreshidentity_main_output = com_atproto_identity_defs_identityinfo
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_identity_refreshidentity_main_error = [ | `HandleNotFound  | `DidNotFound  | `DidDeactivated ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Request that the server re-resolve an identity (DID and handle). The server may ignore this request, or require authentication, depending on the role, implementation, and policy of the server. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_identity_refreshidentity_main_input_to_yojson;
    of_yojson=com_atproto_identity_refreshidentity_main_input_of_yojson;
    pp=pp_com_atproto_identity_refreshidentity_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_identity_refreshidentity_main_output_to_yojson;
    of_yojson=com_atproto_identity_refreshidentity_main_output_of_yojson;
    pp=pp_com_atproto_identity_refreshidentity_main_output}}) 
    ~errors:(Errors {pp=pp_com_atproto_identity_refreshidentity_main_error})

end


(** lexicon "com.atproto.identity.getRecommendedDidCredentials"
  *)
module Com_Atproto_Identity_GetRecommendedDidCredentials = struct
  (** def main *)
  type com_atproto_identity_getrecommendeddidcredentials_main_output = {
    rotationKeys: string list option;
    alsoKnownAs: string list option;
    verificationMethods: Value.t (* unknown *) option;
    services: Value.t (* unknown *) option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Describe the credentials that should be included in the DID doc of an account that is migrating to this service. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_identity_getrecommendeddidcredentials_main_output_to_yojson;
    of_yojson=com_atproto_identity_getrecommendeddidcredentials_main_output_of_yojson;
    pp=pp_com_atproto_identity_getrecommendeddidcredentials_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.identity.defs"
  *)
module Com_Atproto_Identity_Defs = struct
  (** def identityInfo *)
  type nonrec identityinfo = com_atproto_identity_defs_identityinfo = {
    did: string;
    handle: string;
    didDoc: Value.t (* unknown *);
  }
  let pp_identityinfo = pp_com_atproto_identity_defs_identityinfo
  let identityinfo_of_yojson = com_atproto_identity_defs_identityinfo_of_yojson
  let identityinfo_to_yojson = com_atproto_identity_defs_identityinfo_to_yojson


end


(** lexicon "com.atproto.admin.updateSubjectStatus"
  *)
module Com_Atproto_Admin_UpdateSubjectStatus = struct
  (** def main *)
  type com_atproto_admin_updatesubjectstatus_main_input = {
    subject: [
    | `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Com_atproto_admin_defs_repoblobref of com_atproto_admin_defs_repoblobref
    | `Other of Value.t (** Non closed union *)
    ];
    takedown: com_atproto_admin_defs_statusattr option;
    deactivated: com_atproto_admin_defs_statusattr option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_admin_updatesubjectstatus_main_output = {
    subject: [
    | `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Com_atproto_admin_defs_repoblobref of com_atproto_admin_defs_repoblobref
    | `Other of Value.t (** Non closed union *)
    ];
    takedown: com_atproto_admin_defs_statusattr option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Update the service-specific admin status of a subject (account, record, or blob). *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_updatesubjectstatus_main_input_to_yojson;
    of_yojson=com_atproto_admin_updatesubjectstatus_main_input_of_yojson;
    pp=pp_com_atproto_admin_updatesubjectstatus_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_updatesubjectstatus_main_output_to_yojson;
    of_yojson=com_atproto_admin_updatesubjectstatus_main_output_of_yojson;
    pp=pp_com_atproto_admin_updatesubjectstatus_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.updateAccountSigningKey"
  *)
module Com_Atproto_Admin_UpdateAccountSigningKey = struct
  (** def main *)
  type com_atproto_admin_updateaccountsigningkey_main_input = {
    did: string;
    signingKey: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Administrative action to update an account's signing key in their Did document. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_updateaccountsigningkey_main_input_to_yojson;
    of_yojson=com_atproto_admin_updateaccountsigningkey_main_input_of_yojson;
    pp=pp_com_atproto_admin_updateaccountsigningkey_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.updateAccountPassword"
  *)
module Com_Atproto_Admin_UpdateAccountPassword = struct
  (** def main *)
  type com_atproto_admin_updateaccountpassword_main_input = {
    did: string;
    password: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Update the password for a user account as an administrator. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_updateaccountpassword_main_input_to_yojson;
    of_yojson=com_atproto_admin_updateaccountpassword_main_input_of_yojson;
    pp=pp_com_atproto_admin_updateaccountpassword_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.updateAccountHandle"
  *)
module Com_Atproto_Admin_UpdateAccountHandle = struct
  (** def main *)
  type com_atproto_admin_updateaccounthandle_main_input = {
    did: string;
    handle: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Administrative action to update an account's handle. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_updateaccounthandle_main_input_to_yojson;
    of_yojson=com_atproto_admin_updateaccounthandle_main_input_of_yojson;
    pp=pp_com_atproto_admin_updateaccounthandle_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.updateAccountEmail"
  *)
module Com_Atproto_Admin_UpdateAccountEmail = struct
  (** def main *)
  type com_atproto_admin_updateaccountemail_main_input = {
    account: string;
    email: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Administrative action to update an account's email. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_updateaccountemail_main_input_to_yojson;
    of_yojson=com_atproto_admin_updateaccountemail_main_input_of_yojson;
    pp=pp_com_atproto_admin_updateaccountemail_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.sendEmail"
  *)
module Com_Atproto_Admin_SendEmail = struct
  (** def main *)
  type com_atproto_admin_sendemail_main_input = {
    recipientDid: string;
    content: string;
    subject: string option;
    senderDid: string;
    comment: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type com_atproto_admin_sendemail_main_output = {
    sent: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Send email to a user's account email address. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_sendemail_main_input_to_yojson;
    of_yojson=com_atproto_admin_sendemail_main_input_of_yojson;
    pp=pp_com_atproto_admin_sendemail_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_sendemail_main_output_to_yojson;
    of_yojson=com_atproto_admin_sendemail_main_output_of_yojson;
    pp=pp_com_atproto_admin_sendemail_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.searchAccounts"
  *)
module Com_Atproto_Admin_SearchAccounts = struct
  (** def main *)
  type com_atproto_admin_searchaccounts_main_params = {
    email: string option;
    cursor: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_admin_searchaccounts_main_output = {
    cursor: string option;
    accounts: com_atproto_admin_defs_accountview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get list of accounts that matches your search query. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_admin_searchaccounts_main_params_to_yojson;
    of_yojson=com_atproto_admin_searchaccounts_main_params_of_yojson;
    pp=pp_com_atproto_admin_searchaccounts_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_searchaccounts_main_output_to_yojson;
    of_yojson=com_atproto_admin_searchaccounts_main_output_of_yojson;
    pp=pp_com_atproto_admin_searchaccounts_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.getSubjectStatus"
  *)
module Com_Atproto_Admin_GetSubjectStatus = struct
  (** def main *)
  type com_atproto_admin_getsubjectstatus_main_params = {
    did: string option;
    uri: string option;
    blob: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_admin_getsubjectstatus_main_output = {
    subject: [
    | `Com_atproto_admin_defs_reporef of com_atproto_admin_defs_reporef
    | `Com_atproto_repo_strongref_main of com_atproto_repo_strongref_main
    | `Com_atproto_admin_defs_repoblobref of com_atproto_admin_defs_repoblobref
    | `Other of Value.t (** Non closed union *)
    ];
    takedown: com_atproto_admin_defs_statusattr option;
    deactivated: com_atproto_admin_defs_statusattr option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get the service-specific admin status of a subject (account, record, or blob). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_admin_getsubjectstatus_main_params_to_yojson;
    of_yojson=com_atproto_admin_getsubjectstatus_main_params_of_yojson;
    pp=pp_com_atproto_admin_getsubjectstatus_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_getsubjectstatus_main_output_to_yojson;
    of_yojson=com_atproto_admin_getsubjectstatus_main_output_of_yojson;
    pp=pp_com_atproto_admin_getsubjectstatus_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.getInviteCodes"
  *)
module Com_Atproto_Admin_GetInviteCodes = struct
  (** def main *)
  type com_atproto_admin_getinvitecodes_main_params = {
    sort: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_admin_getinvitecodes_main_output = {
    cursor: string option;
    codes: com_atproto_server_defs_invitecode list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get an admin view of invite codes. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_admin_getinvitecodes_main_params_to_yojson;
    of_yojson=com_atproto_admin_getinvitecodes_main_params_of_yojson;
    pp=pp_com_atproto_admin_getinvitecodes_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_getinvitecodes_main_output_to_yojson;
    of_yojson=com_atproto_admin_getinvitecodes_main_output_of_yojson;
    pp=pp_com_atproto_admin_getinvitecodes_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.getAccountInfos"
  *)
module Com_Atproto_Admin_GetAccountInfos = struct
  (** def main *)
  type com_atproto_admin_getaccountinfos_main_params = {
    dids: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_admin_getaccountinfos_main_output = {
    infos: com_atproto_admin_defs_accountview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get details about some accounts. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_admin_getaccountinfos_main_params_to_yojson;
    of_yojson=com_atproto_admin_getaccountinfos_main_params_of_yojson;
    pp=pp_com_atproto_admin_getaccountinfos_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_getaccountinfos_main_output_to_yojson;
    of_yojson=com_atproto_admin_getaccountinfos_main_output_of_yojson;
    pp=pp_com_atproto_admin_getaccountinfos_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.getAccountInfo"
  *)
module Com_Atproto_Admin_GetAccountInfo = struct
  (** def main *)
  type com_atproto_admin_getaccountinfo_main_params = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type com_atproto_admin_getaccountinfo_main_output = com_atproto_admin_defs_accountview
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get details about an account. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=com_atproto_admin_getaccountinfo_main_params_to_yojson;
    of_yojson=com_atproto_admin_getaccountinfo_main_params_of_yojson;
    pp=pp_com_atproto_admin_getaccountinfo_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_getaccountinfo_main_output_to_yojson;
    of_yojson=com_atproto_admin_getaccountinfo_main_output_of_yojson;
    pp=pp_com_atproto_admin_getaccountinfo_main_output}}) ~errors:No_errors

end


(** lexicon "com.atproto.admin.enableAccountInvites"
  *)
module Com_Atproto_Admin_EnableAccountInvites = struct
  (** def main *)
  type com_atproto_admin_enableaccountinvites_main_input = {
    account: string;
    note: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Re-enable an account's ability to receive invite codes. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_enableaccountinvites_main_input_to_yojson;
    of_yojson=com_atproto_admin_enableaccountinvites_main_input_of_yojson;
    pp=pp_com_atproto_admin_enableaccountinvites_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.disableInviteCodes"
  *)
module Com_Atproto_Admin_DisableInviteCodes = struct
  (** def main *)
  type com_atproto_admin_disableinvitecodes_main_input = {
    codes: string list option;
    accounts: string list option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Disable some set of codes and/or all codes associated with a set of users. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_disableinvitecodes_main_input_to_yojson;
    of_yojson=com_atproto_admin_disableinvitecodes_main_input_of_yojson;
    pp=pp_com_atproto_admin_disableinvitecodes_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.disableAccountInvites"
  *)
module Com_Atproto_Admin_DisableAccountInvites = struct
  (** def main *)
  type com_atproto_admin_disableaccountinvites_main_input = {
    account: string;
    note: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Disable an account from receiving new invite codes, but does not invalidate existing codes. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_disableaccountinvites_main_input_to_yojson;
    of_yojson=com_atproto_admin_disableaccountinvites_main_input_of_yojson;
    pp=pp_com_atproto_admin_disableaccountinvites_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.deleteAccount"
  *)
module Com_Atproto_Admin_DeleteAccount = struct
  (** def main *)
  type com_atproto_admin_deleteaccount_main_input = {
    did: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Delete a user account as an administrator. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=com_atproto_admin_deleteaccount_main_input_to_yojson;
    of_yojson=com_atproto_admin_deleteaccount_main_input_of_yojson;
    pp=pp_com_atproto_admin_deleteaccount_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "com.atproto.admin.defs"
  *)
module Com_Atproto_Admin_Defs = struct
  (** def statusAttr *)
  type nonrec statusattr = com_atproto_admin_defs_statusattr = {
    applied: bool;
    ref: string option;
  }
  let pp_statusattr = pp_com_atproto_admin_defs_statusattr
  let statusattr_of_yojson = com_atproto_admin_defs_statusattr_of_yojson
  let statusattr_to_yojson = com_atproto_admin_defs_statusattr_to_yojson


  (** def accountView *)
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
  let accountview_of_yojson = com_atproto_admin_defs_accountview_of_yojson
  let accountview_to_yojson = com_atproto_admin_defs_accountview_to_yojson


  (** def repoRef *)
  type nonrec reporef = com_atproto_admin_defs_reporef = {
    did: string;
  }
  let pp_reporef = pp_com_atproto_admin_defs_reporef
  let reporef_of_yojson = com_atproto_admin_defs_reporef_of_yojson
  let reporef_to_yojson = com_atproto_admin_defs_reporef_to_yojson


  (** def repoBlobRef *)
  type nonrec repoblobref = com_atproto_admin_defs_repoblobref = {
    did: string;
    cid: string;
    recordUri: string option;
  }
  let pp_repoblobref = pp_com_atproto_admin_defs_repoblobref
  let repoblobref_of_yojson = com_atproto_admin_defs_repoblobref_of_yojson
  let repoblobref_to_yojson = com_atproto_admin_defs_repoblobref_to_yojson


  (** def threatSignature *)
  type nonrec threatsignature = com_atproto_admin_defs_threatsignature = {
    property: string;
    value: string;
  }
  let pp_threatsignature = pp_com_atproto_admin_defs_threatsignature
  let threatsignature_of_yojson = com_atproto_admin_defs_threatsignature_of_yojson
  let threatsignature_to_yojson = com_atproto_admin_defs_threatsignature_to_yojson


end


(** lexicon "com.atproto.server.defs"
  *)
module Com_Atproto_Server_Defs = struct
  (** def inviteCode *)
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
  let invitecode_of_yojson = com_atproto_server_defs_invitecode_of_yojson
  let invitecode_to_yojson = com_atproto_server_defs_invitecode_to_yojson


  (** def inviteCodeUse *)
  type nonrec invitecodeuse = com_atproto_server_defs_invitecodeuse = {
    usedBy: string;
    usedAt: string;
  }
  let pp_invitecodeuse = pp_com_atproto_server_defs_invitecodeuse
  let invitecodeuse_of_yojson = com_atproto_server_defs_invitecodeuse_of_yojson
  let invitecodeuse_to_yojson = com_atproto_server_defs_invitecodeuse_to_yojson


end


(** lexicon "app.bsky.video.uploadVideo"
  *)
module App_Bsky_Video_UploadVideo = struct
  (** def main *)
  type app_bsky_video_uploadvideo_main_output = {
    jobStatus: app_bsky_video_defs_jobstatus;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Upload a video to be processed then stored on the PDS. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_opaque {encoding=(Other "video/mp4")}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_video_uploadvideo_main_output_to_yojson;
    of_yojson=app_bsky_video_uploadvideo_main_output_of_yojson;
    pp=pp_app_bsky_video_uploadvideo_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.video.getUploadLimits"
  *)
module App_Bsky_Video_GetUploadLimits = struct
  (** def main *)
  type app_bsky_video_getuploadlimits_main_output = {
    canUpload: bool;
    remainingDailyVideos: int64 option;
    remainingDailyBytes: int64 option;
    message: string option;
    error: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get video upload limits for the authenticated user. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_video_getuploadlimits_main_output_to_yojson;
    of_yojson=app_bsky_video_getuploadlimits_main_output_of_yojson;
    pp=pp_app_bsky_video_getuploadlimits_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.video.getJobStatus"
  *)
module App_Bsky_Video_GetJobStatus = struct
  (** def main *)
  type app_bsky_video_getjobstatus_main_params = {
    jobId: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_video_getjobstatus_main_output = {
    jobStatus: app_bsky_video_defs_jobstatus;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get status details for a video processing job. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_video_getjobstatus_main_params_to_yojson;
    of_yojson=app_bsky_video_getjobstatus_main_params_of_yojson;
    pp=pp_app_bsky_video_getjobstatus_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_video_getjobstatus_main_output_to_yojson;
    of_yojson=app_bsky_video_getjobstatus_main_output_of_yojson;
    pp=pp_app_bsky_video_getjobstatus_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.video.defs"
  *)
module App_Bsky_Video_Defs = struct
  (** def jobStatus *)
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
  let jobstatus_of_yojson = app_bsky_video_defs_jobstatus_of_yojson
  let jobstatus_to_yojson = app_bsky_video_defs_jobstatus_to_yojson


end


(** lexicon "app.bsky.unspecced.searchStarterPacksSkeleton"
  *)
module App_Bsky_Unspecced_SearchStarterPacksSkeleton = struct
  (** def main *)
  type app_bsky_unspecced_searchstarterpacksskeleton_main_params = {
    q: string;
    viewer: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_searchstarterpacksskeleton_main_output = {
    cursor: string option;
    hitsTotal: int64 option;
    starterPacks: app_bsky_unspecced_defs_skeletonsearchstarterpack list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_unspecced_searchstarterpacksskeleton_main_error = [ | `BadQueryString ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Backend Starter Pack search, returns only skeleton. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_searchstarterpacksskeleton_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_searchstarterpacksskeleton_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_searchstarterpacksskeleton_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_searchstarterpacksskeleton_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_searchstarterpacksskeleton_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_searchstarterpacksskeleton_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_unspecced_searchstarterpacksskeleton_main_error})

end


(** lexicon "app.bsky.unspecced.searchPostsSkeleton"
  *)
module App_Bsky_Unspecced_SearchPostsSkeleton = struct
  (** def main *)
  type app_bsky_unspecced_searchpostsskeleton_main_params = {
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
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_searchpostsskeleton_main_output = {
    cursor: string option;
    hitsTotal: int64 option;
    posts: app_bsky_unspecced_defs_skeletonsearchpost list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_unspecced_searchpostsskeleton_main_error = [ | `BadQueryString ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Backend Posts search, returns only skeleton *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_searchpostsskeleton_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_searchpostsskeleton_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_searchpostsskeleton_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_searchpostsskeleton_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_searchpostsskeleton_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_searchpostsskeleton_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_unspecced_searchpostsskeleton_main_error})

end


(** lexicon "app.bsky.unspecced.searchActorsSkeleton"
  *)
module App_Bsky_Unspecced_SearchActorsSkeleton = struct
  (** def main *)
  type app_bsky_unspecced_searchactorsskeleton_main_params = {
    q: string;
    viewer: string option;
    typeahead: bool option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_searchactorsskeleton_main_output = {
    cursor: string option;
    hitsTotal: int64 option;
    actors: app_bsky_unspecced_defs_skeletonsearchactor list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_unspecced_searchactorsskeleton_main_error = [ | `BadQueryString ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Backend Actors (profile) search, returns only skeleton. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_searchactorsskeleton_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_searchactorsskeleton_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_searchactorsskeleton_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_searchactorsskeleton_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_searchactorsskeleton_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_searchactorsskeleton_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_unspecced_searchactorsskeleton_main_error})

end


(** lexicon "app.bsky.unspecced.getTrendsSkeleton"
  *)
module App_Bsky_Unspecced_GetTrendsSkeleton = struct
  (** def main *)
  type app_bsky_unspecced_gettrendsskeleton_main_params = {
    viewer: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_gettrendsskeleton_main_output = {
    trends: app_bsky_unspecced_defs_skeletontrend list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get the skeleton of trends on the network. Intended to be called and then hydrated through app.bsky.unspecced.getTrends *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_gettrendsskeleton_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_gettrendsskeleton_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_gettrendsskeleton_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_gettrendsskeleton_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_gettrendsskeleton_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_gettrendsskeleton_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getTrends"
  *)
module App_Bsky_Unspecced_GetTrends = struct
  (** def main *)
  type app_bsky_unspecced_gettrends_main_params = {
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_gettrends_main_output = {
    trends: app_bsky_unspecced_defs_trendview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get the current trends on the network *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_gettrends_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_gettrends_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_gettrends_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_gettrends_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_gettrends_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_gettrends_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getTrendingTopics"
  *)
module App_Bsky_Unspecced_GetTrendingTopics = struct
  (** def main *)
  type app_bsky_unspecced_gettrendingtopics_main_params = {
    viewer: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_gettrendingtopics_main_output = {
    topics: app_bsky_unspecced_defs_trendingtopic list;
    suggested: app_bsky_unspecced_defs_trendingtopic list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of trending topics *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_gettrendingtopics_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_gettrendingtopics_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_gettrendingtopics_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_gettrendingtopics_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_gettrendingtopics_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_gettrendingtopics_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getTaggedSuggestions"
  *)
module App_Bsky_Unspecced_GetTaggedSuggestions = struct
  (** def main *)
  type app_bsky_unspecced_gettaggedsuggestions_main_output = {
    suggestions: app_bsky_unspecced_gettaggedsuggestions_suggestion list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of suggestions (feeds and users) tagged with categories *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_gettaggedsuggestions_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_gettaggedsuggestions_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_gettaggedsuggestions_main_output}}) ~errors:No_errors

  (** def suggestion *)
  type nonrec suggestion = app_bsky_unspecced_gettaggedsuggestions_suggestion = {
    tag: string;
    subjectType: string;
    subject: string;
  }
  let pp_suggestion = pp_app_bsky_unspecced_gettaggedsuggestions_suggestion
  let suggestion_of_yojson = app_bsky_unspecced_gettaggedsuggestions_suggestion_of_yojson
  let suggestion_to_yojson = app_bsky_unspecced_gettaggedsuggestions_suggestion_to_yojson


end


(** lexicon "app.bsky.unspecced.getSuggestionsSkeleton"
  *)
module App_Bsky_Unspecced_GetSuggestionsSkeleton = struct
  (** def main *)
  type app_bsky_unspecced_getsuggestionsskeleton_main_params = {
    viewer: string option;
    limit: int64 option;
    cursor: string option;
    relativeToDid: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_getsuggestionsskeleton_main_output = {
    cursor: string option;
    actors: app_bsky_unspecced_defs_skeletonsearchactor list;
    relativeToDid: string option;
    recId: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a skeleton of suggested actors. Intended to be called and then hydrated through app.bsky.actor.getSuggestions *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_getsuggestionsskeleton_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestionsskeleton_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestionsskeleton_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_getsuggestionsskeleton_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestionsskeleton_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestionsskeleton_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedUsersSkeleton"
  *)
module App_Bsky_Unspecced_GetSuggestedUsersSkeleton = struct
  (** def main *)
  type app_bsky_unspecced_getsuggestedusersskeleton_main_params = {
    viewer: string option;
    category: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_getsuggestedusersskeleton_main_output = {
    dids: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a skeleton of suggested users. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedUsers *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_getsuggestedusersskeleton_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedusersskeleton_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedusersskeleton_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_getsuggestedusersskeleton_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedusersskeleton_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedusersskeleton_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedUsers"
  *)
module App_Bsky_Unspecced_GetSuggestedUsers = struct
  (** def main *)
  type app_bsky_unspecced_getsuggestedusers_main_params = {
    category: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_getsuggestedusers_main_output = {
    actors: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of suggested users *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_getsuggestedusers_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedusers_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedusers_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_getsuggestedusers_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedusers_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedusers_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedStarterPacksSkeleton"
  *)
module App_Bsky_Unspecced_GetSuggestedStarterPacksSkeleton = struct
  (** def main *)
  type app_bsky_unspecced_getsuggestedstarterpacksskeleton_main_params = {
    viewer: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_getsuggestedstarterpacksskeleton_main_output = {
    starterPacks: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a skeleton of suggested starterpacks. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedStarterpacks *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_getsuggestedstarterpacksskeleton_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedstarterpacksskeleton_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedstarterpacksskeleton_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_getsuggestedstarterpacksskeleton_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedstarterpacksskeleton_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedstarterpacksskeleton_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedStarterPacks"
  *)
module App_Bsky_Unspecced_GetSuggestedStarterPacks = struct
  (** def main *)
  type app_bsky_unspecced_getsuggestedstarterpacks_main_params = {
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_getsuggestedstarterpacks_main_output = {
    starterPacks: app_bsky_graph_defs_starterpackview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of suggested starterpacks *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_getsuggestedstarterpacks_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedstarterpacks_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedstarterpacks_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_getsuggestedstarterpacks_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedstarterpacks_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedstarterpacks_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedFeedsSkeleton"
  *)
module App_Bsky_Unspecced_GetSuggestedFeedsSkeleton = struct
  (** def main *)
  type app_bsky_unspecced_getsuggestedfeedsskeleton_main_params = {
    viewer: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_getsuggestedfeedsskeleton_main_output = {
    feeds: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a skeleton of suggested feeds. Intended to be called and hydrated by app.bsky.unspecced.getSuggestedFeeds *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_getsuggestedfeedsskeleton_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedfeedsskeleton_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedfeedsskeleton_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_getsuggestedfeedsskeleton_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedfeedsskeleton_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedfeedsskeleton_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getSuggestedFeeds"
  *)
module App_Bsky_Unspecced_GetSuggestedFeeds = struct
  (** def main *)
  type app_bsky_unspecced_getsuggestedfeeds_main_params = {
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_getsuggestedfeeds_main_output = {
    feeds: app_bsky_feed_defs_generatorview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of suggested feeds *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_getsuggestedfeeds_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedfeeds_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedfeeds_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_getsuggestedfeeds_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_getsuggestedfeeds_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_getsuggestedfeeds_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getPopularFeedGenerators"
  *)
module App_Bsky_Unspecced_GetPopularFeedGenerators = struct
  (** def main *)
  type app_bsky_unspecced_getpopularfeedgenerators_main_params = {
    limit: int64 option;
    cursor: string option;
    query: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_unspecced_getpopularfeedgenerators_main_output = {
    cursor: string option;
    feeds: app_bsky_feed_defs_generatorview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** An unspecced view of globally popular feed generators. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_unspecced_getpopularfeedgenerators_main_params_to_yojson;
    of_yojson=app_bsky_unspecced_getpopularfeedgenerators_main_params_of_yojson;
    pp=pp_app_bsky_unspecced_getpopularfeedgenerators_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_getpopularfeedgenerators_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_getpopularfeedgenerators_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_getpopularfeedgenerators_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.unspecced.getConfig"
  *)
module App_Bsky_Unspecced_GetConfig = struct
  (** def main *)
  type app_bsky_unspecced_getconfig_main_output = {
    checkEmailConfirmed: bool option;
    liveNow: app_bsky_unspecced_getconfig_livenowconfig list option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get miscellaneous runtime configuration. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_unspecced_getconfig_main_output_to_yojson;
    of_yojson=app_bsky_unspecced_getconfig_main_output_of_yojson;
    pp=pp_app_bsky_unspecced_getconfig_main_output}}) ~errors:No_errors

  (** def liveNowConfig *)
  type nonrec livenowconfig = app_bsky_unspecced_getconfig_livenowconfig = {
    did: string;
    domains: string list;
  }
  let pp_livenowconfig = pp_app_bsky_unspecced_getconfig_livenowconfig
  let livenowconfig_of_yojson = app_bsky_unspecced_getconfig_livenowconfig_of_yojson
  let livenowconfig_to_yojson = app_bsky_unspecced_getconfig_livenowconfig_to_yojson


end


(** lexicon "app.bsky.unspecced.defs"
  *)
module App_Bsky_Unspecced_Defs = struct
  (** def skeletonSearchPost *)
  type nonrec skeletonsearchpost = app_bsky_unspecced_defs_skeletonsearchpost = {
    uri: string;
  }
  let pp_skeletonsearchpost = pp_app_bsky_unspecced_defs_skeletonsearchpost
  let skeletonsearchpost_of_yojson = app_bsky_unspecced_defs_skeletonsearchpost_of_yojson
  let skeletonsearchpost_to_yojson = app_bsky_unspecced_defs_skeletonsearchpost_to_yojson


  (** def skeletonSearchActor *)
  type nonrec skeletonsearchactor = app_bsky_unspecced_defs_skeletonsearchactor = {
    did: string;
  }
  let pp_skeletonsearchactor = pp_app_bsky_unspecced_defs_skeletonsearchactor
  let skeletonsearchactor_of_yojson = app_bsky_unspecced_defs_skeletonsearchactor_of_yojson
  let skeletonsearchactor_to_yojson = app_bsky_unspecced_defs_skeletonsearchactor_to_yojson


  (** def skeletonSearchStarterPack *)
  type nonrec skeletonsearchstarterpack = app_bsky_unspecced_defs_skeletonsearchstarterpack = {
    uri: string;
  }
  let pp_skeletonsearchstarterpack = pp_app_bsky_unspecced_defs_skeletonsearchstarterpack
  let skeletonsearchstarterpack_of_yojson = app_bsky_unspecced_defs_skeletonsearchstarterpack_of_yojson
  let skeletonsearchstarterpack_to_yojson = app_bsky_unspecced_defs_skeletonsearchstarterpack_to_yojson


  (** def trendingTopic *)
  type nonrec trendingtopic = app_bsky_unspecced_defs_trendingtopic = {
    topic: string;
    displayName: string option;
    description: string option;
    link: string;
  }
  let pp_trendingtopic = pp_app_bsky_unspecced_defs_trendingtopic
  let trendingtopic_of_yojson = app_bsky_unspecced_defs_trendingtopic_of_yojson
  let trendingtopic_to_yojson = app_bsky_unspecced_defs_trendingtopic_to_yojson


  (** def skeletonTrend *)
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
  let skeletontrend_of_yojson = app_bsky_unspecced_defs_skeletontrend_of_yojson
  let skeletontrend_to_yojson = app_bsky_unspecced_defs_skeletontrend_to_yojson


  (** def trendView *)
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
  let trendview_of_yojson = app_bsky_unspecced_defs_trendview_of_yojson
  let trendview_to_yojson = app_bsky_unspecced_defs_trendview_to_yojson


end


(** lexicon "app.bsky.notification.updateSeen"
  *)
module App_Bsky_Notification_UpdateSeen = struct
  (** def main *)
  type app_bsky_notification_updateseen_main_input = {
    seenAt: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Notify server that the requesting account has seen notifications. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_notification_updateseen_main_input_to_yojson;
    of_yojson=app_bsky_notification_updateseen_main_input_of_yojson;
    pp=pp_app_bsky_notification_updateseen_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.notification.registerPush"
  *)
module App_Bsky_Notification_RegisterPush = struct
  (** def main *)
  type app_bsky_notification_registerpush_main_input = {
    serviceDid: string;
    token: string;
    platform: string;
    appId: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Register to receive push notifications, via a specified service, for the requesting account. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_notification_registerpush_main_input_to_yojson;
    of_yojson=app_bsky_notification_registerpush_main_input_of_yojson;
    pp=pp_app_bsky_notification_registerpush_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.notification.putPreferences"
  *)
module App_Bsky_Notification_PutPreferences = struct
  (** def main *)
  type app_bsky_notification_putpreferences_main_input = {
    priority: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Set notification-related preferences for an account. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_notification_putpreferences_main_input_to_yojson;
    of_yojson=app_bsky_notification_putpreferences_main_input_of_yojson;
    pp=pp_app_bsky_notification_putpreferences_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.notification.listNotifications"
  *)
module App_Bsky_Notification_ListNotifications = struct
  (** def main *)
  type app_bsky_notification_listnotifications_main_params = {
    reasons: string list option;
    limit: int64 option;
    priority: bool option;
    cursor: string option;
    seenAt: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_notification_listnotifications_main_output = {
    cursor: string option;
    notifications: app_bsky_notification_listnotifications_notification list;
    priority: bool option;
    seenAt: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerate notifications for the requesting account. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_notification_listnotifications_main_params_to_yojson;
    of_yojson=app_bsky_notification_listnotifications_main_params_of_yojson;
    pp=pp_app_bsky_notification_listnotifications_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_notification_listnotifications_main_output_to_yojson;
    of_yojson=app_bsky_notification_listnotifications_main_output_of_yojson;
    pp=pp_app_bsky_notification_listnotifications_main_output}}) ~errors:No_errors

  (** def notification *)
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
  let notification_of_yojson = app_bsky_notification_listnotifications_notification_of_yojson
  let notification_to_yojson = app_bsky_notification_listnotifications_notification_to_yojson


end


(** lexicon "app.bsky.notification.getUnreadCount"
  *)
module App_Bsky_Notification_GetUnreadCount = struct
  (** def main *)
  type app_bsky_notification_getunreadcount_main_params = {
    priority: bool option;
    seenAt: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_notification_getunreadcount_main_output = {
    count: int64;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Count the number of unread notifications for the requesting account. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_notification_getunreadcount_main_params_to_yojson;
    of_yojson=app_bsky_notification_getunreadcount_main_params_of_yojson;
    pp=pp_app_bsky_notification_getunreadcount_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_notification_getunreadcount_main_output_to_yojson;
    of_yojson=app_bsky_notification_getunreadcount_main_output_of_yojson;
    pp=pp_app_bsky_notification_getunreadcount_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.notification.defs"
  *)
module App_Bsky_Notification_Defs = struct
  (** def recordDeleted *)
  type nonrec recorddeleted = app_bsky_notification_defs_recorddeleted
  let pp_recorddeleted = pp_app_bsky_notification_defs_recorddeleted
  let recorddeleted_of_yojson = app_bsky_notification_defs_recorddeleted_of_yojson
  let recorddeleted_to_yojson = app_bsky_notification_defs_recorddeleted_to_yojson


end


(** lexicon "app.bsky.labeler.service"
  *)
module App_Bsky_Labeler_Service = struct
  (** def main *)
  (** A declaration of the existence of labeler service. *)
  type main = {
    policies: app_bsky_labeler_defs_labelerpolicies;
    labels: [
    | `Com_atproto_label_defs_selflabels of com_atproto_label_defs_selflabels
    | `Other of Value.t (** Non closed union *)
    ] option;
    createdAt: string;
    reasonTypes: com_atproto_moderation_defs_reasontype list option;
    subjectTypes: com_atproto_moderation_defs_subjecttype list option;
    subjectCollections: string list option;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.labeler.getServices"
  *)
module App_Bsky_Labeler_GetServices = struct
  (** def main *)
  type app_bsky_labeler_getservices_main_params = {
    dids: string list;
    detailed: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_labeler_getservices_main_output = {
    views: [
    | `App_bsky_labeler_defs_labelerview of app_bsky_labeler_defs_labelerview
    | `App_bsky_labeler_defs_labelerviewdetailed of app_bsky_labeler_defs_labelerviewdetailed
    | `Other of Value.t (** Non closed union *)
    ] list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get information about a list of labeler services. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_labeler_getservices_main_params_to_yojson;
    of_yojson=app_bsky_labeler_getservices_main_params_of_yojson;
    pp=pp_app_bsky_labeler_getservices_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_labeler_getservices_main_output_to_yojson;
    of_yojson=app_bsky_labeler_getservices_main_output_of_yojson;
    pp=pp_app_bsky_labeler_getservices_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.verification"
  *)
module App_Bsky_Graph_Verification = struct
  (** def main *)
  (** Record declaring a verification relationship between two accounts. Verifications are only considered valid by an app if issued by an account the app considers trusted. *)
  type main = {
    subject: string;
    handle: string;
    displayName: string;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.graph.unmuteThread"
  *)
module App_Bsky_Graph_UnmuteThread = struct
  (** def main *)
  type app_bsky_graph_unmutethread_main_input = {
    root: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Unmutes the specified thread. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_unmutethread_main_input_to_yojson;
    of_yojson=app_bsky_graph_unmutethread_main_input_of_yojson;
    pp=pp_app_bsky_graph_unmutethread_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.unmuteActorList"
  *)
module App_Bsky_Graph_UnmuteActorList = struct
  (** def main *)
  type app_bsky_graph_unmuteactorlist_main_input = {
    list: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Unmutes the specified list of accounts. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_unmuteactorlist_main_input_to_yojson;
    of_yojson=app_bsky_graph_unmuteactorlist_main_input_of_yojson;
    pp=pp_app_bsky_graph_unmuteactorlist_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.unmuteActor"
  *)
module App_Bsky_Graph_UnmuteActor = struct
  (** def main *)
  type app_bsky_graph_unmuteactor_main_input = {
    actor: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Unmutes the specified account. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_unmuteactor_main_input_to_yojson;
    of_yojson=app_bsky_graph_unmuteactor_main_input_of_yojson;
    pp=pp_app_bsky_graph_unmuteactor_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.starterpack"
  *)
module App_Bsky_Graph_Starterpack = struct
  (** def main *)
  (** Record defining a starter pack of actors and feeds for new users. *)
  type main = {
    name: string;
    description: string option;
    descriptionFacets: app_bsky_richtext_facet_main list option;
    list: string;
    feeds: app_bsky_graph_starterpack_feeditem list option;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



  (** def feedItem *)
  type nonrec feeditem = app_bsky_graph_starterpack_feeditem = {
    uri: string;
  }
  let pp_feeditem = pp_app_bsky_graph_starterpack_feeditem
  let feeditem_of_yojson = app_bsky_graph_starterpack_feeditem_of_yojson
  let feeditem_to_yojson = app_bsky_graph_starterpack_feeditem_to_yojson


end


(** lexicon "app.bsky.graph.searchStarterPacks"
  *)
module App_Bsky_Graph_SearchStarterPacks = struct
  (** def main *)
  type app_bsky_graph_searchstarterpacks_main_params = {
    q: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_searchstarterpacks_main_output = {
    cursor: string option;
    starterPacks: app_bsky_graph_defs_starterpackviewbasic list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Find starter packs matching search criteria. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_searchstarterpacks_main_params_to_yojson;
    of_yojson=app_bsky_graph_searchstarterpacks_main_params_of_yojson;
    pp=pp_app_bsky_graph_searchstarterpacks_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_searchstarterpacks_main_output_to_yojson;
    of_yojson=app_bsky_graph_searchstarterpacks_main_output_of_yojson;
    pp=pp_app_bsky_graph_searchstarterpacks_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.muteThread"
  *)
module App_Bsky_Graph_MuteThread = struct
  (** def main *)
  type app_bsky_graph_mutethread_main_input = {
    root: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Mutes a thread preventing notifications from the thread and any of its children. Mutes are private in Bluesky. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_mutethread_main_input_to_yojson;
    of_yojson=app_bsky_graph_mutethread_main_input_of_yojson;
    pp=pp_app_bsky_graph_mutethread_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.muteActorList"
  *)
module App_Bsky_Graph_MuteActorList = struct
  (** def main *)
  type app_bsky_graph_muteactorlist_main_input = {
    list: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Creates a mute relationship for the specified list of accounts. Mutes are private in Bluesky. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_muteactorlist_main_input_to_yojson;
    of_yojson=app_bsky_graph_muteactorlist_main_input_of_yojson;
    pp=pp_app_bsky_graph_muteactorlist_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.muteActor"
  *)
module App_Bsky_Graph_MuteActor = struct
  (** def main *)
  type app_bsky_graph_muteactor_main_input = {
    actor: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Creates a mute relationship for the specified account. Mutes are private in Bluesky. Requires auth. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_muteactor_main_input_to_yojson;
    of_yojson=app_bsky_graph_muteactor_main_input_of_yojson;
    pp=pp_app_bsky_graph_muteactor_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.graph.listitem"
  *)
module App_Bsky_Graph_Listitem = struct
  (** def main *)
  (** Record representing an account's inclusion on a specific list. The AppView will ignore duplicate listitem records. *)
  type main = {
    subject: string;
    list: string;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.graph.listblock"
  *)
module App_Bsky_Graph_Listblock = struct
  (** def main *)
  (** Record representing a block relationship against an entire an entire list of accounts (actors). *)
  type main = {
    subject: string;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.graph.list"
  *)
module App_Bsky_Graph_List = struct
  (** def main *)
  (** Record representing a list of accounts (actors). Scope includes both moderation-oriented lists and curration-oriented lists. *)
  type main = {
    purpose: app_bsky_graph_defs_listpurpose;
    name: string;
    description: string option;
    descriptionFacets: app_bsky_richtext_facet_main list option;
    avatar: Blob.t option;
    labels: [
    | `Com_atproto_label_defs_selflabels of com_atproto_label_defs_selflabels
    | `Other of Value.t (** Non closed union *)
    ] option;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.graph.getSuggestedFollowsByActor"
  *)
module App_Bsky_Graph_GetSuggestedFollowsByActor = struct
  (** def main *)
  type app_bsky_graph_getsuggestedfollowsbyactor_main_params = {
    actor: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getsuggestedfollowsbyactor_main_output = {
    suggestions: app_bsky_actor_defs_profileview list;
    isFallback: bool option;
    recId: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates follows similar to a given account (actor). Expected use is to recommend additional accounts immediately after following one account. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getsuggestedfollowsbyactor_main_params_to_yojson;
    of_yojson=app_bsky_graph_getsuggestedfollowsbyactor_main_params_of_yojson;
    pp=pp_app_bsky_graph_getsuggestedfollowsbyactor_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getsuggestedfollowsbyactor_main_output_to_yojson;
    of_yojson=app_bsky_graph_getsuggestedfollowsbyactor_main_output_of_yojson;
    pp=pp_app_bsky_graph_getsuggestedfollowsbyactor_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getStarterPacks"
  *)
module App_Bsky_Graph_GetStarterPacks = struct
  (** def main *)
  type app_bsky_graph_getstarterpacks_main_params = {
    uris: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getstarterpacks_main_output = {
    starterPacks: app_bsky_graph_defs_starterpackviewbasic list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get views for a list of starter packs. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getstarterpacks_main_params_to_yojson;
    of_yojson=app_bsky_graph_getstarterpacks_main_params_of_yojson;
    pp=pp_app_bsky_graph_getstarterpacks_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getstarterpacks_main_output_to_yojson;
    of_yojson=app_bsky_graph_getstarterpacks_main_output_of_yojson;
    pp=pp_app_bsky_graph_getstarterpacks_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getStarterPack"
  *)
module App_Bsky_Graph_GetStarterPack = struct
  (** def main *)
  type app_bsky_graph_getstarterpack_main_params = {
    starterPack: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getstarterpack_main_output = {
    starterPack: app_bsky_graph_defs_starterpackview;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Gets a view of a starter pack. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getstarterpack_main_params_to_yojson;
    of_yojson=app_bsky_graph_getstarterpack_main_params_of_yojson;
    pp=pp_app_bsky_graph_getstarterpack_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getstarterpack_main_output_to_yojson;
    of_yojson=app_bsky_graph_getstarterpack_main_output_of_yojson;
    pp=pp_app_bsky_graph_getstarterpack_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getRelationships"
  *)
module App_Bsky_Graph_GetRelationships = struct
  (** def main *)
  type app_bsky_graph_getrelationships_main_params = {
    actor: string;
    others: string list option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getrelationships_main_output = {
    actor: string option;
    relationships: [
    | `App_bsky_graph_defs_relationship of app_bsky_graph_defs_relationship
    | `App_bsky_graph_defs_notfoundactor of app_bsky_graph_defs_notfoundactor
    | `Other of Value.t (** Non closed union *)
    ] list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_graph_getrelationships_main_error = [ | `ActorNotFound ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates public relationships between one account, and a list of other accounts. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getrelationships_main_params_to_yojson;
    of_yojson=app_bsky_graph_getrelationships_main_params_of_yojson;
    pp=pp_app_bsky_graph_getrelationships_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getrelationships_main_output_to_yojson;
    of_yojson=app_bsky_graph_getrelationships_main_output_of_yojson;
    pp=pp_app_bsky_graph_getrelationships_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_graph_getrelationships_main_error})

end


(** lexicon "app.bsky.graph.getMutes"
  *)
module App_Bsky_Graph_GetMutes = struct
  (** def main *)
  type app_bsky_graph_getmutes_main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getmutes_main_output = {
    cursor: string option;
    mutes: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates accounts that the requesting account (actor) currently has muted. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getmutes_main_params_to_yojson;
    of_yojson=app_bsky_graph_getmutes_main_params_of_yojson;
    pp=pp_app_bsky_graph_getmutes_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getmutes_main_output_to_yojson;
    of_yojson=app_bsky_graph_getmutes_main_output_of_yojson;
    pp=pp_app_bsky_graph_getmutes_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getLists"
  *)
module App_Bsky_Graph_GetLists = struct
  (** def main *)
  type app_bsky_graph_getlists_main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getlists_main_output = {
    cursor: string option;
    lists: app_bsky_graph_defs_listview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates the lists created by a specified account (actor). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getlists_main_params_to_yojson;
    of_yojson=app_bsky_graph_getlists_main_params_of_yojson;
    pp=pp_app_bsky_graph_getlists_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getlists_main_output_to_yojson;
    of_yojson=app_bsky_graph_getlists_main_output_of_yojson;
    pp=pp_app_bsky_graph_getlists_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getListMutes"
  *)
module App_Bsky_Graph_GetListMutes = struct
  (** def main *)
  type app_bsky_graph_getlistmutes_main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getlistmutes_main_output = {
    cursor: string option;
    lists: app_bsky_graph_defs_listview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates mod lists that the requesting account (actor) currently has muted. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getlistmutes_main_params_to_yojson;
    of_yojson=app_bsky_graph_getlistmutes_main_params_of_yojson;
    pp=pp_app_bsky_graph_getlistmutes_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getlistmutes_main_output_to_yojson;
    of_yojson=app_bsky_graph_getlistmutes_main_output_of_yojson;
    pp=pp_app_bsky_graph_getlistmutes_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getListBlocks"
  *)
module App_Bsky_Graph_GetListBlocks = struct
  (** def main *)
  type app_bsky_graph_getlistblocks_main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getlistblocks_main_output = {
    cursor: string option;
    lists: app_bsky_graph_defs_listview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get mod lists that the requesting account (actor) is blocking. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getlistblocks_main_params_to_yojson;
    of_yojson=app_bsky_graph_getlistblocks_main_params_of_yojson;
    pp=pp_app_bsky_graph_getlistblocks_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getlistblocks_main_output_to_yojson;
    of_yojson=app_bsky_graph_getlistblocks_main_output_of_yojson;
    pp=pp_app_bsky_graph_getlistblocks_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getList"
  *)
module App_Bsky_Graph_GetList = struct
  (** def main *)
  type app_bsky_graph_getlist_main_params = {
    list: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getlist_main_output = {
    cursor: string option;
    list: app_bsky_graph_defs_listview;
    items: app_bsky_graph_defs_listitemview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Gets a 'view' (with additional context) of a specified list. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getlist_main_params_to_yojson;
    of_yojson=app_bsky_graph_getlist_main_params_of_yojson;
    pp=pp_app_bsky_graph_getlist_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getlist_main_output_to_yojson;
    of_yojson=app_bsky_graph_getlist_main_output_of_yojson;
    pp=pp_app_bsky_graph_getlist_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getKnownFollowers"
  *)
module App_Bsky_Graph_GetKnownFollowers = struct
  (** def main *)
  type app_bsky_graph_getknownfollowers_main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getknownfollowers_main_output = {
    subject: app_bsky_actor_defs_profileview;
    cursor: string option;
    followers: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates accounts which follow a specified account (actor) and are followed by the viewer. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getknownfollowers_main_params_to_yojson;
    of_yojson=app_bsky_graph_getknownfollowers_main_params_of_yojson;
    pp=pp_app_bsky_graph_getknownfollowers_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getknownfollowers_main_output_to_yojson;
    of_yojson=app_bsky_graph_getknownfollowers_main_output_of_yojson;
    pp=pp_app_bsky_graph_getknownfollowers_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getFollows"
  *)
module App_Bsky_Graph_GetFollows = struct
  (** def main *)
  type app_bsky_graph_getfollows_main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getfollows_main_output = {
    subject: app_bsky_actor_defs_profileview;
    cursor: string option;
    follows: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates accounts which a specified account (actor) follows. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getfollows_main_params_to_yojson;
    of_yojson=app_bsky_graph_getfollows_main_params_of_yojson;
    pp=pp_app_bsky_graph_getfollows_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getfollows_main_output_to_yojson;
    of_yojson=app_bsky_graph_getfollows_main_output_of_yojson;
    pp=pp_app_bsky_graph_getfollows_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getFollowers"
  *)
module App_Bsky_Graph_GetFollowers = struct
  (** def main *)
  type app_bsky_graph_getfollowers_main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getfollowers_main_output = {
    subject: app_bsky_actor_defs_profileview;
    cursor: string option;
    followers: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates accounts which follow a specified account (actor). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getfollowers_main_params_to_yojson;
    of_yojson=app_bsky_graph_getfollowers_main_params_of_yojson;
    pp=pp_app_bsky_graph_getfollowers_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getfollowers_main_output_to_yojson;
    of_yojson=app_bsky_graph_getfollowers_main_output_of_yojson;
    pp=pp_app_bsky_graph_getfollowers_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getBlocks"
  *)
module App_Bsky_Graph_GetBlocks = struct
  (** def main *)
  type app_bsky_graph_getblocks_main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getblocks_main_output = {
    cursor: string option;
    blocks: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Enumerates which accounts the requesting account is currently blocking. Requires auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getblocks_main_params_to_yojson;
    of_yojson=app_bsky_graph_getblocks_main_params_of_yojson;
    pp=pp_app_bsky_graph_getblocks_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getblocks_main_output_to_yojson;
    of_yojson=app_bsky_graph_getblocks_main_output_of_yojson;
    pp=pp_app_bsky_graph_getblocks_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.getActorStarterPacks"
  *)
module App_Bsky_Graph_GetActorStarterPacks = struct
  (** def main *)
  type app_bsky_graph_getactorstarterpacks_main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_graph_getactorstarterpacks_main_output = {
    cursor: string option;
    starterPacks: app_bsky_graph_defs_starterpackviewbasic list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of starter packs created by the actor. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_graph_getactorstarterpacks_main_params_to_yojson;
    of_yojson=app_bsky_graph_getactorstarterpacks_main_params_of_yojson;
    pp=pp_app_bsky_graph_getactorstarterpacks_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_graph_getactorstarterpacks_main_output_to_yojson;
    of_yojson=app_bsky_graph_getactorstarterpacks_main_output_of_yojson;
    pp=pp_app_bsky_graph_getactorstarterpacks_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.graph.follow"
  *)
module App_Bsky_Graph_Follow = struct
  (** def main *)
  (** Record declaring a social 'follow' relationship of another account. Duplicate follows will be ignored by the AppView. *)
  type main = {
    subject: string;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.graph.block"
  *)
module App_Bsky_Graph_Block = struct
  (** def main *)
  (** Record declaring a 'block' relationship against another account. NOTE: blocks are public in Bluesky; see blog posts for details. *)
  type main = {
    subject: string;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.feed.sendInteractions"
  *)
module App_Bsky_Feed_SendInteractions = struct
  (** def main *)
  type app_bsky_feed_sendinteractions_main_input = {
    interactions: app_bsky_feed_defs_interaction list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_feed_sendinteractions_main_output = [`_app_bsky_feed_sendinteractions_main_output]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Send information about interactions with feed items back to the feed generator that served them. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_sendinteractions_main_input_to_yojson;
    of_yojson=app_bsky_feed_sendinteractions_main_input_of_yojson;
    pp=pp_app_bsky_feed_sendinteractions_main_input}}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_sendinteractions_main_output_to_yojson;
    of_yojson=app_bsky_feed_sendinteractions_main_output_of_yojson;
    pp=pp_app_bsky_feed_sendinteractions_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.searchPosts"
  *)
module App_Bsky_Feed_SearchPosts = struct
  (** def main *)
  type app_bsky_feed_searchposts_main_params = {
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
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_searchposts_main_output = {
    cursor: string option;
    hitsTotal: int64 option;
    posts: app_bsky_feed_defs_postview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_feed_searchposts_main_error = [ | `BadQueryString ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Find posts matching search criteria, returning views of those posts. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_searchposts_main_params_to_yojson;
    of_yojson=app_bsky_feed_searchposts_main_params_of_yojson;
    pp=pp_app_bsky_feed_searchposts_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_searchposts_main_output_to_yojson;
    of_yojson=app_bsky_feed_searchposts_main_output_of_yojson;
    pp=pp_app_bsky_feed_searchposts_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_feed_searchposts_main_error})

end


(** lexicon "app.bsky.feed.repost"
  *)
module App_Bsky_Feed_Repost = struct
  (** def main *)
  (** Record representing a 'repost' of an existing Bluesky post. *)
  type main = {
    subject: com_atproto_repo_strongref_main;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.feed.post"
  *)
module App_Bsky_Feed_Post = struct
  (** def main *)
  (** Record containing a Bluesky post. *)
  type main = {
    text: string;
    entities: app_bsky_feed_post_entity list option;
    facets: app_bsky_richtext_facet_main list option;
    reply: app_bsky_feed_post_replyref option;
    embed: [
    | `App_bsky_embed_images_main of app_bsky_embed_images_main
    | `App_bsky_embed_video_main of app_bsky_embed_video_main
    | `App_bsky_embed_external_main of app_bsky_embed_external_main
    | `App_bsky_embed_record_main of app_bsky_embed_record_main
    | `App_bsky_embed_recordwithmedia_main of app_bsky_embed_recordwithmedia_main
    | `Other of Value.t (** Non closed union *)
    ] option;
    langs: string list option;
    labels: [
    | `Com_atproto_label_defs_selflabels of com_atproto_label_defs_selflabels
    | `Other of Value.t (** Non closed union *)
    ] option;
    tags: string list option;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



  (** def replyRef *)
  type nonrec replyref = app_bsky_feed_post_replyref = {
    root: com_atproto_repo_strongref_main;
    parent: com_atproto_repo_strongref_main;
  }
  let pp_replyref = pp_app_bsky_feed_post_replyref
  let replyref_of_yojson = app_bsky_feed_post_replyref_of_yojson
  let replyref_to_yojson = app_bsky_feed_post_replyref_to_yojson


  (** def entity *)
  type nonrec entity = app_bsky_feed_post_entity = {
    index: app_bsky_feed_post_textslice;
    type_: string; [@key "type"]
    value: string;
  }
  let pp_entity = pp_app_bsky_feed_post_entity
  let entity_of_yojson = app_bsky_feed_post_entity_of_yojson
  let entity_to_yojson = app_bsky_feed_post_entity_to_yojson


  (** def textSlice *)
  type nonrec textslice = app_bsky_feed_post_textslice = {
    start: int64;
    end_: int64; [@key "end"]
  }
  let pp_textslice = pp_app_bsky_feed_post_textslice
  let textslice_of_yojson = app_bsky_feed_post_textslice_of_yojson
  let textslice_to_yojson = app_bsky_feed_post_textslice_to_yojson


end


(** lexicon "app.bsky.feed.like"
  *)
module App_Bsky_Feed_Like = struct
  (** def main *)
  (** Record declaring a 'like' of a piece of subject content. *)
  type main = {
    subject: com_atproto_repo_strongref_main;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.feed.getTimeline"
  *)
module App_Bsky_Feed_GetTimeline = struct
  (** def main *)
  type app_bsky_feed_gettimeline_main_params = {
    algorithm: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_gettimeline_main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_feedviewpost list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a view of the requesting account's home timeline. This is expected to be some form of reverse-chronological feed. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_gettimeline_main_params_to_yojson;
    of_yojson=app_bsky_feed_gettimeline_main_params_of_yojson;
    pp=pp_app_bsky_feed_gettimeline_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_gettimeline_main_output_to_yojson;
    of_yojson=app_bsky_feed_gettimeline_main_output_of_yojson;
    pp=pp_app_bsky_feed_gettimeline_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getSuggestedFeeds"
  *)
module App_Bsky_Feed_GetSuggestedFeeds = struct
  (** def main *)
  type app_bsky_feed_getsuggestedfeeds_main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getsuggestedfeeds_main_output = {
    cursor: string option;
    feeds: app_bsky_feed_defs_generatorview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of suggested feeds (feed generators) for the requesting account. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getsuggestedfeeds_main_params_to_yojson;
    of_yojson=app_bsky_feed_getsuggestedfeeds_main_params_of_yojson;
    pp=pp_app_bsky_feed_getsuggestedfeeds_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getsuggestedfeeds_main_output_to_yojson;
    of_yojson=app_bsky_feed_getsuggestedfeeds_main_output_of_yojson;
    pp=pp_app_bsky_feed_getsuggestedfeeds_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getRepostedBy"
  *)
module App_Bsky_Feed_GetRepostedBy = struct
  (** def main *)
  type app_bsky_feed_getrepostedby_main_params = {
    uri: string;
    cid: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getrepostedby_main_output = {
    uri: string;
    cid: string option;
    cursor: string option;
    repostedBy: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of reposts for a given post. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getrepostedby_main_params_to_yojson;
    of_yojson=app_bsky_feed_getrepostedby_main_params_of_yojson;
    pp=pp_app_bsky_feed_getrepostedby_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getrepostedby_main_output_to_yojson;
    of_yojson=app_bsky_feed_getrepostedby_main_output_of_yojson;
    pp=pp_app_bsky_feed_getrepostedby_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getQuotes"
  *)
module App_Bsky_Feed_GetQuotes = struct
  (** def main *)
  type app_bsky_feed_getquotes_main_params = {
    uri: string;
    cid: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getquotes_main_output = {
    uri: string;
    cid: string option;
    cursor: string option;
    posts: app_bsky_feed_defs_postview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of quotes for a given post. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getquotes_main_params_to_yojson;
    of_yojson=app_bsky_feed_getquotes_main_params_of_yojson;
    pp=pp_app_bsky_feed_getquotes_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getquotes_main_output_to_yojson;
    of_yojson=app_bsky_feed_getquotes_main_output_of_yojson;
    pp=pp_app_bsky_feed_getquotes_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getPosts"
  *)
module App_Bsky_Feed_GetPosts = struct
  (** def main *)
  type app_bsky_feed_getposts_main_params = {
    uris: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getposts_main_output = {
    posts: app_bsky_feed_defs_postview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Gets post views for a specified list of posts (by AT-URI). This is sometimes referred to as 'hydrating' a 'feed skeleton'. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getposts_main_params_to_yojson;
    of_yojson=app_bsky_feed_getposts_main_params_of_yojson;
    pp=pp_app_bsky_feed_getposts_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getposts_main_output_to_yojson;
    of_yojson=app_bsky_feed_getposts_main_output_of_yojson;
    pp=pp_app_bsky_feed_getposts_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getPostThread"
  *)
module App_Bsky_Feed_GetPostThread = struct
  (** def main *)
  type app_bsky_feed_getpostthread_main_params = {
    uri: string;
    depth: int64 option;
    parentHeight: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getpostthread_main_output = {
    thread: [
    | `App_bsky_feed_defs_threadviewpost of app_bsky_feed_defs_threadviewpost
    | `App_bsky_feed_defs_notfoundpost of app_bsky_feed_defs_notfoundpost
    | `App_bsky_feed_defs_blockedpost of app_bsky_feed_defs_blockedpost
    | `Other of Value.t (** Non closed union *)
    ];
    threadgate: app_bsky_feed_defs_threadgateview option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_feed_getpostthread_main_error = [ | `NotFound ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get posts in a thread. Does not require auth, but additional metadata and filtering will be applied for authed requests. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getpostthread_main_params_to_yojson;
    of_yojson=app_bsky_feed_getpostthread_main_params_of_yojson;
    pp=pp_app_bsky_feed_getpostthread_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getpostthread_main_output_to_yojson;
    of_yojson=app_bsky_feed_getpostthread_main_output_of_yojson;
    pp=pp_app_bsky_feed_getpostthread_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_feed_getpostthread_main_error})

end


(** lexicon "app.bsky.feed.getListFeed"
  *)
module App_Bsky_Feed_GetListFeed = struct
  (** def main *)
  type app_bsky_feed_getlistfeed_main_params = {
    list: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getlistfeed_main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_feedviewpost list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_feed_getlistfeed_main_error = [ | `UnknownList ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a feed of recent posts from a list (posts and reposts from any actors on the list). Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getlistfeed_main_params_to_yojson;
    of_yojson=app_bsky_feed_getlistfeed_main_params_of_yojson;
    pp=pp_app_bsky_feed_getlistfeed_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getlistfeed_main_output_to_yojson;
    of_yojson=app_bsky_feed_getlistfeed_main_output_of_yojson;
    pp=pp_app_bsky_feed_getlistfeed_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_feed_getlistfeed_main_error})

end


(** lexicon "app.bsky.feed.getLikes"
  *)
module App_Bsky_Feed_GetLikes = struct
  (** def main *)
  type app_bsky_feed_getlikes_main_params = {
    uri: string;
    cid: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getlikes_main_output = {
    uri: string;
    cid: string option;
    cursor: string option;
    likes: app_bsky_feed_getlikes_like list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get like records which reference a subject (by AT-URI and CID). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getlikes_main_params_to_yojson;
    of_yojson=app_bsky_feed_getlikes_main_params_of_yojson;
    pp=pp_app_bsky_feed_getlikes_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getlikes_main_output_to_yojson;
    of_yojson=app_bsky_feed_getlikes_main_output_of_yojson;
    pp=pp_app_bsky_feed_getlikes_main_output}}) ~errors:No_errors

  (** def like *)
  type nonrec like = app_bsky_feed_getlikes_like = {
    indexedAt: string;
    createdAt: string;
    actor: app_bsky_actor_defs_profileview;
  }
  let pp_like = pp_app_bsky_feed_getlikes_like
  let like_of_yojson = app_bsky_feed_getlikes_like_of_yojson
  let like_to_yojson = app_bsky_feed_getlikes_like_to_yojson


end


(** lexicon "app.bsky.feed.getFeedSkeleton"
  *)
module App_Bsky_Feed_GetFeedSkeleton = struct
  (** def main *)
  type app_bsky_feed_getfeedskeleton_main_params = {
    feed: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getfeedskeleton_main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_skeletonfeedpost list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_feed_getfeedskeleton_main_error = [ | `UnknownFeed ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a skeleton of a feed provided by a feed generator. Auth is optional, depending on provider requirements, and provides the DID of the requester. Implemented by Feed Generator Service. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getfeedskeleton_main_params_to_yojson;
    of_yojson=app_bsky_feed_getfeedskeleton_main_params_of_yojson;
    pp=pp_app_bsky_feed_getfeedskeleton_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getfeedskeleton_main_output_to_yojson;
    of_yojson=app_bsky_feed_getfeedskeleton_main_output_of_yojson;
    pp=pp_app_bsky_feed_getfeedskeleton_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_feed_getfeedskeleton_main_error})

end


(** lexicon "app.bsky.feed.getFeedGenerators"
  *)
module App_Bsky_Feed_GetFeedGenerators = struct
  (** def main *)
  type app_bsky_feed_getfeedgenerators_main_params = {
    feeds: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getfeedgenerators_main_output = {
    feeds: app_bsky_feed_defs_generatorview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get information about a list of feed generators. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getfeedgenerators_main_params_to_yojson;
    of_yojson=app_bsky_feed_getfeedgenerators_main_params_of_yojson;
    pp=pp_app_bsky_feed_getfeedgenerators_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getfeedgenerators_main_output_to_yojson;
    of_yojson=app_bsky_feed_getfeedgenerators_main_output_of_yojson;
    pp=pp_app_bsky_feed_getfeedgenerators_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getFeedGenerator"
  *)
module App_Bsky_Feed_GetFeedGenerator = struct
  (** def main *)
  type app_bsky_feed_getfeedgenerator_main_params = {
    feed: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getfeedgenerator_main_output = {
    view: app_bsky_feed_defs_generatorview;
    isOnline: bool;
    isValid: bool;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get information about a feed generator. Implemented by AppView. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getfeedgenerator_main_params_to_yojson;
    of_yojson=app_bsky_feed_getfeedgenerator_main_params_of_yojson;
    pp=pp_app_bsky_feed_getfeedgenerator_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getfeedgenerator_main_output_to_yojson;
    of_yojson=app_bsky_feed_getfeedgenerator_main_output_of_yojson;
    pp=pp_app_bsky_feed_getfeedgenerator_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.getFeed"
  *)
module App_Bsky_Feed_GetFeed = struct
  (** def main *)
  type app_bsky_feed_getfeed_main_params = {
    feed: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getfeed_main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_feedviewpost list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_feed_getfeed_main_error = [ | `UnknownFeed ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a hydrated feed from an actor's selected feed generator. Implemented by App View. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getfeed_main_params_to_yojson;
    of_yojson=app_bsky_feed_getfeed_main_params_of_yojson;
    pp=pp_app_bsky_feed_getfeed_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getfeed_main_output_to_yojson;
    of_yojson=app_bsky_feed_getfeed_main_output_of_yojson;
    pp=pp_app_bsky_feed_getfeed_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_feed_getfeed_main_error})

end


(** lexicon "app.bsky.feed.getAuthorFeed"
  *)
module App_Bsky_Feed_GetAuthorFeed = struct
  (** def main *)
  type app_bsky_feed_getauthorfeed_main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
    filter: string option;
    includePins: bool option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getauthorfeed_main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_feedviewpost list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_feed_getauthorfeed_main_error = [ | `BlockedActor  | `BlockedByActor ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a view of an actor's 'author feed' (post and reposts by the author). Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getauthorfeed_main_params_to_yojson;
    of_yojson=app_bsky_feed_getauthorfeed_main_params_of_yojson;
    pp=pp_app_bsky_feed_getauthorfeed_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getauthorfeed_main_output_to_yojson;
    of_yojson=app_bsky_feed_getauthorfeed_main_output_of_yojson;
    pp=pp_app_bsky_feed_getauthorfeed_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_feed_getauthorfeed_main_error})

end


(** lexicon "app.bsky.feed.getActorLikes"
  *)
module App_Bsky_Feed_GetActorLikes = struct
  (** def main *)
  type app_bsky_feed_getactorlikes_main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getactorlikes_main_output = {
    cursor: string option;
    feed: app_bsky_feed_defs_feedviewpost list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  type app_bsky_feed_getactorlikes_main_error = [ | `BlockedActor  | `BlockedByActor ]
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of posts liked by an actor. Requires auth, actor must be the requesting account. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getactorlikes_main_params_to_yojson;
    of_yojson=app_bsky_feed_getactorlikes_main_params_of_yojson;
    pp=pp_app_bsky_feed_getactorlikes_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getactorlikes_main_output_to_yojson;
    of_yojson=app_bsky_feed_getactorlikes_main_output_of_yojson;
    pp=pp_app_bsky_feed_getactorlikes_main_output}}) 
    ~errors:(Errors {pp=pp_app_bsky_feed_getactorlikes_main_error})

end


(** lexicon "app.bsky.feed.getActorFeeds"
  *)
module App_Bsky_Feed_GetActorFeeds = struct
  (** def main *)
  type app_bsky_feed_getactorfeeds_main_params = {
    actor: string;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_feed_getactorfeeds_main_output = {
    cursor: string option;
    feeds: app_bsky_feed_defs_generatorview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of feeds (feed generator records) created by the actor (in the actor's repo). *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_feed_getactorfeeds_main_params_to_yojson;
    of_yojson=app_bsky_feed_getactorfeeds_main_params_of_yojson;
    pp=pp_app_bsky_feed_getactorfeeds_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_getactorfeeds_main_output_to_yojson;
    of_yojson=app_bsky_feed_getactorfeeds_main_output_of_yojson;
    pp=pp_app_bsky_feed_getactorfeeds_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.feed.generator"
  *)
module App_Bsky_Feed_Generator = struct
  (** def main *)
  (** Record declaring of the existence of a feed generator, and containing metadata about it. The record can exist in any repository. *)
  type main = {
    did: string;
    displayName: string;
    description: string option;
    descriptionFacets: app_bsky_richtext_facet_main list option;
    avatar: Blob.t option;
    acceptsInteractions: bool option;
    labels: [
    | `Com_atproto_label_defs_selflabels of com_atproto_label_defs_selflabels
    | `Other of Value.t (** Non closed union *)
    ] option;
    contentMode: string option;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.feed.describeFeedGenerator"
  *)
module App_Bsky_Feed_DescribeFeedGenerator = struct
  (** def main *)
  type app_bsky_feed_describefeedgenerator_main_output = {
    did: string;
    feeds: app_bsky_feed_describefeedgenerator_feed list;
    links: app_bsky_feed_describefeedgenerator_links option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get information about a feed generator, including policies and offered feed URIs. Does not require auth; implemented by Feed Generator services (not App View). *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_feed_describefeedgenerator_main_output_to_yojson;
    of_yojson=app_bsky_feed_describefeedgenerator_main_output_of_yojson;
    pp=pp_app_bsky_feed_describefeedgenerator_main_output}}) ~errors:No_errors

  (** def feed *)
  type nonrec feed = app_bsky_feed_describefeedgenerator_feed = {
    uri: string;
  }
  let pp_feed = pp_app_bsky_feed_describefeedgenerator_feed
  let feed_of_yojson = app_bsky_feed_describefeedgenerator_feed_of_yojson
  let feed_to_yojson = app_bsky_feed_describefeedgenerator_feed_to_yojson


  (** def links *)
  type nonrec links = app_bsky_feed_describefeedgenerator_links = {
    privacyPolicy: string option;
    termsOfService: string option;
  }
  let pp_links = pp_app_bsky_feed_describefeedgenerator_links
  let links_of_yojson = app_bsky_feed_describefeedgenerator_links_of_yojson
  let links_to_yojson = app_bsky_feed_describefeedgenerator_links_to_yojson


end


(** lexicon "app.bsky.actor.status"
  *)
module App_Bsky_Actor_Status = struct
  (** def main *)
  (** A declaration of a Bluesky account status. *)
  type main = {
    status: string;
    embed: [
    | `App_bsky_embed_external_main of app_bsky_embed_external_main
    | `Other of Value.t (** Non closed union *)
    ] option;
    durationMinutes: int64 option;
    createdAt: string;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



  (** def live *)
  type nonrec live = app_bsky_actor_status_live
  let pp_live = pp_app_bsky_actor_status_live
  let live_of_yojson = app_bsky_actor_status_live_of_yojson
  let live_to_yojson = app_bsky_actor_status_live_to_yojson


end


(** lexicon "app.bsky.actor.searchActorsTypeahead"
  *)
module App_Bsky_Actor_SearchActorsTypeahead = struct
  (** def main *)
  type app_bsky_actor_searchactorstypeahead_main_params = {
    term: string option;
    q: string option;
    limit: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_actor_searchactorstypeahead_main_output = {
    actors: app_bsky_actor_defs_profileviewbasic list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Find actor suggestions for a prefix search term. Expected use is for auto-completion during text field entry. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_actor_searchactorstypeahead_main_params_to_yojson;
    of_yojson=app_bsky_actor_searchactorstypeahead_main_params_of_yojson;
    pp=pp_app_bsky_actor_searchactorstypeahead_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_actor_searchactorstypeahead_main_output_to_yojson;
    of_yojson=app_bsky_actor_searchactorstypeahead_main_output_of_yojson;
    pp=pp_app_bsky_actor_searchactorstypeahead_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.searchActors"
  *)
module App_Bsky_Actor_SearchActors = struct
  (** def main *)
  type app_bsky_actor_searchactors_main_params = {
    term: string option;
    q: string option;
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_actor_searchactors_main_output = {
    cursor: string option;
    actors: app_bsky_actor_defs_profileview list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Find actors (profiles) matching search criteria. Does not require auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_actor_searchactors_main_params_to_yojson;
    of_yojson=app_bsky_actor_searchactors_main_params_of_yojson;
    pp=pp_app_bsky_actor_searchactors_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_actor_searchactors_main_output_to_yojson;
    of_yojson=app_bsky_actor_searchactors_main_output_of_yojson;
    pp=pp_app_bsky_actor_searchactors_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.putPreferences"
  *)
module App_Bsky_Actor_PutPreferences = struct
  (** def main *)
  type app_bsky_actor_putpreferences_main_input = {
    preferences: app_bsky_actor_defs_preferences;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Set the private preferences attached to the account. *)
  let main: _ Base.procedure = Base.make_procedure ~parameters:No_params 
    ~input:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_actor_putpreferences_main_input_to_yojson;
    of_yojson=app_bsky_actor_putpreferences_main_input_of_yojson;
    pp=pp_app_bsky_actor_putpreferences_main_input}}) ~output:No_io ~errors:No_errors

end


(** lexicon "app.bsky.actor.profile"
  *)
module App_Bsky_Actor_Profile = struct
  (** def main *)
  (** A declaration of a Bluesky account profile. *)
  type main = {
    displayName: string option;
    description: string option;
    avatar: Blob.t option;
    banner: Blob.t option;
    labels: [
    | `Com_atproto_label_defs_selflabels of com_atproto_label_defs_selflabels
    | `Other of Value.t (** Non closed union *)
    ] option;
    joinedViaStarterPack: com_atproto_repo_strongref_main option;
    pinnedPost: com_atproto_repo_strongref_main option;
    createdAt: string option;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



end


(** lexicon "app.bsky.actor.getSuggestions"
  *)
module App_Bsky_Actor_GetSuggestions = struct
  (** def main *)
  type app_bsky_actor_getsuggestions_main_params = {
    limit: int64 option;
    cursor: string option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_actor_getsuggestions_main_output = {
    cursor: string option;
    actors: app_bsky_actor_defs_profileview list;
    recId: int64 option;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get a list of suggested actors. Expected use is discovery of accounts to follow during new account onboarding. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_actor_getsuggestions_main_params_to_yojson;
    of_yojson=app_bsky_actor_getsuggestions_main_params_of_yojson;
    pp=pp_app_bsky_actor_getsuggestions_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_actor_getsuggestions_main_output_to_yojson;
    of_yojson=app_bsky_actor_getsuggestions_main_output_of_yojson;
    pp=pp_app_bsky_actor_getsuggestions_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.getProfiles"
  *)
module App_Bsky_Actor_GetProfiles = struct
  (** def main *)
  type app_bsky_actor_getprofiles_main_params = {
    actors: string list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_actor_getprofiles_main_output = {
    profiles: app_bsky_actor_defs_profileviewdetailed list;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get detailed profile views of multiple actors. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_actor_getprofiles_main_params_to_yojson;
    of_yojson=app_bsky_actor_getprofiles_main_params_of_yojson;
    pp=pp_app_bsky_actor_getprofiles_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_actor_getprofiles_main_output_to_yojson;
    of_yojson=app_bsky_actor_getprofiles_main_output_of_yojson;
    pp=pp_app_bsky_actor_getprofiles_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.getProfile"
  *)
module App_Bsky_Actor_GetProfile = struct
  (** def main *)
  type app_bsky_actor_getprofile_main_params = {
    actor: string;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}, make]

  type app_bsky_actor_getprofile_main_output = app_bsky_actor_defs_profileviewdetailed
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get detailed profile view of an actor. Does not require auth, but contains relevant metadata with auth. *)
  let main: _ Base.query = Base.make_query 
    ~parameters:(Params {
    to_yojson=app_bsky_actor_getprofile_main_params_to_yojson;
    of_yojson=app_bsky_actor_getprofile_main_params_of_yojson;
    pp=pp_app_bsky_actor_getprofile_main_params}) 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_actor_getprofile_main_output_to_yojson;
    of_yojson=app_bsky_actor_getprofile_main_output_of_yojson;
    pp=pp_app_bsky_actor_getprofile_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.getPreferences"
  *)
module App_Bsky_Actor_GetPreferences = struct
  (** def main *)
  type app_bsky_actor_getpreferences_main_output = {
    preferences: app_bsky_actor_defs_preferences;
  }
  [@@deriving show {with_path=false}, yojson {strict=false}]

  (** Get private preferences attached to the current account. Expected use is synchronization between multiple devices, and import/export during account migration. Requires auth. *)
  let main: _ Base.query = Base.make_query ~parameters:No_params 
    ~output:(IO_jsonable {encoding=Json; json={
    to_yojson=app_bsky_actor_getpreferences_main_output_to_yojson;
    of_yojson=app_bsky_actor_getpreferences_main_output_of_yojson;
    pp=pp_app_bsky_actor_getpreferences_main_output}}) ~errors:No_errors

end


(** lexicon "app.bsky.actor.defs"
  *)
module App_Bsky_Actor_Defs = struct
  (** def profileViewBasic *)
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
  let profileviewbasic_of_yojson = app_bsky_actor_defs_profileviewbasic_of_yojson
  let profileviewbasic_to_yojson = app_bsky_actor_defs_profileviewbasic_to_yojson


  (** def profileView *)
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
  let profileview_of_yojson = app_bsky_actor_defs_profileview_of_yojson
  let profileview_to_yojson = app_bsky_actor_defs_profileview_to_yojson


  (** def profileViewDetailed *)
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
  let profileviewdetailed_of_yojson = app_bsky_actor_defs_profileviewdetailed_of_yojson
  let profileviewdetailed_to_yojson = app_bsky_actor_defs_profileviewdetailed_to_yojson


  (** def profileAssociated *)
  type nonrec profileassociated = app_bsky_actor_defs_profileassociated = {
    lists: int64 option;
    feedgens: int64 option;
    starterPacks: int64 option;
    labeler: bool option;
    chat: app_bsky_actor_defs_profileassociatedchat option;
  }
  let pp_profileassociated = pp_app_bsky_actor_defs_profileassociated
  let profileassociated_of_yojson = app_bsky_actor_defs_profileassociated_of_yojson
  let profileassociated_to_yojson = app_bsky_actor_defs_profileassociated_to_yojson


  (** def profileAssociatedChat *)
  type nonrec profileassociatedchat = app_bsky_actor_defs_profileassociatedchat = {
    allowIncoming: string;
  }
  let pp_profileassociatedchat = pp_app_bsky_actor_defs_profileassociatedchat
  let profileassociatedchat_of_yojson = app_bsky_actor_defs_profileassociatedchat_of_yojson
  let profileassociatedchat_to_yojson = app_bsky_actor_defs_profileassociatedchat_to_yojson


  (** def viewerState *)
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
  let viewerstate_of_yojson = app_bsky_actor_defs_viewerstate_of_yojson
  let viewerstate_to_yojson = app_bsky_actor_defs_viewerstate_to_yojson


  (** def knownFollowers *)
  type nonrec knownfollowers = app_bsky_actor_defs_knownfollowers = {
    count: int64;
    followers: app_bsky_actor_defs_profileviewbasic list;
  }
  let pp_knownfollowers = pp_app_bsky_actor_defs_knownfollowers
  let knownfollowers_of_yojson = app_bsky_actor_defs_knownfollowers_of_yojson
  let knownfollowers_to_yojson = app_bsky_actor_defs_knownfollowers_to_yojson


  (** def verificationState *)
  type nonrec verificationstate = app_bsky_actor_defs_verificationstate = {
    verifications: app_bsky_actor_defs_verificationview list;
    verifiedStatus: string;
    trustedVerifierStatus: string;
  }
  let pp_verificationstate = pp_app_bsky_actor_defs_verificationstate
  let verificationstate_of_yojson = app_bsky_actor_defs_verificationstate_of_yojson
  let verificationstate_to_yojson = app_bsky_actor_defs_verificationstate_to_yojson


  (** def verificationView *)
  type nonrec verificationview = app_bsky_actor_defs_verificationview = {
    issuer: string;
    uri: string;
    isValid: bool;
    createdAt: string;
  }
  let pp_verificationview = pp_app_bsky_actor_defs_verificationview
  let verificationview_of_yojson = app_bsky_actor_defs_verificationview_of_yojson
  let verificationview_to_yojson = app_bsky_actor_defs_verificationview_to_yojson


  (** def preferences *)
  type nonrec preferences = app_bsky_actor_defs_preferences
  let pp_preferences = pp_app_bsky_actor_defs_preferences
  let preferences_of_yojson = app_bsky_actor_defs_preferences_of_yojson
  let preferences_to_yojson = app_bsky_actor_defs_preferences_to_yojson


  (** def adultContentPref *)
  type nonrec adultcontentpref = app_bsky_actor_defs_adultcontentpref = {
    enabled: bool;
  }
  let pp_adultcontentpref = pp_app_bsky_actor_defs_adultcontentpref
  let adultcontentpref_of_yojson = app_bsky_actor_defs_adultcontentpref_of_yojson
  let adultcontentpref_to_yojson = app_bsky_actor_defs_adultcontentpref_to_yojson


  (** def contentLabelPref *)
  type nonrec contentlabelpref = app_bsky_actor_defs_contentlabelpref = {
    labelerDid: string option;
    label: string;
    visibility: string;
  }
  let pp_contentlabelpref = pp_app_bsky_actor_defs_contentlabelpref
  let contentlabelpref_of_yojson = app_bsky_actor_defs_contentlabelpref_of_yojson
  let contentlabelpref_to_yojson = app_bsky_actor_defs_contentlabelpref_to_yojson


  (** def savedFeed *)
  type nonrec savedfeed = app_bsky_actor_defs_savedfeed = {
    id: string;
    type_: string; [@key "type"]
    value: string;
    pinned: bool;
  }
  let pp_savedfeed = pp_app_bsky_actor_defs_savedfeed
  let savedfeed_of_yojson = app_bsky_actor_defs_savedfeed_of_yojson
  let savedfeed_to_yojson = app_bsky_actor_defs_savedfeed_to_yojson


  (** def savedFeedsPrefV2 *)
  type nonrec savedfeedsprefv2 = app_bsky_actor_defs_savedfeedsprefv2 = {
    items: app_bsky_actor_defs_savedfeed list;
  }
  let pp_savedfeedsprefv2 = pp_app_bsky_actor_defs_savedfeedsprefv2
  let savedfeedsprefv2_of_yojson = app_bsky_actor_defs_savedfeedsprefv2_of_yojson
  let savedfeedsprefv2_to_yojson = app_bsky_actor_defs_savedfeedsprefv2_to_yojson


  (** def savedFeedsPref *)
  type nonrec savedfeedspref = app_bsky_actor_defs_savedfeedspref = {
    pinned: string list;
    saved: string list;
    timelineIndex: int64 option;
  }
  let pp_savedfeedspref = pp_app_bsky_actor_defs_savedfeedspref
  let savedfeedspref_of_yojson = app_bsky_actor_defs_savedfeedspref_of_yojson
  let savedfeedspref_to_yojson = app_bsky_actor_defs_savedfeedspref_to_yojson


  (** def personalDetailsPref *)
  type nonrec personaldetailspref = app_bsky_actor_defs_personaldetailspref = {
    birthDate: string option;
  }
  let pp_personaldetailspref = pp_app_bsky_actor_defs_personaldetailspref
  let personaldetailspref_of_yojson = app_bsky_actor_defs_personaldetailspref_of_yojson
  let personaldetailspref_to_yojson = app_bsky_actor_defs_personaldetailspref_to_yojson


  (** def feedViewPref *)
  type nonrec feedviewpref = app_bsky_actor_defs_feedviewpref = {
    feed: string;
    hideReplies: bool option;
    hideRepliesByUnfollowed: bool option;
    hideRepliesByLikeCount: int64 option;
    hideReposts: bool option;
    hideQuotePosts: bool option;
  }
  let pp_feedviewpref = pp_app_bsky_actor_defs_feedviewpref
  let feedviewpref_of_yojson = app_bsky_actor_defs_feedviewpref_of_yojson
  let feedviewpref_to_yojson = app_bsky_actor_defs_feedviewpref_to_yojson


  (** def threadViewPref *)
  type nonrec threadviewpref = app_bsky_actor_defs_threadviewpref = {
    sort: string option;
    prioritizeFollowedUsers: bool option;
  }
  let pp_threadviewpref = pp_app_bsky_actor_defs_threadviewpref
  let threadviewpref_of_yojson = app_bsky_actor_defs_threadviewpref_of_yojson
  let threadviewpref_to_yojson = app_bsky_actor_defs_threadviewpref_to_yojson


  (** def interestsPref *)
  type nonrec interestspref = app_bsky_actor_defs_interestspref = {
    tags: string list;
  }
  let pp_interestspref = pp_app_bsky_actor_defs_interestspref
  let interestspref_of_yojson = app_bsky_actor_defs_interestspref_of_yojson
  let interestspref_to_yojson = app_bsky_actor_defs_interestspref_to_yojson


  (** def mutedWordTarget *)
  type nonrec mutedwordtarget = app_bsky_actor_defs_mutedwordtarget
  let pp_mutedwordtarget = pp_app_bsky_actor_defs_mutedwordtarget
  let mutedwordtarget_of_yojson = app_bsky_actor_defs_mutedwordtarget_of_yojson
  let mutedwordtarget_to_yojson = app_bsky_actor_defs_mutedwordtarget_to_yojson


  (** def mutedWord *)
  type nonrec mutedword = app_bsky_actor_defs_mutedword = {
    id: string option;
    value: string;
    targets: app_bsky_actor_defs_mutedwordtarget list;
    actorTarget: string option;
    expiresAt: string option;
  }
  let pp_mutedword = pp_app_bsky_actor_defs_mutedword
  let mutedword_of_yojson = app_bsky_actor_defs_mutedword_of_yojson
  let mutedword_to_yojson = app_bsky_actor_defs_mutedword_to_yojson


  (** def mutedWordsPref *)
  type nonrec mutedwordspref = app_bsky_actor_defs_mutedwordspref = {
    items: app_bsky_actor_defs_mutedword list;
  }
  let pp_mutedwordspref = pp_app_bsky_actor_defs_mutedwordspref
  let mutedwordspref_of_yojson = app_bsky_actor_defs_mutedwordspref_of_yojson
  let mutedwordspref_to_yojson = app_bsky_actor_defs_mutedwordspref_to_yojson


  (** def hiddenPostsPref *)
  type nonrec hiddenpostspref = app_bsky_actor_defs_hiddenpostspref = {
    items: string list;
  }
  let pp_hiddenpostspref = pp_app_bsky_actor_defs_hiddenpostspref
  let hiddenpostspref_of_yojson = app_bsky_actor_defs_hiddenpostspref_of_yojson
  let hiddenpostspref_to_yojson = app_bsky_actor_defs_hiddenpostspref_to_yojson


  (** def labelersPref *)
  type nonrec labelerspref = app_bsky_actor_defs_labelerspref = {
    labelers: app_bsky_actor_defs_labelerprefitem list;
  }
  let pp_labelerspref = pp_app_bsky_actor_defs_labelerspref
  let labelerspref_of_yojson = app_bsky_actor_defs_labelerspref_of_yojson
  let labelerspref_to_yojson = app_bsky_actor_defs_labelerspref_to_yojson


  (** def labelerPrefItem *)
  type nonrec labelerprefitem = app_bsky_actor_defs_labelerprefitem = {
    did: string;
  }
  let pp_labelerprefitem = pp_app_bsky_actor_defs_labelerprefitem
  let labelerprefitem_of_yojson = app_bsky_actor_defs_labelerprefitem_of_yojson
  let labelerprefitem_to_yojson = app_bsky_actor_defs_labelerprefitem_to_yojson


  (** def bskyAppStatePref *)
  type nonrec bskyappstatepref = app_bsky_actor_defs_bskyappstatepref = {
    activeProgressGuide: app_bsky_actor_defs_bskyappprogressguide option;
    queuedNudges: string list option;
    nuxs: app_bsky_actor_defs_nux list option;
  }
  let pp_bskyappstatepref = pp_app_bsky_actor_defs_bskyappstatepref
  let bskyappstatepref_of_yojson = app_bsky_actor_defs_bskyappstatepref_of_yojson
  let bskyappstatepref_to_yojson = app_bsky_actor_defs_bskyappstatepref_to_yojson


  (** def bskyAppProgressGuide *)
  type nonrec bskyappprogressguide = app_bsky_actor_defs_bskyappprogressguide = {
    guide: string;
  }
  let pp_bskyappprogressguide = pp_app_bsky_actor_defs_bskyappprogressguide
  let bskyappprogressguide_of_yojson = app_bsky_actor_defs_bskyappprogressguide_of_yojson
  let bskyappprogressguide_to_yojson = app_bsky_actor_defs_bskyappprogressguide_to_yojson


  (** def nux *)
  type nonrec nux = app_bsky_actor_defs_nux = {
    id: string;
    completed: bool;
    data: string option;
    expiresAt: string option;
  }
  let pp_nux = pp_app_bsky_actor_defs_nux
  let nux_of_yojson = app_bsky_actor_defs_nux_of_yojson
  let nux_to_yojson = app_bsky_actor_defs_nux_to_yojson


  (** def verificationPrefs *)
  type nonrec verificationprefs = app_bsky_actor_defs_verificationprefs = {
    hideBadges: bool option;
  }
  let pp_verificationprefs = pp_app_bsky_actor_defs_verificationprefs
  let verificationprefs_of_yojson = app_bsky_actor_defs_verificationprefs_of_yojson
  let verificationprefs_to_yojson = app_bsky_actor_defs_verificationprefs_to_yojson


  (** def postInteractionSettingsPref *)
  type nonrec postinteractionsettingspref = app_bsky_actor_defs_postinteractionsettingspref = {
    threadgateAllowRules: [
    | `App_bsky_feed_threadgate_mentionrule of app_bsky_feed_threadgate_mentionrule
    | `App_bsky_feed_threadgate_followerrule of app_bsky_feed_threadgate_followerrule
    | `App_bsky_feed_threadgate_followingrule of app_bsky_feed_threadgate_followingrule
    | `App_bsky_feed_threadgate_listrule of app_bsky_feed_threadgate_listrule
    | `Other of Value.t (** Non closed union *)
    ] list option;
    postgateEmbeddingRules: [
    | `App_bsky_feed_postgate_disablerule of app_bsky_feed_postgate_disablerule
    | `Other of Value.t (** Non closed union *)
    ] list option;
  }
  let pp_postinteractionsettingspref = pp_app_bsky_actor_defs_postinteractionsettingspref
  let postinteractionsettingspref_of_yojson = app_bsky_actor_defs_postinteractionsettingspref_of_yojson
  let postinteractionsettingspref_to_yojson = app_bsky_actor_defs_postinteractionsettingspref_to_yojson


  (** def statusView *)
  type nonrec statusview = app_bsky_actor_defs_statusview = {
    status: string;
    record: Value.t (* unknown *);
    embed: [
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `Other of Value.t (** Non closed union *)
    ] option;
    expiresAt: string option;
    isActive: bool option;
  }
  let pp_statusview = pp_app_bsky_actor_defs_statusview
  let statusview_of_yojson = app_bsky_actor_defs_statusview_of_yojson
  let statusview_to_yojson = app_bsky_actor_defs_statusview_to_yojson


end


(** lexicon "app.bsky.graph.defs"
  *)
module App_Bsky_Graph_Defs = struct
  (** def listViewBasic *)
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
  let listviewbasic_of_yojson = app_bsky_graph_defs_listviewbasic_of_yojson
  let listviewbasic_to_yojson = app_bsky_graph_defs_listviewbasic_to_yojson


  (** def listView *)
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
  let listview_of_yojson = app_bsky_graph_defs_listview_of_yojson
  let listview_to_yojson = app_bsky_graph_defs_listview_to_yojson


  (** def listItemView *)
  type nonrec listitemview = app_bsky_graph_defs_listitemview = {
    uri: string;
    subject: app_bsky_actor_defs_profileview;
  }
  let pp_listitemview = pp_app_bsky_graph_defs_listitemview
  let listitemview_of_yojson = app_bsky_graph_defs_listitemview_of_yojson
  let listitemview_to_yojson = app_bsky_graph_defs_listitemview_to_yojson


  (** def starterPackView *)
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
  let starterpackview_of_yojson = app_bsky_graph_defs_starterpackview_of_yojson
  let starterpackview_to_yojson = app_bsky_graph_defs_starterpackview_to_yojson


  (** def starterPackViewBasic *)
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
  let starterpackviewbasic_of_yojson = app_bsky_graph_defs_starterpackviewbasic_of_yojson
  let starterpackviewbasic_to_yojson = app_bsky_graph_defs_starterpackviewbasic_to_yojson


  (** def listPurpose *)
  type nonrec listpurpose = app_bsky_graph_defs_listpurpose
  let pp_listpurpose = pp_app_bsky_graph_defs_listpurpose
  let listpurpose_of_yojson = app_bsky_graph_defs_listpurpose_of_yojson
  let listpurpose_to_yojson = app_bsky_graph_defs_listpurpose_to_yojson


  (** def modlist *)
  type nonrec modlist = app_bsky_graph_defs_modlist
  let pp_modlist = pp_app_bsky_graph_defs_modlist
  let modlist_of_yojson = app_bsky_graph_defs_modlist_of_yojson
  let modlist_to_yojson = app_bsky_graph_defs_modlist_to_yojson


  (** def curatelist *)
  type nonrec curatelist = app_bsky_graph_defs_curatelist
  let pp_curatelist = pp_app_bsky_graph_defs_curatelist
  let curatelist_of_yojson = app_bsky_graph_defs_curatelist_of_yojson
  let curatelist_to_yojson = app_bsky_graph_defs_curatelist_to_yojson


  (** def referencelist *)
  type nonrec referencelist = app_bsky_graph_defs_referencelist
  let pp_referencelist = pp_app_bsky_graph_defs_referencelist
  let referencelist_of_yojson = app_bsky_graph_defs_referencelist_of_yojson
  let referencelist_to_yojson = app_bsky_graph_defs_referencelist_to_yojson


  (** def listViewerState *)
  type nonrec listviewerstate = app_bsky_graph_defs_listviewerstate = {
    muted: bool option;
    blocked: string option;
  }
  let pp_listviewerstate = pp_app_bsky_graph_defs_listviewerstate
  let listviewerstate_of_yojson = app_bsky_graph_defs_listviewerstate_of_yojson
  let listviewerstate_to_yojson = app_bsky_graph_defs_listviewerstate_to_yojson


  (** def notFoundActor *)
  type nonrec notfoundactor = app_bsky_graph_defs_notfoundactor = {
    actor: string;
    notFound: bool;
  }
  let pp_notfoundactor = pp_app_bsky_graph_defs_notfoundactor
  let notfoundactor_of_yojson = app_bsky_graph_defs_notfoundactor_of_yojson
  let notfoundactor_to_yojson = app_bsky_graph_defs_notfoundactor_to_yojson


  (** def relationship *)
  type nonrec relationship = app_bsky_graph_defs_relationship = {
    did: string;
    following: string option;
    followedBy: string option;
  }
  let pp_relationship = pp_app_bsky_graph_defs_relationship
  let relationship_of_yojson = app_bsky_graph_defs_relationship_of_yojson
  let relationship_to_yojson = app_bsky_graph_defs_relationship_to_yojson


end


(** lexicon "app.bsky.feed.defs"
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
  let postview_of_yojson = app_bsky_feed_defs_postview_of_yojson
  let postview_to_yojson = app_bsky_feed_defs_postview_to_yojson


  (** def viewerState *)
  type nonrec viewerstate = app_bsky_feed_defs_viewerstate = {
    repost: string option;
    like: string option;
    threadMuted: bool option;
    replyDisabled: bool option;
    embeddingDisabled: bool option;
    pinned: bool option;
  }
  let pp_viewerstate = pp_app_bsky_feed_defs_viewerstate
  let viewerstate_of_yojson = app_bsky_feed_defs_viewerstate_of_yojson
  let viewerstate_to_yojson = app_bsky_feed_defs_viewerstate_to_yojson


  (** def threadContext *)
  type nonrec threadcontext = app_bsky_feed_defs_threadcontext = {
    rootAuthorLike: string option;
  }
  let pp_threadcontext = pp_app_bsky_feed_defs_threadcontext
  let threadcontext_of_yojson = app_bsky_feed_defs_threadcontext_of_yojson
  let threadcontext_to_yojson = app_bsky_feed_defs_threadcontext_to_yojson


  (** def feedViewPost *)
  type nonrec feedviewpost = app_bsky_feed_defs_feedviewpost = {
    post: app_bsky_feed_defs_postview;
    reply: app_bsky_feed_defs_replyref option;
    reason: [
    | `App_bsky_feed_defs_reasonrepost of app_bsky_feed_defs_reasonrepost
    | `App_bsky_feed_defs_reasonpin of app_bsky_feed_defs_reasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedContext: string option;
  }
  let pp_feedviewpost = pp_app_bsky_feed_defs_feedviewpost
  let feedviewpost_of_yojson = app_bsky_feed_defs_feedviewpost_of_yojson
  let feedviewpost_to_yojson = app_bsky_feed_defs_feedviewpost_to_yojson


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
    grandparentAuthor: app_bsky_actor_defs_profileviewbasic option;
  }
  let pp_replyref = pp_app_bsky_feed_defs_replyref
  let replyref_of_yojson = app_bsky_feed_defs_replyref_of_yojson
  let replyref_to_yojson = app_bsky_feed_defs_replyref_to_yojson


  (** def reasonRepost *)
  type nonrec reasonrepost = app_bsky_feed_defs_reasonrepost = {
    by: app_bsky_actor_defs_profileviewbasic;
    indexedAt: string;
  }
  let pp_reasonrepost = pp_app_bsky_feed_defs_reasonrepost
  let reasonrepost_of_yojson = app_bsky_feed_defs_reasonrepost_of_yojson
  let reasonrepost_to_yojson = app_bsky_feed_defs_reasonrepost_to_yojson


  (** def reasonPin *)
  type nonrec reasonpin = app_bsky_feed_defs_reasonpin
  let pp_reasonpin = pp_app_bsky_feed_defs_reasonpin
  let reasonpin_of_yojson = app_bsky_feed_defs_reasonpin_of_yojson
  let reasonpin_to_yojson = app_bsky_feed_defs_reasonpin_to_yojson


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
    threadContext: app_bsky_feed_defs_threadcontext option;
  }
  let pp_threadviewpost = pp_app_bsky_feed_defs_threadviewpost
  let threadviewpost_of_yojson = app_bsky_feed_defs_threadviewpost_of_yojson
  let threadviewpost_to_yojson = app_bsky_feed_defs_threadviewpost_to_yojson


  (** def notFoundPost *)
  type nonrec notfoundpost = app_bsky_feed_defs_notfoundpost = {
    uri: string;
    notFound: bool;
  }
  let pp_notfoundpost = pp_app_bsky_feed_defs_notfoundpost
  let notfoundpost_of_yojson = app_bsky_feed_defs_notfoundpost_of_yojson
  let notfoundpost_to_yojson = app_bsky_feed_defs_notfoundpost_to_yojson


  (** def blockedPost *)
  type nonrec blockedpost = app_bsky_feed_defs_blockedpost = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }
  let pp_blockedpost = pp_app_bsky_feed_defs_blockedpost
  let blockedpost_of_yojson = app_bsky_feed_defs_blockedpost_of_yojson
  let blockedpost_to_yojson = app_bsky_feed_defs_blockedpost_to_yojson


  (** def blockedAuthor *)
  type nonrec blockedauthor = app_bsky_feed_defs_blockedauthor = {
    did: string;
    viewer: app_bsky_actor_defs_viewerstate option;
  }
  let pp_blockedauthor = pp_app_bsky_feed_defs_blockedauthor
  let blockedauthor_of_yojson = app_bsky_feed_defs_blockedauthor_of_yojson
  let blockedauthor_to_yojson = app_bsky_feed_defs_blockedauthor_to_yojson


  (** def generatorView *)
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
  let generatorview_of_yojson = app_bsky_feed_defs_generatorview_of_yojson
  let generatorview_to_yojson = app_bsky_feed_defs_generatorview_to_yojson


  (** def generatorViewerState *)
  type nonrec generatorviewerstate = app_bsky_feed_defs_generatorviewerstate = {
    like: string option;
  }
  let pp_generatorviewerstate = pp_app_bsky_feed_defs_generatorviewerstate
  let generatorviewerstate_of_yojson = app_bsky_feed_defs_generatorviewerstate_of_yojson
  let generatorviewerstate_to_yojson = app_bsky_feed_defs_generatorviewerstate_to_yojson


  (** def skeletonFeedPost *)
  type nonrec skeletonfeedpost = app_bsky_feed_defs_skeletonfeedpost = {
    post: string;
    reason: [
    | `App_bsky_feed_defs_skeletonreasonrepost of app_bsky_feed_defs_skeletonreasonrepost
    | `App_bsky_feed_defs_skeletonreasonpin of app_bsky_feed_defs_skeletonreasonpin
    | `Other of Value.t (** Non closed union *)
    ] option;
    feedContext: string option;
  }
  let pp_skeletonfeedpost = pp_app_bsky_feed_defs_skeletonfeedpost
  let skeletonfeedpost_of_yojson = app_bsky_feed_defs_skeletonfeedpost_of_yojson
  let skeletonfeedpost_to_yojson = app_bsky_feed_defs_skeletonfeedpost_to_yojson


  (** def skeletonReasonRepost *)
  type nonrec skeletonreasonrepost = app_bsky_feed_defs_skeletonreasonrepost = {
    repost: string;
  }
  let pp_skeletonreasonrepost = pp_app_bsky_feed_defs_skeletonreasonrepost
  let skeletonreasonrepost_of_yojson = app_bsky_feed_defs_skeletonreasonrepost_of_yojson
  let skeletonreasonrepost_to_yojson = app_bsky_feed_defs_skeletonreasonrepost_to_yojson


  (** def skeletonReasonPin *)
  type nonrec skeletonreasonpin = app_bsky_feed_defs_skeletonreasonpin
  let pp_skeletonreasonpin = pp_app_bsky_feed_defs_skeletonreasonpin
  let skeletonreasonpin_of_yojson = app_bsky_feed_defs_skeletonreasonpin_of_yojson
  let skeletonreasonpin_to_yojson = app_bsky_feed_defs_skeletonreasonpin_to_yojson


  (** def threadgateView *)
  type nonrec threadgateview = app_bsky_feed_defs_threadgateview = {
    uri: string option;
    cid: string option;
    record: Value.t (* unknown *) option;
    lists: app_bsky_graph_defs_listviewbasic list option;
  }
  let pp_threadgateview = pp_app_bsky_feed_defs_threadgateview
  let threadgateview_of_yojson = app_bsky_feed_defs_threadgateview_of_yojson
  let threadgateview_to_yojson = app_bsky_feed_defs_threadgateview_to_yojson


  (** def interaction *)
  type nonrec interaction = app_bsky_feed_defs_interaction = {
    item: string option;
    event: string option;
    feedContext: string option;
  }
  let pp_interaction = pp_app_bsky_feed_defs_interaction
  let interaction_of_yojson = app_bsky_feed_defs_interaction_of_yojson
  let interaction_to_yojson = app_bsky_feed_defs_interaction_to_yojson


  (** def requestLess *)
  type nonrec requestless = app_bsky_feed_defs_requestless
  let pp_requestless = pp_app_bsky_feed_defs_requestless
  let requestless_of_yojson = app_bsky_feed_defs_requestless_of_yojson
  let requestless_to_yojson = app_bsky_feed_defs_requestless_to_yojson


  (** def requestMore *)
  type nonrec requestmore = app_bsky_feed_defs_requestmore
  let pp_requestmore = pp_app_bsky_feed_defs_requestmore
  let requestmore_of_yojson = app_bsky_feed_defs_requestmore_of_yojson
  let requestmore_to_yojson = app_bsky_feed_defs_requestmore_to_yojson


  (** def clickthroughItem *)
  type nonrec clickthroughitem = app_bsky_feed_defs_clickthroughitem
  let pp_clickthroughitem = pp_app_bsky_feed_defs_clickthroughitem
  let clickthroughitem_of_yojson = app_bsky_feed_defs_clickthroughitem_of_yojson
  let clickthroughitem_to_yojson = app_bsky_feed_defs_clickthroughitem_to_yojson


  (** def clickthroughAuthor *)
  type nonrec clickthroughauthor = app_bsky_feed_defs_clickthroughauthor
  let pp_clickthroughauthor = pp_app_bsky_feed_defs_clickthroughauthor
  let clickthroughauthor_of_yojson = app_bsky_feed_defs_clickthroughauthor_of_yojson
  let clickthroughauthor_to_yojson = app_bsky_feed_defs_clickthroughauthor_to_yojson


  (** def clickthroughReposter *)
  type nonrec clickthroughreposter = app_bsky_feed_defs_clickthroughreposter
  let pp_clickthroughreposter = pp_app_bsky_feed_defs_clickthroughreposter
  let clickthroughreposter_of_yojson = app_bsky_feed_defs_clickthroughreposter_of_yojson
  let clickthroughreposter_to_yojson = app_bsky_feed_defs_clickthroughreposter_to_yojson


  (** def clickthroughEmbed *)
  type nonrec clickthroughembed = app_bsky_feed_defs_clickthroughembed
  let pp_clickthroughembed = pp_app_bsky_feed_defs_clickthroughembed
  let clickthroughembed_of_yojson = app_bsky_feed_defs_clickthroughembed_of_yojson
  let clickthroughembed_to_yojson = app_bsky_feed_defs_clickthroughembed_to_yojson


  (** def contentModeUnspecified *)
  type nonrec contentmodeunspecified = app_bsky_feed_defs_contentmodeunspecified
  let pp_contentmodeunspecified = pp_app_bsky_feed_defs_contentmodeunspecified
  let contentmodeunspecified_of_yojson = app_bsky_feed_defs_contentmodeunspecified_of_yojson
  let contentmodeunspecified_to_yojson = app_bsky_feed_defs_contentmodeunspecified_to_yojson


  (** def contentModeVideo *)
  type nonrec contentmodevideo = app_bsky_feed_defs_contentmodevideo
  let pp_contentmodevideo = pp_app_bsky_feed_defs_contentmodevideo
  let contentmodevideo_of_yojson = app_bsky_feed_defs_contentmodevideo_of_yojson
  let contentmodevideo_to_yojson = app_bsky_feed_defs_contentmodevideo_to_yojson


  (** def interactionSeen *)
  type nonrec interactionseen = app_bsky_feed_defs_interactionseen
  let pp_interactionseen = pp_app_bsky_feed_defs_interactionseen
  let interactionseen_of_yojson = app_bsky_feed_defs_interactionseen_of_yojson
  let interactionseen_to_yojson = app_bsky_feed_defs_interactionseen_to_yojson


  (** def interactionLike *)
  type nonrec interactionlike = app_bsky_feed_defs_interactionlike
  let pp_interactionlike = pp_app_bsky_feed_defs_interactionlike
  let interactionlike_of_yojson = app_bsky_feed_defs_interactionlike_of_yojson
  let interactionlike_to_yojson = app_bsky_feed_defs_interactionlike_to_yojson


  (** def interactionRepost *)
  type nonrec interactionrepost = app_bsky_feed_defs_interactionrepost
  let pp_interactionrepost = pp_app_bsky_feed_defs_interactionrepost
  let interactionrepost_of_yojson = app_bsky_feed_defs_interactionrepost_of_yojson
  let interactionrepost_to_yojson = app_bsky_feed_defs_interactionrepost_to_yojson


  (** def interactionReply *)
  type nonrec interactionreply = app_bsky_feed_defs_interactionreply
  let pp_interactionreply = pp_app_bsky_feed_defs_interactionreply
  let interactionreply_of_yojson = app_bsky_feed_defs_interactionreply_of_yojson
  let interactionreply_to_yojson = app_bsky_feed_defs_interactionreply_to_yojson


  (** def interactionQuote *)
  type nonrec interactionquote = app_bsky_feed_defs_interactionquote
  let pp_interactionquote = pp_app_bsky_feed_defs_interactionquote
  let interactionquote_of_yojson = app_bsky_feed_defs_interactionquote_of_yojson
  let interactionquote_to_yojson = app_bsky_feed_defs_interactionquote_to_yojson


  (** def interactionShare *)
  type nonrec interactionshare = app_bsky_feed_defs_interactionshare
  let pp_interactionshare = pp_app_bsky_feed_defs_interactionshare
  let interactionshare_of_yojson = app_bsky_feed_defs_interactionshare_of_yojson
  let interactionshare_to_yojson = app_bsky_feed_defs_interactionshare_to_yojson


end


(** lexicon "app.bsky.embed.recordWithMedia"
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
  let pp_main = pp_app_bsky_embed_recordwithmedia_main
  let main_of_yojson = app_bsky_embed_recordwithmedia_main_of_yojson
  let main_to_yojson = app_bsky_embed_recordwithmedia_main_to_yojson


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
  let pp_view = pp_app_bsky_embed_recordwithmedia_view
  let view_of_yojson = app_bsky_embed_recordwithmedia_view_of_yojson
  let view_to_yojson = app_bsky_embed_recordwithmedia_view_to_yojson


end


(** lexicon "app.bsky.embed.record"
  A representation of a record embedded in a Bluesky record (eg, a post). For example, a quote-post, or sharing a feed generator record.
  *)
module App_Bsky_Embed_Record = struct
  (** def main *)
  type nonrec main = app_bsky_embed_record_main = {
    record: com_atproto_repo_strongref_main;
  }
  let pp_main = pp_app_bsky_embed_record_main
  let main_of_yojson = app_bsky_embed_record_main_of_yojson
  let main_to_yojson = app_bsky_embed_record_main_to_yojson


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
  let pp_view = pp_app_bsky_embed_record_view
  let view_of_yojson = app_bsky_embed_record_view_of_yojson
  let view_to_yojson = app_bsky_embed_record_view_to_yojson


  (** def viewRecord *)
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
    | `App_bsky_embed_images_view of app_bsky_embed_images_view
    | `App_bsky_embed_video_view of app_bsky_embed_video_view
    | `App_bsky_embed_external_view of app_bsky_embed_external_view
    | `App_bsky_embed_record_view of app_bsky_embed_record_view
    | `App_bsky_embed_recordwithmedia_view of app_bsky_embed_recordwithmedia_view
    | `Other of Value.t (** Non closed union *)
    ] list option;
    indexedAt: string;
  }
  let pp_viewrecord = pp_app_bsky_embed_record_viewrecord
  let viewrecord_of_yojson = app_bsky_embed_record_viewrecord_of_yojson
  let viewrecord_to_yojson = app_bsky_embed_record_viewrecord_to_yojson


  (** def viewNotFound *)
  type nonrec viewnotfound = app_bsky_embed_record_viewnotfound = {
    uri: string;
    notFound: bool;
  }
  let pp_viewnotfound = pp_app_bsky_embed_record_viewnotfound
  let viewnotfound_of_yojson = app_bsky_embed_record_viewnotfound_of_yojson
  let viewnotfound_to_yojson = app_bsky_embed_record_viewnotfound_to_yojson


  (** def viewBlocked *)
  type nonrec viewblocked = app_bsky_embed_record_viewblocked = {
    uri: string;
    blocked: bool;
    author: app_bsky_feed_defs_blockedauthor;
  }
  let pp_viewblocked = pp_app_bsky_embed_record_viewblocked
  let viewblocked_of_yojson = app_bsky_embed_record_viewblocked_of_yojson
  let viewblocked_to_yojson = app_bsky_embed_record_viewblocked_to_yojson


  (** def viewDetached *)
  type nonrec viewdetached = app_bsky_embed_record_viewdetached = {
    uri: string;
    detached: bool;
  }
  let pp_viewdetached = pp_app_bsky_embed_record_viewdetached
  let viewdetached_of_yojson = app_bsky_embed_record_viewdetached_of_yojson
  let viewdetached_to_yojson = app_bsky_embed_record_viewdetached_to_yojson


end


(** lexicon "app.bsky.labeler.defs"
  *)
module App_Bsky_Labeler_Defs = struct
  (** def labelerView *)
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
  let labelerview_of_yojson = app_bsky_labeler_defs_labelerview_of_yojson
  let labelerview_to_yojson = app_bsky_labeler_defs_labelerview_to_yojson


  (** def labelerViewDetailed *)
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
  let labelerviewdetailed_of_yojson = app_bsky_labeler_defs_labelerviewdetailed_of_yojson
  let labelerviewdetailed_to_yojson = app_bsky_labeler_defs_labelerviewdetailed_to_yojson


  (** def labelerViewerState *)
  type nonrec labelerviewerstate = app_bsky_labeler_defs_labelerviewerstate = {
    like: string option;
  }
  let pp_labelerviewerstate = pp_app_bsky_labeler_defs_labelerviewerstate
  let labelerviewerstate_of_yojson = app_bsky_labeler_defs_labelerviewerstate_of_yojson
  let labelerviewerstate_to_yojson = app_bsky_labeler_defs_labelerviewerstate_to_yojson


  (** def labelerPolicies *)
  type nonrec labelerpolicies = app_bsky_labeler_defs_labelerpolicies = {
    labelValues: com_atproto_label_defs_labelvalue list;
    labelValueDefinitions: com_atproto_label_defs_labelvaluedefinition list option;
  }
  let pp_labelerpolicies = pp_app_bsky_labeler_defs_labelerpolicies
  let labelerpolicies_of_yojson = app_bsky_labeler_defs_labelerpolicies_of_yojson
  let labelerpolicies_to_yojson = app_bsky_labeler_defs_labelerpolicies_to_yojson


end


(** lexicon "com.atproto.repo.strongRef"
  A URI with a content-hash fingerprint.
  *)
module Com_Atproto_Repo_StrongRef = struct
  (** def main *)
  type nonrec main = com_atproto_repo_strongref_main = {
    uri: string;
    cid: string;
  }
  let pp_main = pp_com_atproto_repo_strongref_main
  let main_of_yojson = com_atproto_repo_strongref_main_of_yojson
  let main_to_yojson = com_atproto_repo_strongref_main_to_yojson


end


(** lexicon "com.atproto.moderation.defs"
  *)
module Com_Atproto_Moderation_Defs = struct
  (** def reasonType *)
  type nonrec reasontype = com_atproto_moderation_defs_reasontype
  let pp_reasontype = pp_com_atproto_moderation_defs_reasontype
  let reasontype_of_yojson = com_atproto_moderation_defs_reasontype_of_yojson
  let reasontype_to_yojson = com_atproto_moderation_defs_reasontype_to_yojson


  (** def reasonSpam *)
  type nonrec reasonspam = com_atproto_moderation_defs_reasonspam
  let pp_reasonspam = pp_com_atproto_moderation_defs_reasonspam
  let reasonspam_of_yojson = com_atproto_moderation_defs_reasonspam_of_yojson
  let reasonspam_to_yojson = com_atproto_moderation_defs_reasonspam_to_yojson


  (** def reasonViolation *)
  type nonrec reasonviolation = com_atproto_moderation_defs_reasonviolation
  let pp_reasonviolation = pp_com_atproto_moderation_defs_reasonviolation
  let reasonviolation_of_yojson = com_atproto_moderation_defs_reasonviolation_of_yojson
  let reasonviolation_to_yojson = com_atproto_moderation_defs_reasonviolation_to_yojson


  (** def reasonMisleading *)
  type nonrec reasonmisleading = com_atproto_moderation_defs_reasonmisleading
  let pp_reasonmisleading = pp_com_atproto_moderation_defs_reasonmisleading
  let reasonmisleading_of_yojson = com_atproto_moderation_defs_reasonmisleading_of_yojson
  let reasonmisleading_to_yojson = com_atproto_moderation_defs_reasonmisleading_to_yojson


  (** def reasonSexual *)
  type nonrec reasonsexual = com_atproto_moderation_defs_reasonsexual
  let pp_reasonsexual = pp_com_atproto_moderation_defs_reasonsexual
  let reasonsexual_of_yojson = com_atproto_moderation_defs_reasonsexual_of_yojson
  let reasonsexual_to_yojson = com_atproto_moderation_defs_reasonsexual_to_yojson


  (** def reasonRude *)
  type nonrec reasonrude = com_atproto_moderation_defs_reasonrude
  let pp_reasonrude = pp_com_atproto_moderation_defs_reasonrude
  let reasonrude_of_yojson = com_atproto_moderation_defs_reasonrude_of_yojson
  let reasonrude_to_yojson = com_atproto_moderation_defs_reasonrude_to_yojson


  (** def reasonOther *)
  type nonrec reasonother = com_atproto_moderation_defs_reasonother
  let pp_reasonother = pp_com_atproto_moderation_defs_reasonother
  let reasonother_of_yojson = com_atproto_moderation_defs_reasonother_of_yojson
  let reasonother_to_yojson = com_atproto_moderation_defs_reasonother_to_yojson


  (** def reasonAppeal *)
  type nonrec reasonappeal = com_atproto_moderation_defs_reasonappeal
  let pp_reasonappeal = pp_com_atproto_moderation_defs_reasonappeal
  let reasonappeal_of_yojson = com_atproto_moderation_defs_reasonappeal_of_yojson
  let reasonappeal_to_yojson = com_atproto_moderation_defs_reasonappeal_to_yojson


  (** def subjectType *)
  type nonrec subjecttype = com_atproto_moderation_defs_subjecttype
  let pp_subjecttype = pp_com_atproto_moderation_defs_subjecttype
  let subjecttype_of_yojson = com_atproto_moderation_defs_subjecttype_of_yojson
  let subjecttype_to_yojson = com_atproto_moderation_defs_subjecttype_to_yojson


end


(** lexicon "app.bsky.embed.images"
  A set of images embedded in a Bluesky record (eg, a post).
  *)
module App_Bsky_Embed_Images = struct
  (** def main *)
  type nonrec main = app_bsky_embed_images_main = {
    images: app_bsky_embed_images_image list;
  }
  let pp_main = pp_app_bsky_embed_images_main
  let main_of_yojson = app_bsky_embed_images_main_of_yojson
  let main_to_yojson = app_bsky_embed_images_main_to_yojson


  (** def image *)
  type nonrec image = app_bsky_embed_images_image = {
    image: Blob.t;
    alt: string;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  let pp_image = pp_app_bsky_embed_images_image
  let image_of_yojson = app_bsky_embed_images_image_of_yojson
  let image_to_yojson = app_bsky_embed_images_image_to_yojson


  (** def view *)
  type nonrec view = app_bsky_embed_images_view = {
    images: app_bsky_embed_images_viewimage list;
  }
  let pp_view = pp_app_bsky_embed_images_view
  let view_of_yojson = app_bsky_embed_images_view_of_yojson
  let view_to_yojson = app_bsky_embed_images_view_to_yojson


  (** def viewImage *)
  type nonrec viewimage = app_bsky_embed_images_viewimage = {
    thumb: string;
    fullsize: string;
    alt: string;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  let pp_viewimage = pp_app_bsky_embed_images_viewimage
  let viewimage_of_yojson = app_bsky_embed_images_viewimage_of_yojson
  let viewimage_to_yojson = app_bsky_embed_images_viewimage_to_yojson


end


(** lexicon "app.bsky.embed.video"
  A video embedded in a Bluesky record (eg, a post).
  *)
module App_Bsky_Embed_Video = struct
  (** def main *)
  type nonrec main = app_bsky_embed_video_main = {
    video: Blob.t;
    captions: app_bsky_embed_video_caption list option;
    alt: string option;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  let pp_main = pp_app_bsky_embed_video_main
  let main_of_yojson = app_bsky_embed_video_main_of_yojson
  let main_to_yojson = app_bsky_embed_video_main_to_yojson


  (** def caption *)
  type nonrec caption = app_bsky_embed_video_caption = {
    lang: string;
    file: Blob.t;
  }
  let pp_caption = pp_app_bsky_embed_video_caption
  let caption_of_yojson = app_bsky_embed_video_caption_of_yojson
  let caption_to_yojson = app_bsky_embed_video_caption_to_yojson


  (** def view *)
  type nonrec view = app_bsky_embed_video_view = {
    cid: string;
    playlist: string;
    thumbnail: string option;
    alt: string option;
    aspectRatio: app_bsky_embed_defs_aspectratio option;
  }
  let pp_view = pp_app_bsky_embed_video_view
  let view_of_yojson = app_bsky_embed_video_view_of_yojson
  let view_to_yojson = app_bsky_embed_video_view_to_yojson


end


(** lexicon "app.bsky.embed.defs"
  *)
module App_Bsky_Embed_Defs = struct
  (** def aspectRatio *)
  type nonrec aspectratio = app_bsky_embed_defs_aspectratio = {
    width: int64;
    height: int64;
  }
  let pp_aspectratio = pp_app_bsky_embed_defs_aspectratio
  let aspectratio_of_yojson = app_bsky_embed_defs_aspectratio_of_yojson
  let aspectratio_to_yojson = app_bsky_embed_defs_aspectratio_to_yojson


end


(** lexicon "app.bsky.richtext.facet"
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
  let pp_main = pp_app_bsky_richtext_facet_main
  let main_of_yojson = app_bsky_richtext_facet_main_of_yojson
  let main_to_yojson = app_bsky_richtext_facet_main_to_yojson


  (** def mention *)
  type nonrec mention = app_bsky_richtext_facet_mention = {
    did: string;
  }
  let pp_mention = pp_app_bsky_richtext_facet_mention
  let mention_of_yojson = app_bsky_richtext_facet_mention_of_yojson
  let mention_to_yojson = app_bsky_richtext_facet_mention_to_yojson


  (** def link *)
  type nonrec link = app_bsky_richtext_facet_link = {
    uri: string;
  }
  let pp_link = pp_app_bsky_richtext_facet_link
  let link_of_yojson = app_bsky_richtext_facet_link_of_yojson
  let link_to_yojson = app_bsky_richtext_facet_link_to_yojson


  (** def tag *)
  type nonrec tag = app_bsky_richtext_facet_tag = {
    tag: string;
  }
  let pp_tag = pp_app_bsky_richtext_facet_tag
  let tag_of_yojson = app_bsky_richtext_facet_tag_of_yojson
  let tag_to_yojson = app_bsky_richtext_facet_tag_to_yojson


  (** def byteSlice *)
  type nonrec byteslice = app_bsky_richtext_facet_byteslice = {
    byteStart: int64;
    byteEnd: int64;
  }
  let pp_byteslice = pp_app_bsky_richtext_facet_byteslice
  let byteslice_of_yojson = app_bsky_richtext_facet_byteslice_of_yojson
  let byteslice_to_yojson = app_bsky_richtext_facet_byteslice_to_yojson


end


(** lexicon "com.atproto.label.defs"
  *)
module Com_Atproto_Label_Defs = struct
  (** def label *)
  type nonrec label = com_atproto_label_defs_label = {
    ver: int64 option;
    src: string;
    uri: string;
    cid: string option;
    val_: string; [@key "val"]
    neg: bool option;
    cts: string;
    exp: string option;
    sig_: bytes option; [@key "sig"]
  }
  let pp_label = pp_com_atproto_label_defs_label
  let label_of_yojson = com_atproto_label_defs_label_of_yojson
  let label_to_yojson = com_atproto_label_defs_label_to_yojson


  (** def selfLabels *)
  type nonrec selflabels = com_atproto_label_defs_selflabels = {
    values: com_atproto_label_defs_selflabel list;
  }
  let pp_selflabels = pp_com_atproto_label_defs_selflabels
  let selflabels_of_yojson = com_atproto_label_defs_selflabels_of_yojson
  let selflabels_to_yojson = com_atproto_label_defs_selflabels_to_yojson


  (** def selfLabel *)
  type nonrec selflabel = com_atproto_label_defs_selflabel = {
    val_: string; [@key "val"]
  }
  let pp_selflabel = pp_com_atproto_label_defs_selflabel
  let selflabel_of_yojson = com_atproto_label_defs_selflabel_of_yojson
  let selflabel_to_yojson = com_atproto_label_defs_selflabel_to_yojson


  (** def labelValueDefinition *)
  type nonrec labelvaluedefinition = com_atproto_label_defs_labelvaluedefinition = {
    identifier: string;
    severity: string;
    blurs: string;
    defaultSetting: string option;
    adultOnly: bool option;
    locales: com_atproto_label_defs_labelvaluedefinitionstrings list;
  }
  let pp_labelvaluedefinition = pp_com_atproto_label_defs_labelvaluedefinition
  let labelvaluedefinition_of_yojson = com_atproto_label_defs_labelvaluedefinition_of_yojson
  let labelvaluedefinition_to_yojson = com_atproto_label_defs_labelvaluedefinition_to_yojson


  (** def labelValueDefinitionStrings *)
  type nonrec labelvaluedefinitionstrings = com_atproto_label_defs_labelvaluedefinitionstrings = {
    lang: string;
    name: string;
    description: string;
  }
  let pp_labelvaluedefinitionstrings = pp_com_atproto_label_defs_labelvaluedefinitionstrings
  let labelvaluedefinitionstrings_of_yojson = com_atproto_label_defs_labelvaluedefinitionstrings_of_yojson
  let labelvaluedefinitionstrings_to_yojson = com_atproto_label_defs_labelvaluedefinitionstrings_to_yojson


  (** def labelValue *)
  type nonrec labelvalue = com_atproto_label_defs_labelvalue
  let pp_labelvalue = pp_com_atproto_label_defs_labelvalue
  let labelvalue_of_yojson = com_atproto_label_defs_labelvalue_of_yojson
  let labelvalue_to_yojson = com_atproto_label_defs_labelvalue_to_yojson


end


(** lexicon "app.bsky.feed.threadgate"
  *)
module App_Bsky_Feed_Threadgate = struct
  (** def main *)
  (** Record defining interaction gating rules for a thread (aka, reply controls). The record key (rkey) of the threadgate record must match the record key of the thread's root post, and that record must be in the same repository. *)
  type main = {
    post: string;
    allow: [
    | `App_bsky_feed_threadgate_mentionrule of app_bsky_feed_threadgate_mentionrule
    | `App_bsky_feed_threadgate_followerrule of app_bsky_feed_threadgate_followerrule
    | `App_bsky_feed_threadgate_followingrule of app_bsky_feed_threadgate_followingrule
    | `App_bsky_feed_threadgate_listrule of app_bsky_feed_threadgate_listrule
    | `Other of Value.t (** Non closed union *)
    ] list option;
    createdAt: string;
    hiddenReplies: string list option;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



  (** def mentionRule *)
  type nonrec mentionrule = app_bsky_feed_threadgate_mentionrule
  let pp_mentionrule = pp_app_bsky_feed_threadgate_mentionrule
  let mentionrule_of_yojson = app_bsky_feed_threadgate_mentionrule_of_yojson
  let mentionrule_to_yojson = app_bsky_feed_threadgate_mentionrule_to_yojson


  (** def followerRule *)
  type nonrec followerrule = app_bsky_feed_threadgate_followerrule
  let pp_followerrule = pp_app_bsky_feed_threadgate_followerrule
  let followerrule_of_yojson = app_bsky_feed_threadgate_followerrule_of_yojson
  let followerrule_to_yojson = app_bsky_feed_threadgate_followerrule_to_yojson


  (** def followingRule *)
  type nonrec followingrule = app_bsky_feed_threadgate_followingrule
  let pp_followingrule = pp_app_bsky_feed_threadgate_followingrule
  let followingrule_of_yojson = app_bsky_feed_threadgate_followingrule_of_yojson
  let followingrule_to_yojson = app_bsky_feed_threadgate_followingrule_to_yojson


  (** def listRule *)
  type nonrec listrule = app_bsky_feed_threadgate_listrule = {
    list: string;
  }
  let pp_listrule = pp_app_bsky_feed_threadgate_listrule
  let listrule_of_yojson = app_bsky_feed_threadgate_listrule_of_yojson
  let listrule_to_yojson = app_bsky_feed_threadgate_listrule_to_yojson


end


(** lexicon "app.bsky.feed.postgate"
  *)
module App_Bsky_Feed_Postgate = struct
  (** def main *)
  (** Record defining interaction rules for a post. The record key (rkey) of the postgate record must match the record key of the post, and that record must be in the same repository. *)
  type main = {
    createdAt: string;
    post: string;
    detachedEmbeddingUris: string list option;
    embeddingRules: [
    | `App_bsky_feed_postgate_disablerule of app_bsky_feed_postgate_disablerule
    | `Other of Value.t (** Non closed union *)
    ] list option;
  }  [@@deriving show {with_path=false}, yojson {strict=false}, make]



  (** def disableRule *)
  type nonrec disablerule = app_bsky_feed_postgate_disablerule
  let pp_disablerule = pp_app_bsky_feed_postgate_disablerule
  let disablerule_of_yojson = app_bsky_feed_postgate_disablerule_of_yojson
  let disablerule_to_yojson = app_bsky_feed_postgate_disablerule_to_yojson


end


(** lexicon "app.bsky.embed.external"
  *)
module App_Bsky_Embed_External = struct
  (** def main *)
  type nonrec main = app_bsky_embed_external_main = {
    external_: app_bsky_embed_external_external; [@key "external"]
  }
  let pp_main = pp_app_bsky_embed_external_main
  let main_of_yojson = app_bsky_embed_external_main_of_yojson
  let main_to_yojson = app_bsky_embed_external_main_to_yojson


  (** def external *)
  type nonrec external_ = app_bsky_embed_external_external = {
    uri: string;
    title: string;
    description: string;
    thumb: Blob.t option;
  }
  let pp_external_ = pp_app_bsky_embed_external_external
  let external__of_yojson = app_bsky_embed_external_external_of_yojson
  let external__to_yojson = app_bsky_embed_external_external_to_yojson


  (** def view *)
  type nonrec view = app_bsky_embed_external_view = {
    external_: app_bsky_embed_external_viewexternal; [@key "external"]
  }
  let pp_view = pp_app_bsky_embed_external_view
  let view_of_yojson = app_bsky_embed_external_view_of_yojson
  let view_to_yojson = app_bsky_embed_external_view_to_yojson


  (** def viewExternal *)
  type nonrec viewexternal = app_bsky_embed_external_viewexternal = {
    uri: string;
    title: string;
    description: string;
    thumb: string option;
  }
  let pp_viewexternal = pp_app_bsky_embed_external_viewexternal
  let viewexternal_of_yojson = app_bsky_embed_external_viewexternal_of_yojson
  let viewexternal_to_yojson = app_bsky_embed_external_viewexternal_to_yojson


end


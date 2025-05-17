
module App = struct

module Bsky = struct

module Actor = struct

module Defs = struct
  (** lexicon app.bsky.actor.defs
  *)

(** def profileViewBasic *)
(** def profileView *)
(** def profileViewDetailed *)
(** def profileAssociated *)
(** def profileAssociatedChat *)
(** def viewerState *)
(** def knownFollowers *)
(** def verificationState *)
(** def verificationView *)
(** def preferences *)
(** def adultContentPref *)
(** def contentLabelPref *)
(** def savedFeed *)
(** def savedFeedsPrefV2 *)
(** def savedFeedsPref *)
(** def personalDetailsPref *)
(** def feedViewPref *)
(** def threadViewPref *)
(** def interestsPref *)
(** def mutedWordTarget *)
(** def mutedWord *)
(** def mutedWordsPref *)
(** def hiddenPostsPref *)
(** def labelersPref *)
(** def labelerPrefItem *)
(** def bskyAppStatePref *)
(** def bskyAppProgressGuide *)
(** def nux *)
(** def verificationPrefs *)
(** def postInteractionSettingsPref *)
(** def statusView *)
end

module GetPreferences = struct
  (** lexicon app.bsky.actor.getPreferences
  *)

(** def main *)
end

module GetProfile = struct
  (** lexicon app.bsky.actor.getProfile
  *)

(** def main *)
end

module GetProfiles = struct
  (** lexicon app.bsky.actor.getProfiles
  *)

(** def main *)
end

module GetSuggestions = struct
  (** lexicon app.bsky.actor.getSuggestions
  *)

(** def main *)
end

module Profile = struct
  (** lexicon app.bsky.actor.profile
  *)

(** def main *)
end

module PutPreferences = struct
  (** lexicon app.bsky.actor.putPreferences
  *)

(** def main *)
end

module SearchActors = struct
  (** lexicon app.bsky.actor.searchActors
  *)

(** def main *)
end

module SearchActorsTypeahead = struct
  (** lexicon app.bsky.actor.searchActorsTypeahead
  *)

(** def main *)
end

module Status = struct
  (** lexicon app.bsky.actor.status
  *)

(** def main *)
(** def live *)
end
end

module Embed = struct

module Defs = struct
  (** lexicon app.bsky.embed.defs
  *)

(** def aspectRatio *)
end

module External = struct
  (** lexicon app.bsky.embed.external
  *)

(** def main *)
(** def external *)
(** def view *)
(** def viewExternal *)
end

module Images = struct
  (** lexicon app.bsky.embed.images
  A set of images embedded in a Bluesky record (eg, a post).
  *)

(** def main *)
(** def image *)
(** def view *)
(** def viewImage *)
end

module Record = struct
  (** lexicon app.bsky.embed.record
  A representation of a record embedded in a Bluesky record (eg, a post). For example, a quote-post, or sharing a feed generator record.
  *)

(** def main *)
(** def view *)
(** def viewRecord *)
(** def viewNotFound *)
(** def viewBlocked *)
(** def viewDetached *)
end

module RecordWithMedia = struct
  (** lexicon app.bsky.embed.recordWithMedia
  A representation of a record embedded in a Bluesky record (eg, a post), alongside other compatible embeds. For example, a quote post and image, or a quote post and external URL card.
  *)

(** def main *)
(** def view *)
end

module Video = struct
  (** lexicon app.bsky.embed.video
  A video embedded in a Bluesky record (eg, a post).
  *)

(** def main *)
(** def caption *)
(** def view *)
end
end

module Feed = struct

module Defs = struct
  (** lexicon app.bsky.feed.defs
  *)

(** def postView *)
(** def viewerState *)
(** def threadContext *)
(** def feedViewPost *)
(** def replyRef *)
(** def reasonRepost *)
(** def reasonPin *)
(** def threadViewPost *)
(** def notFoundPost *)
(** def blockedPost *)
(** def blockedAuthor *)
(** def generatorView *)
(** def generatorViewerState *)
(** def skeletonFeedPost *)
(** def skeletonReasonRepost *)
(** def skeletonReasonPin *)
(** def threadgateView *)
(** def interaction *)
(** def requestLess *)
(** def requestMore *)
(** def clickthroughItem *)
(** def clickthroughAuthor *)
(** def clickthroughReposter *)
(** def clickthroughEmbed *)
(** def contentModeUnspecified *)
(** def contentModeVideo *)
(** def interactionSeen *)
(** def interactionLike *)
(** def interactionRepost *)
(** def interactionReply *)
(** def interactionQuote *)
(** def interactionShare *)
end

module DescribeFeedGenerator = struct
  (** lexicon app.bsky.feed.describeFeedGenerator
  *)

(** def main *)
(** def feed *)
(** def links *)
end

module Generator = struct
  (** lexicon app.bsky.feed.generator
  *)

(** def main *)
end

module GetActorFeeds = struct
  (** lexicon app.bsky.feed.getActorFeeds
  *)

(** def main *)
end

module GetActorLikes = struct
  (** lexicon app.bsky.feed.getActorLikes
  *)

(** def main *)
end

module GetAuthorFeed = struct
  (** lexicon app.bsky.feed.getAuthorFeed
  *)

(** def main *)
end

module GetFeed = struct
  (** lexicon app.bsky.feed.getFeed
  *)

(** def main *)
end

module GetFeedGenerator = struct
  (** lexicon app.bsky.feed.getFeedGenerator
  *)

(** def main *)
end

module GetFeedGenerators = struct
  (** lexicon app.bsky.feed.getFeedGenerators
  *)

(** def main *)
end

module GetFeedSkeleton = struct
  (** lexicon app.bsky.feed.getFeedSkeleton
  *)

(** def main *)
end

module GetLikes = struct
  (** lexicon app.bsky.feed.getLikes
  *)

(** def main *)
(** def like *)
end

module GetListFeed = struct
  (** lexicon app.bsky.feed.getListFeed
  *)

(** def main *)
end

module GetPostThread = struct
  (** lexicon app.bsky.feed.getPostThread
  *)

(** def main *)
end

module GetPosts = struct
  (** lexicon app.bsky.feed.getPosts
  *)

(** def main *)
end

module GetQuotes = struct
  (** lexicon app.bsky.feed.getQuotes
  *)

(** def main *)
end

module GetRepostedBy = struct
  (** lexicon app.bsky.feed.getRepostedBy
  *)

(** def main *)
end

module GetSuggestedFeeds = struct
  (** lexicon app.bsky.feed.getSuggestedFeeds
  *)

(** def main *)
end

module GetTimeline = struct
  (** lexicon app.bsky.feed.getTimeline
  *)

(** def main *)
end

module Like = struct
  (** lexicon app.bsky.feed.like
  *)

(** def main *)
end

module Post = struct
  (** lexicon app.bsky.feed.post
  *)

(** def main *)
(** def replyRef *)
(** def entity *)
(** def textSlice *)
end

module Postgate = struct
  (** lexicon app.bsky.feed.postgate
  *)

(** def main *)
(** def disableRule *)
end

module Repost = struct
  (** lexicon app.bsky.feed.repost
  *)

(** def main *)
end

module SearchPosts = struct
  (** lexicon app.bsky.feed.searchPosts
  *)

(** def main *)
end

module SendInteractions = struct
  (** lexicon app.bsky.feed.sendInteractions
  *)

(** def main *)
end

module Threadgate = struct
  (** lexicon app.bsky.feed.threadgate
  *)

(** def main *)
(** def mentionRule *)
(** def followerRule *)
(** def followingRule *)
(** def listRule *)
end
end

module Graph = struct

module Block = struct
  (** lexicon app.bsky.graph.block
  *)

(** def main *)
end

module Defs = struct
  (** lexicon app.bsky.graph.defs
  *)

(** def listViewBasic *)
(** def listView *)
(** def listItemView *)
(** def starterPackView *)
(** def starterPackViewBasic *)
(** def listPurpose *)
(** def modlist *)
(** def curatelist *)
(** def referencelist *)
(** def listViewerState *)
(** def notFoundActor *)
(** def relationship *)
end

module Follow = struct
  (** lexicon app.bsky.graph.follow
  *)

(** def main *)
end

module GetActorStarterPacks = struct
  (** lexicon app.bsky.graph.getActorStarterPacks
  *)

(** def main *)
end

module GetBlocks = struct
  (** lexicon app.bsky.graph.getBlocks
  *)

(** def main *)
end

module GetFollowers = struct
  (** lexicon app.bsky.graph.getFollowers
  *)

(** def main *)
end

module GetFollows = struct
  (** lexicon app.bsky.graph.getFollows
  *)

(** def main *)
end

module GetKnownFollowers = struct
  (** lexicon app.bsky.graph.getKnownFollowers
  *)

(** def main *)
end

module GetList = struct
  (** lexicon app.bsky.graph.getList
  *)

(** def main *)
end

module GetListBlocks = struct
  (** lexicon app.bsky.graph.getListBlocks
  *)

(** def main *)
end

module GetListMutes = struct
  (** lexicon app.bsky.graph.getListMutes
  *)

(** def main *)
end

module GetLists = struct
  (** lexicon app.bsky.graph.getLists
  *)

(** def main *)
end

module GetMutes = struct
  (** lexicon app.bsky.graph.getMutes
  *)

(** def main *)
end

module GetRelationships = struct
  (** lexicon app.bsky.graph.getRelationships
  *)

(** def main *)
end

module GetStarterPack = struct
  (** lexicon app.bsky.graph.getStarterPack
  *)

(** def main *)
end

module GetStarterPacks = struct
  (** lexicon app.bsky.graph.getStarterPacks
  *)

(** def main *)
end

module GetSuggestedFollowsByActor = struct
  (** lexicon app.bsky.graph.getSuggestedFollowsByActor
  *)

(** def main *)
end

module List = struct
  (** lexicon app.bsky.graph.list
  *)

(** def main *)
end

module Listblock = struct
  (** lexicon app.bsky.graph.listblock
  *)

(** def main *)
end

module Listitem = struct
  (** lexicon app.bsky.graph.listitem
  *)

(** def main *)
end

module MuteActor = struct
  (** lexicon app.bsky.graph.muteActor
  *)

(** def main *)
end

module MuteActorList = struct
  (** lexicon app.bsky.graph.muteActorList
  *)

(** def main *)
end

module MuteThread = struct
  (** lexicon app.bsky.graph.muteThread
  *)

(** def main *)
end

module SearchStarterPacks = struct
  (** lexicon app.bsky.graph.searchStarterPacks
  *)

(** def main *)
end

module Starterpack = struct
  (** lexicon app.bsky.graph.starterpack
  *)

(** def main *)
(** def feedItem *)
end

module UnmuteActor = struct
  (** lexicon app.bsky.graph.unmuteActor
  *)

(** def main *)
end

module UnmuteActorList = struct
  (** lexicon app.bsky.graph.unmuteActorList
  *)

(** def main *)
end

module UnmuteThread = struct
  (** lexicon app.bsky.graph.unmuteThread
  *)

(** def main *)
end

module Verification = struct
  (** lexicon app.bsky.graph.verification
  *)

(** def main *)
end
end

module Labeler = struct

module Defs = struct
  (** lexicon app.bsky.labeler.defs
  *)

(** def labelerView *)
(** def labelerViewDetailed *)
(** def labelerViewerState *)
(** def labelerPolicies *)
end

module GetServices = struct
  (** lexicon app.bsky.labeler.getServices
  *)

(** def main *)
end

module Service = struct
  (** lexicon app.bsky.labeler.service
  *)

(** def main *)
end
end

module Notification = struct

module Defs = struct
  (** lexicon app.bsky.notification.defs
  *)

(** def recordDeleted *)
end

module GetUnreadCount = struct
  (** lexicon app.bsky.notification.getUnreadCount
  *)

(** def main *)
end

module ListNotifications = struct
  (** lexicon app.bsky.notification.listNotifications
  *)

(** def main *)
(** def notification *)
end

module PutPreferences = struct
  (** lexicon app.bsky.notification.putPreferences
  *)

(** def main *)
end

module RegisterPush = struct
  (** lexicon app.bsky.notification.registerPush
  *)

(** def main *)
end

module UpdateSeen = struct
  (** lexicon app.bsky.notification.updateSeen
  *)

(** def main *)
end
end

module Richtext = struct

module Facet = struct
  (** lexicon app.bsky.richtext.facet
  *)

(** def main *)
(** def mention *)
(** def link *)
(** def tag *)
(** def byteSlice *)
end
end

module Unspecced = struct

module Defs = struct
  (** lexicon app.bsky.unspecced.defs
  *)

(** def skeletonSearchPost *)
(** def skeletonSearchActor *)
(** def skeletonSearchStarterPack *)
(** def trendingTopic *)
(** def skeletonTrend *)
(** def trendView *)
end

module GetConfig = struct
  (** lexicon app.bsky.unspecced.getConfig
  *)

(** def main *)
(** def liveNowConfig *)
end

module GetPopularFeedGenerators = struct
  (** lexicon app.bsky.unspecced.getPopularFeedGenerators
  *)

(** def main *)
end

module GetSuggestedFeeds = struct
  (** lexicon app.bsky.unspecced.getSuggestedFeeds
  *)

(** def main *)
end

module GetSuggestedFeedsSkeleton = struct
  (** lexicon app.bsky.unspecced.getSuggestedFeedsSkeleton
  *)

(** def main *)
end

module GetSuggestedStarterPacks = struct
  (** lexicon app.bsky.unspecced.getSuggestedStarterPacks
  *)

(** def main *)
end

module GetSuggestedStarterPacksSkeleton = struct
  (** lexicon app.bsky.unspecced.getSuggestedStarterPacksSkeleton
  *)

(** def main *)
end

module GetSuggestedUsers = struct
  (** lexicon app.bsky.unspecced.getSuggestedUsers
  *)

(** def main *)
end

module GetSuggestedUsersSkeleton = struct
  (** lexicon app.bsky.unspecced.getSuggestedUsersSkeleton
  *)

(** def main *)
end

module GetSuggestionsSkeleton = struct
  (** lexicon app.bsky.unspecced.getSuggestionsSkeleton
  *)

(** def main *)
end

module GetTaggedSuggestions = struct
  (** lexicon app.bsky.unspecced.getTaggedSuggestions
  *)

(** def main *)
(** def suggestion *)
end

module GetTrendingTopics = struct
  (** lexicon app.bsky.unspecced.getTrendingTopics
  *)

(** def main *)
end

module GetTrends = struct
  (** lexicon app.bsky.unspecced.getTrends
  *)

(** def main *)
end

module GetTrendsSkeleton = struct
  (** lexicon app.bsky.unspecced.getTrendsSkeleton
  *)

(** def main *)
end

module SearchActorsSkeleton = struct
  (** lexicon app.bsky.unspecced.searchActorsSkeleton
  *)

(** def main *)
end

module SearchPostsSkeleton = struct
  (** lexicon app.bsky.unspecced.searchPostsSkeleton
  *)

(** def main *)
end

module SearchStarterPacksSkeleton = struct
  (** lexicon app.bsky.unspecced.searchStarterPacksSkeleton
  *)

(** def main *)
end
end

module Video = struct

module Defs = struct
  (** lexicon app.bsky.video.defs
  *)

(** def jobStatus *)
end

module GetJobStatus = struct
  (** lexicon app.bsky.video.getJobStatus
  *)

(** def main *)
end

module GetUploadLimits = struct
  (** lexicon app.bsky.video.getUploadLimits
  *)

(** def main *)
end

module UploadVideo = struct
  (** lexicon app.bsky.video.uploadVideo
  *)

(** def main *)
end
end
end
end

module Chat = struct

module Bsky = struct

module Actor = struct

module Declaration = struct
  (** lexicon chat.bsky.actor.declaration
  *)

(** def main *)
end

module Defs = struct
  (** lexicon chat.bsky.actor.defs
  *)

(** def profileViewBasic *)
end

module DeleteAccount = struct
  (** lexicon chat.bsky.actor.deleteAccount
  *)

(** def main *)
end

module ExportAccountData = struct
  (** lexicon chat.bsky.actor.exportAccountData
  *)

(** def main *)
end
end

module Convo = struct

module AcceptConvo = struct
  (** lexicon chat.bsky.convo.acceptConvo
  *)

(** def main *)
end

module AddReaction = struct
  (** lexicon chat.bsky.convo.addReaction
  *)

(** def main *)
end

module Defs = struct
  (** lexicon chat.bsky.convo.defs
  *)

(** def messageRef *)
(** def messageInput *)
(** def messageView *)
(** def deletedMessageView *)
(** def messageViewSender *)
(** def reactionView *)
(** def reactionViewSender *)
(** def messageAndReactionView *)
(** def convoView *)
(** def logBeginConvo *)
(** def logAcceptConvo *)
(** def logLeaveConvo *)
(** def logMuteConvo *)
(** def logUnmuteConvo *)
(** def logCreateMessage *)
(** def logDeleteMessage *)
(** def logReadMessage *)
(** def logAddReaction *)
(** def logRemoveReaction *)
end

module DeleteMessageForSelf = struct
  (** lexicon chat.bsky.convo.deleteMessageForSelf
  *)

(** def main *)
end

module GetConvo = struct
  (** lexicon chat.bsky.convo.getConvo
  *)

(** def main *)
end

module GetConvoAvailability = struct
  (** lexicon chat.bsky.convo.getConvoAvailability
  *)

(** def main *)
end

module GetConvoForMembers = struct
  (** lexicon chat.bsky.convo.getConvoForMembers
  *)

(** def main *)
end

module GetLog = struct
  (** lexicon chat.bsky.convo.getLog
  *)

(** def main *)
end

module GetMessages = struct
  (** lexicon chat.bsky.convo.getMessages
  *)

(** def main *)
end

module LeaveConvo = struct
  (** lexicon chat.bsky.convo.leaveConvo
  *)

(** def main *)
end

module ListConvos = struct
  (** lexicon chat.bsky.convo.listConvos
  *)

(** def main *)
end

module MuteConvo = struct
  (** lexicon chat.bsky.convo.muteConvo
  *)

(** def main *)
end

module RemoveReaction = struct
  (** lexicon chat.bsky.convo.removeReaction
  *)

(** def main *)
end

module SendMessage = struct
  (** lexicon chat.bsky.convo.sendMessage
  *)

(** def main *)
end

module SendMessageBatch = struct
  (** lexicon chat.bsky.convo.sendMessageBatch
  *)

(** def main *)
(** def batchItem *)
end

module UnmuteConvo = struct
  (** lexicon chat.bsky.convo.unmuteConvo
  *)

(** def main *)
end

module UpdateAllRead = struct
  (** lexicon chat.bsky.convo.updateAllRead
  *)

(** def main *)
end

module UpdateRead = struct
  (** lexicon chat.bsky.convo.updateRead
  *)

(** def main *)
end
end

module Moderation = struct

module GetActorMetadata = struct
  (** lexicon chat.bsky.moderation.getActorMetadata
  *)

(** def main *)
(** def metadata *)
end

module GetMessageContext = struct
  (** lexicon chat.bsky.moderation.getMessageContext
  *)

(** def main *)
end

module UpdateActorAccess = struct
  (** lexicon chat.bsky.moderation.updateActorAccess
  *)

(** def main *)
end
end
end
end

module Com = struct

module Atproto = struct

module Admin = struct

module Defs = struct
  (** lexicon com.atproto.admin.defs
  *)

(** def statusAttr *)
(** def accountView *)
(** def repoRef *)
(** def repoBlobRef *)
(** def threatSignature *)
end

module DeleteAccount = struct
  (** lexicon com.atproto.admin.deleteAccount
  *)

(** def main *)
end

module DisableAccountInvites = struct
  (** lexicon com.atproto.admin.disableAccountInvites
  *)

(** def main *)
end

module DisableInviteCodes = struct
  (** lexicon com.atproto.admin.disableInviteCodes
  *)

(** def main *)
end

module EnableAccountInvites = struct
  (** lexicon com.atproto.admin.enableAccountInvites
  *)

(** def main *)
end

module GetAccountInfo = struct
  (** lexicon com.atproto.admin.getAccountInfo
  *)

(** def main *)
end

module GetAccountInfos = struct
  (** lexicon com.atproto.admin.getAccountInfos
  *)

(** def main *)
end

module GetInviteCodes = struct
  (** lexicon com.atproto.admin.getInviteCodes
  *)

(** def main *)
end

module GetSubjectStatus = struct
  (** lexicon com.atproto.admin.getSubjectStatus
  *)

(** def main *)
end

module SearchAccounts = struct
  (** lexicon com.atproto.admin.searchAccounts
  *)

(** def main *)
end

module SendEmail = struct
  (** lexicon com.atproto.admin.sendEmail
  *)

(** def main *)
end

module UpdateAccountEmail = struct
  (** lexicon com.atproto.admin.updateAccountEmail
  *)

(** def main *)
end

module UpdateAccountHandle = struct
  (** lexicon com.atproto.admin.updateAccountHandle
  *)

(** def main *)
end

module UpdateAccountPassword = struct
  (** lexicon com.atproto.admin.updateAccountPassword
  *)

(** def main *)
end

module UpdateAccountSigningKey = struct
  (** lexicon com.atproto.admin.updateAccountSigningKey
  *)

(** def main *)
end

module UpdateSubjectStatus = struct
  (** lexicon com.atproto.admin.updateSubjectStatus
  *)

(** def main *)
end
end

module Identity = struct

module Defs = struct
  (** lexicon com.atproto.identity.defs
  *)

(** def identityInfo *)
end

module GetRecommendedDidCredentials = struct
  (** lexicon com.atproto.identity.getRecommendedDidCredentials
  *)

(** def main *)
end

module RefreshIdentity = struct
  (** lexicon com.atproto.identity.refreshIdentity
  *)

(** def main *)
end

module RequestPlcOperationSignature = struct
  (** lexicon com.atproto.identity.requestPlcOperationSignature
  *)

(** def main *)
end

module ResolveDid = struct
  (** lexicon com.atproto.identity.resolveDid
  *)

(** def main *)
end

module ResolveHandle = struct
  (** lexicon com.atproto.identity.resolveHandle
  *)

(** def main *)
end

module ResolveIdentity = struct
  (** lexicon com.atproto.identity.resolveIdentity
  *)

(** def main *)
end

module SignPlcOperation = struct
  (** lexicon com.atproto.identity.signPlcOperation
  *)

(** def main *)
end

module SubmitPlcOperation = struct
  (** lexicon com.atproto.identity.submitPlcOperation
  *)

(** def main *)
end

module UpdateHandle = struct
  (** lexicon com.atproto.identity.updateHandle
  *)

(** def main *)
end
end

module Label = struct

module Defs = struct
  (** lexicon com.atproto.label.defs
  *)

(** def label *)
(** def selfLabels *)
(** def selfLabel *)
(** def labelValueDefinition *)
(** def labelValueDefinitionStrings *)
(** def labelValue *)
end

module QueryLabels = struct
  (** lexicon com.atproto.label.queryLabels
  *)

(** def main *)
end

module SubscribeLabels = struct
  (** lexicon com.atproto.label.subscribeLabels
  *)

(** def main *)
(** def labels *)
(** def info *)
end
end

module Lexicon = struct

module Schema = struct
  (** lexicon com.atproto.lexicon.schema
  *)

(** def main *)
end
end

module Moderation = struct

module CreateReport = struct
  (** lexicon com.atproto.moderation.createReport
  *)

(** def main *)
end

module Defs = struct
  (** lexicon com.atproto.moderation.defs
  *)

(** def reasonType *)
(** def reasonSpam *)
(** def reasonViolation *)
(** def reasonMisleading *)
(** def reasonSexual *)
(** def reasonRude *)
(** def reasonOther *)
(** def reasonAppeal *)
(** def subjectType *)
end
end

module Repo = struct

module ApplyWrites = struct
  (** lexicon com.atproto.repo.applyWrites
  *)

(** def main *)
(** def create *)
(** def update *)
(** def delete *)
(** def createResult *)
(** def updateResult *)
(** def deleteResult *)
end

module CreateRecord = struct
  (** lexicon com.atproto.repo.createRecord
  *)

(** def main *)
end

module Defs = struct
  (** lexicon com.atproto.repo.defs
  *)

(** def commitMeta *)
end

module DeleteRecord = struct
  (** lexicon com.atproto.repo.deleteRecord
  *)

(** def main *)
end

module DescribeRepo = struct
  (** lexicon com.atproto.repo.describeRepo
  *)

(** def main *)
end

module GetRecord = struct
  (** lexicon com.atproto.repo.getRecord
  *)

(** def main *)
end

module ImportRepo = struct
  (** lexicon com.atproto.repo.importRepo
  *)

(** def main *)
end

module ListMissingBlobs = struct
  (** lexicon com.atproto.repo.listMissingBlobs
  *)

(** def main *)
(** def recordBlob *)
end

module ListRecords = struct
  (** lexicon com.atproto.repo.listRecords
  *)

(** def main *)
(** def record *)
end

module PutRecord = struct
  (** lexicon com.atproto.repo.putRecord
  *)

(** def main *)
end

module StrongRef = struct
  (** lexicon com.atproto.repo.strongRef
  A URI with a content-hash fingerprint.
  *)

(** def main *)
end

module UploadBlob = struct
  (** lexicon com.atproto.repo.uploadBlob
  *)

(** def main *)
end
end

module Server = struct

module ActivateAccount = struct
  (** lexicon com.atproto.server.activateAccount
  *)

(** def main *)
end

module CheckAccountStatus = struct
  (** lexicon com.atproto.server.checkAccountStatus
  *)

(** def main *)
end

module ConfirmEmail = struct
  (** lexicon com.atproto.server.confirmEmail
  *)

(** def main *)
end

module CreateAccount = struct
  (** lexicon com.atproto.server.createAccount
  *)

(** def main *)
end

module CreateAppPassword = struct
  (** lexicon com.atproto.server.createAppPassword
  *)

(** def main *)
(** def appPassword *)
end

module CreateInviteCode = struct
  (** lexicon com.atproto.server.createInviteCode
  *)

(** def main *)
end

module CreateInviteCodes = struct
  (** lexicon com.atproto.server.createInviteCodes
  *)

(** def main *)
(** def accountCodes *)
end

module CreateSession = struct
  (** lexicon com.atproto.server.createSession
  *)

(** def main *)
end

module DeactivateAccount = struct
  (** lexicon com.atproto.server.deactivateAccount
  *)

(** def main *)
end

module Defs = struct
  (** lexicon com.atproto.server.defs
  *)

(** def inviteCode *)
(** def inviteCodeUse *)
end

module DeleteAccount = struct
  (** lexicon com.atproto.server.deleteAccount
  *)

(** def main *)
end

module DeleteSession = struct
  (** lexicon com.atproto.server.deleteSession
  *)

(** def main *)
end

module DescribeServer = struct
  (** lexicon com.atproto.server.describeServer
  *)

(** def main *)
(** def links *)
(** def contact *)
end

module GetAccountInviteCodes = struct
  (** lexicon com.atproto.server.getAccountInviteCodes
  *)

(** def main *)
end

module GetServiceAuth = struct
  (** lexicon com.atproto.server.getServiceAuth
  *)

(** def main *)
end

module GetSession = struct
  (** lexicon com.atproto.server.getSession
  *)

(** def main *)
end

module ListAppPasswords = struct
  (** lexicon com.atproto.server.listAppPasswords
  *)

(** def main *)
(** def appPassword *)
end

module RefreshSession = struct
  (** lexicon com.atproto.server.refreshSession
  *)

(** def main *)
end

module RequestAccountDelete = struct
  (** lexicon com.atproto.server.requestAccountDelete
  *)

(** def main *)
end

module RequestEmailConfirmation = struct
  (** lexicon com.atproto.server.requestEmailConfirmation
  *)

(** def main *)
end

module RequestEmailUpdate = struct
  (** lexicon com.atproto.server.requestEmailUpdate
  *)

(** def main *)
end

module RequestPasswordReset = struct
  (** lexicon com.atproto.server.requestPasswordReset
  *)

(** def main *)
end

module ReserveSigningKey = struct
  (** lexicon com.atproto.server.reserveSigningKey
  *)

(** def main *)
end

module ResetPassword = struct
  (** lexicon com.atproto.server.resetPassword
  *)

(** def main *)
end

module RevokeAppPassword = struct
  (** lexicon com.atproto.server.revokeAppPassword
  *)

(** def main *)
end

module UpdateEmail = struct
  (** lexicon com.atproto.server.updateEmail
  *)

(** def main *)
end
end

module Sync = struct

module Defs = struct
  (** lexicon com.atproto.sync.defs
  *)

(** def hostStatus *)
end

module GetBlob = struct
  (** lexicon com.atproto.sync.getBlob
  *)

(** def main *)
end

module GetBlocks = struct
  (** lexicon com.atproto.sync.getBlocks
  *)

(** def main *)
end

module GetCheckout = struct
  (** lexicon com.atproto.sync.getCheckout
  *)

(** def main *)
end

module GetHead = struct
  (** lexicon com.atproto.sync.getHead
  *)

(** def main *)
end

module GetHostStatus = struct
  (** lexicon com.atproto.sync.getHostStatus
  *)

(** def main *)
end

module GetLatestCommit = struct
  (** lexicon com.atproto.sync.getLatestCommit
  *)

(** def main *)
end

module GetRecord = struct
  (** lexicon com.atproto.sync.getRecord
  *)

(** def main *)
end

module GetRepo = struct
  (** lexicon com.atproto.sync.getRepo
  *)

(** def main *)
end

module GetRepoStatus = struct
  (** lexicon com.atproto.sync.getRepoStatus
  *)

(** def main *)
end

module ListBlobs = struct
  (** lexicon com.atproto.sync.listBlobs
  *)

(** def main *)
end

module ListHosts = struct
  (** lexicon com.atproto.sync.listHosts
  *)

(** def main *)
(** def host *)
end

module ListRepos = struct
  (** lexicon com.atproto.sync.listRepos
  *)

(** def main *)
(** def repo *)
end

module ListReposByCollection = struct
  (** lexicon com.atproto.sync.listReposByCollection
  *)

(** def main *)
(** def repo *)
end

module NotifyOfUpdate = struct
  (** lexicon com.atproto.sync.notifyOfUpdate
  *)

(** def main *)
end

module RequestCrawl = struct
  (** lexicon com.atproto.sync.requestCrawl
  *)

(** def main *)
end

module SubscribeRepos = struct
  (** lexicon com.atproto.sync.subscribeRepos
  *)

(** def main *)
(** def commit *)
(** def sync *)
(** def identity *)
(** def account *)
(** def info *)
(** def repoOp *)
end
end

module Temp = struct

module AddReservedHandle = struct
  (** lexicon com.atproto.temp.addReservedHandle
  *)

(** def main *)
end

module CheckSignupQueue = struct
  (** lexicon com.atproto.temp.checkSignupQueue
  *)

(** def main *)
end

module FetchLabels = struct
  (** lexicon com.atproto.temp.fetchLabels
  *)

(** def main *)
end

module RequestPhoneVerification = struct
  (** lexicon com.atproto.temp.requestPhoneVerification
  *)

(** def main *)
end
end
end
end

module Tools = struct

module Ozone = struct

module Communication = struct

module CreateTemplate = struct
  (** lexicon tools.ozone.communication.createTemplate
  *)

(** def main *)
end

module Defs = struct
  (** lexicon tools.ozone.communication.defs
  *)

(** def templateView *)
end

module DeleteTemplate = struct
  (** lexicon tools.ozone.communication.deleteTemplate
  *)

(** def main *)
end

module ListTemplates = struct
  (** lexicon tools.ozone.communication.listTemplates
  *)

(** def main *)
end

module UpdateTemplate = struct
  (** lexicon tools.ozone.communication.updateTemplate
  *)

(** def main *)
end
end

module Hosting = struct

module GetAccountHistory = struct
  (** lexicon tools.ozone.hosting.getAccountHistory
  *)

(** def main *)
(** def event *)
(** def accountCreated *)
(** def emailUpdated *)
(** def emailConfirmed *)
(** def passwordUpdated *)
(** def handleUpdated *)
end
end

module Moderation = struct

module Defs = struct
  (** lexicon tools.ozone.moderation.defs
  *)

(** def modEventView *)
(** def modEventViewDetail *)
(** def subjectStatusView *)
(** def subjectView *)
(** def accountStats *)
(** def recordsStats *)
(** def subjectReviewState *)
(** def reviewOpen *)
(** def reviewEscalated *)
(** def reviewClosed *)
(** def reviewNone *)
(** def modEventTakedown *)
(** def modEventReverseTakedown *)
(** def modEventResolveAppeal *)
(** def modEventComment *)
(** def modEventReport *)
(** def modEventLabel *)
(** def modEventPriorityScore *)
(** def modEventAcknowledge *)
(** def modEventEscalate *)
(** def modEventMute *)
(** def modEventUnmute *)
(** def modEventMuteReporter *)
(** def modEventUnmuteReporter *)
(** def modEventEmail *)
(** def modEventDivert *)
(** def modEventTag *)
(** def accountEvent *)
(** def identityEvent *)
(** def recordEvent *)
(** def repoView *)
(** def repoViewDetail *)
(** def repoViewNotFound *)
(** def recordView *)
(** def recordViewDetail *)
(** def recordViewNotFound *)
(** def moderation *)
(** def moderationDetail *)
(** def blobView *)
(** def imageDetails *)
(** def videoDetails *)
(** def accountHosting *)
(** def recordHosting *)
(** def reporterStats *)
end

module EmitEvent = struct
  (** lexicon tools.ozone.moderation.emitEvent
  *)

(** def main *)
end

module GetEvent = struct
  (** lexicon tools.ozone.moderation.getEvent
  *)

(** def main *)
end

module GetRecord = struct
  (** lexicon tools.ozone.moderation.getRecord
  *)

(** def main *)
end

module GetRecords = struct
  (** lexicon tools.ozone.moderation.getRecords
  *)

(** def main *)
end

module GetRepo = struct
  (** lexicon tools.ozone.moderation.getRepo
  *)

(** def main *)
end

module GetReporterStats = struct
  (** lexicon tools.ozone.moderation.getReporterStats
  *)

(** def main *)
end

module GetRepos = struct
  (** lexicon tools.ozone.moderation.getRepos
  *)

(** def main *)
end

module GetSubjects = struct
  (** lexicon tools.ozone.moderation.getSubjects
  *)

(** def main *)
end

module QueryEvents = struct
  (** lexicon tools.ozone.moderation.queryEvents
  *)

(** def main *)
end

module QueryStatuses = struct
  (** lexicon tools.ozone.moderation.queryStatuses
  *)

(** def main *)
end

module SearchRepos = struct
  (** lexicon tools.ozone.moderation.searchRepos
  *)

(** def main *)
end
end

module Server = struct

module GetConfig = struct
  (** lexicon tools.ozone.server.getConfig
  *)

(** def main *)
(** def serviceConfig *)
(** def viewerConfig *)
end
end

module Set = struct

module AddValues = struct
  (** lexicon tools.ozone.set.addValues
  *)

(** def main *)
end

module Defs = struct
  (** lexicon tools.ozone.set.defs
  *)

(** def set *)
(** def setView *)
end

module DeleteSet = struct
  (** lexicon tools.ozone.set.deleteSet
  *)

(** def main *)
end

module DeleteValues = struct
  (** lexicon tools.ozone.set.deleteValues
  *)

(** def main *)
end

module GetValues = struct
  (** lexicon tools.ozone.set.getValues
  *)

(** def main *)
end

module QuerySets = struct
  (** lexicon tools.ozone.set.querySets
  *)

(** def main *)
end

module UpsertSet = struct
  (** lexicon tools.ozone.set.upsertSet
  *)

(** def main *)
end
end

module Setting = struct

module Defs = struct
  (** lexicon tools.ozone.setting.defs
  *)

(** def option *)
end

module ListOptions = struct
  (** lexicon tools.ozone.setting.listOptions
  *)

(** def main *)
end

module RemoveOptions = struct
  (** lexicon tools.ozone.setting.removeOptions
  *)

(** def main *)
end

module UpsertOption = struct
  (** lexicon tools.ozone.setting.upsertOption
  *)

(** def main *)
end
end

module Signature = struct

module Defs = struct
  (** lexicon tools.ozone.signature.defs
  *)

(** def sigDetail *)
end

module FindCorrelation = struct
  (** lexicon tools.ozone.signature.findCorrelation
  *)

(** def main *)
end

module FindRelatedAccounts = struct
  (** lexicon tools.ozone.signature.findRelatedAccounts
  *)

(** def main *)
(** def relatedAccount *)
end

module SearchAccounts = struct
  (** lexicon tools.ozone.signature.searchAccounts
  *)

(** def main *)
end
end

module Team = struct

module AddMember = struct
  (** lexicon tools.ozone.team.addMember
  *)

(** def main *)
end

module Defs = struct
  (** lexicon tools.ozone.team.defs
  *)

(** def member *)
(** def roleAdmin *)
(** def roleModerator *)
(** def roleTriage *)
(** def roleVerifier *)
end

module DeleteMember = struct
  (** lexicon tools.ozone.team.deleteMember
  *)

(** def main *)
end

module ListMembers = struct
  (** lexicon tools.ozone.team.listMembers
  *)

(** def main *)
end

module UpdateMember = struct
  (** lexicon tools.ozone.team.updateMember
  *)

(** def main *)
end
end

module Verification = struct

module Defs = struct
  (** lexicon tools.ozone.verification.defs
  *)

(** def verificationView *)
end

module GrantVerifications = struct
  (** lexicon tools.ozone.verification.grantVerifications
  *)

(** def main *)
(** def verificationInput *)
(** def grantError *)
end

module ListVerifications = struct
  (** lexicon tools.ozone.verification.listVerifications
  *)

(** def main *)
end

module RevokeVerifications = struct
  (** lexicon tools.ozone.verification.revokeVerifications
  *)

(** def main *)
(** def revokeError *)
end
end
end
end

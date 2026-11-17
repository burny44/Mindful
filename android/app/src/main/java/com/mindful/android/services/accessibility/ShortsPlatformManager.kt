package com.mindful.android.services.accessibility

import android.content.Context
import android.util.Log
import android.view.accessibility.AccessibilityNodeInfo
import com.mindful.android.AppConstants.FACEBOOK_PACKAGE
import com.mindful.android.AppConstants.INSTAGRAM_PACKAGE
import com.mindful.android.AppConstants.REDDIT_PACKAGE
import com.mindful.android.AppConstants.SNAPCHAT_PACKAGE
import com.mindful.android.AppConstants.VIRTUAL_INSTAGRAM_REELS
import com.mindful.android.AppConstants.VIRTUAL_YOUTUBE_SHORTS
import com.mindful.android.AppConstants.YOUTUBE_CLIENT_PACKAGE_SUFFIX
import com.mindful.android.AppConstants.YOUTUBE_PACKAGE
import com.mindful.android.enums.PlatformFeatures
import com.mindful.android.helpers.storage.SharedPrefsHelper
import com.mindful.android.models.Wellbeing
import org.jetbrains.annotations.Contract


class ShortsPlatformManager(
    private val context: Context,
    private val blockedContentGoBack: () -> Unit,
) {

    /**
     * Returns `true` if Instagram reels should be blocked right now.
     *
     * With a daily reels limit set, reels are blocked once reels were watched for that long
     * today or the shared allowance (if on) is used up. Otherwise only the allowance applies.
     */
    fun isInstagramReelsBlocked(wellbeing: Wellbeing): Boolean {
        if (PlatformFeatures.INSTAGRAM_REELS !in wellbeing.blockedFeatures) return false

        return if (wellbeing.instagramReelsLimitMs > 0) {
            ShortFormUsageTracker.todayMs(context, VIRTUAL_INSTAGRAM_REELS) >=
                    wellbeing.instagramReelsLimitMs || isAllowanceOnAndUsedUp(wellbeing)
        } else {
            isAllowanceUsedUp(wellbeing)
        }
    }

    /**
     * Returns `true` if YouTube shorts with their own daily limit must be blocked: the limit
     * or the shared allowance (if on) is used up.
     */
    private fun isYoutubeShortsLimitReached(wellbeing: Wellbeing): Boolean =
        ShortFormUsageTracker.todayMs(context, VIRTUAL_YOUTUBE_SHORTS) >=
                wellbeing.youtubeShortsLimitMs || isAllowanceOnAndUsedUp(wellbeing)

    /**
     * Returns `true` if blocked short content without its own limit must be blocked now:
     * the shared daily allowance is off (negative) or used up. The allowance counts all
     * short content watched today (measured by [ShortFormUsageTracker]).
     */
    fun isAllowanceUsedUp(wellbeing: Wellbeing): Boolean =
        wellbeing.allowedShortsTimeMs <= 0 || isAllowanceOnAndUsedUp(wellbeing)

    /** Returns `true` if the shared allowance is on and all of it was used today. */
    private fun isAllowanceOnAndUsedUp(wellbeing: Wellbeing): Boolean =
        wellbeing.allowedShortsTimeMs > 0 &&
                ShortFormUsageTracker.allowanceUsedMs(context) >= wellbeing.allowedShortsTimeMs

    /**
     * Checks if a blocked short-form content feature is open and applies restrictions.
     *
     * @param packageName The package name of the current app in focus.
     * @param node The root `AccessibilityNodeInfo` of the current screen.
     * @param wellbeing The user's `WellBeingSettings`, including blocked features and time limits.
     */
    fun blockDistraction(
        packageName: String,
        node: AccessibilityNodeInfo,
        wellbeing: Wellbeing,
    ) {
        // Use default youtube package for unofficial clients too
        val resolvedPackage =
            if (packageName.contains(YOUTUBE_CLIENT_PACKAGE_SUFFIX)) YOUTUBE_PACKAGE
            else packageName

        val blockedFeatures = wellbeing.blockedFeatures

        /// Instagram reels with their own daily limit: allowed until that much reels time
        /// or the shared allowance was used up today.
        if (resolvedPackage == INSTAGRAM_PACKAGE
            && wellbeing.instagramReelsLimitMs > 0
            && PlatformFeatures.INSTAGRAM_REELS in blockedFeatures
            && isInstagramReelsViewerOpen(node)
        ) {
            if (isInstagramReelsBlocked(wellbeing)) blockedContentGoBack.invoke()
            return
        }

        /// Same for YouTube shorts with their own daily limit
        if (resolvedPackage == YOUTUBE_PACKAGE
            && wellbeing.youtubeShortsLimitMs > 0
            && isYoutubeFeatureOpen(node, blockedFeatures)
        ) {
            if (isYoutubeShortsLimitReached(wellbeing)) blockedContentGoBack.invoke()
            return
        }

        /// Check if blocking is enabled for platforms
        val isFeatureOpen = when (resolvedPackage) {
            INSTAGRAM_PACKAGE -> isInstagramFeatureOpen(node, blockedFeatures)
            SNAPCHAT_PACKAGE -> isSnapchatFeatureOpen(node, blockedFeatures)
            FACEBOOK_PACKAGE -> isFacebookFeatureOpen(node, blockedFeatures)
            REDDIT_PACKAGE -> isRedditFeatureOpen(node, blockedFeatures)
            YOUTUBE_PACKAGE -> isYoutubeFeatureOpen(node, blockedFeatures)
            else -> false
        }

        // Time is measured by ShortFormUsageTracker, only enforce the allowance here
        if (isFeatureOpen && isAllowanceUsedUp(wellbeing)) blockedContentGoBack.invoke()
    }

    /**
     * Returns which short form viewer is open in [node]'s window regardless of any blocking
     * settings: [VIRTUAL_INSTAGRAM_REELS], [VIRTUAL_YOUTUBE_SHORTS] or null.
     */
    fun detectShortFormViewer(node: AccessibilityNodeInfo): String? {
        val pkg = node.packageName?.toString() ?: return null
        return when {
            pkg == INSTAGRAM_PACKAGE ->
                if (isInstagramReelsViewerOpen(node)) VIRTUAL_INSTAGRAM_REELS else null

            pkg == YOUTUBE_PACKAGE || pkg.contains(YOUTUBE_CLIENT_PACKAGE_SUFFIX) ->
                if (doesNodeByIdExists(node, "$pkg:id/reel_player_underlay"))
                    VIRTUAL_YOUTUBE_SHORTS else null

            else -> null
        }
    }

    /**
     * Like [detectShortFormViewer], but also returns
     * [ShortFormUsageTracker.OTHER_SHORT_CONTENT] while other blocked short content
     * (Explore, Snapchat, Facebook, Reddit) is open, so it counts towards the allowance.
     */
    fun detectShortContent(node: AccessibilityNodeInfo, wellbeing: Wellbeing): String? {
        detectShortFormViewer(node)?.let { return it }

        val blocked = wellbeing.blockedFeatures
        if (blocked.isEmpty()) return null
        val isOtherOpen = when (node.packageName?.toString()) {
            INSTAGRAM_PACKAGE -> PlatformFeatures.INSTAGRAM_EXPLORE in blocked &&
                    isInstagramFeatureOpen(node, setOf(PlatformFeatures.INSTAGRAM_EXPLORE))

            SNAPCHAT_PACKAGE -> isSnapchatFeatureOpen(node, blocked)
            FACEBOOK_PACKAGE -> isFacebookFeatureOpen(node, blocked)
            REDDIT_PACKAGE -> isRedditFeatureOpen(node, blocked)
            else -> false
        }
        return if (isOtherOpen) ShortFormUsageTracker.OTHER_SHORT_CONTENT else null
    }

    /**
     * Leaves Instagram Reels / YouTube Shorts right away when they are blocked by a focus session
     * or earn-unlock rule. Unlike [blockDistraction] there is no daily allowance.
     *
     * @param focusBlocked Features currently blocked by focus (only reels and shorts).
     * @return `true` if blocked content was open and the user was sent back.
     */
    fun blockFocusedContent(
        packageName: String,
        node: AccessibilityNodeInfo,
        focusBlocked: Set<PlatformFeatures>,
    ): Boolean {
        if (focusBlocked.isEmpty()) return false

        val resolvedPackage =
            if (packageName.contains(YOUTUBE_CLIENT_PACKAGE_SUFFIX)) YOUTUBE_PACKAGE
            else packageName

        val isOpen = when (resolvedPackage) {
            INSTAGRAM_PACKAGE -> PlatformFeatures.INSTAGRAM_REELS in focusBlocked
                    && isInstagramReelsViewerOpen(node)

            YOUTUBE_PACKAGE -> isYoutubeFeatureOpen(node, focusBlocked)
            else -> false
        }

        if (isOpen) blockedContentGoBack.invoke()
        return isOpen
    }

    /**
     * Checks if a short-form content website is open in the browser based on WellBeingSettings.
     *
     * @param wellbeing The WellBeingSettings model indicating which platforms are blocked.
     * @param url      The URL text from the browser.
     * @return True if a blocked short-form content website is open, false otherwise.
     */
    fun checkAndBlockShortsOnBrowser(wellbeing: Wellbeing, url: String): Boolean {
        when {
            PlatformFeatures.INSTAGRAM_REELS in wellbeing.blockedFeatures
                    && doesUrlContainsAnyElement(mInstaReelUrls, url) -> true

            PlatformFeatures.INSTAGRAM_EXPLORE in wellbeing.blockedFeatures
                    && doesUrlContainsAnyElement(mInstaExploreUrls, url) -> true

            PlatformFeatures.YOUTUBE_SHORTS in wellbeing.blockedFeatures
                    && doesUrlContainsAnyElement(mYtShortUrls, url) -> true

            PlatformFeatures.FACEBOOK_REELS in wellbeing.blockedFeatures
                    && doesUrlContainsAnyElement(mFbReelUrls, url) -> true

            PlatformFeatures.SNAPCHAT_SPOTLIGHT in wellbeing.blockedFeatures
                    && doesUrlContainsAnyElement(mSnapSpotlightUrls, url) -> true

            PlatformFeatures.SNAPCHAT_DISCOVER in wellbeing.blockedFeatures
                    && doesUrlContainsAnyElement(mSnapDiscoverUrls, url) -> true

            else -> false
        }.let { isOpen ->
            if (isOpen) {
                // Count it towards the allowance, leave once it's used up
                ShortFormUsageTracker.observe(context, ShortFormUsageTracker.OTHER_SHORT_CONTENT)
                if (isAllowanceUsedUp(wellbeing)) blockedContentGoBack.invoke()
                return true
            }
        }

        // Browser left the short content
        if (ShortFormUsageTracker.watching != null) ShortFormUsageTracker.observe(context, null)
        return false
    }

    companion object {
        private const val TAG = "Mindful.ShortsPlatformManager"

        // Possible URLs of different short-form content platforms
        private val mInstaReelUrls = listOf("instagram.com/reels/", "m.instagram.com/reels/")
        private val mInstaExploreUrls = listOf("instagram.com/explore/", "m.instagram.com/explore/")

        private val mYtShortUrls = listOf("youtube.com/shorts/", "m.youtube.com/shorts/")
        private val mFbReelUrls = listOf("facebook.com/reel/", "m.facebook.com/reel/")
        private val mSnapSpotlightUrls = listOf(
            "snapchat.com/spotlight/",
            "m.snapchat.com/spotlight/",
            "web.snapchat.com/spotlight/"
        )
        private val mSnapDiscoverUrls = listOf(
            "snapchat.com/discover/",
            "m.snapchat.com/discover/",
            "web.snapchat.com/discover/"
        )

        private val mFbNodeTexts = listOf("Add a comment", "कमेंट जोड़ें…")


        /**
         * Checks if Instagram features (Reels or Search Feed) are open.
         */
        private fun isInstagramFeatureOpen(
            node: AccessibilityNodeInfo,
            blockedFeatures: Set<PlatformFeatures>,
        ): Boolean {
            return when {
                PlatformFeatures.INSTAGRAM_REELS in blockedFeatures &&
                        isInstagramReelsViewerOpen(node)
                -> true

                PlatformFeatures.INSTAGRAM_EXPLORE in blockedFeatures &&
                        doesNodeByIdExists(node, "com.instagram.android:id/action_bar_search_edit_text")
                -> true

                else -> false
            }
        }

        /**
         * Checks if the user is actually watching Reels, without reacting to reels/videos
         * that are shown inside the home feed.
         *
         * Instagram uses the same `clips_video_container` for reels inside the home feed and
         * for the dedicated Reels viewer, so that view alone can't be used. Instead:
         * 1. Reels tab is open: the `clips_tab` button in the bottom bar is selected.
         * 2. Full-screen reel viewer (e.g. a reel opened from a DM or a profile): a reel video
         *    is on screen and the bottom tab bar is gone. The home feed always shows the
         *    tab bar with the feed tab selected, so feed videos are not affected.
         */
        private fun isInstagramReelsViewerOpen(node: AccessibilityNodeInfo): Boolean {
            val reelsTabs = node.findAccessibilityNodeInfosByViewId(INSTA_REELS_TAB_ID)
            if (reelsTabs.any { it.isSelected && it.isVisibleToUser }) return true

            val isReelVideoOnScreen = node
                .findAccessibilityNodeInfosByViewId(INSTA_REEL_VIDEO_ID)
                .any { it.isVisibleToUser }
            if (!isReelVideoOnScreen) return false

            val isTabBarVisible = reelsTabs.any { it.isVisibleToUser } ||
                    node.findAccessibilityNodeInfosByViewId(INSTA_FEED_TAB_ID)
                        .any { it.isVisibleToUser }

            return !isTabBarVisible
        }

        private const val INSTA_REELS_TAB_ID = InstagramReelsLock.REELS_TAB_ID
        private const val INSTA_FEED_TAB_ID = "com.instagram.android:id/feed_tab"
        private const val INSTA_REEL_VIDEO_ID = "com.instagram.android:id/clips_video_container"

        /**
         * Checks if YouTube Shorts is currently open.
         */
        private fun isYoutubeFeatureOpen(
            node: AccessibilityNodeInfo,
            blockedFeatures: Set<PlatformFeatures>,
        ): Boolean {
            return PlatformFeatures.YOUTUBE_SHORTS in blockedFeatures &&
                    doesNodeByIdExists(node, "${node.packageName}:id/reel_player_underlay")
        }

        /**
         * Checks if Snapchat Spotlight or Discover is open.
         */
        private fun isSnapchatFeatureOpen(
            node: AccessibilityNodeInfo,
            blockedFeatures: Set<PlatformFeatures>,
        ): Boolean {

            return when {
                PlatformFeatures.SNAPCHAT_SPOTLIGHT in blockedFeatures &&
                        doesNodeByIdExists(
                            node,
                            "com.snapchat.android:id/spotlight_card_static_thumbnail"
                        )
                -> true

                PlatformFeatures.SNAPCHAT_DISCOVER in blockedFeatures &&
                        doesNodeByIdExists(node, "com.snapchat.android:id/df_large_story")
                -> true

                else -> false
            }
        }

        /**
         * Checks if Facebook Reels is currently open.
         */
        private fun isFacebookFeatureOpen(
            node: AccessibilityNodeInfo,
            blockedFeatures: Set<PlatformFeatures>,
        ): Boolean {
            // TODO: Add more string translated from different languages for the node text
            //  as user may have set different language for facebook app

            if (PlatformFeatures.FACEBOOK_REELS in blockedFeatures) {
                for (text in mFbNodeTexts) {
                    if (node.findAccessibilityNodeInfosByText(text).isNotEmpty()) {
                        return true
                    }
                }
            }

            return false
        }

        /**
         * Checks if Reddit Shorts is open.
         */
        private fun isRedditFeatureOpen(
            node: AccessibilityNodeInfo,
            blockedFeatures: Set<PlatformFeatures>,
        ): Boolean {
            return PlatformFeatures.REDDIT_SHORTS in blockedFeatures && node.viewIdResourceName == "feed_vertical_pager"
        }

        /**
         * Checks if the URL contains any of the elements from the provided list of URLs.
         *
         * @param urlList The list of URL substrings to check against.
         * @param url     The URL to check.
         * @return True if the URL contains any element from the list, false otherwise.
         */
        @Contract(pure = true)
        private fun doesUrlContainsAnyElement(urlList: List<String>, url: String): Boolean {
            for (element in urlList) {
                if (url.contains(element)) return true
            }
            return false
        }

        /**
         * Checks whether an AccessibilityNodeInfo with the specified view ID exists as a descendant
         * of the given node.
         *
         * @param node   The parent AccessibilityNodeInfo to search within. This parameter must not be null.
         * @param viewId The ID of the view to look for.
         * @return `true` if a node with the specified view ID exists, `false` otherwise.
         */
        private fun doesNodeByIdExists(node: AccessibilityNodeInfo, viewId: String): Boolean {
            return node.findAccessibilityNodeInfosByViewId(viewId).isNotEmpty()
        }
    }
}
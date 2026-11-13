package com.mindful.android.models

import com.mindful.android.enums.PlatformFeatures
import com.mindful.android.utils.JsonUtils
import org.json.JSONObject

/**
 * Represents the wellbeing configuration for the application.
 */
data class Wellbeing(

    /**
     * Whether adult (NSFW) sites are blocked.
     */
    val blockNsfwSites: Boolean = false,

    /**
     * Allowed time for short-form content in ms.
     */
    val allowedShortsTimeMs: Long = DEFAULT_SHORTS_TIME_SEC * 1000L,

    /**
     * If greater than 0, Instagram reels are only blocked after Instagram was used for
     * this long today (in ms). If 0, reels follow [allowedShortsTimeMs] like other platforms.
     */
    val instagramUsageLimitMs: Long = 0L,

    /**
     * Set of blocked platform features.
     */
    val blockedFeatures: Set<PlatformFeatures> = emptySet(),

    /**
     * Set of blocked website hosts.
     */
    val blockedWebsites: Set<String> = emptySet(),

    /**
     * Set of NSFW website hosts.
     */
    val nsfwWebsites: Set<String> = emptySet(),
) {
    companion object {
        private const val DEFAULT_SHORTS_TIME_SEC = 30 * 60

        /**
         * Builds a [Wellbeing] object from a JSON string (typically from Flutter).
         */
        fun fromJson(json: String): Wellbeing {
            val jsonObject = JSONObject(json)

            return Wellbeing(
                allowedShortsTimeMs = jsonObject.optInt(
                    "allowedShortsTimeSec",
                    DEFAULT_SHORTS_TIME_SEC
                ) * 1000L,
                instagramUsageLimitMs = jsonObject.optInt("instagramUsageLimitSec", 0) * 1000L,
                blockedFeatures = JsonUtils.parseStringSet(
                    jsonObject.optJSONArray("blockedFeatures")?.toString()
                ).mapIndexedNotNull { i, e -> PlatformFeatures.fromName(e) }.toSet(),
                blockNsfwSites = jsonObject.optBoolean("blockNsfwSites", false),
                blockedWebsites = JsonUtils.parseStringSet(
                    jsonObject.optJSONArray("blockedWebsites")?.toString()
                ),
                nsfwWebsites = JsonUtils.parseStringSet(
                    jsonObject.optJSONArray("nsfwWebsites")?.toString()
                ),
            )
        }
    }
}

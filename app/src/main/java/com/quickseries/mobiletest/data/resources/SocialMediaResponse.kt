package com.quickseries.mobiletest.data.resources

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

/**
 * Response item containing informations the social medias links.
 */
@JsonClass(generateAdapter = true)
data class SocialMediaResponse(
    @Json(name = "youtubeChannel")
    val youtubes: List<String> = emptyList(),
    @Json(name = "twitter")
    val twitters: List<String> = emptyList(),
    @Json(name = "facebook")
    val facebooks: List<String> = emptyList()
)
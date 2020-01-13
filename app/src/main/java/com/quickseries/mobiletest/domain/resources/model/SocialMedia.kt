package com.quickseries.mobiletest.domain.resources.model

import com.quickseries.mobiletest.data.resources.SocialMediaResponse
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

data class SocialMedia(
    val youtube: String? = null,
    val twitter: String? = null,
    val facebook: String? = null
)

suspend fun SocialMediaResponse.toSocialMedia() = withContext(Dispatchers.Default) {
    SocialMedia(
        youtubes.firstOrNull(),
        twitters.firstOrNull(),
        facebooks.firstOrNull()
    )
}
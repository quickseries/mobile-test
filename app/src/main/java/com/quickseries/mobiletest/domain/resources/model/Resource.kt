package com.quickseries.mobiletest.domain.resources.model

import com.quickseries.mobiletest.data.resources.ResourceResponse
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.util.*

data class Resource(
    val title: String,
    val description: String,
    val photoUrl: String,
    val lastModified: Date? = null,
    val contactInfo: ContactInfo,
    val addresses: List<Address>,
    val bizHours: BizHours,
    val socialMedia: SocialMedia
)

suspend fun List<ResourceResponse>.toResources() = withContext(Dispatchers.Default) {
    map { resourceResponse ->
        Resource(
            resourceResponse.title.orEmpty(),
            resourceResponse.description.orEmpty(),
            resourceResponse.photoUrl.orEmpty(),
            resourceResponse.updatedAt ?: resourceResponse.createdAt,
            resourceResponse.contactInfo.toContactInfo(),
            resourceResponse.addresses.toAddresses(),
            resourceResponse.bizHours.toBizHours(),
            resourceResponse.socialMedia.toSocialMedia()
        )
    }
}
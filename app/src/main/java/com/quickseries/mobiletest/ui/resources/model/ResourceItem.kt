package com.quickseries.mobiletest.ui.resources.model

import coil.Coil
import coil.api.get
import com.quickseries.mobiletest.domain.resources.model.Address
import com.quickseries.mobiletest.domain.resources.model.BizHours
import com.quickseries.mobiletest.domain.resources.model.Resource
import com.quickseries.mobiletest.domain.resources.model.SocialMedia
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

data class ResourceItem(
    val resourceInfo: ResourceInfo,
    val contactInfos: List<ContactInfoItem>,
    val addresses: List<Address>,
    val bizHours: BizHours,
    val socialMedia: SocialMedia
)

suspend fun List<Resource>.toResourcesItems() = withContext(Dispatchers.Default) {
    map { resource ->
        val resourceInfo = ResourceInfo(
            resource.title,
            resource.description,
            Coil.get(resource.photoUrl),
            resource.lastModified.toString()
        )

        ResourceItem(
            resourceInfo,
            resource.contactInfo.toContactInfosItems(),
            resource.addresses.filter { !it.isEmpty() },
            resource.bizHours,
            resource.socialMedia
        )
    }
}
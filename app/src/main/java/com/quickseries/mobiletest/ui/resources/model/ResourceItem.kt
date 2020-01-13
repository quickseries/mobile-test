package com.quickseries.mobiletest.ui.resources.model

import coil.Coil
import coil.api.get
import com.quickseries.mobiletest.domain.resources.model.Address
import com.quickseries.mobiletest.domain.resources.model.BizHours
import com.quickseries.mobiletest.domain.resources.model.ContactInfo
import com.quickseries.mobiletest.domain.resources.model.Resource
import com.quickseries.mobiletest.domain.resources.model.SocialMedia
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

data class ResourceItem(
    val resourceInfo: ResourceInfo,
    val contactInfo: ContactInfo?,
    val address: List<Address>,
    val bizHours: BizHours?,
    val socialMedia: SocialMedia?
)

suspend fun List<Resource>.toResourcesItems() = withContext(Dispatchers.Default) {
    map { resource ->
        val resourceInfo = ResourceInfo(
            resource.title,
            resource.description,
            Coil.get(resource.photoUrl),
            resource.lastModified.toString()
        )
        val contactInfo = resource.contactInfo.let {
                if (it.website == null
                    && it.email == null
                    && it.phoneNmber == null
                    && it.faxNumber == null
                    && it.tollFree == null) null
            else it
        }
        val bizHours = resource.bizHours.let {
            if (it.sunday == null
                && it.monday == null
                && it.tuesday == null
                && it.thursday == null
                && it.friday == null
                && it.saturday == null) null
            else it
        }
        val socialMedia = resource.socialMedia.let {
            if (it.youtube == null
                && it.twitter == null
                && it.facebook == null) null
            else it
        }

        ResourceItem(
            resourceInfo,
            contactInfo,
            resource.address,
            bizHours,
            socialMedia
        )
    }
}
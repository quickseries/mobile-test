package com.quickseries.mobiletest.data.resources

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass
import java.util.*

/**
 * Response item containing informations about a resource.
 */
@JsonClass(generateAdapter = true)
data class ResourceResponse(
    @Json(name = "_id")
    val id: String? = null,
    @Json(name = "created_at")
    val createdAt: Date? = null,
    @Json(name = "updated_at")
    val updatedAt: Date? = null,
    @Json(name = "slug")
    val slug: String? = null,
    @Json(name = "category_eid")
    val categoryEid: String? = null,
    @Json(name = "eid")
    val eid: String? = null,
    @Json(name = "title")
    val title: String? = null,
    @Json(name = "description")
    val description: String? = null,
    @Json(name = "__v")
    val v: Int? = null,
    @Json(name = "_active")
    val active: Boolean = false,
    @Json(name = "photo")
    val photoUrl: String? = null,
    @Json(name = "contactInfo")
    val contactInfo: ContactInfoResponse = ContactInfoResponse(),
    @Json(name = "addresses")
    val addresses: List<AddressResponse> = emptyList(),
    @Json(name = "bizHours")
    val bizHours: BizHoursResponse = BizHoursResponse(),
    @Json(name = "socialMedia")
    val socialMedia: SocialMediaResponse = SocialMediaResponse()
)
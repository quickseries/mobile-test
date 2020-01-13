package com.quickseries.mobiletest.data.resources

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

/**
 * Response item containing informations about a contact information.
 */
@JsonClass(generateAdapter = true)
data class ContactInfoResponse(
    @Json(name = "website")
    val websites: List<String> = emptyList(),
    @Json(name = "email")
    val emails: List<String> = emptyList(),
    @Json(name = "phoneNumber")
    val phoneNumbers: List<String> = emptyList(),
    @Json(name = "faxNumber")
    val faxNumbers: List<String> = emptyList(),
    @Json(name = "tollFree")
    val tollFrees: List<String> = emptyList()
)
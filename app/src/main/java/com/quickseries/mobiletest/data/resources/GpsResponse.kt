package com.quickseries.mobiletest.data.resources

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

/**
 * Response item containing informations about a position.
 */
@JsonClass(generateAdapter = true)
data class GpsResponse(
    @Json(name = "latitude")
    val latitude: String? = null,
    @Json(name = "longitude")
    val longitude: String? = null
)
package com.quickseries.mobiletest.data.resources

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

/**
 * Response item containing informations about an address.
 */
@JsonClass(generateAdapter = true)
data class AddressResponse(
    @Json(name = "address1")
    val address1: String? = null,
    @Json(name = "label")
    val label: String? = null,
    @Json(name = "zipCode")
    val zipCode: String? = null,
    @Json(name = "city")
    val city: String? = null,
    @Json(name = "state")
    val state: String? = null,
    @Json(name = "country")
    val country: String? = null,
    @Json(name = "gps")
    val gps: GpsResponse = GpsResponse()
)
package com.quickseries.mobiletest.data.resources

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

/**
 * Response item containing informations about a business hours of a certain day.
 */
@JsonClass(generateAdapter = true)
data class BizDayHoursResponse(
    @Json(name = "from")
    val from: String? = null,
    @Json(name = "to")
    val to: String? = null
)
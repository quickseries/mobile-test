package com.quickseries.mobiletest.data.resources

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass

/**
 * Response item containing informations about business hours.
 */
@JsonClass(generateAdapter = true)
data class BizHoursResponse(
    @Json(name = "sunday")
    val sunday: BizDayHoursResponse? = null,
    @Json(name = "monday")
    val monday: BizDayHoursResponse? = null,
    @Json(name = "tuesday")
    val tuesday: BizDayHoursResponse? = null,
    @Json(name = "wednesday")
    val wednesday: BizDayHoursResponse? = null,
    @Json(name = "thursday")
    val thursday: BizDayHoursResponse? = null,
    @Json(name = "friday")
    val friday: BizDayHoursResponse? = null,
    @Json(name = "saturday")
    val saturday: BizDayHoursResponse? = null
)
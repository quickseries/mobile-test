package com.quickseries.quickseriesapp.network.api.model

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.jive.android.contactsv2.OpenClassOnDebug


/**
 * ResBizHours model
 * @constructor ResBizHours
 */
@OpenClassOnDebug
@JsonIgnoreProperties(ignoreUnknown = true)
data class ResBizHours(
    var sunday: Time? = null,
    var monday: Time? = null,
    var tuesday: Time? = null,
    var wednesday: Time? = null,
    var thursday: Time? = null,
    var friday: Time? = null,
    var saturday: Time? = null
)


/**
 * Time model
 * @constructor Time
 */
@JsonIgnoreProperties(ignoreUnknown = true)
data class Time(
    var from: String? = "",
    var to: String? = ""
)

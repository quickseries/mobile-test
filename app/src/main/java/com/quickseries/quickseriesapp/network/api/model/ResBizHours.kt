package com.quickseries.quickseriesapp.network.api.model

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.annotation.JsonProperty
import com.jive.android.contactsv2.OpenClassOnDebug


/**
 * This is the list of Address for particular Restaurant
 * @constructor V4AddressBook
 */
@OpenClassOnDebug
@JsonIgnoreProperties(ignoreUnknown = true)
data class ResBizHours(
    var sunday: Time? =null,
    var monday: Time? =null,
    var tuesday: Time? =null,
    var wednesday: Time? =null,
    var thursday: Time? =null,
    var friday: Time? =null,
    var saturday: Time? =null
)


@JsonIgnoreProperties(ignoreUnknown = true)
data class Time(
    var from: String? = "",
    var to: String? = ""
)

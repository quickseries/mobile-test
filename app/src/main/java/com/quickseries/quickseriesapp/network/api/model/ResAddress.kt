package com.quickseries.quickseriesapp.network.api.model

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.jive.android.contactsv2.OpenClassOnDebug


/**
 * address model
 * @constructor ResAddress
 */
@OpenClassOnDebug
@JsonIgnoreProperties(ignoreUnknown = true)
data class ResAddress(
    var address1: String = "",
    var label: String? = "",
    var zipCode: String? = "",
    var city: String? = "",
    var state: String? = "",
    var country: String? = "",
    var gps: Gps? = null
)


/**
 * Gps Model
 *  @constructor Gps
 *
 */
@JsonIgnoreProperties(ignoreUnknown = true)
data class Gps(
    var latitude: String? = "",
    var longitude: String? = ""
)
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
 * This is addressbook api response class
 *  @constructor V4AddressBookResponse
 *
 */
@JsonIgnoreProperties(ignoreUnknown = true)
data class Gps(
    var latitude: String? = "",
    var longitude: String? = ""
)
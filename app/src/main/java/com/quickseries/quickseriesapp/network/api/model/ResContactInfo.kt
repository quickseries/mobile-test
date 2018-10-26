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
data class ResContactInfo(
    var website: List<String> = emptyList(),
    var email: List<String> = emptyList(),
    var phoneNumber: List<String> = emptyList(),
    var faxNumber: List<String> = emptyList(),
    var tollFree: List<String> = emptyList()
)

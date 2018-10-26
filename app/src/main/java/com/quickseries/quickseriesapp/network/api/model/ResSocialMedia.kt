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
data class ResSocialMedia(
    var youtubeChannel: List<String> = emptyList(),
    var twitter: List<String> = emptyList(),
    var facebook: List<String> = emptyList()
)

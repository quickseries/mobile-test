package com.quickseries.quickseriesapp.network.api.model

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.jive.android.contactsv2.OpenClassOnDebug


/**
 * ResSocialMedia model
 * @constructor ResSocialMedia
 */
@OpenClassOnDebug
@JsonIgnoreProperties(ignoreUnknown = true)
data class ResSocialMedia(
    var youtubeChannel: List<String> = emptyList(),
    var twitter: List<String> = emptyList(),
    var facebook: List<String> = emptyList()
)

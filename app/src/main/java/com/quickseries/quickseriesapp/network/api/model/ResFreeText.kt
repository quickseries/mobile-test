package com.quickseries.quickseriesapp.network.api.model

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.jive.android.contactsv2.OpenClassOnDebug


/**
 * ResFreeText model
 * @constructor ResFreeText
 */
@OpenClassOnDebug
@JsonIgnoreProperties(ignoreUnknown = true)
data class ResFreeText(
    var text: String? = ""
)

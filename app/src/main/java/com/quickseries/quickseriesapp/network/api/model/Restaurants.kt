package com.quickseries.quickseriesapp.network.api.model

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.annotation.JsonProperty

/**
 *  Restaurants  category details model
 *  @constructor Restaurants
 *
 */
@JsonIgnoreProperties(ignoreUnknown = true)
data class Restaurants(
    @field:JsonProperty("_id")
    var restaurantsId: String = "",
    var slug: String? = "",
    var eid: String? = "",
    var title: String? = "",
    var description: String? = "",
    var category_eid: String? = "",
    var photo: String? = "",
    var __v: Int = 0,
    var _active: Boolean = false,
    var created_at: String? = "",
    var updated_at: String? = "",
    @field:JsonProperty("addresses")
    var addressList: List<ResAddress> = emptyList(),
    var contactInfo: ResContactInfo? = null,
    var freeText: List<ResFreeText> = emptyList(),
    var bizHours: ResBizHours? = null,
    var socialMedia: ResSocialMedia? = null

)
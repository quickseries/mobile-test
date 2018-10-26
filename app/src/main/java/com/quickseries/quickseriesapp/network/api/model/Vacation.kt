package com.quickseries.quickseriesapp.network.api.model

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.annotation.JsonProperty

/**
 *  Vacation category details model
 *  @constructor Vacation
 *
 */
@JsonIgnoreProperties(ignoreUnknown = true)
data class Vacation(
    @field:JsonProperty("_id")
    var vacationId: String = "",
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
    var contactInfo: List<ResContactInfo>? = null,
    var freeText: List<ResFreeText>? = null,
    var bizHours: List<ResBizHours>? = null,
    var socialMedia: List<ResSocialMedia>? = null

)
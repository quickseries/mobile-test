package com.quickseries.quickseriesapp.network.api.model

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.annotation.JsonProperty

/**
 *  Categories model
 *  @constructor Categories
 *
 */
@JsonIgnoreProperties(ignoreUnknown = true)
data class Categories(
    @field:JsonProperty("_id")
    var categoryId: String = "",
    var updated_at: String? = "",
    var slug: String? = "",
    var custom_module_eid: String? = "",
    var eid: String? = "",
    var title: String? = "",
    var description: String? = "",
    var __v: Int = 0,
    var _active: Boolean = false,
    var created_at: String? = ""
)
package com.quickseries.mobiletest.data.categories

import com.squareup.moshi.Json
import com.squareup.moshi.JsonClass
import java.util.*

/**
 * Response item containing informations about a category.
 */
@JsonClass(generateAdapter = true)
data class CategoryResponse(
    @Json(name = "_id")
    val id: String? = null,
    @Json(name = "updated_at")
    val updatedAt: Date? = null,
    @Json(name = "slug")
    val slug: String? = null,
    @Json(name = "custom_module_eid")
    val customModuleEid: String? = null,
    @Json(name = "eid")
    val eid: String? = null,
    @Json(name = "title")
    val title: String? = null,
    @Json(name = "description")
    val description: String? = null,
    @Json(name = "__v")
    val v: Int? = null,
    @Json(name = "_active")
    val active: Boolean = false,
    @Json(name = "created_at")
    val createdAt: Date? = null
)
package com.mvckx.elistique.data

import com.google.gson.annotations.SerializedName

data class RepCategory(

    @field:SerializedName("eid")
    val eid: String? = null,

    @field:SerializedName("updated_at")
    val updatedAt: String? = null,

    @field:SerializedName("__v")
    val V: Int? = null,

    @field:SerializedName("description")
    val description: String? = null,

    @field:SerializedName("created_at")
    val createdAt: String? = null,

    @field:SerializedName("_active")
    val active: Boolean? = null,

    @field:SerializedName("_id")
    val id: String? = null,

    @field:SerializedName("title")
    val title: String? = null,

    @field:SerializedName("slug")
    val slug: String? = null,

    @field:SerializedName("custom_module_eid")
    val customModuleEid: String? = null
)
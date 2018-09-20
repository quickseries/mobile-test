package com.quickseries.codetest.model

import com.google.gson.annotations.SerializedName

data class Categorie(
        @SerializedName("_id") val id: String,
        @SerializedName("updated_at") val updatedAt: String? = null,
        @SerializedName("slug") val slug: String,
        @SerializedName("custom_module_eid") val customModuleEid: String? = null,
        @SerializedName("eid") val eid: String? = null,
        @SerializedName("title") val title: String? = null,
        @SerializedName("description") val description: String? = null,
        @SerializedName("__v") val v: Int? = null,
        @SerializedName("_active") val active: Boolean? = null,
        @SerializedName("created_at") val createdAt: String? = null
)
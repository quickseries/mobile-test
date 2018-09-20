package com.quickseries.codetest.model

import com.google.gson.annotations.SerializedName
import java.io.Serializable

data class Resource(
        @SerializedName("_id") val id: String,
        @SerializedName("slug") val slug: String,
        @SerializedName("eid") val eid: String? = null,
        @SerializedName("title") val title: String,
        @SerializedName("description") val description: String? = null,
        @SerializedName("category_eid") val categoryEid: String? = null,
        @SerializedName("__v") val v: Int? = null,
        @SerializedName("photo") val photo: String? = null,
        @SerializedName("_active") val active: Boolean? = null,
        @SerializedName("updated_at") val updatedAt: String? = null,
        @SerializedName("created_at") val createdAt: String? = null,
        @SerializedName("contactInfo") val contactInfo: ContactInfo? = null,
        @SerializedName("addresses") val addresses: List<Address>? = emptyList()
) : Serializable

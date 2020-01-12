package com.ztd.interview_test.infrustructure.data.models

import com.google.gson.annotations.SerializedName
import com.ztd.interview_test.infrustructure.data.models.restaurant.Gps

data class AddressesItem(
    @SerializedName("zipCode")
    val zipCode: String? = null,

    @SerializedName("country")
    val country: String? = null,

    @SerializedName("city")
    val city: String? = null,

    @SerializedName("address1")
    val address1: String? = null,

    @SerializedName("label")
    val label: String? = null,

    @SerializedName("state")
    val state: String? = null,

    @SerializedName("gps")
    val gps: Gps? = null
)
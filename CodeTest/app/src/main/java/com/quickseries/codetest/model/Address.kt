package com.quickseries.codetest.model

import com.google.gson.annotations.SerializedName
import java.io.Serializable


data class Address(
        @SerializedName("label") val label: String,
        @SerializedName("address1") val address1: String,
        @SerializedName("city") val city: String,
        @SerializedName("zipCode") val zipCode: String,
        @SerializedName("state") val state: String,
        @SerializedName("country") val country: String
): Serializable
package com.android.kotlin.model

import com.google.gson.annotations.SerializedName

data class BitcoinPriceItem(
        @SerializedName("status") var status: String? = null,
        @SerializedName("name") var name: String? = null,
        @SerializedName("unit") var unit: String? = null,
        @SerializedName("period") var period: String? = null,
        @SerializedName("description") var description: String? = null,
        @SerializedName("values") var values: List<Value>? = null
)
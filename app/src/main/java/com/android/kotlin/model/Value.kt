package com.android.kotlin.model

import com.google.gson.annotations.SerializedName

data class Value(
        @SerializedName("x") var x: Int? = null,
        @SerializedName("y") var y: Double? = null
)
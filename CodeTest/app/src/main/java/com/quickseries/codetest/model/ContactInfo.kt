package com.quickseries.codetest.model

import com.google.gson.annotations.SerializedName
import java.io.Serializable

data class ContactInfo(
        @SerializedName("website") val website: List<String>,
        @SerializedName("email") val email: List<String>,
        @SerializedName("phoneNumber") val phoneNumber: List<String>
): Serializable {
    companion object {
        val PHONE = 1
        val WEBSITE = 2
        val EMAIL = 3
    }
}
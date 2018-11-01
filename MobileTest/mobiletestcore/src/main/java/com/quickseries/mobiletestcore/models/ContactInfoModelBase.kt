package com.quickseries.mobiletestcore.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

open class ContactInfoModelBase {
    @SerializedName("website")
    @Expose
    var website = mutableListOf<String>()

    @SerializedName("email")
    @Expose
    var email = mutableListOf<String>()

    @SerializedName("faxNumber")
    @Expose
    var faxNumber = mutableListOf<String>()

    @SerializedName("tollFree")
    @Expose
    var tollFree = mutableListOf<String>()

    @SerializedName("phoneNumber")
    @Expose
    var phoneNumber = mutableListOf<String>()
}
package com.quickseries.mobiletestcore.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

open class AddressModelBase {
    @SerializedName("address1")
    @Expose
    var address1: String = ""

    @SerializedName("address2")
    @Expose
    var address2: String? = null

    @SerializedName("city")
    @Expose
    var city: String? = null

    @SerializedName("state")
    @Expose
    var state: String? = null

    @SerializedName("zipCode")
    @Expose
    var zipCode: String? = null

    @SerializedName("country")
    @Expose
    var country: String? = null

    @SerializedName("label")
    @Expose
    var label: String = ""

    @SerializedName("gps")
    @Expose
    var gps: GpsModelBase? = null
}
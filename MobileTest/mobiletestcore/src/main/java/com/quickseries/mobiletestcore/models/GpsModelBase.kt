package com.quickseries.mobiletestcore.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

class GpsModelBase {
    @SerializedName("latitude")
    @Expose
    var latitude: String = ""

    @SerializedName("longitude")
    @Expose
    var longitude: String = ""
}
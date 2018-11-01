package com.quickseries.mobiletestcore.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

open class BusinessHoursRangeModelBase {
    @SerializedName("from")
    @Expose
    var from: String = ""

    @SerializedName("to")
    @Expose
    var to: String = ""
}
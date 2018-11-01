package com.quickseries.mobiletestcore.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

open class BusinessHoursModelBase {
    @SerializedName("sunday")
    @Expose
    var sunday: BusinessHoursRangeModelBase? = null

    @SerializedName("monday")
    @Expose
    var monday: BusinessHoursRangeModelBase? = null

    @SerializedName("tuesday")
    @Expose
    var tuesday: BusinessHoursRangeModelBase? = null

    @SerializedName("wednesday")
    @Expose
    var wednesday: BusinessHoursRangeModelBase? = null

    @SerializedName("thursday")
    @Expose
    var thursday: BusinessHoursRangeModelBase? = null

    @SerializedName("friday")
    @Expose
    var friday: BusinessHoursRangeModelBase? = null

    @SerializedName("saturday")
    @Expose
    var saturday: BusinessHoursRangeModelBase? = null
}
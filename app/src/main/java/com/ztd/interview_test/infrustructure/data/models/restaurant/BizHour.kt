package com.ztd.interview_test.infrustructure.data.models.restaurant

import com.google.gson.annotations.SerializedName

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/13/2020.
 */
data class BizHour (
    @SerializedName("from")
    var fromTime : String,
    @SerializedName("to")
    var toTime : String
)
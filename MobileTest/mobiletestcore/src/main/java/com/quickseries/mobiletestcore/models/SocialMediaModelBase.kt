package com.quickseries.mobiletestcore.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

open class SocialMediaModelBase {
    @SerializedName("youtubeChannel")
    @Expose
    var youtubeChannel = mutableListOf<String>()

    @SerializedName("twitter")
    @Expose
    var twitter = mutableListOf<String>()

    @SerializedName("facebook")
    @Expose
    var facebook = mutableListOf<String>()
}
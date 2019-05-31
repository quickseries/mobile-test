package com.mohamadk.quickseries.pages.gride.items.places

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import kotlinx.android.parcel.Parcelize

@Parcelize
class SocialMedia (
    @SerializedName("youtubeChannel")
    val youtubeChannel:List<String>,
    @SerializedName("twitter")
    val twitter:List<String>,
    @SerializedName("facebook")
    val facebook:List<String>
):Parcelable {

}

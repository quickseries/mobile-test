package com.mohamadk.quickseries.pages.detail.items.social

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.R
import kotlinx.android.parcel.Parcelize

@Parcelize
class ItemSocial(
    @SerializedName("youtubeChannel")
    val youtubeChannel: String?,
    @SerializedName("twitter")
    val twitter: String?,
    @SerializedName("facebook")
    val facebook: String?
) : BaseModel
    , Parcelable {
    override fun defaultResLayout(position: Int): Int? {
        return R.layout.item_social
    }

    override fun defaultViewClass(position: Int): Class<*>? {
        return null
    }


}
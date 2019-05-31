package com.mohamadk.quickseries.pages.gride.items.places

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import kotlinx.android.parcel.Parcelize

@Parcelize
class Gps(
    @SerializedName("latitude")
    val latitude:String
    ,@SerializedName("longitude")
    val longitude:String
) :Parcelable
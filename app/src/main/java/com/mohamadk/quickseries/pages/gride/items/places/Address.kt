package com.mohamadk.quickseries.pages.gride.items.places

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import kotlinx.android.parcel.Parcelize

@Parcelize
class Address(
    @SerializedName("address1")
    val address1: String,
    @SerializedName("label")
    val label: String,
    @SerializedName("zipCode")
    val zipCode: String,
    @SerializedName("city")
    val city: String,
    @SerializedName("state")
    val state: String,
    @SerializedName("country")
    val country: String,
    @SerializedName("gps")
    val gps: Gps
):Parcelable

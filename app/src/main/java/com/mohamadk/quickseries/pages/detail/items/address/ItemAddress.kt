package com.mohamadk.quickseries.pages.detail.items.address

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.R
import com.mohamadk.quickseries.pages.gride.items.places.Gps
import kotlinx.android.parcel.Parcelize


@Parcelize
class ItemAddress(
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
    val gps: Gps?
) : Parcelable
    , BaseModel {
    override fun defaultResLayout(position: Int): Int? {
        return R.layout.item_address
    }

    override fun defaultViewClass(position: Int): Class<*>? {
        return null
    }

    fun address11(): String {
        return "$address1\n$city $zipCode \n $country"
    }
}
package com.mohamadk.quickseries.pages.gride.items.places

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import kotlinx.android.parcel.Parcelize

@Parcelize
class ContactInfo(
    @SerializedName("website")
    val website: List<String>,
    @SerializedName("email")
    val email: List<String>,
    @SerializedName("phoneNumber")
    val phoneNumber: List<String>
):Parcelable

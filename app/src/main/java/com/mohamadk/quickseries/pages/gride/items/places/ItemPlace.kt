package com.mohamadk.quickseries.pages.gride.items.places

import android.os.Parcelable
import com.google.gson.annotations.SerializedName
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.R
import kotlinx.android.parcel.Parcelize

@Parcelize
class ItemPlace(
    @SerializedName("_id")
    val id: String
    , @SerializedName("title")
    val title: String
    , @SerializedName("description")
    val description: String
    , @SerializedName("photo")
    val photo: String
    , @SerializedName("addresses")
    val addresses: List<Address>
    , @SerializedName("contactInfo")
    val contactInfo: ContactInfo
    , @SerializedName("socialMedia")
    val socialMedia: SocialMedia

) : BaseModel
,Parcelable
{
    override fun defaultResLayout(position: Int): Int? {
        return R.layout.item_place
    }

    override fun defaultViewClass(position: Int): Class<*>? {
        return null
    }
}
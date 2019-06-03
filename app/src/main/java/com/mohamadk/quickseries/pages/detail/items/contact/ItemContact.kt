package com.mohamadk.quickseries.pages.detail.items.contact

import android.os.Parcelable
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.R
import kotlinx.android.parcel.Parcelize

@Parcelize
class ItemContact(
    val title: String
    , val info: String
    , val call: Boolean
    , val sms: Boolean
    , val email: Boolean
    , val website: Boolean

) : BaseModel
    , Parcelable {
    override fun defaultResLayout(position: Int): Int? {
        return R.layout.item_contact
    }

    override fun defaultViewClass(position: Int): Class<*>? {
        return null
    }


}
package com.mohamadk.quickseries.pages.gride.items.category

import com.google.gson.annotations.SerializedName
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.R

class ItemCategory(
    @SerializedName("_id")
    val id: String
    , @SerializedName("title")
    val title: String
    , @SerializedName("description")
    val description: String
    , @SerializedName("slug")
    val slug: String

) : BaseModel {
    override fun defaultResLayout(position: Int): Int? {
        return R.layout.item_category
    }

    override fun defaultViewClass(position: Int): Class<*>? {
        return null
    }

}

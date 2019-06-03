package com.mohamadk.quickseries.pages.detail.items.description

import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.R

class ItemDescription(
    val title: String
    , val description: String
) : BaseModel {
    override fun defaultResLayout(position: Int): Int? {
        return R.layout.item_description
    }

    override fun defaultViewClass(position: Int): Class<*>? {
        return null
    }
}
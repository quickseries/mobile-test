package com.mohamadk.quickseries.pages.detail.items.title

import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.R

class ItemTitle(val title: String) : BaseModel {
    override fun defaultResLayout(position: Int): Int? {
        return R.layout.item_title
    }

    override fun defaultViewClass(position: Int): Class<*>? {
        return null
    }
}
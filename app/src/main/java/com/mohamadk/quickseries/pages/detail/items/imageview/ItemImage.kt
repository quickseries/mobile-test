package com.mohamadk.quickseries.pages.detail.items.imageview

import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.R

class ItemImage(val img: String) : BaseModel {
    override fun defaultResLayout(position: Int): Int? {
        return R.layout.item_image
    }

    override fun defaultViewClass(position: Int): Class<*>? {
        return null
    }

}
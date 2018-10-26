package com.quickseries.quickseriesapp.ui.categories.categoryitem

import com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter.model.ICategoryItem

interface CategoryItemClickListener {
    fun onItemClick(event: ICategoryItem)
}
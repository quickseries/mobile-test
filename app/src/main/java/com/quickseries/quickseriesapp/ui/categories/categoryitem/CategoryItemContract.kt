package com.quickseries.quickseriesapp.ui.categories.categoryitem

import android.content.Context
import com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter.model.ICategoryItem

interface CategoryItemContract {

    interface View {
        fun showProgress(show: Boolean)
        fun showError(message: String)
        fun getContext(): Context
        fun updateRecentList(data: List<ICategoryItem>)
        fun notifyItemChanged(position: Int, event: ICategoryItem)
    }

    interface Presenter {
        fun load(status: Boolean, slug: String)
        fun filter(newText: String)

    }
}
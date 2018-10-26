package com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter.model

import com.myfolks.android.folks.view.adapter.ViewType
import com.quickseries.quickseriesapp.ui.view.AdapterConstants

open class ICategoryItem(
    open var id: String? = "",
    open var title: String? = "",
    open var photo: String? = "",
    open var slug: String? = ""
) : ViewType {

    override fun getViewType(): Int {
        return AdapterConstants.CATEGORY_ITEM
    }

}
package com.quickseries.quickseriesapp.ui.categorydetail

import com.quickseries.quickseriesapp.network.localdao.QSCategoriesData


interface CategoryDetailContract {

    interface View {
        fun showProgress(show: Boolean)
        fun showError(message: String)
        fun setupView(item: QSCategoriesData)
    }

    interface Presenter {
        fun getItemDetails(id: String)
    }
}
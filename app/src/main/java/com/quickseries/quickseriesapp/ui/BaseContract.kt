package com.quickseries.quickseriesapp.ui

import com.quickseries.quickseriesapp.network.localdao.QSCategories

interface BaseContract {

    interface View {
        fun showProgress(show: Boolean)
        fun showError(message: String)
        fun updateRecentList(data: List<QSCategories>)
    }

    interface Presenter {
        fun load(status: Boolean)
    }
}
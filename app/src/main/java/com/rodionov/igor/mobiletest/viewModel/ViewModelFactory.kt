package com.rodionov.igor.mobiletest.viewModel

import android.arch.lifecycle.ViewModel
import android.arch.lifecycle.ViewModelProvider
import android.content.Context
import com.rodionov.igor.mobiletest.repository.CategoriesRepository
import com.rodionov.igor.mobiletest.repository.RestaurantsRepository

class ViewModelFactory(context: Context) : ViewModelProvider.NewInstanceFactory() {

    val mContext: Context

    init {
        mContext = context
    }

    override fun <T : ViewModel> create(modelClass: Class<T>): T {
        val viewModel: T
        if (modelClass == CategoryListViewModel::class.java) {
            viewModel = CategoryListViewModel(CategoriesRepository(mContext)) as T
        } else if (modelClass == RestaurantListViewModel::class.java) {
            viewModel = RestaurantListViewModel(RestaurantsRepository(mContext)) as T
        } else {
            viewModel = super.create(modelClass)
        }

        return viewModel
    }
}

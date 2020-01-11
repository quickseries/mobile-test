package com.ztd.interview_test.mvvm

import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
class ViewModelProviderFactory<V : Any>(var viewModel: V) : ViewModelProvider.Factory {

    override fun <T : ViewModel?> create(modelClass: Class<T>): T {
        if (modelClass.isAssignableFrom(viewModel.javaClass)) {
            return viewModel as T
        }
        throw IllegalArgumentException("Unknown class name")
    }
}
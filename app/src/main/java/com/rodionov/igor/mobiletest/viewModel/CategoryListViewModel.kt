package com.rodionov.igor.mobiletest.viewModel

import android.arch.lifecycle.LiveData
import android.arch.lifecycle.ViewModel

import com.rodionov.igor.mobiletest.model.Category
import com.rodionov.igor.mobiletest.repository.CategoriesRepository

class CategoryListViewModel(repository: CategoriesRepository) : ViewModel() {

    val categoryList: LiveData<List<Category>>

    init {
        categoryList = repository.categoryListData
    }
}

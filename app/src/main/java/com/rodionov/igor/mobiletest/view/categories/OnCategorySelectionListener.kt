package com.rodionov.igor.mobiletest.view.categories

import com.rodionov.igor.mobiletest.model.Category

interface OnCategorySelectionListener {
    fun onCategorySelected(category: Category?)
}

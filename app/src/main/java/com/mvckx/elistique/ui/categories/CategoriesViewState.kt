package com.mvckx.elistique.ui.categories

data class CategoriesViewState(val categoryItems: List<CategoryItem>, val loading: Boolean) {
    data class CategoryItem(val id: String, val title: String?, val description: String?)
}

package com.quickseries.mobiletest.ui.categories

import com.quickseries.mobiletest.domain.model.Category
import com.quickseries.mobiletest.domain.model.Slug
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

data class CategoryItem(
    val title: String,
    val description: String,
    val lastModified: String,
    val slug: Slug
)

suspend fun List<Category>.toCategoriesItems() = withContext(Dispatchers.Default) {
    map { category ->
        CategoryItem(
            category.title,
            category.description,
            category.lastModified.toString(),
            category.slug
        )
    }
}
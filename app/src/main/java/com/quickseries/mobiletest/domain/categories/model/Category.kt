package com.quickseries.mobiletest.domain.categories.model

import com.quickseries.mobiletest.data.categories.CategoryResponse
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import java.util.*

data class Category(
    val title: String,
    val description: String,
    val lastModified: Date?,
    val slug: Slug
)

/**
 * Extension that convert a list of [CategoryResponse] to a list of [Category].
 *
 * @return List<Category>
 */
suspend fun List<CategoryResponse>.toCategories() = withContext(Dispatchers.Default) {
    map { categoryResponse ->
        Category(
            categoryResponse.title.orEmpty(),
            categoryResponse.description.orEmpty(),
            categoryResponse.updatedAt ?: categoryResponse.createdAt,
            Slug.fromString(categoryResponse.slug)
        )
    }
}
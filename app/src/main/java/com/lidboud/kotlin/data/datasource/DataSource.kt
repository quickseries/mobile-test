package com.lidboud.kotlin.data.datasource

import com.lidboud.kotlin.data.model.domain.Category
import com.lidboud.kotlin.data.model.domain.Resource

interface DataSource {
    suspend fun fetchCategories(): List<Category>
    suspend fun fetchResources(categoryId: String): List<Resource>
}

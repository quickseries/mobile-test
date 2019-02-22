package com.lidboud.kotlin.repository

import com.lidboud.kotlin.data.model.domain.Category
import com.lidboud.kotlin.data.model.domain.Resource

interface DataRepository {
    suspend fun fetchCategories(): List<Category>
    suspend fun fetchResources(categoryId: String): List<Resource>
    suspend fun fetchResourceFromLastFetchedResource(resourceId: String): Resource?
}

package com.lidboud.kotlin.repository

import com.lidboud.kotlin.data.datasource.DataSource
import com.lidboud.kotlin.data.model.domain.Category
import com.lidboud.kotlin.data.model.domain.Resource
import javax.inject.Inject

class DataRepositoryImpl @Inject constructor(private val dataSource: DataSource) : DataRepository {

    private var lastFetchedResource = listOf<Resource>()

    override suspend fun fetchCategories(): List<Category> {
        return dataSource.fetchCategories()
    }

    override suspend fun fetchResources(categoryId: String): List<Resource> {
        lastFetchedResource = dataSource.fetchResources(categoryId)
        return lastFetchedResource
    }

    override suspend fun fetchResourceFromLastFetchedResource(resourceId: String): Resource? {
        return lastFetchedResource.find { it -> it.id == resourceId }
    }
}
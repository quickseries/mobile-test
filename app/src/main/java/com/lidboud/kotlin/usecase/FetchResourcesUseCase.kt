package com.lidboud.kotlin.usecase

import com.lidboud.kotlin.data.model.domain.Resource

interface FetchResourcesUseCase {
    suspend fun fetchResource(categoryId: String): List<Resource>
}
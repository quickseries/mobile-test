package com.lidboud.kotlin.usecase

import com.lidboud.kotlin.data.model.domain.Resource

interface FetchResourceUseCase {
    suspend fun fetchResource(resourceId: String): Resource?
}
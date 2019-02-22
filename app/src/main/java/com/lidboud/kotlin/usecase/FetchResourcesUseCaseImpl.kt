package com.lidboud.kotlin.usecase

import com.lidboud.kotlin.data.model.domain.Resource
import com.lidboud.kotlin.repository.DataRepository
import javax.inject.Inject

class FetchResourcesUseCaseImpl @Inject constructor(private val dataRepository: DataRepository) : FetchResourcesUseCase {
    override suspend fun fetchResource(categoryId: String): List<Resource> {
        return dataRepository.fetchResources(categoryId)
    }
}
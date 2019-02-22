package com.lidboud.kotlin.usecase

import com.lidboud.kotlin.data.model.domain.Resource
import com.lidboud.kotlin.repository.DataRepository
import javax.inject.Inject

class FetchResourceUseCaseImpl @Inject constructor(private val dataRepository: DataRepository) : FetchResourceUseCase {
    override suspend fun fetchResource(resourceId: String): Resource? {
        return dataRepository.fetchResourceFromLastFetchedResource(resourceId)
    }
}
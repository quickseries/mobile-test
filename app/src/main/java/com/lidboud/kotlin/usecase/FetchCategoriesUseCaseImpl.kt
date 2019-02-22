package com.lidboud.kotlin.usecase

import com.lidboud.kotlin.data.model.domain.Category
import com.lidboud.kotlin.repository.DataRepository

import javax.inject.Inject

class FetchCategoriesUseCaseImpl @Inject
constructor(private val dataRepository: DataRepository) : FetchCategoriesUseCase {
    override suspend fun fetchCategories(): List<Category> {
        return dataRepository.fetchCategories()
    }
}

package com.lidboud.kotlin.usecase

import com.lidboud.kotlin.data.model.domain.Category

interface FetchCategoriesUseCase {
    suspend fun fetchCategories(): List<Category>
}
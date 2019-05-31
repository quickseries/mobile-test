package com.kotlin.test.core

import com.kotlin.test.models.Category
import io.reactivex.Single

interface ApiHelper {
    fun fetchCategories(): Single<List<Category>>
}
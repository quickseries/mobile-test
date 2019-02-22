package com.lidboud.kotlin.ui.category

import com.lidboud.kotlin.data.model.domain.Category

data class CategoryDataModel constructor(var categories: List<Category>? = null, var errorMessage: String? = null)

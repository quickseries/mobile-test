package com.quickseries.mobiletestcore.data

class CategoryRepository private constructor(private val categoryDao: CategoryDao) {

    init {

    }

    fun getCategories() = categoryDao.getCategories()

    companion object {
        @Volatile
        private var instance: CategoryRepository? = null

        fun getInstance(categoryDao: CategoryDao) =
            instance ?: synchronized(this) { instance ?: CategoryRepository(categoryDao).also { instance = it } }
    }
}
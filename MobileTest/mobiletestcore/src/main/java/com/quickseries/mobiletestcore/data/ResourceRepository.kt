package com.quickseries.mobiletestcore.data

class ResourceRepository private constructor(private val resourceDao: ResourceDao) {

    init {

    }

    companion object {
        @Volatile
        private var instance: ResourceRepository? = null

        fun getInstance(resourceDao: ResourceDao) =
            instance ?: synchronized(this) { instance ?: ResourceRepository(resourceDao).also { instance = it } }
    }
}
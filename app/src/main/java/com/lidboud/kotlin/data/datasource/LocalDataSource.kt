package com.lidboud.kotlin.data.datasource

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.lidboud.kotlin.R
import com.lidboud.kotlin.common.RawFileReader
import com.lidboud.kotlin.data.model.domain.Category
import com.lidboud.kotlin.data.model.domain.Resource
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import javax.inject.Inject

class LocalDataSource @Inject constructor(private val rawFileReader: RawFileReader) : DataSource {

    override suspend fun fetchResources(categoryId: String): List<Resource> {
        return withContext(Dispatchers.IO) {
            val resources = rawFileReader.getStringFromResource(getRawId(categoryId))
            val gson = Gson()
            val type = object : TypeToken<List<Resource>>() {}.type
            gson.fromJson<List<Resource>>(resources, type)
        }
    }

    override suspend fun fetchCategories(): List<Category> {
        return withContext(Dispatchers.IO) {
            val categories = rawFileReader.getStringFromResource(R.raw.categories)
            val gson = Gson()
            val type = object : TypeToken<List<Category>>() {}.type
            gson.fromJson<List<Category>>(categories, type)
        }
    }

    private fun getRawId(categoryId: String): Int {
        return when (categoryId) {
            "59839fd7951cf747207bed3e" -> R.raw.restaurants
            "5983a2b7951cf747207bed41" -> R.raw.vacation_spot
            else -> {
                throw IllegalArgumentException("Unknown id")
            }
        }
    }
}
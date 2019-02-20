package org.johny.quickseries.model

import android.app.Application
import com.squareup.moshi.JsonAdapter
import com.squareup.moshi.Moshi
import com.squareup.moshi.Types
import com.squareup.moshi.kotlin.reflect.KotlinJsonAdapterFactory


class DataManager(val application: Application) {
    val moshi = Moshi.Builder()
        .add(KotlinJsonAdapterFactory())
        .build()!!

    inline fun <reified T> loadListFromAssets(slug: String): List<T>? {
        val fileContent = application.assets.open("$slug.json").bufferedReader().use {
            it.readText()
        }
        val type = Types.newParameterizedType(List::class.java, T::class.java)
        val subcategoryAdater: JsonAdapter<List<T>> = moshi.adapter(type)
        return subcategoryAdater.fromJson(fileContent)
    }
}
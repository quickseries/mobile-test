package com.mohamadk.quickseries.pages.gride.repo

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.core.utils.readFileText
import com.mohamadk.quickseries.pages.gride.items.category.ItemCategory
import com.mohamadk.quickseries.pages.gride.items.places.ItemPlace
import io.reactivex.Observable
import java.util.concurrent.TimeUnit


/**
 * this is a sample mock implementation for api call for categories
 * in real application this instance must created with retrofit
 */
class CategoriesApiImpl(private val gson: Gson) : CategoriesApi {


    override fun loadCategories(slug: String): Observable<List<BaseModel>> {

        val categoriesString = readFileText("$slug.json")

        val items =
            when (slug) {
                "categories" -> {
                    val listType = object : TypeToken<List<ItemCategory>>() {}.type
                    gson.fromJson<List<ItemCategory>>(categoriesString, listType)
                }
                "restaurants", "vacation-spots" -> {
                    val listType = object : TypeToken<List<ItemPlace>>() {}.type
                    gson.fromJson<List<BaseModel>>(categoriesString, listType)
                }
                else -> {
                    throw IllegalStateException(" slug=$slug did not implemented")
                }
            }



        return Observable.just(items)
            .delay(500, TimeUnit.MILLISECONDS)

    }
}
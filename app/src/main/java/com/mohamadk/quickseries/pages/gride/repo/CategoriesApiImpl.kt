package com.mohamadk.quickseries.pages.gride.repo

import com.google.gson.Gson
import com.mohamadk.quickseries.core.utils.readFileText
import com.mohamadk.quickseries.pages.gride.items.category.ItemCategory
import io.reactivex.Observable
import java.util.concurrent.TimeUnit
import com.google.gson.reflect.TypeToken
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.pages.gride.items.places.ItemPlace
import java.lang.IllegalStateException


/**
 * this is a sample mock implementation for api call for categories
 * in real application this instance must created with retrofit
 */
class CategoriesApiImpl(private val gson:Gson) : CategoriesApi {


    override fun loadCategories(slug: String): Observable<List<BaseModel>> {

        val categoriesString=readFileText("$slug.json")

        val listType =
            when(slug){
                "categories"->{
                    object : TypeToken<List<ItemCategory>>() {}.type
                }
                "restaurants","vacation-spots"->{
                    object : TypeToken<List<ItemPlace>>() {}.type
                }
                else->{
                    throw IllegalStateException(" slug=$slug did not implemented")
                }
            }

        val items= gson.fromJson<List<BaseModel>>(categoriesString, listType)

        return Observable.just(items)
            .delay(2,TimeUnit.SECONDS)

    }
}
package com.android.kotlin.utils

import com.android.kotlin.model.CategoryItem
import io.reactivex.Observable
import retrofit2.http.GET
import retrofit2.http.Query

interface ApiInterface {

    @GET("categories.json")
    fun getCategories(): Observable<List<CategoryItem>>

}
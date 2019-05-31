package com.mohamadk.quickseries.pages.gride.repo

import com.mohamadk.middleman.model.BaseModel
import io.reactivex.Observable
import retrofit2.http.GET
import retrofit2.http.Path

interface CategoriesApi {
    @GET("/data/{slug}.json")
    fun loadCategories(@Path("slug")slug: String): Observable<List<BaseModel>>

}

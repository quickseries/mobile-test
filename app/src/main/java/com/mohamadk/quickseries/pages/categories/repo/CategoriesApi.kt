package com.mohamadk.quickseries.pages.categories.repo

import com.mohamadk.quickseries.pages.categories.repo.paging.CategoryPageModel
import io.reactivex.Observable
import retrofit2.http.GET

interface CategoriesApi {
    @GET("")
    fun loadCategories(key: String): Observable<CategoryPageModel>

}

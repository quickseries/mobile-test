package com.quickseries.quickseriesapp.network.wrapper

import com.quickseries.quickseriesapp.Injector
import com.quickseries.quickseriesapp.QuickSeriesApp
import com.quickseries.quickseriesapp.network.api.ApiClient
import com.quickseries.quickseriesapp.network.api.model.Categories
import com.quickseries.quickseriesapp.network.api.model.Restaurants
import io.reactivex.Observable
import javax.inject.Inject


class ApiWrapper(val app: QuickSeriesApp) {

    init {
        Injector.get().inject(this)
    }

    @Inject
    lateinit var realmProvider: RealmWrapper
    @Inject
    lateinit var apiClient: ApiClient


    fun getCategories(): Observable<List<Categories>> {
        return apiClient.getCategories()
    }

    fun getCategoryData(slug: String): Observable<List<Restaurants>> {
        return apiClient.getCategoriesData(slug)
    }
}
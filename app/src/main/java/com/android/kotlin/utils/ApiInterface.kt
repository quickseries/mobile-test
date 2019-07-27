package com.android.kotlin.utils

import com.android.kotlin.model.BitcoinPriceItem
import com.android.kotlin.model.CategoryItem
import com.android.kotlin.model.RestaurantItem
import io.reactivex.Observable
import retrofit2.http.GET
import retrofit2.http.Query

interface ApiInterface {

    @GET("categories.json")
    fun getCategories(): Observable<List<CategoryItem>>

    @GET("restaurants.json")
    fun getRestaurants(): Observable<List<RestaurantItem>>

    @GET("market-price")
    fun getMarketPrice(@Query("timespan") timeSpan: String,
                       @Query("rollingAverage") rollingAverage: String): Observable<BitcoinPriceItem>
}
package com.android.kotlin.utils

import com.android.kotlin.model.BitcoinPriceItem
import com.android.kotlin.model.CategoryItem
import com.android.kotlin.model.RestaurantItem
import io.reactivex.Observable
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class DataManager @Inject constructor(private var apiInterface: ApiInterface) {

    fun getCategories(): Observable<List<CategoryItem>>{
        return apiInterface.getCategories()
    }

    fun getRestaurants(): Observable<List<RestaurantItem>>{
        return apiInterface.getRestaurants()
    }

    fun getMarketPrice(timeSpan: String,rollingAverage : String): Observable<BitcoinPriceItem>{
        return apiInterface.getMarketPrice(timeSpan,rollingAverage)
    }

}
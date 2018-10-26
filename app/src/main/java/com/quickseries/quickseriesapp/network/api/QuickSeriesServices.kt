package com.quickseries.quickseriesapp.network.api

import com.quickseries.quickseriesapp.network.api.model.Categories
import com.quickseries.quickseriesapp.network.api.model.Restaurants
import com.quickseries.quickseriesapp.network.api.model.Vacation
import retrofit2.Call
import retrofit2.http.GET
import retrofit2.http.Headers
import retrofit2.http.Path

interface QuickSeriesServices {
    @GET("categories.json")
    fun getCategories(): Call<List<Categories>>

    @GET("{categorySlug}" + ".json")
    fun getDataForCategory(@Path("categorySlug") categorySlug: String): Call<List<Restaurants>>

    @Headers("Accept:application/x-www-form-urlencoded;charset=utf-8")
    @GET("vacation-spot.json")
    fun getVacationSpots(): Call<List<Vacation>>

}
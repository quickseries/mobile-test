package com.mvckx.elistique.data

import io.reactivex.Observable
import retrofit2.http.GET

interface NetworkService {
    @GET("data/categories.json")
    fun getCategories(): Observable<List<RepCategory>>

    @GET("data/restaurants.json")
    fun getRestaurants(): Observable<List<RepRestaurant>>

    @GET("data/vacation-spot.json")
    fun getVacationSpots(): Observable<List<RepVacationSpot>>
}
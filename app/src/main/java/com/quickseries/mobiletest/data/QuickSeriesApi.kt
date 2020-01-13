package com.quickseries.mobiletest.data

import com.quickseries.mobiletest.data.categories.CategoryResponse
import com.quickseries.mobiletest.data.resources.ResourceResponse
import retrofit2.Response
import retrofit2.http.GET

/**
 * Api containing the differents calls for QuickSeries mobile test.
 */
interface QuickSeriesApi {

    /**
     * A suspendable method to fetch a list of category from a json (Github).
     *
     * @return Response<List<CategoryResponse>>
     */
    @GET(BASE_PATH + "categories.json")
    suspend fun categories(): Response<List<CategoryResponse>>

    /**
     * A suspendable method to fetch a list of resource (restaurant) from a json (Github).
     *
     * @return Response<List<CategoryResponse>>
     */
    @GET(BASE_PATH + "restaurants.json")
    suspend fun restaurants(): Response<List<ResourceResponse>>

    /**
     * A suspendable method to fetch a list of resource (vacation-spot) from a json (Github).
     *
     * @return Response<List<CategoryResponse>>
     */
    @GET(BASE_PATH + "vacation-spot.json")
    suspend fun vacationSpots(): Response<List<ResourceResponse>>

    companion object {
        private const val BASE_PATH = "/quickseries/mobile-test/master/data/"
    }
}
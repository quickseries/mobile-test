package com.quickseries.mobiletest.data

import com.quickseries.mobiletest.data.categories.CategoryResponse
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
    @GET("/quickseries/mobile-test/master/data/categories.json")
    suspend fun categories(): Response<List<CategoryResponse>>
}
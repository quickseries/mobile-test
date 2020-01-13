package com.quickseries.mobiletest.data

import com.squareup.moshi.Moshi
import com.squareup.moshi.adapters.Rfc3339DateJsonAdapter
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import retrofit2.HttpException
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.moshi.MoshiConverterFactory
import java.util.*

/**
 * Service containing calls for QuickSeries mobile test.
 */
object QuickSeriesService {

    private const val BASE_API_URL = "https://raw.githubusercontent.com"

    // build moshi. Specifying the adapter for the fields of type Date.
    private val moshi by lazy {
        Moshi.Builder()
            .add(Date::class.java, Rfc3339DateJsonAdapter().nullSafe())
            .build()
    }

    // build retrofit with the base url and moshi.
    private val retrofit by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_API_URL)
            .addConverterFactory(MoshiConverterFactory.create(moshi))
            .build()
    }

    /**
     * Fetch the categories using QuickSeriesApi.
     */
    suspend fun categories() = withContext(Dispatchers.IO) {
        runServiceBlock {
            retrofit.create(QuickSeriesApi::class.java).categories()
        }
    }

    /**
     * Fetch the resources (restaurant) using QuickSeriesApi.
     */
    suspend fun restaurants() = withContext(Dispatchers.IO) {
        runServiceBlock {
            retrofit.create(QuickSeriesApi::class.java).restaurants()
        }
    }

    /**
     * Fetch the categories (vacation spots) using QuickSeriesApi.
     */
    suspend fun vacationSpots() = withContext(Dispatchers.IO) {
        runServiceBlock {
            retrofit.create(QuickSeriesApi::class.java).vacationSpots()
        }
    }

    /**
     * A generic method to handle a service call, its response and error.
     *
     * @param serviceCallBlock the block to run (returning a response of the generic type)
     * @return T reponse value
     * @throws [ServiceException], [HttpServiceException], [UnauthorizeServiceException], [PayloadServiceException]
     */
    @Throws(
        ServiceException::class,
        HttpServiceException::class,
        UnauthorizeServiceException::class,
        PayloadServiceException::class
    )
    private suspend fun <T> runServiceBlock(
        serviceCallBlock: suspend () -> Response<T>
    ) = withContext(Dispatchers.IO) {
        try {
            val response = serviceCallBlock()
            if (response.isSuccessful) {
                response.body() ?: throw PayloadServiceException("The response body is null.")
            } else {
                if (response.code() in 400 until 500) {
                    throw UnauthorizeServiceException(
                        "The service failed with a HTTP status code: ${response.code()}",
                        HttpException(response)
                    )
                }
                throw HttpServiceException(
                    "The service failed with a HTTP status code: ${response.code()}",
                    HttpException(response)
                )
            }
        } catch (e: Exception) {
            throw ServiceException("An error occurred with the service call.", e)
        }
    }
}
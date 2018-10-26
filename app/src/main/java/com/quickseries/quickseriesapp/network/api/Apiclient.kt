package com.quickseries.quickseriesapp.network.api

import android.content.Context
import com.jakewharton.retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import com.quickseries.quickseriesapp.BuildConfig
import com.quickseries.quickseriesapp.Injector
import com.quickseries.quickseriesapp.network.api.model.Categories
import com.quickseries.quickseriesapp.network.api.model.Restaurants
import com.quickseries.quickseriesapp.network.wrapper.RealmWrapper
import io.reactivex.Observable
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.jackson.JacksonConverterFactory
import java.util.concurrent.TimeUnit
import javax.inject.Inject

/**
 * Created by parth.gadhiya on 2018-02-18.
 */

class ApiClient(val context: Context, QUICKSERIES_API_BASE_URL: String = BuildConfig.BASE_URL) {
    private val quickSeriesServices: QuickSeriesServices

    @Inject
    lateinit var realmWrapper: RealmWrapper


    init {
        Injector.get().inject(this)
        val interceptor = HttpLoggingInterceptor()
        interceptor.level = HttpLoggingInterceptor.Level.BODY

        val client = OkHttpClient.Builder()
            .addNetworkInterceptor(interceptor)
            .addInterceptor(interceptor)
            .connectTimeout(120, TimeUnit.SECONDS)
            .build()

        val retrofit = Retrofit.Builder()
            .baseUrl(QUICKSERIES_API_BASE_URL)
            .client(client)
            .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
            .addConverterFactory(JacksonConverterFactory.create())
            .build()


        quickSeriesServices = retrofit.create(QuickSeriesServices::class.java)
    }


    fun getCategories(): Observable<List<Categories>> {
        return Observable.create<List<Categories>> { subscriber ->
            quickSeriesServices.getCategories().enqueue(object :
                Callback<List<Categories>> {
                override fun onResponse(call: Call<List<Categories>>, response: Response<List<Categories>>) {
                    if (response.isSuccessful) {
                        realmWrapper.saveCategories(result = response.body()!!)
                        subscriber.onNext(response.body()!!)
                        subscriber.onComplete()
                    } else {
                        subscriber.onError(Throwable(response.message()))
                    }
                }

                override fun onFailure(call: Call<List<Categories>>, t: Throwable) {
                    subscriber.onError(t)
                }
            })
        }
    }

    fun getCategoriesData(slug: String): Observable<List<Restaurants>> {
        return Observable.create<List<Restaurants>> { subscriber ->
            quickSeriesServices.getDataForCategory(slug).enqueue(object :
                Callback<List<Restaurants>> {
                override fun onResponse(call: Call<List<Restaurants>>, response: Response<List<Restaurants>>) {
                    if (response.isSuccessful) {
                        realmWrapper.saveCategoriesData(result = response.body()!!)
                        subscriber.onNext(response.body()!!)
                        subscriber.onComplete()
                    } else {
                        subscriber.onError(Throwable(response.message()))
                    }
                }

                override fun onFailure(call: Call<List<Restaurants>>, t: Throwable) {
                    subscriber.onError(t)
                }
            })
        }
    }

}

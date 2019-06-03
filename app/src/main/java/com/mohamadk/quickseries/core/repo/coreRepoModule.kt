package com.mohamadk.quickseries.core.repo

import android.util.Log
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.mohamadk.quickseries.core.repo.api.ArrayItemContactTypeAdapter
import com.mohamadk.quickseries.core.repo.api.ArrayItemSocialTypeAdapter
import com.mohamadk.quickseries.pages.detail.items.contact.ItemContact
import com.mohamadk.quickseries.pages.detail.items.social.ItemSocial
import okhttp3.HttpUrl
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import org.koin.dsl.module
import retrofit2.Retrofit
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory
import retrofit2.converter.gson.GsonConverterFactory

const val BASE_URL=""

val coreRepoModule= module {
    single<Retrofit> {
        val httpUrl = HttpUrl.parse(BASE_URL)!!

        Retrofit.Builder()
            .baseUrl(httpUrl)
            .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
            .client(get())
            .addConverterFactory(GsonConverterFactory.create(get()))
            .build()
    }


    single<Interceptor>() {
        val logger = HttpLoggingInterceptor(HttpLoggingInterceptor.Logger {
            Log.d("API", it)
        })
        logger.level = HttpLoggingInterceptor.Level.BODY
        logger
    }

    single<OkHttpClient> {
        OkHttpClient.Builder()
            .addInterceptor(get())
            .build()
    }

    single<Gson> {
        GsonBuilder()
            .registerTypeAdapter(Array<ItemContact>::class.java, ArrayItemContactTypeAdapter())
            .registerTypeAdapter(
                ItemSocial::class.java,
                ArrayItemSocialTypeAdapter()
            )
            .create()
    }


}
package com.mvckx.elistique

import android.app.Application
import com.mvckx.elistique.data.NetworkService
import com.mvckx.elistique.data.PlacesRepository
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import org.koin.android.ext.android.startKoin
import org.koin.dsl.module.module
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory

class ElistiqueApplication: Application() {

    override fun onCreate() {
        super.onCreate()
        initKoin()
    }

    private fun initKoin() {
        val module = module {
            single { provideRetrofit().create(NetworkService::class.java) }
            single { PlacesRepository() }
        }

        startKoin(this, listOf(module))
    }

    private fun provideRetrofit(): Retrofit {
        val builder = OkHttpClient.Builder()

        // Log requests if debug
        if (BuildConfig.DEBUG) {
            val interceptor = HttpLoggingInterceptor()
            interceptor.level = HttpLoggingInterceptor.Level.BODY
            builder.addInterceptor(interceptor)
        }

        return Retrofit.Builder()
            .baseUrl("https://raw.githubusercontent.com/quickseries/mobile-test/master/")
            .client(builder.build())
            .addConverterFactory(GsonConverterFactory.create())
            .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
            .build()
    }
}
package com.example.mhamed.demo.di

import android.support.annotation.VisibleForTesting
import com.google.gson.FieldNamingPolicy
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module
class ApiModule {

    val API_SUPPORTED_VERSION  = 1.0

    @VisibleForTesting
    @Provides
    @Singleton
    fun provideGson(): Gson {
        return GsonBuilder()
                .setDateFormat("yyyy-MM-ddTHH:mm:sssZ") // 2017-08-03T22:12:39.537Z
                .setVersion(API_SUPPORTED_VERSION)
                .setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES)
                .create()
    }

}

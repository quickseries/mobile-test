package com.quickseries.quickseriesapp

import android.content.SharedPreferences
import android.preference.PreferenceManager
import com.quickseries.quickseriesapp.network.api.ApiClient
import com.quickseries.quickseriesapp.network.wrapper.ApiWrapper
import com.quickseries.quickseriesapp.network.wrapper.RealmWrapper
import dagger.Module
import dagger.Provides

import javax.inject.Singleton

/**
 * Created by parth.gadhiya on 2018-10-26.
 */

@Module
class AppModule(private val app: QuickSeriesApp) {

    @Provides
    fun providesApplication(): QuickSeriesApp {
        return app
    }

    @Provides
    @Singleton
    fun provideSharedPrefs(): SharedPreferences {
        return PreferenceManager.getDefaultSharedPreferences(app)
    }

    @Provides
    @Singleton
    fun provideApiClient(): ApiClient {
        return ApiClient(app)
    }

    @Provides
    @Singleton
    fun providesApiWrapper(): ApiWrapper {
        return ApiWrapper(app)
    }

    @Provides
    @Singleton
    fun providesApiRealmWrapper(): RealmWrapper {
        return RealmWrapper(app)
    }


}

package com.android.kotlin.di.modules

import android.app.Application
import android.content.Context
import com.android.kotlin.di.ApplicationContext
import com.android.kotlin.utils.ApiInterface
import com.android.kotlin.utils.DataManager
import com.android.kotlin.utils.SchedulerProvider
import dagger.Module
import dagger.Provides

/**
 * Created by Amanjeet Singh on 10/2/18.
 */
@Module
class AppModule(private val app: Application) {

    @Provides
    fun providesApp(): Application {
        return app
    }

    @Provides
    @ApplicationContext
    fun provideContext(): Context {
        return app
    }

    @Provides
    fun providesSchedulers(): SchedulerProvider {
        return SchedulerProvider()
    }

    @Provides
    fun providesDataManager(apiInterface: ApiInterface): DataManager {
        return DataManager(apiInterface)
    }
}
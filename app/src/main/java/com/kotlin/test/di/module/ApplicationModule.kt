package com.kotlin.test.di.module

import android.app.Application
import android.content.Context
import com.kotlin.test.di.qualifier.ApplicationContext
import dagger.Module
import dagger.Provides

import javax.inject.Singleton

@Module
class ApplicationModule(private val mApplication: Application) {


    @Provides
    @ApplicationContext
    internal fun provideContext(): Context {
        return mApplication
    }

    @Provides
    internal fun provideApplication(): Application {
        return mApplication
    }

}

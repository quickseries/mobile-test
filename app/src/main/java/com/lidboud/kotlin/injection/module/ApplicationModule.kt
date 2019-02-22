package com.lidboud.kotlin.injection.module

import android.app.Application
import android.content.Context
import com.lidboud.kotlin.KotlinApplication
import dagger.Module
import dagger.Provides
import javax.inject.Singleton

@Module
class ApplicationModule {

    @Provides
    @Singleton
    internal fun provideApplication(application: KotlinApplication): Application {
        return application
    }

    @Provides
    @Singleton
    internal fun provideContext(application: Application): Context {
        return application.applicationContext
    }
}
package com.android.kotlin

import android.app.Application
import android.content.Context
import com.android.kotlin.di.components.AppComponent
import com.android.kotlin.di.modules.AppModule
import com.android.kotlin.di.modules.NetworkModule

internal class MobileTestApplication : Application() {

    companion object {
        operator fun get(context: Context): MobileTestApplication {
            return context.applicationContext as MobileTestApplication
        }
    }

    fun component(): AppComponent {
        return DaggerAppComponent.builder().appModule(AppModule(this))
                .netModule(NetworkModule())
                .build()
    }
}
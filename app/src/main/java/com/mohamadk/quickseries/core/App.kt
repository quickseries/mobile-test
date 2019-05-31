package com.mohamadk.quickseries.core

import android.annotation.SuppressLint
import android.app.Application
import android.content.Context
import com.mohamadk.quickseries.core.repo.coreRepoModule
import com.mohamadk.quickseries.pages.gride.categoryModule
import org.koin.android.ext.koin.androidContext
import org.koin.core.context.startKoin

class App:Application() {

    override fun onCreate() {
        super.onCreate()

        context=this

        startKoin {
            modules(coreRepoModule, categoryModule)
            androidContext(this@App)
        }


    }


    companion object {
        //this warning about liking the context of the application can be ignored because we don't have any
        // multi processing in this app and application context is singleton any way.
        @SuppressLint("StaticFieldLeak")
        lateinit var context: Context
    }
}
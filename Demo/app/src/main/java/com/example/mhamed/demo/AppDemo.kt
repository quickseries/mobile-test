package com.example.mhamed.demo

import android.app.Application
import com.example.mhamed.demo.di.AppComponent
import com.example.mhamed.demo.di.AppModule
import com.example.mhamed.demo.di.DaggerAppComponent
import com.example.mhamed.demo.repo.CacheRepo

/**
 * @author mhamed
 * @since 2018-11-10
 */
/**
 * @author Mhamed Hlioui
 * @since 2016-04-30.
 */
class AppDemo : Application() {

    var appComponent: AppComponent? = null

    override fun onCreate() {
        super.onCreate()
        appComponent = DaggerAppComponent.builder()
                .appModule(AppModule(this))
                .build()
    }

    override fun onLowMemory() {
        super.onLowMemory()
        CacheRepo.clearAll()
    }


}
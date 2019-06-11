package com.android.kotlin.di.components

import android.content.Context
import com.android.kotlin.di.ApplicationContext
import com.android.kotlin.di.modules.AppModule
import com.android.kotlin.di.modules.NetworkModule
import com.android.kotlin.utils.DataManager
import dagger.Component
import javax.inject.Singleton

@Singleton
@Component(modules = arrayOf(AppModule::class, NetworkModule::class))
interface AppComponent {

    @ApplicationContext
    fun context(): Context

    fun dataManager(): DataManager


}
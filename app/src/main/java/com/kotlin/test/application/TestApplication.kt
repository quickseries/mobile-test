package com.kotlin.test.application

import android.app.Application
import com.kotlin.test.di.component.ApplicationComponent
import com.kotlin.test.di.module.ApplicationModule

class TestApplication : Application() {

    var component: ApplicationComponent? = null
        private set
    override fun onCreate() {
        super.onCreate()
        component = DaggerApplicationComponent.builder()
            .applicationModule(ApplicationModule(this)).build()
        component!!.inject(this)
    }
}

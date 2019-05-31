package com.kotlin.test.ui

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.app.AppCompatDelegate
import com.kotlin.test.application.TestApplication
import com.kotlin.test.di.component.ActivityComponent
import com.kotlin.test.di.module.ActivityModule

open class BaseActivity : AppCompatActivity(){
    var activityComponent: ActivityComponent? = null
        private set

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        AppCompatDelegate.setCompatVectorFromResourcesEnabled(true)
        activityComponent = DaggerActivityComponent.builder()
            .activityModule(ActivityModule(this))
            .applicationComponent((application as TestApplication).component)
            .build()
    }
}
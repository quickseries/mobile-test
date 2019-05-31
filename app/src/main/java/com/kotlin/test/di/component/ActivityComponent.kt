package com.kotlin.test.di.component

import android.content.Context
import com.kotlin.test.di.module.ActivityModule
import com.kotlin.test.di.qualifier.ActivityContext
import com.kotlin.test.di.scopes.ActivityScoped
import com.kotlin.test.ui.MainActivity
import dagger.Component

@ActivityScoped
@Component(dependencies = [ApplicationComponent::class], modules = [ActivityModule::class])
interface ActivityComponent {

    @get:ActivityContext
    val context: Context

    fun inject(mainActivity: MainActivity) //We can inject more than 1 activity

}

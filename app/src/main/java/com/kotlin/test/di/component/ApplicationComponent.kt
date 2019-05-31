package com.kotlin.test.di.component

import android.app.Application
import android.content.Context
import com.kotlin.test.application.TestApplication
import com.kotlin.test.di.module.ApplicationModule
import com.kotlin.test.di.qualifier.ApplicationContext
import dagger.Component

import javax.inject.Singleton

@Singleton
@Component(modules = [ApplicationModule::class])
interface ApplicationComponent {

    fun inject(testApplication: TestApplication)

    @ApplicationContext
    fun context(): Context

    fun application(): Application

    /* @Component.Builder
    interface Builder {
        @BindsInstance
        ApplicationComponent.Builder application(Application application);

        ApplicationComponent build();
    }*/
}

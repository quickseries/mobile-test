package com.ztd.interview_test.infrustructure.di

import android.app.Application
import com.ztd.interview_test.mvvm.InterviewApplication
import dagger.BindsInstance
import dagger.Component
import dagger.android.AndroidInjectionModule
import javax.inject.Singleton

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
@Singleton
@Component(modules = arrayOf(AndroidInjectionModule::class , AppModule::class, ActivityBuilder::class))
interface AppComponent {
    fun inject(app: InterviewApplication)

    @Component.Builder
    interface Builder{
        @BindsInstance
        fun application(application: Application):Builder
        fun build():AppComponent
    }
}
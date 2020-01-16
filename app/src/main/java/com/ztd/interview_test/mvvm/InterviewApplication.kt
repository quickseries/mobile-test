package com.ztd.interview_test.mvvm

import android.app.Activity
import android.app.Application
import com.ztd.interview_test.infrustructure.di.DaggerAppComponent
import dagger.android.AndroidInjector
import dagger.android.DispatchingAndroidInjector
import dagger.android.HasActivityInjector
import javax.inject.Inject
import androidx.appcompat.app.AppCompatDelegate



/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
class InterviewApplication: Application(),HasActivityInjector{

    @Inject
    lateinit var activityDispatchingAndroidInjector: DispatchingAndroidInjector<Activity>

    override fun activityInjector(): AndroidInjector<Activity> {
        return activityDispatchingAndroidInjector
    }
    override fun onCreate() {
        super.onCreate()
        AppCompatDelegate.setCompatVectorFromResourcesEnabled(true)

        DaggerAppComponent.builder()
            .application(this)
            .build()
            .inject(this)
    }
}
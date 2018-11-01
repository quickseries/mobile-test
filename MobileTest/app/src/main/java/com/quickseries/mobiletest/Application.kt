package com.quickseries.mobiletest

import android.app.Application
import net.danlew.android.joda.JodaTimeAndroid
import timber.log.Timber
import timber.log.Timber.DebugTree


class Application : Application() {
    override fun onCreate() {
        super.onCreate()
        JodaTimeAndroid.init(this)

        if (BuildConfig.DEBUG) {
            Timber.plant(DebugTree())
        } else {

        }

    }
}
package com.quickseries.quickseriesapp

import android.app.Activity
import android.app.Application
import android.content.pm.ActivityInfo
import android.os.Bundle

class ActivityLifecycle private constructor() : Application.ActivityLifecycleCallbacks {

    var isForeground = false
        private set

    val isBackground: Boolean
        get() = !isForeground

    override fun onActivityCreated(activity: Activity, savedInstanceState: Bundle) {
        activity.requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
    }

    override fun onActivityStarted(activity: Activity) {

    }

    override fun onActivityResumed(activity: Activity) {
        isForeground = true
    }

    override fun onActivityPaused(activity: Activity) {
        isForeground = false
    }

    override fun onActivityStopped(activity: Activity) {

    }

    override fun onActivitySaveInstanceState(activity: Activity, outState: Bundle) {

    }

    override fun onActivityDestroyed(activity: Activity) {

    }

    companion object {

        @get:Synchronized
        var instance: ActivityLifecycle? = null
            private set

        fun init(app: Application) {
            if (instance == null) {
                instance = ActivityLifecycle()
                app.registerActivityLifecycleCallbacks(instance)
            }
        }
    }
}
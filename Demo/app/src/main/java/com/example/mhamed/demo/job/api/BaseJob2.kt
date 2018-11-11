package com.example.mhamed.demo.job.api

import com.birbit.android.jobqueue.Job
import com.birbit.android.jobqueue.Params
import com.birbit.android.jobqueue.RetryConstraint
import com.example.mhamed.demo.di.AppComponent
import com.google.gson.Gson
import org.greenrobot.eventbus.EventBus
import javax.inject.Inject
import javax.inject.Singleton

/**
 * @author mhamed
 * @since 2018-11-10
 */
@Singleton
abstract class BaseJob2(params : Params) : Job(params) {

    /**
     * Number of times to retry to run the job before cancelling.
     */
    private val DEFAULT_RETRY_LIMIT = 3

    companion object {
        val UI_HIGH_PRIORITY = 10
        val BACKGROUND_PRIORITY = 0
    }


    @Inject
    @Transient
    var eventBus: EventBus? = null

    @Inject
    @Transient
    var gson: Gson? = null


    override fun shouldReRunOnThrowable(throwable: Throwable, runCount: Int, maxRunCount: Int): RetryConstraint {
        return if (runCount > maxRunCount)
            RetryConstraint.CANCEL
        else
            if (priority == UI_HIGH_PRIORITY) RetryConstraint.RETRY else RetryConstraint.createExponentialBackoff(runCount, 1000)
    }

    fun inject (appComponent: AppComponent?) {
        //appComponent?.inject(this)
    }
}
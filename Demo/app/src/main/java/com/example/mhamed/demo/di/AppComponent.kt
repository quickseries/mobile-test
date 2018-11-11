package com.example.mhamed.demo.di

import com.birbit.android.jobqueue.JobManager
import com.example.mhamed.demo.job.api.BaseJob
import com.example.mhamed.demo.repo.ApiRepo
import com.example.mhamed.demo.repo.AppRepo
import com.example.mhamed.demo.repo.CacheRepo
import com.google.gson.Gson
import dagger.Component
import org.greenrobot.eventbus.EventBus
import javax.inject.Singleton

/**
 * @author mhamed
 * @since 2018-11-10
 */
@Singleton
@Component(modules = arrayOf(ApiModule::class, AppModule::class))
interface AppComponent {

    fun eventBus(): EventBus

    fun jobManager(): JobManager

    fun  gson() : Gson

    fun apiRepo() : ApiRepo

    fun appRepo() : AppRepo

    fun cacheRepo() : CacheRepo


    fun inject(baseJob: BaseJob)
}
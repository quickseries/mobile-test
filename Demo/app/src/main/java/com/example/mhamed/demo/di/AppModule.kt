package com.example.mhamed.demo.di

import com.birbit.android.jobqueue.JobManager
import com.birbit.android.jobqueue.config.Configuration
import com.example.mhamed.demo.AppDemo
import com.example.mhamed.demo.job.api.BaseJob
import com.example.mhamed.demo.repo.ApiRepo
import com.example.mhamed.demo.repo.AppRepo
import com.example.mhamed.demo.repo.CacheRepo
import dagger.Module
import dagger.Provides
import org.greenrobot.eventbus.EventBus
import javax.inject.Inject
import javax.inject.Singleton

@Module
class AppModule (val app : AppDemo) {

    @Provides
    @Singleton
    fun provideEventBus(): EventBus {
        return EventBus()
    }

    @Provides
    @Singleton
    fun provideJobManager(): JobManager {
        val config = Configuration.Builder(app)
                .consumerKeepAlive(45)
                .maxConsumerCount(3)
                .minConsumerCount(1)
                //.customLogger(L.getJobLogger())
                .injector { job ->
                    if (job is BaseJob) {
                        job.inject(app.appComponent)
                    }
                }
                .build()
        return JobManager(config)
    }

    @Provides
    @Singleton
    fun provideCacheRepo(): CacheRepo {
        return CacheRepo
    }

    @Provides
    @Singleton
    @Inject
    fun provideApiRepo(jobManager: JobManager): ApiRepo {
        return ApiRepo(jobManager)
    }

    @Provides
    @Singleton
    @Inject
    fun provideAppRepo(apiRepo : ApiRepo, cacheRepo : CacheRepo, eventBus : EventBus): AppRepo {
        return AppRepo(apiRepo, cacheRepo, eventBus)
    }


}

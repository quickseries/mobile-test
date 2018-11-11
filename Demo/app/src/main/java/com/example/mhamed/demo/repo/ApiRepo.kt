package com.example.mhamed.demo.repo

import com.birbit.android.jobqueue.JobManager
import com.example.mhamed.demo.job.api.FetchCategoryJob
import javax.inject.Named
import javax.inject.Singleton

/**
 * @author mhamed
 * @since 2018-11-10
 */
@Singleton
class ApiRepo (@field:Named("jobManager") private val jobManager : JobManager) {


    fun fetchCategory() {
        jobManager.addJobInBackground(FetchCategoryJob())
    }
}
package com.example.mhamed.demo.job.api

import com.birbit.android.jobqueue.Params
import com.example.mhamed.demo.api.response.CategoriesResponse
import com.example.mhamed.demo.events.CategoriesEvent
import java.io.File
import java.io.FileReader

/**
 * Background job to fetch categories
 *
 * @author mhamed
 * @since 2018-11-10
 */
class FetchCategoryJob : BaseJob(Params(BaseJob2.UI_HIGH_PRIORITY)) {


    override fun onAdded() {
    }


    override fun onRun() {
        // TODO add the file path
        val file = File("categories.json")
        val categoryResponse = gson?.fromJson<CategoriesResponse>(FileReader(file), CategoriesResponse::class.java)

        eventBus?.post(CategoriesEvent(categoryResponse?.categoryResponses, true))
    }


    override fun onCancel(cancelReason: Int, throwable: Throwable?) {
        eventBus?.post(CategoriesEvent(null, false))
    }
}
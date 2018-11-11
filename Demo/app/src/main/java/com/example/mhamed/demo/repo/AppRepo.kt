package com.example.mhamed.demo.repo

import org.greenrobot.eventbus.EventBus
import javax.inject.Inject

/**
 * AppRepo responsible for providing the data to the app.
 * The data can be coming from different source e.g API or Database
 *
 * @author mhamed
 * @since 2018-11-10
 */

class AppRepo @Inject constructor(val apiRepo: ApiRepo,
                                  val cacheRepo: CacheRepo,
                                  val eventBus: EventBus) {

    /**
     * listen for CategoriesEvent using EventBus for the result
     * @see com.example.mhamed.demo.events.CategoriesEvent
     */
    fun getCategories() {
        cacheRepo.getCategoriesEvent()?.let {
            eventBus.post(it) // if the event is cached post it
        } ?: run {
            apiRepo.fetchCategory() // if not, fetch it
        }

    }
}
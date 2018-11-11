package com.example.mhamed.demo.repo

import android.util.LruCache
import com.example.mhamed.demo.events.CategoriesEvent

/**
 * @author mhamed
 * @since 2018-11-10
 */
object CacheRepo {

    private val lruCache: LruCache<String, Any> = LruCache(4)

    /**
     * temporary cache the Category events
     */
    fun cacheCategoriesEvent(categoriesEvent: CategoriesEvent) {
        lruCache.put("categories", categoriesEvent)
    }

    /**
     * @return cached event or null
     */
    fun getCategoriesEvent() : CategoriesEvent? {
        return lruCache["categories"] as CategoriesEvent;
    }

    fun clearAll() {
        lruCache.evictAll()
    }
}
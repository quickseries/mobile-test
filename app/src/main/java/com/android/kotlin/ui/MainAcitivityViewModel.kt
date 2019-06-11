package com.android.kotlin.ui

import com.android.kotlin.model.CategoryItem
import com.android.kotlin.model.RestaurantItem
import com.android.kotlin.utils.DataManager
import com.android.kotlin.utils.SchedulerProvider
import io.reactivex.Observable
import javax.inject.Inject

class MainActivityViewModel @Inject constructor(private var dataManager: DataManager,
                                        private var schedulerProvider: SchedulerProvider) {

    var loading: Boolean? = null

    fun setIsLoading(loading: Boolean) {
        this.loading = loading
    }


    fun provideCategories(): Observable<List<CategoryItem>>? {
        setIsLoading(true)
        return dataManager.getCategories()
                .subscribeOn(schedulerProvider.io())
                .observeOn(schedulerProvider.ui())
                .map { result -> result }
    }

    fun provideRestaurants(): Observable<List<RestaurantItem>>? {
        setIsLoading(true)
        return dataManager.getRestaurants()
                .subscribeOn(schedulerProvider.io())
                .observeOn(schedulerProvider.ui())
                .map { result -> result }
    }
}
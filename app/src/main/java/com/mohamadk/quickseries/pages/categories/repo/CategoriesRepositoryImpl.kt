package com.mohamadk.quickseries.pages.categories.repo

import androidx.lifecycle.Transformations
import androidx.paging.LivePagedListBuilder
import androidx.paging.PagedList
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.pagingfragment.Listing
import com.mohamadk.quickseries.pages.categories.repo.paging.DataSourceFactory
import com.mohamadk.quickseries.pages.categories.repo.paging.PageKeyedDataSource
import java.util.concurrent.Executors

private val NETWORK_IO = Executors.newFixedThreadPool(5)

class CategoriesRepositoryImpl(
    private val categoriesApi:CategoriesApi
) : CategoriesRepository {

    override fun loadCategories(): Listing<PagedList<BaseModel>> {
        val sourceFactory = DataSourceFactory(
            PageKeyedDataSource(
                NETWORK_IO,
                categoriesApi
            )
        )

        // ignored because we use complete url in next field in response
        val pageSize = 20

        val livePagedList = LivePagedListBuilder(sourceFactory, pageSize)
            .setFetchExecutor(NETWORK_IO)
            .build()

        return Listing(
            list = livePagedList,
            pagingState = Transformations.switchMap(sourceFactory.sourceLiveData) {
                it.networkState
            },
            refreshState = Transformations.switchMap(sourceFactory.sourceLiveData) {
                it.initialLoad
            },
            retry = {
                sourceFactory.sourceLiveData.value?.retryAllFailed()
            }
        )
    }
}
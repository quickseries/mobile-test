package com.mohamadk.quickseries.pages.categories.repo.paging

import androidx.lifecycle.MutableLiveData
import androidx.paging.PageKeyedDataSource
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.middleman.networkstate.NetworkState
import com.mohamadk.quickseries.pages.categories.repo.CategoriesApi
import io.reactivex.Observable
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.rxkotlin.subscribeBy
import io.reactivex.schedulers.Schedulers
import java.util.concurrent.Executor

class PageKeyedDataSource(
    private val retryExecutor: Executor,
    private val categoriesApi: CategoriesApi
) : PageKeyedDataSource<String, BaseModel>() {

    private var retry: (() -> Any)? = null

    val networkState = MutableLiveData<NetworkState>()
    val initialLoad = MutableLiveData<NetworkState>()

    fun retryAllFailed() {
        val prevRetry = retry
        retry = null
        prevRetry?.let {
            retryExecutor.execute {
                it.invoke()
            }
        }
    }

    override fun loadBefore(
        params: LoadParams<String>,
        callback: LoadCallback<String, BaseModel>
    ) {
        // ignored, since we only ever append to our initial load
    }

    override fun loadAfter(params: LoadParams<String>, callback: LoadCallback<String, BaseModel>) {
        networkState.postValue(NetworkState.LOADING)
        makeCall(params.key)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribeBy(
                onNext = {
                    networkState.postValue(NetworkState.LOADED)
                    callback.onResult(it.list, it?.after)
                },
                onError = {
                    retry = {
                        loadAfter(params, callback)
                    }
                    networkState.postValue(NetworkState.error(it.message ?: "unknown err"))
                    it.printStackTrace()
                }
            )
    }

    override fun loadInitial(
        params: LoadInitialParams<String>,
        callback: LoadInitialCallback<String, BaseModel>
    ) {
        initialLoad.postValue(NetworkState.LOADING)

        makeCall()
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribeBy(
                onNext = {
                    initialLoad.postValue(NetworkState.LOADED)
                    callback.onResult(it.list, it?.before, it?.after)
                },
                onError = {
                    retry = {
                        loadInitial(params, callback)
                    }
                    initialLoad.postValue(NetworkState.error(it.message ?: "unknown err"))
                    it.printStackTrace()
                }
            )
    }

    private fun makeCall(key: String = ""): Observable<CategoryPageModel> {
        return categoriesApi.loadCategories(key)
    }

}
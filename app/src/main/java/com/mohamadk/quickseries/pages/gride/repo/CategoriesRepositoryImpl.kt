package com.mohamadk.quickseries.pages.gride.repo

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Transformations
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.middleman.networkstate.NetworkState
import com.mohamadk.pagingfragment.Listing
import com.mohamadk.quickseries.core.repo.BaseResponse
import com.mohamadk.quickseries.core.utils.handleConnectionErrors
import com.mohamadk.quickseries.core.utils.toLiveData
import io.reactivex.Scheduler
import io.reactivex.schedulers.Schedulers
import io.reactivex.subjects.BehaviorSubject


class CategoriesRepositoryImpl(
    private val categoriesApi: CategoriesApi
    ,scheduler: Scheduler =Schedulers.io()
) : CategoriesRepository {

    private val publishCategories = BehaviorSubject.create<String>()

    private val resultLive =
        publishCategories.flatMap { slug ->
            categoriesApi.loadCategories(slug)
                .map {
                    BaseResponse(NetworkState.LOADED, it)
                }
                .onErrorReturn(handleConnectionErrors(BaseResponse()))
                .startWith(BaseResponse(NetworkState.LOADING))
                .subscribeOn(scheduler)

        }
            .toLiveData()


    private val items: LiveData<List<BaseModel>> = Transformations.switchMap(resultLive) {
        val itemsLive = MutableLiveData<List<BaseModel>>()

        if (it.networkState == NetworkState.LOADED) {
            itemsLive.value = it.result as List<BaseModel>
        }

        itemsLive
    }

    private val refreshState: LiveData<NetworkState> = Transformations.map(resultLive) {
        it.networkState
    }

    override fun loadCategories(slug: String): Listing<List<BaseModel>> {
        publishCategories.onNext(slug)
        return Listing(items, refreshState = refreshState)
    }

    override fun retry(slug: String) {
        publishCategories.onNext(slug)
    }

}
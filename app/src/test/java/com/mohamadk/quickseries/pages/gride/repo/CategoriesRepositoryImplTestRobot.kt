package com.mohamadk.quickseries.pages.gride.repo

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Observer
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.middleman.networkstate.NetworkState
import com.mohamadk.pagingfragment.Listing
import com.nhaarman.mockitokotlin2.*
import io.reactivex.Observable
import io.reactivex.schedulers.TestScheduler
import org.junit.Assert.assertEquals

class CategoriesRepositoryImplTestRobot(
    vararg apiObservable: Observable<List<BaseModel>>
) {

    private val categoriesRepositoryImpl: CategoriesRepositoryImpl
    private val categoriesApi: CategoriesApi = mock()
    private val testScheduler = TestScheduler()

    private val resultLive = MutableLiveData<Listing<List<BaseModel>>>()
    private val resultObserver: Observer<Listing<List<BaseModel>>> = mock()

    private val itemsObserver: Observer<List<BaseModel>> = mock()
    private val refreshStateObserver: Observer<NetworkState> = mock()

    init {

        whenever(categoriesApi.loadCategories(any())).thenReturn(
            apiObservable[0]
            , *apiObservable.sliceArray(1 until apiObservable.size)
        )

        resultLive.observeForever(resultObserver)

        whenever(resultObserver.onChanged(any())).then {
            (it.arguments[0] as Listing<List<BaseModel>>).list!!.observeForever(itemsObserver)
            (it.arguments[0] as Listing<List<BaseModel>>).refreshState.observeForever(refreshStateObserver)
        }

        categoriesRepositoryImpl = CategoriesRepositoryImpl(categoriesApi, testScheduler)
    }

    fun loadCategory(slug: String): CategoriesRepositoryImplTestRobot {

        val listingResult = categoriesRepositoryImpl.loadCategories(slug)

        resultLive.postValue(listingResult)
        testScheduler.triggerActions()

        return this
    }

    fun checkRefreshState(vararg networkStates: NetworkState): CategoriesRepositoryImplTestRobot {

        val argCapture = argumentCaptor<NetworkState>()
        verify(refreshStateObserver, times(networkStates.size)).onChanged(argCapture.capture())

        assertEquals(networkStates.toList(), argCapture.allValues)

        return this
    }

    fun checkItemsResult(vararg items: List<BaseModel>): CategoriesRepositoryImplTestRobot {

        val argCapture = argumentCaptor<List<BaseModel>>()
        verify(itemsObserver, times(items.size)).onChanged(argCapture.capture())
        assertEquals(items.toList(), argCapture.allValues)

        return this
    }

    fun checkApiCallWith(vararg slugs: String): CategoriesRepositoryImplTestRobot {
        val argCapture = argumentCaptor<String>()

        verify(categoriesApi, times(slugs.size)).loadCategories(argCapture.capture())
        assertEquals(slugs.toList(), argCapture.allValues)

        return this
    }

    fun retry(slug: String): CategoriesRepositoryImplTestRobot {

        categoriesRepositoryImpl.retry(slug)
        testScheduler.triggerActions()
        return this

    }

}

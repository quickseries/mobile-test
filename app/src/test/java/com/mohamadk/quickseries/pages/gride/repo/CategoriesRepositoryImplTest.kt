package com.mohamadk.quickseries.pages.gride.repo

import androidx.arch.core.executor.testing.InstantTaskExecutorRule
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.middleman.networkstate.NetworkState
import com.mohamadk.quickseries.pages.gride.items.category.ItemCategory
import io.reactivex.Observable
import org.junit.Rule
import org.junit.Test
import java.lang.IllegalStateException

class CategoriesRepositoryImplTest {

    @Rule
    @JvmField
    val rule = InstantTaskExecutorRule()

    private val items = listOf<BaseModel>(
        ItemCategory("1", "Restaurant", "description", "restaurant")
    )
    private val errorMessage = "something went wrong :O"
    private val slug = "categories"

    @Test
    fun loadCategory() {

        CategoriesRepositoryImplTestRobot(Observable.just(items))

            .loadCategory(slug)

            .checkApiCallWith(slug)
            .checkRefreshState(NetworkState.LOADING, NetworkState.LOADED)
            .checkItemsResult(items)

    }

    @Test
    fun loadError() {

        CategoriesRepositoryImplTestRobot(Observable.error(IllegalStateException(errorMessage)))

            .loadCategory(slug)

            .checkApiCallWith(slug)
            .checkRefreshState(NetworkState.LOADING, NetworkState.error(errorMessage))
            .checkItemsResult()

    }

    @Test
    fun retry() {
        val slug = "categories"
        CategoriesRepositoryImplTestRobot(
            Observable.error(IllegalStateException(errorMessage))
            , Observable.just(items)
        )
            .loadCategory(slug)
            .retry(slug)

            .checkApiCallWith(slug, slug)
            .checkRefreshState(
                NetworkState.LOADING, NetworkState.error(errorMessage)
                , NetworkState.LOADING, NetworkState.LOADED
            )
            .checkItemsResult(items)

    }


}
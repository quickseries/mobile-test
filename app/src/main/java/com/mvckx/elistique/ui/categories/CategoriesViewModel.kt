package com.mvckx.elistique.ui.categories

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.mvckx.elistique.data.Lce
import com.mvckx.elistique.data.PlacesRepository
import com.mvckx.elistique.data.RepCategory
import io.reactivex.disposables.Disposable
import io.reactivex.schedulers.Schedulers
import org.koin.standalone.KoinComponent
import org.koin.standalone.inject

class CategoriesViewModel : ViewModel(), KoinComponent {
    private val placesRepository: PlacesRepository by inject()
    private val categoryLiveData = MutableLiveData<CategoriesViewState>()
    private val disposable: Disposable

    init {
        disposable = placesRepository.getCategories()
            .subscribeOn(Schedulers.io())
            .subscribe {
                val vs = when (it) {
                    is Lce.Content -> {
                        CategoriesViewState(createCategoryItemList(it.content), false)
                    }
                    is Lce.Loading -> {
                        CategoriesViewState(emptyList(), true)
                    }
                    is Lce.Error -> {
                        // TODO: Error state to user
                        CategoriesViewState(emptyList(), false)
                    }
                }
                categoryLiveData.postValue(vs)
            }
    }

    override fun onCleared() {
        disposable.dispose()
    }

    fun categoryLiveData(): LiveData<CategoriesViewState> = categoryLiveData

    private fun createCategoryItemList(repCategoryList: List<RepCategory>): List<CategoriesViewState.CategoryItem> {
        return repCategoryList.map { CategoriesViewState.CategoryItem(it.eid, it.title, it.description) }
    }
}
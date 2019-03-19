package com.mvckx.elistique.ui.categories

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.mvckx.elistique.data.Lce
import com.mvckx.elistique.data.PlacesRepository
import com.mvckx.elistique.data.RepCategory
import io.reactivex.disposables.Disposable
import org.koin.standalone.KoinComponent
import org.koin.standalone.inject

class CategoriesViewModel : ViewModel(), KoinComponent {
    private val placesRepository: PlacesRepository by inject()
    private val categoryLiveData = MutableLiveData<List<CategoryItem>>()
    private val disposable: Disposable

    init {
        disposable = placesRepository.getCategories()
            .subscribe {
                when (it) {
                    is Lce.Content -> {
                        categoryLiveData.postValue(createCategoryItemList(it.content))
                    }
                    else -> {
                        // TODO: Implement ViewState
                    }
                }
            }
    }

    override fun onCleared() {
        disposable.dispose()
    }

    fun categoryLiveData(): LiveData<List<CategoryItem>> = categoryLiveData

    private fun createCategoryItemList(repCategoryList: List<RepCategory>): List<CategoryItem> {
        return repCategoryList.map { CategoryItem(it.eid, it.title, it.description) }
    }
}
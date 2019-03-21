package com.mvckx.elistique.ui.categorydetail

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.mvckx.elistique.data.Lce
import com.mvckx.elistique.data.PlacesRepository
import com.mvckx.elistique.data.RepPlace
import io.reactivex.disposables.Disposable
import io.reactivex.schedulers.Schedulers
import org.koin.standalone.KoinComponent
import org.koin.standalone.inject

class CategoryDetailViewModel : ViewModel(), KoinComponent {
    private val placesRepository: PlacesRepository by inject()
    private val detailLiveData = MutableLiveData<CategoryDetailViewState>()
    private var disposable: Disposable? = null
    private var sorted: Boolean? = null

    fun setCategoryId(categoryId: String) {
        disposable = placesRepository.getCategoryDetail(categoryId)
            .subscribeOn(Schedulers.io())
            .subscribe {

                val vs = when (it) {
                    is Lce.Content -> {
                        CategoryDetailViewState(createPlacesList(it.content), false)
                    }
                    is Lce.Loading -> {
                        CategoryDetailViewState(emptyList(), true)
                    }
                    is Lce.Error -> {
                        // TODO: Error state to user
                        CategoryDetailViewState(emptyList(), false)
                    }
                }
                detailLiveData.postValue(vs)
            }
    }

    fun detailLiveData(): LiveData<CategoryDetailViewState> = detailLiveData

    private fun createPlacesList(content: List<RepPlace>): List<CategoryDetailViewState.PlaceItem> {
        return content.map {
            CategoryDetailViewState.PlaceItem(it.eid, it.title, it.description)
        }
    }

    fun sort() {
        val currentVs = detailLiveData.value?.takeIf { it.placeItems.isNotEmpty() } ?: return
        val newVs = if (sorted == null) {
            sorted = true
            currentVs.copy(placeItems = currentVs.placeItems.sortedBy {
                it.title
            })
        } else {
            currentVs.copy(placeItems = currentVs.placeItems.reversed())
        }
        detailLiveData.postValue(newVs)
    }
}
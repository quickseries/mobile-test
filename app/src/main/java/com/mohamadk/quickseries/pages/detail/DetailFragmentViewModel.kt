package com.mohamadk.quickseries.pages.detail

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Transformations
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.middleman.networkstate.NetworkState
import com.mohamadk.pagingfragment.base.list.BaseListFragmentViewModel
import com.mohamadk.quickseries.core.repo.BaseResponse
import com.mohamadk.quickseries.core.utils.toLiveData
import com.mohamadk.quickseries.pages.detail.items.description.ItemDescription
import com.mohamadk.quickseries.pages.detail.items.imageview.ItemImage
import com.mohamadk.quickseries.pages.detail.items.title.ItemTitle
import com.mohamadk.quickseries.pages.gride.items.places.ItemPlace
import io.reactivex.Observable

class DetailFragmentViewModel(itemPlace: ItemPlace) : BaseListFragmentViewModel<List<BaseModel>>() {

    private val detailLive: LiveData<BaseResponse<List<BaseModel>>>

    init {
        detailLive = Observable.just(itemPlace)
            .flatMap {
                Observable.just(BaseResponse(NetworkState.LOADED, convertPlaceToDetailList(it)))
            }
            .startWith(BaseResponse(NetworkState.LOADING))
            .toLiveData()


    }

    override val items: LiveData<List<BaseModel>> = Transformations.switchMap(detailLive) {
        val itemsLive = MutableLiveData<List<BaseModel>>()

        if (it.networkState == NetworkState.LOADED) {
            itemsLive.value = it.result
        }

        itemsLive
    }

    override val refreshState: LiveData<NetworkState> = Transformations.map(detailLive) {
        it.networkState
    }

    private fun convertPlaceToDetailList(place: ItemPlace): List<BaseModel> {
        val detailItems = mutableListOf<BaseModel>()

        detailItems.add(ItemImage(place.photo))
        detailItems.add(ItemDescription(place.title, place.description))

        detailItems.add(ItemTitle("Contact Information"))
        place.contactInfo.forEach {
            detailItems.add(it)
        }

        if (place.addresses != null) {
            detailItems.add(ItemTitle("Address"))

            place.addresses.forEach {
                detailItems.add(it)
            }
        }

        if (place.socialMedia != null) {
            detailItems.add(place.socialMedia)
        }
        return detailItems
    }


}
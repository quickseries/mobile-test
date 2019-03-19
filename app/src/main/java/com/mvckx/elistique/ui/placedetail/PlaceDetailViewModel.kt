package com.mvckx.elistique.ui.placedetail

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

class PlaceDetailViewModel : ViewModel(), KoinComponent {
    private val placesRepository: PlacesRepository by inject()
    private var disposable: Disposable? = null
    private val placeLiveData = MutableLiveData<PlaceDetailViewState>()

    fun setPlace(placeId: String, categoryId: String) {
        disposable = placesRepository.getPlaceDetail(placeId, categoryId)
            .subscribeOn(Schedulers.io())
            .subscribe {
                val vs = when (it) {
                    is Lce.Content -> {
                        PlaceDetailViewState(createPlaceViewState(it.content), false)
                    }
                    is Lce.Loading -> {
                        PlaceDetailViewState(null, true)
                    }
                    is Lce.Error -> {
                        // TODO: Error state to user
                        PlaceDetailViewState(null, false)
                    }
                }
                placeLiveData.postValue(vs)
            }
    }

    fun placeLiveData(): LiveData<PlaceDetailViewState> = placeLiveData

    private fun createPlaceViewState(content: RepPlace): PlaceDetailViewState.PlaceDetailItem {
        val contactInformation = PlaceDetailViewState.ContactInformation(
            content.contactInfo?.let { it.website?.first() },
            content.contactInfo?.let { it.phoneNumber?.first() },
            content.contactInfo?.let { it.faxNumber?.first() },
            content.contactInfo?.let { it.tollFree?.first() },
            content.contactInfo?.let { it.email?.first() }
        )

        val socialMedia = PlaceDetailViewState.SocialMedia(
            content.socialMedia?.let { it.facebook?.first() },
            content.socialMedia?.let { it.twitter?.first() },
            content.socialMedia?.let { it.youtubeChannel?.first() }
        )

        val addresses = content.addresses?.map {
            PlaceDetailViewState.Address(
                it?.zipCode,
                it?.country,
                it?.city,
                it?.address1,
                it?.label,
                it?.state,
                it?.gps?.toGpsVs()
            )
        } ?: emptyList()

        return PlaceDetailViewState.PlaceDetailItem(
            content.eid,
            content.title,
            content.description,
            content.photo,
            contactInformation,
            socialMedia,
            addresses
        )
    }

    override fun onCleared() {
        super.onCleared()
        disposable?.dispose()
    }
}

private fun RepPlace.Gps.toGpsVs(): PlaceDetailViewState.Gps {
    return PlaceDetailViewState.Gps(this.latitude, this.longitude)
}

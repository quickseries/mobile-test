package com.mvckx.elistique.ui.placedetail

data class PlaceDetailViewState(val placeDetailItem: PlaceDetailItem?, val loading: Boolean) {
    data class PlaceDetailItem(
        val id: String,
        val title: String?,
        val description: String?,
        val photoUrl: String?,
        val contactInformation: ContactInformation,
        val socialMedia: SocialMedia,
        val addresses: List<Address>
    )

    data class ContactInformation(
        val webSite: String?,
        val phoneNumber: String?,
        val faxNumber: String?,
        val tollFree: String?,
        val email: String?
    )

    data class SocialMedia(
        val facebook: String?,
        val twitter: String?,
        val youtube: String?
    )

    data class Address(
        val zip: String,
        val country: String,
        val city: String,
        val address1: String,
        val label: String?,
        val state: String,
        val gps: Gps?
    )

    data class Gps(
        val latitude: String?,
        val longitude: String?
    )
}

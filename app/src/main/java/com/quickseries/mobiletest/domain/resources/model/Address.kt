package com.quickseries.mobiletest.domain.resources.model

import com.quickseries.mobiletest.data.resources.AddressResponse
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

data class Address(
    val address1: String,
    val label: String,
    val zipCode: String,
    val city: String,
    val state: String,
    val country: String,
    val latitude: String,
    val longitude: String
)

suspend fun List<AddressResponse>.toAddresses() = withContext(Dispatchers.Default) {
    map { addressResponse ->
        Address(
            addressResponse.address1.orEmpty(),
            addressResponse.label.orEmpty(),
            addressResponse.zipCode.orEmpty(),
            addressResponse.city.orEmpty(),
            addressResponse.state.orEmpty(),
            addressResponse.country.orEmpty(),
            addressResponse.gps?.latitude.orEmpty(),
            addressResponse.gps?.longitude.orEmpty()
        )
    }
}
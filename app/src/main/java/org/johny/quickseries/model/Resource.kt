package org.johny.quickseries.model

data class Resource(
    val _id: String,
    val title: String = "",
    val description: String= "",
    val photo: String = "",
    val addresses: List<Address>?,
    val contactInfo: ContactInfo?
)

data class Address(
    val address1: String ="",
    val label: String = "",
    val zipCode: String = "",
    val city: String = ""
){
    override fun toString(): String {
        return "$address1\n$label\n$zipCode\n$city"
    }
}

data class ContactInfo(
    val website: List<String>?,
    val email: List<String>?,
    val phoneNumber: List<String>?
)
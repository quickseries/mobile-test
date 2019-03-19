package com.mvckx.elistique.data

import com.google.gson.annotations.SerializedName

data class RepRestaurant(

    @field:SerializedName("eid")
    val eid: String,

    @field:SerializedName("addresses")
    val addresses: List<AddressesItem?>? = null,

    @field:SerializedName("contactInfo")
    val contactInfo: ContactInfo? = null,

    @field:SerializedName("description")
    val description: String? = null,

    @field:SerializedName("photo")
    val photo: String? = null,

    @field:SerializedName("created_at")
    val createdAt: String? = null,

    @field:SerializedName("title")
    val title: String? = null,

    @field:SerializedName("category_eid")
    val categoryEid: String? = null,

    @field:SerializedName("updated_at")
    val updatedAt: String? = null,

    @field:SerializedName("__v")
    val V: Int? = null,

    @field:SerializedName("_active")
    val active: Boolean? = null,

    @field:SerializedName("_id")
    val id: String? = null,

    @field:SerializedName("slug")
    val slug: String? = null
) {


    data class Gps(

        @field:SerializedName("latitude")
        val latitude: String? = null,

        @field:SerializedName("longitude")
        val longitude: String? = null
    )

    data class ContactInfo(

        @field:SerializedName("website")
        val website: List<String?>? = null,

        @field:SerializedName("phoneNumber")
        val phoneNumber: List<String?>? = null,

        @field:SerializedName("email")
        val email: List<String?>? = null
    )

    data class AddressesItem(

        @field:SerializedName("zipCode")
        val zipCode: String? = null,

        @field:SerializedName("country")
        val country: String? = null,

        @field:SerializedName("city")
        val city: String? = null,

        @field:SerializedName("address1")
        val address1: String? = null,

        @field:SerializedName("label")
        val label: String? = null,

        @field:SerializedName("state")
        val state: String? = null,

        @field:SerializedName("gps")
        val gps: Gps? = null
    )
}
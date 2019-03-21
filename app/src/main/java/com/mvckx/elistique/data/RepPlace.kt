package com.mvckx.elistique.data

import com.google.gson.annotations.SerializedName

data class RepPlace(
    @field:SerializedName("eid")
    val eid: String,

    @field:SerializedName("addresses")
    val addresses: List<AddressesItem?>? = null,

    @field:SerializedName("contactInfo")
    val contactInfo: ContactInfo? = null,

    @field:SerializedName("photo")
    val photo: String? = null,

    @field:SerializedName("description")
    val description: String? = null,

    @field:SerializedName("created_at")
    val createdAt: String? = null,

    @field:SerializedName("title")
    val title: String? = null,

    @field:SerializedName("socialMedia")
    val socialMedia: SocialMedia? = null,

    @field:SerializedName("category_eid")
    val categoryEid: String? = null,

    @field:SerializedName("updated_at")
    val updatedAt: String? = null,

    @field:SerializedName("__v")
    val V: Int? = null,

    @field:SerializedName("freeText")
    val freeText: List<FreeTextItem?>? = null,

    @field:SerializedName("_active")
    val active: Boolean? = null,

    @field:SerializedName("_id")
    val id: String? = null,

    @field:SerializedName("slug")
    val slug: String? = null
) {
    data class SocialMedia(

        @field:SerializedName("twitter")
        val twitter: List<String?>? = null,

        @field:SerializedName("youtubeChannel")
        val youtubeChannel: List<String?>? = null,

        @field:SerializedName("facebook")
        val facebook: List<String?>? = null
    )

    data class FreeTextItem(
        val any: Any? = null
    )

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

        @field:SerializedName("faxNumber")
        val faxNumber: List<String?>? = null,

        @field:SerializedName("tollFree")
        val tollFree: List<String?>? = null,

        @field:SerializedName("email")
        val email: List<String?>? = null
    )

    data class AddressesItem(

        @field:SerializedName("zipCode")
        val zipCode: String,

        @field:SerializedName("country")
        val country: String,

        @field:SerializedName("city")
        val city: String,

        @field:SerializedName("address1")
        val address1: String,

        @field:SerializedName("label")
        val label: String? = null,

        @field:SerializedName("state")
        val state: String,

        @field:SerializedName("gps")
        val gps: Gps? = null
    )


}
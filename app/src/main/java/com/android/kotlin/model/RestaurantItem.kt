package com.android.kotlin.model

import java.util.ArrayList
import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

data class RestaurantItem(
        @SerializedName("_id") var id: String = "",
        @SerializedName("slug") var slug: String = "",
        @SerializedName("eid") var eid: String = "",
        @SerializedName("title") var title: String = "",
        @SerializedName("description") var description: String = "",
        @SerializedName("category_eid") var categoryEid: String = "",
        @SerializedName("__v") var v: Long = 0,
        @SerializedName("photo") var photo: String = "",
        @SerializedName("_active") var active: Boolean = false,
        @SerializedName("updated_at") var updatedAt: String = "",
        @SerializedName("created_at") var createdAt: String = "",
        @SerializedName("addresses") var addresses: List<Address>?,
        @SerializedName("contactInfo") var contactInfo: ContactInfo,
        @SerializedName("bizHours") val bizHours: BizHours?,
        @SerializedName("socialMedia") var socialMedia: SocialMedia?
)

data class SocialMedia(
        @SerializedName("youtubeChannel") var youtubeChannel: List<String>?,
        @SerializedName("twitter") var twitter: List<String> ?,
        @SerializedName("facebook") var facebook: List<String>?
)

data class BizHours(
        @SerializedName("sunday") var sunday: Sunday? = null,
        @SerializedName("monday") var monday: Monday? = null
)

data class ContactInfo(
        @SerializedName("website") var website: List<String>?,
        @SerializedName("email") var email: List<String>?,
        @SerializedName("phoneNumber") var phoneNumber: List<String>?,
        @SerializedName("faxNumber") var faxNumber: List<String>?,
        @SerializedName("tollFree") var tollFree: List<String>?
)

data class Monday(
        @SerializedName("from") var from: String? = null,
        @SerializedName("to") var to: String? = null
)

class Sunday(
        @SerializedName("from") var from: String? = null,
        @SerializedName("to") var to: String? = null
)

data class Address(
        @SerializedName("address1") var address1: String? = null,
        @SerializedName("label") var label: String? = null,
        @SerializedName("zipCode") var zipCode: String? = null,
        @SerializedName("city") var city: String? = null,
        @SerializedName("state") var state: String? = null,
        @SerializedName("country") var country: String? = null,
        @SerializedName("gps") var gps: Gps? = null
)

class Gps(
        @SerializedName("latitude") var latitude: String? = null,
        @SerializedName("longitude") var longitude: String? = null
)
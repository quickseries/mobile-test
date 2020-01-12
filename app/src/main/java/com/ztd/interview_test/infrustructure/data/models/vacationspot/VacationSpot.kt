package com.ztd.interview_test.infrustructure.data.models.vacationspot

import com.google.gson.annotations.SerializedName
import com.ztd.interview_test.infrustructure.data.models.AddressesItem
import com.ztd.interview_test.infrustructure.data.models.ContactInfo

data class VacationSpot(

    @SerializedName("eid")
	val eid: String? = null,

    @SerializedName("addresses")
	val addresses: List<AddressesItem?>? = null,

    @SerializedName("contactInfo")
	val contactInfo: ContactInfo? = null,

    @SerializedName("photo")
	val photo: String? = null,

    @SerializedName("description")
	val description: String? = null,

    @SerializedName("created_at")
	val createdAt: String? = null,

    @SerializedName("title")
	val title: String? = null,

    @SerializedName("socialMedia")
	val socialMedia: SocialMedia? = null,

    @SerializedName("category_eid")
	val categoryEid: String? = null,

    @SerializedName("updated_at")
	val updatedAt: String? = null,

    @SerializedName("__v")
	val V: Int? = null,

    @SerializedName("freeText")
	val freeText: List<FreeTextItem?>? = null,

    @SerializedName("_active")
	val active: Boolean? = null,

    @SerializedName("_id")
	val id: String? = null,

    @SerializedName("slug")
	val slug: String? = null
)
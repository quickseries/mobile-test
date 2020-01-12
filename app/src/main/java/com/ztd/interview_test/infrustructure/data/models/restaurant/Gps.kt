package com.ztd.interview_test.infrustructure.data.models.restaurant

import com.google.gson.annotations.SerializedName

data class Gps(

	@SerializedName("latitude")
	val latitude: String? = null,

	@SerializedName("longitude")
	val longitude: String? = null
)
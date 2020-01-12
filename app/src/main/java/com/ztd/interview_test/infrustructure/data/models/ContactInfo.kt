package com.ztd.interview_test.infrustructure.data.models

import com.google.gson.annotations.SerializedName

data class ContactInfo(

	@SerializedName("website")
	val website: List<String?>? = null,

	@SerializedName("phoneNumber")
	val phoneNumber: List<String?>? = null,

	@SerializedName("faxNumber")
	val faxNumber: List<String?>? = null,

	@SerializedName("tollFree")
	val tollFree: List<String?>? = null,

	@SerializedName("email")
	val email: List<String?>? = null
)
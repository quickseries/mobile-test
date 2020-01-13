package com.ztd.interview_test.infrustructure.data.models

import com.google.gson.annotations.SerializedName

data class SocialMedia(

	@SerializedName("twitter")
	val twitter: List<String?>? = null,

	@SerializedName("youtubeChannel")
	val youtubeChannel: List<String?>? = null,

	@SerializedName("facebook")
	val facebook: List<String?>? = null
)
package com.ztd.interview_test.infrustructure.data.models.category

import com.google.gson.annotations.SerializedName

data class CategoryModel(

	@SerializedName("eid")
	val eid: String?,

	@SerializedName("updated_at")
	val updatedAt: String?,

	@SerializedName("__v")
	val V: Int?,

	@SerializedName("description")
	val description: String?,

	@SerializedName("created_at")
	val createdAt: String?,

	@SerializedName("_active")
	val active: Boolean?,

	@SerializedName("_id")
	val id: String?,

	@SerializedName("title")
	val title: String?,

	@SerializedName("slug")
	val slug: String?,

	@SerializedName("custom_module_eid")
	val customModuleEid: String?
)
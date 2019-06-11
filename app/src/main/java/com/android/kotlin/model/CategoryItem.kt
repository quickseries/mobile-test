package com.android.kotlin.model

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName
data class CategoryItem (
    @SerializedName("_id") var id:String = "",
    @SerializedName("updated_at") var updatedAt:String = "",
    @SerializedName("slug") var slug:String = "",
    @SerializedName("custom_module_eid") var customModuleEid:String = "",
    @SerializedName("eid") var eid:String = "",
    @SerializedName("title") var title:String = "",
    @SerializedName("description") var description:String = "",
    @SerializedName("__v") var v:Long = 0,
    @SerializedName("_active") var active:Boolean = false,
    @SerializedName("created_at") var createdAt:String = ""
)
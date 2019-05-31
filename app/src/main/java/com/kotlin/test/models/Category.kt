package com.kotlin.test.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName

class Category {

    @SerializedName("_id")
    @Expose
    var id: String? = null
    @SerializedName("updated_at")
    @Expose
    var updatedAt: String? = null
    @SerializedName("slug")
    @Expose
    var slug: String? = null
    @SerializedName("custom_module_eid")
    @Expose
    var customModuleEid: String? = null
    @SerializedName("eid")
    @Expose
    var eid: String? = null
    @SerializedName("title")
    @Expose
    var title: String? = null
    @SerializedName("description")
    @Expose
    var description: String? = null
    @SerializedName("__v")
    @Expose
    var v: Int? = null
    @SerializedName("_active")
    @Expose
    var active: Boolean? = null
    @SerializedName("created_at")
    @Expose
    var createdAt: String? = null
}

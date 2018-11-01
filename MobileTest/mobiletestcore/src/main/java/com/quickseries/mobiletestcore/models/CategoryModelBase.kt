package com.quickseries.mobiletestcore.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName
import com.quickseries.mobiletestcore.util.UUIDUtil
import org.joda.time.DateTime
import java.util.*

open class CategoryModelBase {
    @SerializedName("_id")
    @Expose
    var internalId: String = ""

    @SerializedName("updated_at")
    @Expose
    var updatedAt: DateTime? = null

    @SerializedName("slug")
    @Expose
    var slug: String = ""

    @SerializedName("custom_module_eid")
    @Expose
    var customModuleId: UUID = UUIDUtil.emptyUUID()

    @SerializedName("eid")
    @Expose
    var id: UUID = UUIDUtil.emptyUUID()

    @SerializedName("title")
    @Expose
    var title: String = ""

    @SerializedName("description")
    @Expose
    var description: String = ""

    @SerializedName("__v")
    @Expose
    var version: Int = 0

    @SerializedName("_active")
    @Expose
    var active: Boolean = false

    @SerializedName("created_at")
    @Expose
    var createdAt: DateTime = DateTime.now()
}
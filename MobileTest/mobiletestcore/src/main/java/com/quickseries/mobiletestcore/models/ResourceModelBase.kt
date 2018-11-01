package com.quickseries.mobiletestcore.models

import com.google.gson.annotations.Expose
import com.google.gson.annotations.SerializedName
import com.quickseries.mobiletestcore.util.UUIDUtil
import org.joda.time.DateTime
import java.util.*

class ResourceModelBase {
    @SerializedName("_id")
    @Expose
    var internalId: String = ""

    @SerializedName("slug")
    @Expose
    var slug: String = ""

    @SerializedName("eid")
    @Expose
    var id: UUID = UUIDUtil.emptyUUID()

    @SerializedName("title")
    @Expose
    var title: String = ""

    @SerializedName("description")
    @Expose
    var description: String = ""

    @SerializedName("bizHours")
    @Expose
    var businessHours: BusinessHoursModelBase? = null

    @SerializedName("category_eid")
    @Expose
    var categoryId: UUID = UUIDUtil.emptyUUID()

    @SerializedName("__v")
    @Expose
    var version: Int = 0

    @SerializedName("photo")
    @Expose
    var photo: String? = null

    @SerializedName("_active")
    @Expose
    var active: Boolean = false

    @SerializedName("updated_at")
    @Expose
    var updatedAt: DateTime? = null

    @SerializedName("created_at")
    @Expose
    var createdAt: DateTime = DateTime.now()

    @SerializedName("addresses")
    @Expose
    var addresses = mutableListOf<AddressModelBase>()

    @SerializedName("contactInfo")
    @Expose
    var contactInfo: ContactInfoModelBase? = null

    @SerializedName("socialMedia")
    @Expose
    var socialMedia: SocialMediaModelBase? = null
}
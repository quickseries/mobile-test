package com.rodionov.igor.mobiletest.model

import android.arch.persistence.room.ColumnInfo
import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey

@Entity(tableName = "resources")
class Restaurant {

    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "id")
    var id: Int = 0
    @ColumnInfo(name = "custom_id")
    var _id: String? = null
    @ColumnInfo(name = "slug")
    var slug: String? = null
    @ColumnInfo(name = "eid")
    var eid: String? = null
    @ColumnInfo(name = "title")
    var title: String? = null
    @ColumnInfo(name = "description")
    var description: String? = null
    @ColumnInfo(name = "category_eid")
    var category_eid: String? = null
    @ColumnInfo(name = "version")
    var _v: Int = 0
    @ColumnInfo(name = "photo")
    var photo: String? = null
    @ColumnInfo(name = "active")
    var _active: Boolean = false
    @ColumnInfo(name = "updated_at")
    var updated_at: String? = null
    @ColumnInfo(name = "created_at")
    var created_at: String? = null

    var addresses: List<Address>? = null

    var contactInfo: ContactInfo? = null

    var bizHours: BusinessHours? = null

    var socialMedia: SocialMedia? = null
}

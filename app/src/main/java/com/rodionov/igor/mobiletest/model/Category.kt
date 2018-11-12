package com.rodionov.igor.mobiletest.model

import android.arch.persistence.room.ColumnInfo
import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey

@Entity(tableName = "categories")
class Category {

    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "id")
    var id: Int
    @ColumnInfo(name = "custom_id")
    var _id: String;
    @ColumnInfo(name = "updated_at")
    var updated_at: String
    @ColumnInfo(name = "slug")
    var slug: String
    @ColumnInfo(name = "custom_module_eid")
    var custom_module_eid: String
    @ColumnInfo(name = "eid")
    var eid: String
    @ColumnInfo(name = "title")
    var title: String
    @ColumnInfo(name = "description")
    var description: String
    @ColumnInfo(name = "version")
    var __v: Int = 0
    @ColumnInfo(name = "active")
    var _active: Boolean = false
    @ColumnInfo(name = "created_at")
    var created_at: String

    init {
        id = 0
        _id = ""
        updated_at = ""
        slug = ""
        custom_module_eid = ""
        eid = ""
        title = ""
        description = ""
        created_at = ""
    }
}

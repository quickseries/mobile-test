package com.rodionov.igor.mobiletest.model

import android.arch.persistence.room.ColumnInfo
import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey

@Entity(tableName = "addresses")
class Address {

    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "id")
    var id: Int = 0
    @ColumnInfo(name = "address1")
    var address1: String? = null
    @ColumnInfo(name = "label")
    var label: String? = null
    @ColumnInfo(name = "zipCode")
    var zipCode: String? = null
    @ColumnInfo(name = "city")
    var city: String? = null
    @ColumnInfo(name = "state")
    var state: String? = null
    @ColumnInfo(name = "country")
    var country: String? = null
    var gps: GpsEntity? = null
}

package com.rodionov.igor.mobiletest.model

import android.arch.persistence.room.ColumnInfo
import android.arch.persistence.room.Entity
import android.arch.persistence.room.PrimaryKey

@Entity
class GpsEntity {

    @PrimaryKey(autoGenerate = true)
    @ColumnInfo(name = "id")
    var id: Int = 0
    @ColumnInfo(name = "latitude")
    var latitude: Double = 0.toDouble()
    @ColumnInfo(name = "longitude")
    var longitude: Double = 0.toDouble()
    @ColumnInfo(name = "address_id")
    var addressId: Int = 0
}

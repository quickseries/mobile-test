package com.rodionov.igor.mobiletest.data

import android.arch.persistence.room.Database
import android.arch.persistence.room.RoomDatabase

import com.rodionov.igor.mobiletest.model.Category

@Database(entities = arrayOf(Category::class), version = 1)
abstract class TestDatabase : RoomDatabase() {

    abstract fun categoryDao(): CategoryDao

}

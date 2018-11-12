package com.rodionov.igor.mobiletest.data

import android.arch.persistence.room.Room
import android.content.Context

/**
 * Created by Igor Rodionov
 */

class DataBaseProvider private constructor() {

    private object Holder {
        val instance = DataBaseProvider()
    }

    companion object {
        val PROVIDER: DataBaseProvider by lazy { Holder.instance }
    }

    private var mDatabase: TestDatabase? = null

    fun getDatabase(context: Context): TestDatabase? {
        if (mDatabase == null)
            mDatabase = Room.databaseBuilder(context.applicationContext, TestDatabase::class.java, "test_database").build()

        return mDatabase
    }
}

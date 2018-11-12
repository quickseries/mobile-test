package com.rodionov.igor.mobiletest.data

import android.arch.lifecycle.LiveData
import android.arch.persistence.room.*

import com.rodionov.igor.mobiletest.model.Category

@Dao
interface CategoryDao {

    @Insert(onConflict = OnConflictStrategy.REPLACE)
    @Transaction
    fun insert(categoryList: List<Category>)

    @Query("SELECT * FROM categories")
    fun fetchAll(): LiveData<List<Category>>
}

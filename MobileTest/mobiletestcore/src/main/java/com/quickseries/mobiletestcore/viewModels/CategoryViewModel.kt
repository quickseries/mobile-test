package com.quickseries.mobiletestcore.viewModels

import android.app.Application
import android.arch.lifecycle.AndroidViewModel
import com.quickseries.mobiletestcore.data.DemoDatabase
import com.quickseries.mobiletestcore.enums.SortDirection

open class CategoryViewModel : AndroidViewModel {

    private val database: DemoDatabase

    constructor(application: Application) : super(application) {
        database = DemoDatabase.getInstance(application.applicationContext)
    }

    fun getCategories() = database.categoryDao.getCategories()

    fun getSortDirection() : SortDirection = database.categoryDao.currentSortDirection

    fun getFiltter() : String = database.categoryDao.currentFilter

    fun toggleSortDirection() {
        if (database.categoryDao.currentSortDirection == SortDirection.ASC) {
            database.categoryDao.sort(SortDirection.DESC)
        } else {
            database.categoryDao.sort(SortDirection.ASC)
        }
    }

    fun filter(text: String) {
        this.database.categoryDao.filter(text)
    }
}


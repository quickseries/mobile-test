package com.quickseries.mobiletestcore.viewModels

import android.app.Application
import android.arch.lifecycle.AndroidViewModel
import com.quickseries.mobiletestcore.data.DemoDatabase
import com.quickseries.mobiletestcore.enums.SortDirection
import java.util.*

class ResourceListViewModel : AndroidViewModel {
    private val database: DemoDatabase

    constructor(application: Application) : super(application) {
        database = DemoDatabase.getInstance(application.applicationContext)
    }

    fun getResources() = database.resourceDao.getResourcesFiltered()

    fun getSortDirection(): SortDirection = database.resourceDao.currentSortDirection

    fun getFiltter(): String = database.resourceDao.currentFilter

    fun toggleSortDirection() {
        if (database.resourceDao.currentSortDirection == SortDirection.ASC) {
            database.resourceDao.sort(SortDirection.DESC)
        } else {
            database.resourceDao.sort(SortDirection.ASC)
        }
    }

    fun filter(text: String) {
        this.database.resourceDao.filter(text)
    }

    fun setCategoryId(categoryId: UUID) {
        this.database.resourceDao.setCategoryId(categoryId)
    }
}
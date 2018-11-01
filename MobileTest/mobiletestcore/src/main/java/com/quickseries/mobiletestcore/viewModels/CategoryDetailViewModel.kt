package com.quickseries.mobiletestcore.viewModels

import android.app.Application
import android.arch.lifecycle.AndroidViewModel
import android.arch.lifecycle.LiveData
import android.arch.lifecycle.MutableLiveData
import com.quickseries.mobiletestcore.data.DemoDatabase
import com.quickseries.mobiletestcore.models.CategoryModelBase
import java.util.*

class CategoryDetailViewModel : AndroidViewModel {
    private val database: DemoDatabase
    private val category = MutableLiveData<CategoryModelBase?>()

    constructor(application: Application) : super(application) {
        database = DemoDatabase.getInstance(application.applicationContext)
    }

    fun setCategoryId(categoryId: UUID) {
        category.value = database.categoryDao.getCategories().value?.firstOrNull { c -> c.id == categoryId }
    }

    fun getCategory() = category as LiveData<CategoryModelBase?>
}
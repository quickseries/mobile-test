package com.quickseries.mobiletestcore.data

import android.arch.lifecycle.LiveData
import android.arch.lifecycle.MutableLiveData
import com.quickseries.mobiletestcore.enums.SortDirection
import com.quickseries.mobiletestcore.models.CategoryModelBase

class CategoryDao {
    private val categoryList = mutableListOf<CategoryModelBase>()
    private val categories = MutableLiveData<List<CategoryModelBase>>()
    var currentFilter: String = ""
        private set
    var currentSortDirection = SortDirection.ASC
        private set

    init {
        categories.value = categoryList
    }

    internal fun setCategories(categories: Array<CategoryModelBase>) {
        this.currentFilter = ""
        this.currentSortDirection = SortDirection.ASC
        categoryList.clear()
        categoryList.addAll(categories)
        refresh()
    }

    fun getCategories() = categories as LiveData<List<CategoryModelBase>>

    private fun refresh() {
        val list = categoryList.filter { c ->
            c.active && (this.currentFilter.isBlank() || c.title.contains(
                this.currentFilter,
                true
            ))
        }.toMutableList()
        when (this.currentSortDirection) {
            SortDirection.ASC -> {
                list.sortBy { c -> c.title }
            }
            else -> {
                list.sortByDescending { c -> c.title }
            }
        }
        categories.value = list

    }

    fun filter(text: String) {
        currentFilter = text
        refresh()
    }

    fun sort(direction: SortDirection) {
        this.currentSortDirection = direction
        refresh()
    }
}
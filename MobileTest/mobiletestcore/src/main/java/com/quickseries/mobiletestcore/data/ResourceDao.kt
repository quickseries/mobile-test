package com.quickseries.mobiletestcore.data

import android.arch.lifecycle.LiveData
import android.arch.lifecycle.MutableLiveData
import com.quickseries.mobiletestcore.enums.SortDirection
import com.quickseries.mobiletestcore.models.ResourceModelBase
import com.quickseries.mobiletestcore.util.UUIDUtil
import java.util.*

class ResourceDao {
    private val resourceList = mutableListOf<ResourceModelBase>()
    private val resources = MutableLiveData<List<ResourceModelBase>>()
    private val filteredResources = MutableLiveData<List<ResourceModelBase>>()

    var currentFilter: String = ""
        private set
    var currentSortDirection = SortDirection.ASC
        private set

    var currentCategoryId: UUID = UUIDUtil.emptyUUID()
        private set

    init {
        resources.value = resourceList
    }

    internal fun addResources(places: Array<ResourceModelBase>) {
        resourceList.addAll(places)
        this.resources.value = resourceList
        refresh()
    }

    fun getResources() = resources as LiveData<List<ResourceModelBase>>

    fun getResourcesFiltered() = filteredResources as LiveData<List<ResourceModelBase>>

    fun setCategoryId(categoryId: UUID) {
        currentCategoryId = categoryId
        refresh()
    }

    private fun refresh() {
        val list = resourceList.filter { r ->
            r.active && r.categoryId == currentCategoryId && (this.currentFilter.isBlank() || r.title.contains(
                this.currentFilter,
                true
            ))
        }.toMutableList()
        when (this.currentSortDirection) {
            SortDirection.ASC -> {
                list.sortBy { r -> r.title }
            }
            else -> {
                list.sortByDescending { r -> r.title }
            }
        }
        filteredResources.value = list
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
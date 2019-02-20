package org.johny.quickseries.viewmodel

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import org.johny.quickseries.model.Category
import org.johny.quickseries.model.DataManager
import org.johny.quickseries.model.Resource

class ListViewModel(application: Application) : AndroidViewModel(application) {

    private val categoryList = MutableLiveData<List<Category>>()
    private val detailResource = MutableLiveData<Resource>()

    val observableList: LiveData<List<Category>>
        get() = categoryList

    val observableResource: LiveData<Resource>
        get() = detailResource

    fun load(slug: String) {
        categoryList.value = DataManager(getApplication()).loadListFromAssets(slug)
    }

    fun loadResource(slug: String, id: String) {
        val a: List<Resource>? = DataManager(getApplication()).loadListFromAssets(slug)
        detailResource.value = a?.find { it._id == id }
    }

    fun sort() {
        categoryList.value = categoryList.value?.sortedWith(compareBy { it.title })
    }

    fun reverseSort() {
        categoryList.value = categoryList.value?.sortedWith(compareBy { it.title })?.reversed()
    }
}

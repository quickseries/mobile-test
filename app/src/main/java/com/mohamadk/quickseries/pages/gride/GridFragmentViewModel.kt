package com.mohamadk.quickseries.pages.gride

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.Transformations
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.pagingfragment.Listing
import com.mohamadk.pagingfragment.base.list.BaseListFragmentViewModel
import com.mohamadk.quickseries.pages.gride.items.category.ItemCategory
import com.mohamadk.quickseries.pages.gride.items.places.ItemPlace
import com.mohamadk.quickseries.pages.gride.repo.CategoriesRepository

class GridFragmentViewModel(
    private val categoryRepository: CategoriesRepository
) : BaseListFragmentViewModel<List<BaseModel>>() {


    override val items: MutableLiveData<List<BaseModel>> = Transformations.switchMap(repoResult) {
        it.list
    } as MutableLiveData<List<BaseModel>>

    override fun getListingPage(vararg args: Any): Listing<List<BaseModel>> {
        return categoryRepository.loadCategories(args[0] as String)
    }

    override fun retry(vararg args: Any) {
        categoryRepository.retry(args[0] as String)
    }

    fun sort(sortASC: Boolean) {
        var list = items.value!!

        list = if (sortASC) {
            list.sortedBy {
                sortItemBy(it)
            }
        } else {
            list.sortedByDescending {
                sortItemBy(it)
            }
        }

        items.value = list

    }
}

fun sortItemBy(item: BaseModel): String {
    return when (item) {
        is ItemPlace -> item.title
        is ItemCategory -> item.title
        else -> throw IllegalStateException("$item not implemented")
    }
}
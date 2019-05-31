package com.mohamadk.quickseries.pages.categories

import androidx.paging.PagedList
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.pagingfragment.Listing
import com.mohamadk.pagingfragment.base.pagelist.BasePagingViewModel
import com.mohamadk.quickseries.pages.categories.repo.CategoriesRepository

class CategoriesFragmentViewModel(
    private val repository: CategoriesRepository
): BasePagingViewModel<PagedList<BaseModel>>() {


    override fun getListingPage(vararg args: Any): Listing<PagedList<BaseModel>> {
        return repository.loadCategories()
    }

}

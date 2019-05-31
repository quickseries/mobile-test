package com.mohamadk.quickseries.pages.gride

import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.pagingfragment.Listing
import com.mohamadk.pagingfragment.base.list.BaseListFragmentViewModel
import com.mohamadk.quickseries.pages.gride.repo.CategoriesRepository

class GridFragmentViewModel(
    private val categoryRepository: CategoriesRepository
) : BaseListFragmentViewModel<List<BaseModel>>() {

    override fun getListingPage(vararg args: Any): Listing<List<BaseModel>> {
        return categoryRepository.loadCategories(args[0] as String)
    }

    override fun retry(vararg args: Any) {
        categoryRepository.retry(args[0] as String)
    }

}

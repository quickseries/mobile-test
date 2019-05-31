package com.mohamadk.quickseries.pages.categories.repo

import androidx.paging.PagedList
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.pagingfragment.Listing

interface CategoriesRepository {
    fun loadCategories(): Listing<PagedList<BaseModel>>

}

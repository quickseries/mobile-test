package com.mohamadk.quickseries.pages.gride.repo

import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.pagingfragment.Listing

interface CategoriesRepository {
    fun loadCategories(slug: String): Listing<List<BaseModel>>
    fun retry(slug: String)

}

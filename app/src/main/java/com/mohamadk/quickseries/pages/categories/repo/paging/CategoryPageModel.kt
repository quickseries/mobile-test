package com.mohamadk.quickseries.pages.categories.repo.paging

import com.google.gson.annotations.SerializedName
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.quickseries.pages.categories.items.ItemCategory

class CategoryPageModel(
    @SerializedName("results")
    val list: List<BaseModel>
    ,
    @SerializedName("next")
    val after: String
    ,
    @SerializedName("previous")
    val before: String
) {

}

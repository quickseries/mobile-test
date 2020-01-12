package com.ztd.interview_test.mvvm.homefragment.adapter

import androidx.databinding.ObservableField
import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * mahdiZTD@gmail.com
 */
class CategoryItemViewModel(private val category:CategoryModel,private val clickListener: CategoryAdapter.CategoryClickListener?) {
    val title:ObservableField<String> = ObservableField(category.title!!)
    val description:ObservableField<String> = ObservableField(category.description?:"")

    fun onItemClicked(){
        clickListener?.onCategoryClicked(category)
    }
}
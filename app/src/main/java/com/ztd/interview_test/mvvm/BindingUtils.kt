package com.ztd.interview_test.mvvm

import androidx.databinding.BindingAdapter
import androidx.recyclerview.widget.RecyclerView
import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.mvvm.homefragment.adapter.CategoryAdapter


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * mahdiZTD@gmail.com
 */
object BindingUtils {

    @JvmStatic
    @BindingAdapter("categoryAdapter")
    fun addCategoryItems(recyclerView: RecyclerView, categories: MutableList<CategoryModel>?) {
        if (categories!=null) {
            val adapter = recyclerView.adapter as CategoryAdapter?
            adapter?.clearItems()
            adapter?.addItems(categories)
        }
    }

}
package com.rodionov.igor.mobiletest.view.categories

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import com.rodionov.igor.mobiletest.R
import com.rodionov.igor.mobiletest.model.Category

class CategoryListAdapter internal constructor(private val mCategoryList: List<Category>?, private val mListener: OnCategorySelectionListener) : RecyclerView.Adapter<CategoryListViewHolder>() {

    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): CategoryListViewHolder {
        val rootView = LayoutInflater.from(viewGroup.context).inflate(R.layout.row_category, viewGroup, false)
        return CategoryListViewHolder(rootView, mListener)
    }

    override fun onBindViewHolder(categoryListViewHolder: CategoryListViewHolder, i: Int) {
        val category = mCategoryList!![i]
        categoryListViewHolder.bindData(category)
    }

    override fun getItemCount(): Int {
        return mCategoryList?.size ?: 0
    }
}

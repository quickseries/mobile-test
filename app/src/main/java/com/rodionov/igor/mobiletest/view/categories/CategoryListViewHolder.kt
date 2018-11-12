package com.rodionov.igor.mobiletest.view.categories

import android.databinding.DataBindingUtil
import android.support.v7.widget.RecyclerView
import android.view.View

import com.rodionov.igor.mobiletest.databinding.RowCategoryBinding
import com.rodionov.igor.mobiletest.model.Category

class CategoryListViewHolder(itemView: View, private val mListener: OnCategorySelectionListener?) : RecyclerView.ViewHolder(itemView), View.OnClickListener {

    private val mBinding: RowCategoryBinding?

    init {
        itemView.setOnClickListener(this)
        mBinding = DataBindingUtil.bind(itemView)
    }

    fun bindData(category: Category) {
        mBinding?.category = category
    }

    override fun onClick(v: View) {
        mListener?.onCategorySelected(mBinding?.category)
    }
}

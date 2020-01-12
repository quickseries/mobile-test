package com.ztd.interview_test.mvvm.homefragment.adapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.ztd.interview_test.databinding.LayoutItemCategoryBinding
import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.mvvm.base.BaseViewHolder


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * mahdiZTD@gmail.com
 */
class CategoryAdapter(private val categories: MutableList<CategoryModel>) :
    RecyclerView.Adapter<CategoryAdapter.CategoryViewHolder>() {

    var clickListener: CategoryClickListener? = null

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryViewHolder {
        val categoryViewDataBinding =
            LayoutItemCategoryBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return CategoryViewHolder(categoryViewDataBinding)
    }

    override fun getItemCount(): Int {
        return categories.size
    }

    override fun onBindViewHolder(holder: CategoryViewHolder, position: Int) {
        holder.onBind(position)
    }

    fun addItems(categories: MutableList<CategoryModel>) {
        this.categories.clear()
        this.categories.addAll(categories)
        notifyDataSetChanged()
    }

    fun clearItems() {
        this.categories.clear()
    }


    inner class CategoryViewHolder(val mBinding: LayoutItemCategoryBinding) :
        BaseViewHolder(mBinding.root) {

        private var mCategoryViewModel: CategoryItemViewModel? = null

        override fun onBind(position: Int) {

            val category = categories[position]
            mCategoryViewModel = CategoryItemViewModel(category,clickListener)
            mBinding.vm = mCategoryViewModel
            mBinding.executePendingBindings()

        }
    }

    interface CategoryClickListener {
        fun onCategoryClicked(category: CategoryModel)
    }
}
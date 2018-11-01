package com.quickseries.mobiletest.adapters.category

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import com.quickseries.mobiletest.R
import com.quickseries.mobiletestcore.models.CategoryModelBase

class CategoryAdapter : RecyclerView.Adapter<CategoryViewHolder>() {
    private var categories = mutableListOf<CategoryModelBase>()

    fun setCategories(categories: List<CategoryModelBase>) {
        this.categories = categories.toMutableList()
        this.notifyDataSetChanged()
    }

    fun getCategories() = categories

    var infoClick: CategoryClickDelegate? = null
    var itemClick: CategoryClickDelegate? = null

    override fun onCreateViewHolder(parent: ViewGroup, position: Int): CategoryViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_category, parent, false)
        val viewHolder = CategoryViewHolder(view)
        viewHolder.itemClick = { category ->
            itemClick?.invoke(category)
        }

        viewHolder.infoImageViewClick = { category ->
            infoClick?.invoke(category)
        }
        return viewHolder
    }

    override fun getItemCount(): Int = categories.size

    override fun onBindViewHolder(viewHolder: CategoryViewHolder, position: Int) {
        viewHolder.dataBind(categories[position])
    }
}
package com.mvckx.elistique.ui.categories

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.item_category.view.*

class CategoriesAdapter : RecyclerView.Adapter<CategoriesAdapter.ViewHolder>() {
    private var categoryList = emptyList<CategoryItem>()
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater
            .from(parent.context)
            .inflate(R.layout.item_category, parent, false)

        return ViewHolder(view)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val category = categoryList[position]
        holder.itemView.tvTitle.text = category.title
        holder.itemView.tvDesc.text = category.description
    }

    override fun getItemCount() = categoryList.size

    fun updateCategories(categoryList: List<CategoryItem>) {
        this.categoryList = categoryList
        notifyDataSetChanged()
    }

    class ViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

    }
}
package com.example.mhamed.demo.ui.activity

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.example.mhamed.demo.R
import com.example.mhamed.demo.databinding.ItemCategoryBinding
import com.example.mhamed.demo.model.Category

/**
 * Adapter for category list Category
 *
 * @author mhamed
 * @since 2018-11-10
 */
class CategoryAdapter (var categories: List<Category>?, var listener: CategoryListener) : RecyclerView.Adapter<CategoryHolder>() {


    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CategoryHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_category, parent, false)


        val holder = CategoryHolder(view)
        holder.binding.listener = listener
        return holder
    }

    override fun getItemCount(): Int {
        return categories?.size ?: 0
    }

    override fun onBindViewHolder(holder: CategoryHolder, position: Int) {
        holder.binding.category = categories!![position]
        holder.binding.executePendingBindings()
    }




}

class CategoryHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

    var binding : ItemCategoryBinding = ItemCategoryBinding.bind(itemView)

}
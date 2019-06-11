package com.android.kotlin.adapter

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.android.kotlin.model.CategoryItem
import com.android.kotlindemo.R

class CategoriesAdapter(val items : List<CategoryItem>,val mCategoryClickListener : CategoryClickListener) : RecyclerView.Adapter<CategoriesAdapter.CategoriesViewHolder>() {



    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): CategoriesViewHolder {
        val view = LayoutInflater.from(viewGroup.context).inflate(R.layout.row_layout_categories_item, viewGroup, false)
        return CategoriesViewHolder(view)
    }

    override fun onBindViewHolder(categoriesViewHolder: CategoriesViewHolder, i: Int) {
            categoriesViewHolder.mCategoryTitleTextView.setText(items.get(i).title)
            categoriesViewHolder.itemView.setOnClickListener {
                mCategoryClickListener.onCategoryClick(i)
            }
    }

    override fun getItemCount(): Int {
        return items.size
    }

    inner class CategoriesViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
         val mCategoryTitleTextView: TextView = itemView.findViewById(R.id.row_layout_category_text_view)

    }

    interface CategoryClickListener{
        fun onCategoryClick(i:Int)
    }
}
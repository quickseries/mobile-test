package com.android.kotlin.adapter

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.android.kotlindemo.R

class CategoriesAdapter(val items : ArrayList<String>) : RecyclerView.Adapter<CategoriesAdapter.CategoriesViewHolder>() {

    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): CategoriesViewHolder {
        val view = LayoutInflater.from(viewGroup.context).inflate(R.layout.row_layout_categories_item, viewGroup, false)
        return CategoriesViewHolder(view)
    }

    override fun onBindViewHolder(cancelReasonViewHolder: CategoriesViewHolder, i: Int) {

    }

    override fun getItemCount(): Int {
        return 0
    }

    inner class CategoriesViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val mReasonTextView: TextView = itemView.findViewById(R.id.row_layout_category_text_view)

    }
}
package com.android.kotlin.adapter

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.android.kotlin.entities.ContactItem
import com.android.kotlindemo.R

class ContactInfoDisplayAdapter(val items: List<ContactItem>) : RecyclerView.Adapter<ContactInfoDisplayAdapter.CategoriesViewHolder>() {


    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): CategoriesViewHolder {
        val view = LayoutInflater.from(viewGroup.context).inflate(R.layout.row_layout_contact_item, viewGroup, false)
        return CategoriesViewHolder(view)
    }

    override fun onBindViewHolder(categoriesViewHolder: CategoriesViewHolder, i: Int) {
        categoriesViewHolder.mContactTypeTextView.text = items.get(i).contactType
        if (items.get(i).value.isNotEmpty()) {
            categoriesViewHolder.mContactValueTextView.text = items.get(i).value.get(0)
        }
    }

    override fun getItemCount(): Int {
        return items.size
    }

    inner class CategoriesViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val mContactTypeTextView: TextView = itemView.findViewById(R.id.row_layout_contact_type_text_view)
        val mContactValueTextView: TextView = itemView.findViewById(R.id.row_layout_contact_text_view)

    }
}
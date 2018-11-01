package com.quickseries.mobiletest.adapters.category

import android.support.v7.widget.AppCompatImageView
import android.support.v7.widget.RecyclerView
import android.view.View
import android.widget.TextView
import com.quickseries.mobiletest.R
import com.quickseries.mobiletestcore.models.CategoryModelBase


class CategoryViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
    private lateinit var category: CategoryModelBase
    private val titleTextView = itemView.findViewById<TextView>(R.id.titleTextView)
    private val infoImageView = itemView.findViewById<AppCompatImageView>(R.id.infoImageView)

    var infoImageViewClick: CategoryClickDelegate? = null
    var itemClick: CategoryClickDelegate? = null

    init {

        infoImageView.isClickable = true
        infoImageView.setOnClickListener {
            infoImageViewClick?.invoke(category)
        }

        itemView.isClickable = true
        itemView.setOnClickListener {
            itemClick?.invoke(category)
        }
    }

    fun dataBind(category: CategoryModelBase) {
        this.category = category
        this.titleTextView.text = category.title
    }
}
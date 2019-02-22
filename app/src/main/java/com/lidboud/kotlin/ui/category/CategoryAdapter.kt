package com.lidboud.kotlin.ui.category

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.lidboud.kotlin.data.model.domain.Category
import com.lidboud.kotlin.databinding.CategoryItemBinding
import javax.inject.Inject

class CategoryListAdapter @Inject
constructor(private val onClickListener: View.OnClickListener) : ListAdapter<Category, CategoryListAdapter.ViewHolder>(CategoryDiffCallback()) {

    override fun onCreateViewHolder(parent: ViewGroup, i: Int): ViewHolder {
        return ViewHolder(CategoryItemBinding.inflate(LayoutInflater.from(parent.context), parent, false))
    }

    override fun onBindViewHolder(viewHolder: ViewHolder, i: Int) {
        val category = getItem(i)
        viewHolder.apply {
            bind(category, onClickListener)
            itemView.tag = category
        }
    }

    inner class ViewHolder(private val categoryItemBinding: CategoryItemBinding) : RecyclerView.ViewHolder(categoryItemBinding.root) {
        fun bind(category: Category, onClick: View.OnClickListener) {
            categoryItemBinding.apply {
                this.category = category
                this.root.setOnClickListener(onClick)
                executePendingBindings()
            }
        }
    }
}

internal class CategoryDiffCallback : DiffUtil.ItemCallback<Category>() {

    override fun areItemsTheSame(oldItem: Category, newItem: Category): Boolean {
        return oldItem.id == newItem.id
    }

    override fun areContentsTheSame(oldItem: Category, newItem: Category): Boolean {
        return oldItem === newItem
    }
}

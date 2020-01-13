package com.quickseries.mobiletest.ui.categories

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.quickseries.mobiletest.databinding.ViewCategoryItemBinding


class CategoriesAdapter(private val data: List<CategoryItem>) :
    RecyclerView.Adapter<CategoriesAdapter.ViewHolder>() {

    class ViewHolder(private val binding: ViewCategoryItemBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(category: CategoryItem) {
            binding.category = category
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemBinding = ViewCategoryItemBinding.inflate(layoutInflater, parent, false)

        return ViewHolder(itemBinding)
    }

    override fun getItemCount() = data.size

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bind(data[position])
    }

}
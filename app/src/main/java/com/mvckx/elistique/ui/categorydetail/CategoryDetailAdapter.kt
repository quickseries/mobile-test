package com.mvckx.elistique.ui.categorydetail

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.item_place.view.*

class CategoryDetailAdapter(private val listener: ((String) -> (Unit))) :
    ListAdapter<CategoryDetailViewState.PlaceItem, CategoryDetailAdapter.ViewHolder>(DIFF_CALLBACK) {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater
            .from(parent.context)
            .inflate(R.layout.item_place, parent, false)
        return CategoryDetailAdapter.ViewHolder(view, listener)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bind(getItem(position))
    }

    companion object {
        private val DIFF_CALLBACK = object : DiffUtil.ItemCallback<CategoryDetailViewState.PlaceItem>() {
            override fun areItemsTheSame(
                oldItem: CategoryDetailViewState.PlaceItem,
                newItem: CategoryDetailViewState.PlaceItem
            ): Boolean {
                return oldItem.id == newItem.id
            }

            override fun areContentsTheSame(
                oldItem: CategoryDetailViewState.PlaceItem,
                newItem: CategoryDetailViewState.PlaceItem
            ): Boolean {
                return oldItem == newItem
            }
        }
    }

    class ViewHolder(itemView: View, private val listener: ((String) -> (Unit))) : RecyclerView.ViewHolder(itemView) {
        private var categoryId: String? = null

        init {
            itemView.setOnClickListener {
                categoryId?.let {
                    listener.invoke(it)
                }
            }
        }

        fun bind(category: CategoryDetailViewState.PlaceItem) {
            itemView.tvTitle.text = category.title
            category.imageUrl?.let {
                Glide.with(itemView)
                    .load(it)
                    .into(itemView.ivPhoto)
            }
            categoryId = category.id
        }
    }
}
package com.lidboud.kotlin.ui.resource

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.lidboud.kotlin.data.model.domain.Resource
import com.lidboud.kotlin.databinding.ResourceItemBinding
import javax.inject.Inject

class ResourceListAdapter @Inject constructor(private val onClickListener: View.OnClickListener) : ListAdapter<Resource, ResourceListAdapter.ViewHolder>(ResourceDiffCallback()) {

    override fun onCreateViewHolder(parent: ViewGroup, i: Int): ViewHolder {
        return ViewHolder(ResourceItemBinding.inflate(LayoutInflater.from(parent.context), parent, false))
    }

    override fun onBindViewHolder(viewHolder: ViewHolder, i: Int) {
        val resource = getItem(i)
        viewHolder.apply {
            bind(resource, onClickListener)
            itemView.tag = resource
        }
    }

    inner class ViewHolder(private val resourceItemBinding: ResourceItemBinding) : RecyclerView.ViewHolder(resourceItemBinding.root) {
        fun bind(resource: Resource, onClick: View.OnClickListener) {
            resourceItemBinding.apply {
                this.resource = resource
                this.root.setOnClickListener(onClick)
                executePendingBindings()
            }
        }
    }
}

internal class ResourceDiffCallback : DiffUtil.ItemCallback<Resource>() {

    override fun areItemsTheSame(oldItem: Resource, newItem: Resource): Boolean {
        return oldItem.id == newItem.id
    }

    override fun areContentsTheSame(oldItem: Resource, newItem: Resource): Boolean {
        return oldItem === newItem
    }
}

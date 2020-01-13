package com.quickseries.mobiletest.ui.resources.list

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.quickseries.mobiletest.databinding.ViewResourceInfoItemBinding
import com.quickseries.mobiletest.ui.resources.model.ResourceItem


class ResourcesAdapter(private val listener: Listener, private val data: List<ResourceItem>) :
    RecyclerView.Adapter<ResourcesAdapter.ViewHolder>() {

    class ViewHolder(private val binding: ViewResourceInfoItemBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(resource: ResourceItem, listener: Listener) {
            binding.resource = resource
            binding.listener = listener
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemBinding = ViewResourceInfoItemBinding.inflate(layoutInflater, parent, false)

        return ViewHolder(itemBinding)
    }

    override fun getItemCount() = data.size

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bind(data[position], listener)
    }

    interface Listener {
        fun onResourceItemClick(resource: ResourceItem)
    }
}
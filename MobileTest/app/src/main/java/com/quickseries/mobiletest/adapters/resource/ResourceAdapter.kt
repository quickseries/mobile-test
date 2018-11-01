package com.quickseries.mobiletest.adapters.resource

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import com.quickseries.mobiletest.R
import com.quickseries.mobiletestcore.models.ResourceModelBase

class ResourceAdapter : RecyclerView.Adapter<ResourceViewHolder>() {
    private var resources = mutableListOf<ResourceModelBase>()

    fun setResources(resources: List<ResourceModelBase>) {
        this.resources = resources.toMutableList()
        this.notifyDataSetChanged()
    }

    fun getResources() = resources

    var itemClick: ResourceClickDelegate? = null

    override fun onCreateViewHolder(parent: ViewGroup, position: Int): ResourceViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_resource, parent, false)
        val viewHolder = ResourceViewHolder(view)
        viewHolder.itemClick = { resource ->
            itemClick?.invoke(resource)
        }
        return viewHolder
    }

    override fun getItemCount(): Int = resources.size

    override fun onBindViewHolder(viewHolder: ResourceViewHolder, position: Int) {
        viewHolder.dataBind(resources[position])
    }
}
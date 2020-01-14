package com.quickseries.mobiletest.ui.resources.details

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.quickseries.mobiletest.databinding.ViewResourceDetailsContactInfoItemBinding
import com.quickseries.mobiletest.ui.resources.model.ContactInfoItem

class ResourceDetailsContactInfoAdapter(private val listener: Listener, private val data: List<ContactInfoItem>) :
    RecyclerView.Adapter<ResourceDetailsContactInfoAdapter.ViewHolder>() {

    class ViewHolder(private val binding: ViewResourceDetailsContactInfoItemBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(contactInfoItem: ContactInfoItem, listener: Listener) {
            binding.contactInfo = contactInfoItem
            binding.listener = listener
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemBinding = ViewResourceDetailsContactInfoItemBinding.inflate(layoutInflater, parent, false)

        return ViewHolder(itemBinding)
    }

    override fun getItemCount() = data.size

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bind(data[position], listener)
    }

    interface Listener {
        fun onContactInfoItemClick(contactInfoItem: ContactInfoItem)
    }
}
package com.lidboud.kotlin.ui.detailresource

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import androidx.recyclerview.widget.RecyclerView
import com.lidboud.kotlin.data.model.domain.Address
import com.lidboud.kotlin.databinding.AddressItemBinding
import javax.inject.Inject

class AddressListAdapter @Inject
constructor(private val onClickListener: View.OnClickListener) : ListAdapter<Address, AddressListAdapter.ViewHolder>(AddressDiffCallback()) {

    override fun onCreateViewHolder(parent: ViewGroup, i: Int): ViewHolder {
        return ViewHolder(AddressItemBinding.inflate(LayoutInflater.from(parent.context), parent, false))
    }

    override fun onBindViewHolder(viewHolder: ViewHolder, i: Int) {
        val resource = getItem(i)
        viewHolder.apply {
            bind(resource, onClickListener)
            itemView.tag = resource
        }
    }

    inner class ViewHolder(private val resourceItemBinding: AddressItemBinding) : RecyclerView.ViewHolder(resourceItemBinding.root) {
        fun bind(address: Address, onClick: View.OnClickListener) {
            resourceItemBinding.apply {
                this.address = address
                this.root.setOnClickListener(onClick)
                executePendingBindings()
            }
        }
    }
}

internal class AddressDiffCallback : DiffUtil.ItemCallback<Address>() {

    override fun areItemsTheSame(oldItem: Address, newItem: Address): Boolean {
        return oldItem.address == newItem.address && oldItem.country == newItem.country
    }

    override fun areContentsTheSame(oldItem: Address, newItem: Address): Boolean {
        return oldItem === newItem
    }
}

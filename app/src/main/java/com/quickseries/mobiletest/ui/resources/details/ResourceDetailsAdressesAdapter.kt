package com.quickseries.mobiletest.ui.resources.details

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.quickseries.mobiletest.databinding.ViewResourceDetailsAddressItemBinding
import com.quickseries.mobiletest.domain.resources.model.Address

class ResourceDetailsAdressesAdapter(private val listener: Listener, private val data: List<Address>) :
    RecyclerView.Adapter<ResourceDetailsAdressesAdapter.ViewHolder>() {

    class ViewHolder(private val binding: ViewResourceDetailsAddressItemBinding) : RecyclerView.ViewHolder(binding.root) {
        fun bind(address: Address, listener: Listener) {
            binding.address = address
            binding.listener = listener
        }
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val layoutInflater = LayoutInflater.from(parent.context)
        val itemBinding = ViewResourceDetailsAddressItemBinding.inflate(layoutInflater, parent, false)

        return ViewHolder(itemBinding)
    }

    override fun getItemCount() = data.size

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        holder.bind(data[position], listener)
    }

    interface Listener {
        fun onAdressItemClick(address: Address)
    }
}
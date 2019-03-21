package com.mvckx.elistique.ui.placedetail

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.item_place_address.view.*

class PlaceDetailAddressAdapter(private val listener: ((PlaceDetailViewState.Address) -> (Unit))) :
    RecyclerView.Adapter<PlaceDetailAddressAdapter.ViewHolder>() {
    private var addresses: List<PlaceDetailViewState.Address> = emptyList()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater
            .from(parent.context)
            .inflate(R.layout.item_place_address, parent, false)
        return ViewHolder(view, listener)
    }

    override fun getItemCount() = addresses.size

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val address = addresses[position]
        holder.bind(address)
    }

    fun updateAddresses(addresses: List<PlaceDetailViewState.Address>) {
        this.addresses = addresses
        // Could use DiffUtils instead of notifyDataSetChanged() to be cleaner if we know we may get updates
        notifyDataSetChanged()
    }

    class ViewHolder(itemView: View, private val listener: ((PlaceDetailViewState.Address) -> (Unit))) :
        RecyclerView.ViewHolder(itemView) {
        private var address: PlaceDetailViewState.Address? = null

        init {
            itemView.setOnClickListener {
                address?.let {
                    listener.invoke(it)
                }
            }
        }

        fun bind(address: PlaceDetailViewState.Address) {
            this.address = address
            itemView.addressDetail.setValue(address.toReadableFormat())
        }
    }
}

private fun PlaceDetailViewState.Address.toReadableFormat(): String {
    return "$address1\n$city, $state $zip\n$country"
}

package com.quickseries.codetest.adapter

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.quickseries.codetest.R
import com.quickseries.codetest.model.Address
import kotlinx.android.synthetic.main.list_item_contact.view.*


class RecyclerAddressAdapter(private val addresses: List<Address>) : RecyclerView.Adapter<RecyclerAddressAdapter.RecyclerAdressViewHolder>() {

    private lateinit var context: Context

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerAdressViewHolder {
        context = parent.context
        val view = LayoutInflater.from(parent.context).inflate(R.layout.list_item_contact, parent, false)
        return RecyclerAdressViewHolder(view)
    }

    override fun getItemCount(): Int {
        return addresses.size
    }

    override fun onBindViewHolder(holder: RecyclerAdressViewHolder, position: Int) {
        holder.contactInfo.text = addresses[position].address1

    }

    inner class RecyclerAdressViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var contactInfo: TextView = itemView.contact_info

        init {

            itemView.contact_label.text = "ADDRESS"

            itemView.setOnClickListener { view ->
//                when (labels[adapterPosition]) {
//                    ContactInfo.EMAIL -> {
//                        val intent = Intent(Intent.ACTION_SENDTO)
//                        intent.data = Uri.parse("mailto:${contacts[adapterPosition]}")
//                        context.startActivity(intent)
//                    }
//                    ContactInfo.PHONE -> {
//                        val intent = Intent(Intent.ACTION_CALL, Uri.parse("tel:" + contacts[adapterPosition]))
//                        context.startActivity(intent)
//                    }
//                    ContactInfo.WEBSITE -> {
//                        val intent = Intent(Intent.ACTION_VIEW)
//                        intent.data = Uri.parse(contacts[adapterPosition])
//                        context.startActivity(intent)
//                    }
//                    else -> {
//                    }
//                }

            }
        }
    }
}
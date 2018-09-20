package com.quickseries.codetest.adapter

import android.annotation.SuppressLint
import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.quickseries.codetest.R
import kotlinx.android.synthetic.main.list_item_contact.view.*
import android.support.v4.content.ContextCompat.startActivity
import android.content.Intent
import android.net.Uri
import com.quickseries.codetest.model.ContactInfo


class RecyclerContactAdapter(private val contacts: List<String>, private val labels: List<Int>) : RecyclerView.Adapter<RecyclerContactAdapter.RecyclerContactViewHolder>() {

    private lateinit var context: Context

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerContactViewHolder {
        context = parent.context
        val view = LayoutInflater.from(parent.context).inflate(R.layout.list_item_contact, parent, false)
        return RecyclerContactViewHolder(view)
    }

    override fun getItemCount(): Int {
        return contacts.size
    }

    override fun onBindViewHolder(holder: RecyclerContactViewHolder, position: Int) {
        holder.contactInfo.text = contacts[position]
        holder.contactLabel.text = when (labels[position]) {
            ContactInfo.EMAIL -> "Email"
            ContactInfo.PHONE -> "PHONE NUMBER"
            ContactInfo.WEBSITE -> "WEBSITE"
            else -> ""
        }
    }

    inner class RecyclerContactViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var contactInfo: TextView = itemView.contact_info
        var contactLabel: TextView = itemView.contact_label


        init {
            itemView.setOnClickListener { view ->
                when (labels[adapterPosition]) {
                    ContactInfo.EMAIL -> {
                        val intent = Intent(Intent.ACTION_SENDTO)
                        intent.data = Uri.parse("mailto:${contacts[adapterPosition]}")
                        context.startActivity(intent)
                    }
                    ContactInfo.PHONE -> {
                        val intent = Intent(Intent.ACTION_DIAL, Uri.parse("tel:" + contacts[adapterPosition]))
                        context.startActivity(intent)
                    }
                    ContactInfo.WEBSITE -> {
                        val intent = Intent(Intent.ACTION_VIEW)
                        intent.data = Uri.parse(contacts[adapterPosition])
                        context.startActivity(intent)
                    }
                    else -> {
                    }
                }

            }
        }
    }
}
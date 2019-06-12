package com.android.kotlin.adapter

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.android.kotlin.model.Address
import com.android.kotlindemo.R

class AddressDisplayAdapter(val items: List<Address>) : RecyclerView.Adapter<AddressDisplayAdapter.CategoriesViewHolder>() {


    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): CategoriesViewHolder {
        val view = LayoutInflater.from(viewGroup.context).inflate(R.layout.row_layout_address_item, viewGroup, false)
        return CategoriesViewHolder(view)
    }

    override fun onBindViewHolder(categoriesViewHolder: CategoriesViewHolder, i: Int) {
        categoriesViewHolder.mAddressTextView.text = items.get(i).address1
        val cityStateZip = items.get(i).city+" "+items.get(i).state+" "+items.get(i).zipCode
        categoriesViewHolder.mCityStateZipTextView.text = cityStateZip
        categoriesViewHolder.mAddressTextView.text = items.get(i).address1
        categoriesViewHolder.mCountryTextView.text = items.get(i).country
    }

    override fun getItemCount(): Int {
        return items.size
    }

    inner class CategoriesViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val mAddressTextView: TextView = itemView.findViewById(R.id.row_layout_address_text_view)
        val mCityStateZipTextView: TextView = itemView.findViewById(R.id.row_layout_city_state_text_view)
        val mCountryTextView: TextView = itemView.findViewById(R.id.row_layout_country_text_view)

    }
}
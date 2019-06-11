package com.android.kotlin.adapter

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.android.kotlin.model.RestaurantItem
import com.android.kotlindemo.R

class RestaurantsAdapter(val items : List<RestaurantItem>, val restaurantClickListener: RestaurantsAdapter.RestaurantClickListener) : RecyclerView.Adapter<RestaurantsAdapter.RestaurantsViewHolder>() {

    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): RestaurantsViewHolder {
        val view = LayoutInflater.from(viewGroup.context).inflate(R.layout.row_layout_categories_item, viewGroup, false)
        return RestaurantsViewHolder(view)
    }

    override fun onBindViewHolder(restaurantsViewHolder: RestaurantsViewHolder, i: Int) {
        restaurantsViewHolder.mRestaurantsTextView.setText(items.get(i).title)
        restaurantsViewHolder.itemView.setOnClickListener {
            restaurantClickListener.onRestaurantClick(i)
        }
    }

    override fun getItemCount(): Int {
        return items.size
    }

    inner class RestaurantsViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
         val mRestaurantsTextView: TextView = itemView.findViewById(R.id.row_layout_category_text_view)

    }

    interface RestaurantClickListener{
        fun onRestaurantClick(i:Int)
    }
}
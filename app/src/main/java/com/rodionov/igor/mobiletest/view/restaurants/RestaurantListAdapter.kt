package com.rodionov.igor.mobiletest.view.restaurants

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.ViewGroup
import com.rodionov.igor.mobiletest.R
import com.rodionov.igor.mobiletest.model.Restaurant

class RestaurantListAdapter internal constructor(private val mCategoryList: List<Restaurant>?, private val mListener: RestaurantSelectionListener) : RecyclerView.Adapter<RestaurantListViewHolder>() {

    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): RestaurantListViewHolder {
        val rootView = LayoutInflater.from(viewGroup.context).inflate(R.layout.row_restaurant, viewGroup, false)
        return RestaurantListViewHolder(rootView, mListener)
    }

    override fun onBindViewHolder(categoryListViewHolder: RestaurantListViewHolder, i: Int) {
        val category = mCategoryList!![i]
        categoryListViewHolder.bindData(category)
    }

    override fun getItemCount(): Int {
        return mCategoryList?.size ?: 0
    }
}

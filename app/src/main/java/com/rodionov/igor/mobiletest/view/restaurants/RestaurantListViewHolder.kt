package com.rodionov.igor.mobiletest.view.restaurants

import android.databinding.DataBindingUtil
import android.support.v7.widget.RecyclerView
import android.view.View
import com.bumptech.glide.Glide
import com.rodionov.igor.mobiletest.databinding.RowRestaurantBinding
import com.rodionov.igor.mobiletest.model.Restaurant

class RestaurantListViewHolder(itemView: View, private val mListener: RestaurantSelectionListener?) : RecyclerView.ViewHolder(itemView), View.OnClickListener {

    private val mBinding: RowRestaurantBinding?

    init {
        itemView.setOnClickListener(this)
        mBinding = DataBindingUtil.bind(itemView)
    }

    fun bindData(restaurant: Restaurant) {
        mBinding?.restaurant = restaurant
        Glide.with(mBinding?.iconView?.context).load(restaurant.photo).into(mBinding?.iconView)
    }

    override fun onClick(v: View) {
        mListener?.onRestaurantSelected(mBinding?.restaurant)
    }
}

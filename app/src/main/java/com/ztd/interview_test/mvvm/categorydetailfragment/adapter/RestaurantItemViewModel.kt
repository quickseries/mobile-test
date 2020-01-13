package com.ztd.interview_test.mvvm.categorydetailfragment.adapter

import androidx.databinding.ObservableField
import com.ztd.interview_test.infrustructure.data.models.restaurant.RestaurantModel


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * mahdiZTD@gmail.com
 */
class RestaurantItemViewModel(private val restaurant: RestaurantModel,private val clickListener: CategoryDetailAdapter.OnItemClickListener?) {

    val title: ObservableField<String> = ObservableField(restaurant.title ?: "")
    val description: ObservableField<String> = ObservableField(restaurant.description ?: "")
    val address: ObservableField<String> = if (restaurant.addresses != null) {
        ObservableField(
            "${restaurant.addresses[0]?.address1},${restaurant.addresses[0]?.city},${restaurant.addresses[0]?.state},${restaurant.addresses[0]?.country}"
        )
    } else {
        ObservableField("")
    }

    fun onItemClicked(){
        clickListener?.onItemClicked(restaurant)
    }
}
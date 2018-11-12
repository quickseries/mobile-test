package com.rodionov.igor.mobiletest.view.restaurants

import com.rodionov.igor.mobiletest.model.Restaurant

interface RestaurantSelectionListener {

    fun onRestaurantSelected(restaurant: Restaurant?)
}

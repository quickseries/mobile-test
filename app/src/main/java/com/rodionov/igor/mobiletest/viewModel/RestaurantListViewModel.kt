package com.rodionov.igor.mobiletest.viewModel

import android.arch.lifecycle.LiveData
import android.arch.lifecycle.ViewModel

import com.rodionov.igor.mobiletest.model.Restaurant
import com.rodionov.igor.mobiletest.repository.RestaurantsRepository

class RestaurantListViewModel(restaurantsRepository: RestaurantsRepository) : ViewModel() {

    val restaurantListData: LiveData<List<Restaurant>>

    init {
        restaurantListData = restaurantsRepository.fetchRestaurants()
    }
}

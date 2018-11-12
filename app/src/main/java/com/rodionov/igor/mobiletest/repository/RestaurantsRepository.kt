package com.rodionov.igor.mobiletest.repository

import android.arch.lifecycle.LiveData
import android.arch.lifecycle.MutableLiveData
import android.content.Context

import com.rodionov.igor.mobiletest.json.JsonDataSource
import com.rodionov.igor.mobiletest.model.Restaurant
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class RestaurantsRepository(context: Context) {

    private val mRestaurantListData: MutableLiveData<List<Restaurant>>
    private val uiScope = CoroutineScope(Dispatchers.IO)

    init {
        mRestaurantListData = MutableLiveData()
        uiScope.launch { loadRestaurants(context) }
    }

    fun fetchRestaurants(): LiveData<List<Restaurant>> {
        return mRestaurantListData
    }

    private fun loadRestaurants(context: Context) {
        val jsonDataSource = JsonDataSource(context)
        val restaurantList = jsonDataSource.readRestaurants()
        mRestaurantListData.postValue(restaurantList)
    }
}

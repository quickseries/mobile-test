package com.rodionov.igor.mobiletest.view.restaurants

import android.arch.lifecycle.Observer
import android.arch.lifecycle.ViewModelProviders
import android.databinding.DataBindingUtil
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.LinearLayoutManager
import com.rodionov.igor.mobiletest.R
import com.rodionov.igor.mobiletest.databinding.ActivityRestaurantListBinding
import com.rodionov.igor.mobiletest.model.Restaurant
import com.rodionov.igor.mobiletest.view.general.Divider
import com.rodionov.igor.mobiletest.viewModel.RestaurantListViewModel
import com.rodionov.igor.mobiletest.viewModel.ViewModelFactory

class RestaurantListActivity : AppCompatActivity(), RestaurantSelectionListener {

    lateinit var mBinding: ActivityRestaurantListBinding
    lateinit var mViewModel: RestaurantListViewModel

    override fun onRestaurantSelected(restaurant: Restaurant?) {

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mBinding = DataBindingUtil.setContentView(this, R.layout.activity_restaurant_list)
        initViewModel()
    }

    private fun initViewModel() {
        mViewModel = ViewModelProviders.of(this, ViewModelFactory(this)).get(RestaurantListViewModel::class.java)
        mViewModel.restaurantListData.observe(this, Observer {restaurantList -> initRestaurantList(restaurantList) })
    }

    private fun initRestaurantList(restaurantList: List<Restaurant>?) {
        mBinding.restaurantListView.layoutManager = LinearLayoutManager(this)
        mBinding.restaurantListView.addItemDecoration(Divider(this))
        mBinding.restaurantListView.adapter = RestaurantListAdapter(restaurantList, this)
    }
}

package com.android.kotlin.ui

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.View
import android.widget.ProgressBar
import com.android.kotlin.MobileTestApplication
import com.android.kotlin.adapter.RestaurantsAdapter
import com.android.kotlin.di.components.DaggerActivityComponent
import com.android.kotlin.di.modules.ActivityModule
import com.android.kotlin.model.RestaurantItem
import com.android.kotlin.utils.SchedulerProvider
import com.android.kotlindemo.R
import com.google.gson.Gson
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.disposables.Disposable
import javax.inject.Inject


class RestaurantListActivity : AppCompatActivity(),RestaurantsAdapter.RestaurantClickListener {

    @Inject
    lateinit var mainViewModel: MainActivityViewModel
    private lateinit var compositeDisposable: CompositeDisposable
    private var disposable: Disposable? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_retaurants)
        val activityComponent = DaggerActivityComponent.builder()
                .appComponent(MobileTestApplication.get(this).component())
                .activityModule(ActivityModule(SchedulerProvider()))
                .build()
        activityComponent.inject(this)
        val recyclerView  : RecyclerView = findViewById(R.id.activity_restaurant_recycler_view)
        val progressBar : ProgressBar = findViewById(R.id.activity_restaurants_progress_bar)
        progressBar.visibility = View.VISIBLE
        val linearLayoutManager = LinearLayoutManager(this)
        recyclerView.layoutManager = linearLayoutManager
        lateinit var adapter: RestaurantsAdapter
        disposable = mainViewModel.provideRestaurants()
                ?.subscribe({ result ->
                    adapter = RestaurantsAdapter(result,this)
                    recyclerView.adapter = adapter
                    progressBar.visibility = View.GONE
                    mainViewModel.setIsLoading(false)
                }, { e -> e.printStackTrace() })


        compositeDisposable = CompositeDisposable()


    }

    override fun onPause() {
        super.onPause()
        if (compositeDisposable.size() > 0) {
            compositeDisposable.clear()
        }
    }

    override fun onResume() {
        super.onResume()
        if (disposable != null) {
            compositeDisposable.add(disposable!!)
        }
    }

    override fun onRestaurantClick(restaurantItem: RestaurantItem) {
        val intent = Intent(this, RestaurantDetailActivity::class.java)
        val gson = Gson()
        val restaurantItemString  = gson.toJson(restaurantItem)
        intent.putExtra(RestaurantDetailActivity.KEY_RESTAURANT_ITEM,restaurantItemString)
        startActivity(intent)
    }
}

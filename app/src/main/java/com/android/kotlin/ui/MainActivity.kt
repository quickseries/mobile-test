package com.android.kotlin.ui

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.view.View
import android.widget.ProgressBar
import com.android.kotlin.MobileTestApplication
import com.android.kotlin.adapter.CategoriesAdapter
import com.android.kotlin.di.components.DaggerActivityComponent
import com.android.kotlin.di.modules.ActivityModule
import com.android.kotlin.utils.SchedulerProvider
import com.android.kotlindemo.R
import io.reactivex.disposables.CompositeDisposable
import io.reactivex.disposables.Disposable
import javax.inject.Inject

class MainActivity : AppCompatActivity(),CategoriesAdapter.CategoryClickListener {

    @Inject
    lateinit var mainViewModel: MainActivityViewModel
    private lateinit var compositeDisposable: CompositeDisposable
    private var disposable: Disposable? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        val activityComponent = DaggerActivityComponent.builder()
                .appComponent(MobileTestApplication.get(this).component())
                .activityModule(ActivityModule(SchedulerProvider()))
                .build()
        activityComponent.inject(this)
        val recyclerView  : RecyclerView = findViewById(R.id.activity_main_recycler_view)
        val progressBar : ProgressBar = findViewById(R.id.activity_main_progress_bar)
        progressBar.visibility = View.VISIBLE
        val linearLayoutManager = LinearLayoutManager(this)
        recyclerView.layoutManager = linearLayoutManager
        lateinit var adapter: CategoriesAdapter
        disposable = mainViewModel.provideCategories()
                ?.subscribe({ result ->
                    progressBar.visibility = View.GONE
                    adapter = CategoriesAdapter(result,this)
                    recyclerView.adapter = adapter
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

    override fun onCategoryClick(i: Int) {
        val intent = Intent(this, RestaurantListActivity::class.java)
        startActivity(intent)
    }
}



package com.mvckx.elistique.ui.categories

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.activity_categories.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class CategoriesActivity : AppCompatActivity() {

    private val viewModel = viewModel<CategoriesViewModel>()
    private val categoriesAdapter = CategoriesAdapter()
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_categories)
        setupViews()
        setupViewModel()
    }

    private fun setupViews() {
        recyclerView.adapter = categoriesAdapter
        recyclerView.layoutManager = LinearLayoutManager(this)
    }

    private fun renderViewState(vs: CategoriesViewState) {
        progressBar.visibility = if (vs.loading) View.VISIBLE else View.GONE
        recyclerView.visibility = if (vs.loading) View.GONE else View.VISIBLE
        categoriesAdapter.updateCategories(vs.categoryItems)
    }

    private fun setupViewModel() {
        viewModel.value.categoryLiveData().observe(this, Observer {
            renderViewState(it)
        })
    }
}

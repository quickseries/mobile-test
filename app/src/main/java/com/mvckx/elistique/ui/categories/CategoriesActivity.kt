package com.mvckx.elistique.ui.categories

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.mvckx.elistique.R
import com.mvckx.elistique.ui.categorydetail.CategoryDetailActivity
import kotlinx.android.synthetic.main.activity_categories.*
import org.koin.androidx.viewmodel.ext.android.viewModel


class CategoriesActivity : AppCompatActivity() {

    private val viewModel = viewModel<CategoriesViewModel>()
    private val categoriesAdapter = CategoriesAdapter { categoryClicked(it) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_categories)
        setupViews()
        setupViewModel()
    }

    private fun setupViews() {
        recyclerView.adapter = categoriesAdapter
        recyclerView.layoutManager = LinearLayoutManager(this)
        val dividerItemDecoration = DividerItemDecoration(this, LinearLayoutManager.VERTICAL)
        recyclerView.addItemDecoration(dividerItemDecoration)
    }

    private fun setupViewModel() {
        viewModel.value.categoryLiveData().observe(this, Observer {
            renderViewState(it)
        })
    }

    private fun renderViewState(vs: CategoriesViewState) {
        progressBar.visibility = if (vs.loading) View.VISIBLE else View.GONE
        recyclerView.visibility = if (vs.loading) View.GONE else View.VISIBLE
        categoriesAdapter.updateCategories(vs.categoryItems)
    }

    private fun categoryClicked(categoryId: String) {
        // This could actually be forwarded to the ViewModel for extra logic handling
        startActivity(CategoryDetailActivity.intent(this, categoryId))
    }
}

package com.mvckx.elistique.ui.categories

import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.activity_categories.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class CategoriesActivity : AppCompatActivity() {

    private val viewModel = viewModel<CategoriesViewModel>()
    private val categoriesAdapter = CategoriesAdapter { categoryClicked(it) } // This could actually be forwarded to the ViewModel for extra logic handling

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

    private fun categoryClicked(it: String) {
        Toast.makeText(this, "$it clicked", Toast.LENGTH_LONG).show()
    }
}

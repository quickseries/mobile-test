package com.mvckx.elistique.ui.categorydetail

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.DividerItemDecoration
import androidx.recyclerview.widget.LinearLayoutManager
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.activity_categories.*
import org.koin.androidx.viewmodel.ext.android.viewModel

class CategoryDetailActivity : AppCompatActivity() {

    private val viewModel = viewModel<CategoryDetailViewModel>()
    private val categoryDetailAdapter = CategoryDetailAdapter { placeClicked(it) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_category_detail)
        setupViews()
        setupViewModel()
    }

    private fun setupViews() {
        recyclerView.adapter = categoryDetailAdapter
        recyclerView.layoutManager = LinearLayoutManager(this)
        val dividerItemDecoration = DividerItemDecoration(this, LinearLayoutManager.VERTICAL)
        recyclerView.addItemDecoration(dividerItemDecoration)
    }

    private fun setupViewModel() {
        val vm = viewModel.value
        vm.setCategoryId(intent.getStringExtra(EXTRA_CATEGORY_ID))
        vm.detailLiveData().observe(this, Observer {
            renderViewState(it)
        })
    }

    private fun renderViewState(vs: CategoryDetailViewState) {
        progressBar.visibility = if (vs.loading) View.VISIBLE else View.GONE
        recyclerView.visibility = if (vs.loading) View.GONE else View.VISIBLE
        categoryDetailAdapter.updatePlaces(vs.placeItems)
    }

    private fun placeClicked(categoryId: String) {
        Toast.makeText(this, "$categoryId clicked", Toast.LENGTH_LONG).show()
    }

    companion object {
        private const val EXTRA_CATEGORY_ID = "CATEGORY_ID"

        fun intent(context: Context, categoryId: String): Intent {
            val intent = Intent(context, CategoryDetailActivity::class.java)
            intent.putExtra(EXTRA_CATEGORY_ID, categoryId)
            return intent
        }
    }
}
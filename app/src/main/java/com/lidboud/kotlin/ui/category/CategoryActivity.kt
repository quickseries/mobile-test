package com.lidboud.kotlin.ui.category

import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import com.lidboud.kotlin.R
import com.lidboud.kotlin.data.model.domain.Category
import com.lidboud.kotlin.ui.resource.ResourceActivity
import dagger.android.AndroidInjection
import kotlinx.android.synthetic.main.activity_category.category_layout_recyclerView
import javax.inject.Inject

class CategoryActivity : AppCompatActivity() {

    @Inject
    lateinit var viewModelFactory: ViewModelProvider.Factory
    private val listAdapter = CategoryListAdapter(View.OnClickListener { v ->
        v?.let {
            val position = category_layout_recyclerView.getChildLayoutPosition(v)
            resourceViewModel.handleCategoryClicked(position)
        }
    })

    lateinit var resourceViewModel: CategoryViewModel

    public override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        AndroidInjection.inject(this)
        setContentView(R.layout.activity_category)
        initViewModel()
        setupRecyclerView()
        resourceViewModel.fetchCategories()
    }

    private fun initViewModel() {
        resourceViewModel = ViewModelProviders.of(this, viewModelFactory).get(CategoryViewModel::class.java)
        setupViewModel()
    }

    private fun setupRecyclerView() {
        category_layout_recyclerView.layoutManager = LinearLayoutManager(this)
        category_layout_recyclerView.adapter = listAdapter
    }

    private fun setupViewModel() {
        resourceViewModel.categoryDataModel.observe(this, Observer<CategoryDataModel> { searchDataModel ->
            if (searchDataModel != null) {
                searchDataModel.errorMessage?.let { message ->
                    displayError(message)
                } ?: run {
                    searchDataModel.categories?.let { categories ->
                        displayCategories(categories)
                    }
                }
            }
        })

        resourceViewModel.navigationDataModel.observe(this, Observer<Category> { category ->
            category?.let {
                val intent = ResourceActivity.getIntent(this, category.id)
                startActivity(intent)
            }
        })
    }

    private fun displayCategories(categories: List<Category>) {
        listAdapter.submitList(categories)
    }

    private fun displayError(errorMessage: String) {
        val title = "Error"
        val dialog = AlertDialog.Builder(this)
                .setTitle(title)
                .setMessage(errorMessage)
                .setPositiveButton("ok", null)
                .create()
        dialog.show()
    }
}

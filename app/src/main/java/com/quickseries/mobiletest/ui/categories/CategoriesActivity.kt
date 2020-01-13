package com.quickseries.mobiletest.ui.categories

import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.databinding.DataBindingUtil
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import com.quickseries.mobiletest.R
import com.quickseries.mobiletest.databinding.ActivityCategoriesBinding

class CategoriesActivity : AppCompatActivity() {

    private val viewmodel by lazy {
        ViewModelProviders.of(this).get(CategoriesViewModel::class.java)
    }

    private val categories = mutableListOf<CategoryItem>()
    private val categoriesAdapter by lazy {
        CategoriesAdapter(categories)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val binding: ActivityCategoriesBinding =
            DataBindingUtil.setContentView(this, R.layout.activity_categories)

        binding.categoriesRecyclerview.apply {
            layoutManager = LinearLayoutManager(this@CategoriesActivity)
            adapter = categoriesAdapter
        }

        viewmodel.categoriesLiveData.observe(this, Observer<CategoriesState> { state ->
            binding.state = state
            handleState(state)
        })
    }

    override fun onResume() {
        super.onResume()
        viewmodel.fetchCategories()
    }

    private fun handleState(state: CategoriesState) {
        when (state) {
            is CategoriesState.Success -> {
                categories.clear()
                categories.addAll(state.list)
                categoriesAdapter.notifyDataSetChanged()
            }
            is CategoriesState.Error -> {
                AlertDialog.Builder(this)
                    .setMessage(state.message)
                    .show()
            }
        }

    }
}

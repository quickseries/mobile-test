package com.mvckx.elistique.ui.categories

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.fragment_categories.*
import org.koin.androidx.viewmodel.ext.android.viewModel
import org.koin.standalone.KoinComponent

class CategoriesFragment : Fragment(), KoinComponent {
    private val viewModel = viewModel<CategoriesViewModel>()
    private val categoriesAdapter = CategoriesAdapter()

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_categories, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupViews()
        setupViewModel()
    }

    private fun setupViews() {
        viewModel.value.categoryLiveData().observe(this, Observer {
            categoriesAdapter.updateCategories(it)
        })
    }

    private fun setupViewModel() {
        recyclerView.adapter = categoriesAdapter
        recyclerView.layoutManager = LinearLayoutManager(context)
    }

    companion object {
        private const val LOG_TAG = "CategoriesFragment"
    }
}
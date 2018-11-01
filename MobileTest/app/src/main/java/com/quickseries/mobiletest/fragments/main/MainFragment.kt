package com.quickseries.mobiletest.fragments.main

import android.arch.lifecycle.Observer
import android.arch.lifecycle.ViewModelProviders
import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.widget.LinearLayoutManager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.quickseries.mobiletest.R
import com.quickseries.mobiletest.activities.main.MainActivity
import com.quickseries.mobiletest.adapters.category.CategoryAdapter
import com.quickseries.mobiletest.fragments.categoryDetail.CategoryDetailFragment
import com.quickseries.mobiletest.fragments.resourceList.ResourceListFragment
import com.quickseries.mobiletest.util.Extras
import com.quickseries.mobiletestcore.enums.SortDirection
import com.quickseries.mobiletestcore.models.CategoryModelBase
import com.quickseries.mobiletestcore.viewModels.CategoryViewModel
import kotlinx.android.synthetic.main.fragment_list_base.*

class MainFragment : Fragment() {
    private val adapter = CategoryAdapter()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {

        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_main, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        titleTextView.text = getString(R.string.categories)

        val layoutManager = LinearLayoutManager(this.requireContext())
        layoutManager.orientation = LinearLayoutManager.VERTICAL
        recyclerView.layoutManager = layoutManager
        recyclerView.adapter = adapter

        adapter.infoClick = { category ->
            showInfoFragment(category)
        }

        adapter.itemClick = { category ->
            showResources(category)
        }

        val viewModel = ViewModelProviders.of(this).get(CategoryViewModel::class.java)
        viewModel.getCategories().observe(this, Observer { categories ->
            if (categories != null) {
                adapter.setCategories(categories)
            } else {
                adapter.setCategories(emptyList())
            }
        })

        sortImageView.setOnClickListener {
            viewModel.toggleSortDirection()
            if (viewModel.getSortDirection() == SortDirection.ASC) {
                sortImageView.setImageResource(R.drawable.ic_sort_asc)
            } else {
                sortImageView.setImageResource(R.drawable.ic_sort_desc)
            }
        }
    }

    private fun showInfoFragment(category: CategoryModelBase) {
        val fragment = CategoryDetailFragment()
        val bundle = Bundle()
        bundle.putString(Extras.EXTRA_ID, category.id.toString())
        fragment.arguments = bundle
        (this.activity as MainActivity?)?.navigateToFragment(fragment)
    }

    private fun showResources(category: CategoryModelBase) {
        val fragment = ResourceListFragment()
        val bundle = Bundle()
        bundle.putString(Extras.EXTRA_ID, category.id.toString())
        fragment.arguments = bundle
        (this.activity as MainActivity?)?.navigateToFragment(fragment)
    }
}

package com.quickseries.mobiletest.fragments.resourceList


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
import com.quickseries.mobiletest.adapters.resource.ResourceAdapter
import com.quickseries.mobiletest.fragments.resourceDetail.ResourceDetailFragment
import com.quickseries.mobiletest.util.Extras
import com.quickseries.mobiletestcore.enums.SortDirection
import com.quickseries.mobiletestcore.util.UUIDUtil
import com.quickseries.mobiletestcore.viewModels.ResourceListViewModel
import kotlinx.android.synthetic.main.fragment_list_base.*
import java.util.*

class ResourceListFragment : Fragment() {

    val adapter = ResourceAdapter()
    var categoryId: UUID = UUIDUtil.emptyUUID()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_resource_list, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        arguments?.let {
            categoryId = UUID.fromString(it.getString(Extras.EXTRA_ID, UUIDUtil.emptyUUID().toString()))
        }
        titleTextView.text = getString(R.string.resources)
        val layoutManager = LinearLayoutManager(this.requireContext())
        layoutManager.orientation = LinearLayoutManager.VERTICAL
        recyclerView.layoutManager = layoutManager
        recyclerView.adapter = adapter

        adapter.itemClick = { resource ->
            val fragment = ResourceDetailFragment()
            val bundle = Bundle()
            bundle.putString(Extras.EXTRA_ID, resource.id.toString())
            fragment.arguments = bundle
            (this.activity as MainActivity?)?.navigateToFragment(fragment)
        }

        val viewModel = ViewModelProviders.of(this).get(ResourceListViewModel::class.java)
        viewModel.getResources().observe(this, Observer { resources ->
            if (resources != null) {
                adapter.setResources(resources)
            } else {
                adapter.setResources(emptyList())
            }
        })

        viewModel.setCategoryId(categoryId)

        sortImageView.setOnClickListener {
            viewModel.toggleSortDirection()
            if (viewModel.getSortDirection() == SortDirection.ASC) {
                sortImageView.setImageResource(R.drawable.ic_sort_asc)
            } else {
                sortImageView.setImageResource(R.drawable.ic_sort_desc)
            }
        }

    }
}

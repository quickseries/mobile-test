package com.quickseries.mobiletest.ui.resources.list

import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.appcompat.app.AlertDialog
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import com.quickseries.mobiletest.databinding.FragmentResourcesListBinding
import com.quickseries.mobiletest.ui.resources.ResourcesState
import com.quickseries.mobiletest.ui.resources.ResourcesViewModel
import com.quickseries.mobiletest.ui.resources.model.ResourceItem

class ResourcesListFragment : Fragment(), ResourcesAdapter.Listener {

    private val viewmodel by lazy {
        ViewModelProviders.of(requireActivity()).get(ResourcesViewModel::class.java)
    }

    private var binding: FragmentResourcesListBinding? = null

    private val resources = mutableListOf<ResourceItem>()
    private val resourcesAdapter by lazy {
        ResourcesAdapter(this, resources)
    }

    private var listener: Listener? = null

    override fun onAttach(context: Context) {
        super.onAttach(context)
        listener = context as Listener
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentResourcesListBinding.inflate(layoutInflater, container, false)
        binding?.viewmodel = viewmodel
        return binding?.root
    }

    override fun onActivityCreated(savedInstanceState: Bundle?) {
        super.onActivityCreated(savedInstanceState)

        binding?.resourcesRecyclerview?.apply {
            layoutManager = LinearLayoutManager(requireContext())
            adapter = resourcesAdapter
        }

        viewmodel.stateLiveData.observe(viewLifecycleOwner, Observer { state ->
            binding?.state = state
            handleState(state)
        })
    }

    override fun onResume() {
        super.onResume()
        viewmodel.fetchResources()
    }

    override fun onDetach() {
        listener = null
        super.onDetach()
    }

    override fun onResourceItemClick(resource: ResourceItem) {
        viewmodel.resourceItemSelected(resource)
        listener?.onResourceItemClick(resource)
    }

    private fun handleState(state: ResourcesState) {
        when (state) {
            is ResourcesState.Success -> {
                resources.clear()
                resources.addAll(state.list)
                resourcesAdapter.notifyDataSetChanged()
            }
            is ResourcesState.Error -> {
                AlertDialog.Builder(requireContext())
                    .setMessage(state.message)
                    .show()
            }
        }
    }

    interface Listener {
        fun onResourceItemClick(resourceItem: ResourceItem)
    }

    companion object {
        fun newInstance() = ResourcesListFragment()
    }
}
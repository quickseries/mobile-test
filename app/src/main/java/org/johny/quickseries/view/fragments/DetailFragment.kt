package org.johny.quickseries.view.fragments

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.Fragment
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProviders
import org.johny.quickseries.R
import org.johny.quickseries.databinding.FragmentDetailBinding
import org.johny.quickseries.model.Resource
import org.johny.quickseries.viewmodel.ListViewModel

class DetailFragment : Fragment() {
    private val slug by lazy { this.arguments?.getString("slug") ?: "categories" }
    private val title by lazy { this.arguments?.getString("title") ?: getString(R.string.category_title) }
    private val id by lazy { this.arguments?.getString("id") ?: "" }
    private lateinit var binding: FragmentDetailBinding

    private lateinit var viewModel: ListViewModel

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        binding = DataBindingUtil.inflate(layoutInflater, R.layout.fragment_detail, container, false)

//        binding = DataBindingUtil.inflate<FragmentDetailBinding>(
//            inflater, R.layout.fragment_detail, container, false
//        ).apply {
//            lifecycleOwner = this@DetailFragment
//        }

        return binding.root
    }

    override fun onResume() {
        super.onResume()
        activity?.title = title
        viewModel.loadResource(slug, id)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        viewModel = ViewModelProviders.of(this).get(ListViewModel::class.java)
        viewModel.observableResource.observe(this, Observer { resource ->
            resource?.let { render(it) }
        })
    }

    private fun render(resource: Resource) {
        Log.v("DetailFragment", "" + resource)
        binding.resource = resource
    }
}
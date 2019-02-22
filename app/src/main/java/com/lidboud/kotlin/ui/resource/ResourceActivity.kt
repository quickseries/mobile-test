package com.lidboud.kotlin.ui.resource

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import com.lidboud.kotlin.R
import com.lidboud.kotlin.data.model.domain.Resource
import com.lidboud.kotlin.ui.detailresource.DetailResourceActivity
import dagger.android.AndroidInjection
import kotlinx.android.synthetic.main.activity_resource.resource_layout_button
import kotlinx.android.synthetic.main.activity_resource.resource_layout_recyclerView
import javax.inject.Inject

class ResourceActivity : AppCompatActivity() {

    @Inject
    lateinit var viewModelFactory: ViewModelProvider.Factory

    val listAdapter = ResourceListAdapter(View.OnClickListener { v ->
        v?.let {
            val position = resource_layout_recyclerView.getChildLayoutPosition(v)
            resourceViewModel.handleResourceClicked(position)
        }
    })

    lateinit var resourceViewModel: ResourceViewModel

    public override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        AndroidInjection.inject(this)
        setContentView(R.layout.activity_resource)
        initViewModel()
        setupRecyclerView()
        setupListener()
        val categoryId = intent.getStringExtra(EXTRA_CATEGORY_ID)
        resourceViewModel.fetchResources(categoryId)
    }

    private fun setupListener() {
        resource_layout_button.setOnClickListener {
            resourceViewModel.handleSortedClick()
        }
    }

    private fun initViewModel() {
        resourceViewModel = ViewModelProviders.of(this, viewModelFactory).get(ResourceViewModel::class.java)
        setupViewModel()
    }

    private fun setupRecyclerView() {
        resource_layout_recyclerView.layoutManager = LinearLayoutManager(this)
        resource_layout_recyclerView.adapter = listAdapter
    }

    private fun setupViewModel() {
        resourceViewModel.resourceDataModel.observe(this, Observer<ResourceDataModel> { resourceDataModel ->
            if (resourceDataModel != null) {
                resourceDataModel.errorMessage?.let { message ->
                    displayError(message)
                } ?: run {
                    resourceDataModel.resources?.let { resources ->
                        displayResources(resources)
                    }
                }
            }
        })

        resourceViewModel.navigationDataModel.observe(this, Observer<Resource> { resource ->
            resource?.let {
                val intent = DetailResourceActivity.getIntent(this, resource.id)
                startActivity(intent)
            }
        })
    }

    private fun displayResources(resources: List<Resource>) {
        listAdapter.submitList(resources)
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


    companion object {
        const val EXTRA_CATEGORY_ID = "extra_category_id"
        fun getIntent(context: Context, categoryId: String): Intent {
            val intent = Intent(context, ResourceActivity::class.java)
            intent.putExtra(EXTRA_CATEGORY_ID, categoryId)
            return intent
        }
    }
}

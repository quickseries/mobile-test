package com.lidboud.kotlin.ui.detailresource

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.text.Html
import android.view.View
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.lifecycle.Observer
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import androidx.recyclerview.widget.LinearLayoutManager
import com.lidboud.kotlin.R
import com.lidboud.kotlin.data.model.domain.Address
import com.lidboud.kotlin.data.model.domain.Resource
import com.lidboud.kotlin.ui.common.navigateTo
import dagger.android.AndroidInjection
import kotlinx.android.synthetic.main.activity_detail_resource.detail_resource_addresses_recycleview
import kotlinx.android.synthetic.main.activity_detail_resource.detail_resource_description_textView
import kotlinx.android.synthetic.main.activity_detail_resource.detail_resource_title_textView
import kotlinx.android.synthetic.main.activity_detail_resource.include_contact_email_info
import kotlinx.android.synthetic.main.activity_detail_resource.include_contact_info_web
import kotlinx.android.synthetic.main.contact_info_email.contact_info_email_content_textView2
import kotlinx.android.synthetic.main.contact_info_web.contact_info_web_content_textView
import javax.inject.Inject

class DetailResourceActivity : AppCompatActivity() {

    @Inject
    lateinit var viewModelFactory: ViewModelProvider.Factory

    val listAdapter = AddressListAdapter(View.OnClickListener { v ->
        v?.let {
            val position = detail_resource_addresses_recycleview.getChildLayoutPosition(v)
            resourceViewModel.handleAddressClicked(position)
        }
    })

    lateinit var resourceViewModel: DetailResourceViewModel

    public override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        AndroidInjection.inject(this)
        setContentView(R.layout.activity_detail_resource)
        initViewModel()
        setupRecyclerView()
        setupListener()
        val resourceId = intent.getStringExtra(EXTRA_RESOURCE_ID)
        resourceViewModel.fetchResource(resourceId)
    }

    private fun setupListener() {
        include_contact_email_info.setOnClickListener(object : View.OnClickListener {
            override fun onClick(v: View?) {
                resourceViewModel.handleEmailClicked()
            }
        })
        include_contact_info_web.setOnClickListener(object : View.OnClickListener {
            override fun onClick(v: View?) {
                resourceViewModel.handleWebsiteClicked()
            }
        })
    }

    private fun initViewModel() {
        resourceViewModel = ViewModelProviders.of(this, viewModelFactory).get(DetailResourceViewModel::class.java)
        setupViewModel()
    }

    private fun setupRecyclerView() {
        detail_resource_addresses_recycleview.layoutManager = LinearLayoutManager(this)
        detail_resource_addresses_recycleview.adapter = listAdapter
    }

    private fun setupViewModel() {
        resourceViewModel.resourceDataModel.observe(this, Observer<DetailResourceDataModel> { resourceDataModel ->
            if (resourceDataModel != null) {
                resourceDataModel.errorMessage?.let { message ->
                    displayError(message)
                } ?: run {
                    resourceDataModel.resource?.let { resource ->
                        displayResourceDetails(resource)
                    }
                }
            }
        })

        resourceViewModel.navigationDataModel.observe(this, Observer { navigationInfo ->
            navigateTo(this, navigationInfo)
        })
    }

    private fun displayResourceDetails(resource: Resource) {
        detail_resource_title_textView.text = resource.title
        detail_resource_description_textView.text = Html.fromHtml(resource.description)
        resource.contactInfo.email?.let {
            contact_info_email_content_textView2.text = resource.contactInfo.email[0]
        }
        resource.contactInfo.website?.let {
            contact_info_web_content_textView.text = resource.contactInfo.website[0]
        }
        displayAddresses(resource.addresses)
    }

    private fun displayAddresses(addresses: List<Address>) {
        listAdapter.submitList(addresses)
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
        const val EXTRA_RESOURCE_ID = "extra_resource_id"
        fun getIntent(context: Context, categoryId: String): Intent {
            val intent = Intent(context, DetailResourceActivity::class.java)
            intent.putExtra(EXTRA_RESOURCE_ID, categoryId)
            return intent
        }
    }
}

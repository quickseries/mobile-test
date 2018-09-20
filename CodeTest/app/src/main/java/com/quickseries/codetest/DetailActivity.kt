package com.quickseries.codetest

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.LinearLayoutManager
import android.text.Html
import com.quickseries.codetest.adapter.RecyclerContactAdapter
import com.quickseries.codetest.model.Resource
import kotlinx.android.synthetic.main.activity_detail.*
import android.support.v7.widget.DividerItemDecoration
import android.util.Log
import com.quickseries.codetest.adapter.RecyclerAddressAdapter
import com.quickseries.codetest.model.ContactInfo
import com.squareup.picasso.Picasso


class DetailActivity : AppCompatActivity() {

    private lateinit var resource: Resource

    companion object {
        private val INTENT_RESOUCE = "resouce"

        fun newIntent(context: Context, resource: Resource): Intent {
            val intent = Intent(context, DetailActivity::class.java)
            intent.putExtra(INTENT_RESOUCE, resource)
            return intent

        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_detail)

        resource = intent.getSerializableExtra(INTENT_RESOUCE) as Resource

        title = "Detail"

        setupView()
    }

    private fun setupView() {

        resource.photo?.let {
            if (it.isNotEmpty())
                Picasso.get().load(resource.photo).into(resouce_image)
        }



        resouce_title.text = resource.title
        resouce_details.text = Html.fromHtml(resource.description)


        val type: MutableList<Int> = mutableListOf()

        val contacts: MutableList<String> = mutableListOf()

        resource.contactInfo?.phoneNumber?.forEach {
            if (it.isNotEmpty()) {
                contacts.add(it)
                type.add(ContactInfo.PHONE)
            }
        }

        resource.contactInfo?.email?.forEach {
            if (it.isNotEmpty()) {
                contacts.add(it)
                type.add(ContactInfo.EMAIL)
            }
        }

        resource.contactInfo?.website?.forEach {
            if (it.isNotEmpty()) {
                contacts.add(it)
                type.add(ContactInfo.WEBSITE)
            }
        }

        contact_recycler.adapter = RecyclerContactAdapter(contacts, type)
        contact_recycler.layoutManager = LinearLayoutManager(this@DetailActivity, LinearLayoutManager.VERTICAL, false)
        contact_recycler.isNestedScrollingEnabled = false
        contact_recycler.addItemDecoration(DividerItemDecoration(this, DividerItemDecoration.VERTICAL))



        resource.addresses?.let {
            address_recycler.adapter = RecyclerAddressAdapter(it)
            contact_recycler.layoutManager = LinearLayoutManager(this@DetailActivity, LinearLayoutManager.VERTICAL, false)
            contact_recycler.isNestedScrollingEnabled = false
            contact_recycler.addItemDecoration(DividerItemDecoration(this, DividerItemDecoration.VERTICAL))
        }

    }
}


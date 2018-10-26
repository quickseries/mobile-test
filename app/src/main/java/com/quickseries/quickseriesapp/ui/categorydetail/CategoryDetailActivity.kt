package com.quickseries.quickseriesapp.ui.categorydetail

import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.support.v7.app.AlertDialog
import android.support.v7.app.AppCompatActivity
import android.text.Html
import android.view.MenuItem
import android.view.View
import com.quickseries.quickseriesapp.R
import com.quickseries.quickseriesapp.network.localdao.QSCategoriesData
import com.quickseries.quickseriesapp.ui.view.WebViewActivity
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.activity_category_detail.*


class CategoryDetailActivity : AppCompatActivity(), CategoryDetailContract.View, View.OnClickListener {


    lateinit var presenter: CategoryDetailContract.Presenter

    var currentItem: QSCategoriesData? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_category_detail)
        val id = intent?.getStringExtra("itemId")
        presenter = CategoryDetailPresenter(this)
        presenter.getItemDetails(id!!)
        message.setOnClickListener(this)
        call.setOnClickListener(this)
        email.setOnClickListener(this)
        websitearrow.setOnClickListener(this)
        addicon.setOnClickListener(this)

        // toolbar

        // add back arrow to toolbar
        if (supportActionBar != null) {
            supportActionBar!!.setDisplayHomeAsUpEnabled(true)
            supportActionBar!!.setDisplayShowHomeEnabled(true)
        }

    }


    override fun setupView(item: QSCategoriesData) {
        currentItem = item;
        if (!item.photo.isNullOrEmpty()) {
            try {
                Picasso.with(this).load(item.photo).fit()
                    .placeholder(R.drawable.rounded_image_placeholder_white).into(detailImageView)
            } catch (e: Exception) {
                Picasso.with(this).load(R.drawable.rounded_image_placeholder_white).into(detailImageView)
            }
        } else {
            Picasso.with(this).load(R.drawable.rounded_image_placeholder_white).into(detailImageView)
        }

        detailTitle.text = item.title
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            detailDescription.text = Html.fromHtml(item.description, Html.FROM_HTML_MODE_COMPACT)
        } else {
            detailDescription.text = Html.fromHtml(item.description)
        }

        phoneNumber.text = item.contactInfo?.phoneNumber?.get(0)?.name
        emailid.text = item.contactInfo?.email?.get(0)?.name
        website.text = item.contactInfo?.website?.get(0)?.name
        address.text = item.addressList[0].toString()

    }


    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        // handle arrow click here
        if (item.itemId == android.R.id.home) {
            finish() // close this activity and return to preview activity (if there is any)
        }

        return super.onOptionsItemSelected(item)
    }

    override fun showProgress(show: Boolean) {
        runOnUiThread {
            if (show)
                progressBar.visibility = View.VISIBLE
            else
                progressBar.visibility = View.GONE
        }
    }

    override fun showError(message: String) {
        runOnUiThread {
            AlertDialog.Builder(this)
                .setTitle("Uh-oh!")
                .setMessage(message)
                .setPositiveButton("Ok", null)
                .show()
        }
    }

    override fun onClick(p0: View?) {
        when (p0?.id) {
            R.id.message -> startMessageConversation()
            R.id.call -> startCall()
            R.id.email -> startEmailComposer()
            R.id.websitearrow -> startWebView()
            R.id.addicon -> startMap()
        }

    }

    fun startCall() {
        val intent = Intent(Intent.ACTION_DIAL)
        intent.data = Uri.parse("tel:" + currentItem?.contactInfo?.phoneNumber?.get(0)?.name)
        startActivity(intent)
    }

    fun startEmailComposer() {
        val intent = Intent(Intent.ACTION_SEND)
        val recipients = arrayOf(currentItem?.contactInfo?.email?.get(0)?.name)
        intent.putExtra(Intent.EXTRA_EMAIL, recipients)
        intent.type = "text/html"
        startActivity(Intent.createChooser(intent, "Send mail"))
    }

    fun startMessageConversation() {
        val sendIntent = Intent(Intent.ACTION_VIEW)
        sendIntent.data = Uri.parse("sms:" + currentItem?.contactInfo?.phoneNumber?.get(0)?.name)
        startActivity(sendIntent)
    }

    fun startWebView() {
        val intent = Intent(this, WebViewActivity::class.java)
        intent.putExtra("url", currentItem?.contactInfo?.website?.get(0)?.name)
        startActivity(intent)
    }

    fun startMap() {
        val latlng = currentItem!!.addressList[0]?.gps?.getLatLng()
        val gmmIntentUri = Uri.parse("geo:$latlng?q=" + Uri.encode(currentItem?.title) + "&z=10")
        val mapIntent = Intent(Intent.ACTION_VIEW, gmmIntentUri)
        mapIntent.setPackage("com.google.android.apps.maps")
        startActivity(mapIntent)
    }


}
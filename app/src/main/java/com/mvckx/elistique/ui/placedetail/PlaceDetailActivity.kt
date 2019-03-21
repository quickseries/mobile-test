package com.mvckx.elistique.ui.placedetail

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity
import androidx.core.text.HtmlCompat
import androidx.lifecycle.Observer
import androidx.recyclerview.widget.LinearLayoutManager
import com.bumptech.glide.Glide
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.activity_place_detail.*
import org.koin.androidx.viewmodel.ext.android.viewModel


class PlaceDetailActivity : AppCompatActivity() {

    private val viewModel = viewModel<PlaceDetailViewModel>()
    private val placeDetailAddressAdapter = PlaceDetailAddressAdapter { addressClicked(it) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_place_detail)
        setupViews()
        setupViewModel()
    }

    private fun setupViews() {
        rvAddresses.adapter = placeDetailAddressAdapter
        rvAddresses.layoutManager = LinearLayoutManager(this)

        infoEmail.setOnClickListener {
            val intent = Intent(Intent.ACTION_SENDTO, Uri.fromParts("mailto", infoEmail.getValue(), null))
            startActivity(intent)
        }

        infoPhone.setOnClickListener {
            val intent = Intent(Intent.ACTION_DIAL, Uri.parse("tel: ${infoPhone.getValue()}"))
            startActivity(intent)
        }

        infoTollFree.setOnClickListener {
            val intent = Intent(Intent.ACTION_DIAL, Uri.parse("tel: ${infoTollFree.getValue()}"))
            startActivity(intent)
        }

        infoWebsite.setOnClickListener {
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse(infoWebsite.getValue()))
            startActivity(intent)
        }

    }

    private fun setupViewModel() {
        val vm = viewModel.value
        vm.placeLiveData().observe(this, Observer {
            renderViewState(it)
        })
        vm.setPlace(intent.getStringExtra(EXTRA_PLACE_ID), intent.getStringExtra(EXTRA_CATEGORY_ID))
    }

    private fun renderViewState(vs: PlaceDetailViewState) {
        progressBar.visibility = if (vs.loading) View.VISIBLE else View.GONE
        scrollView.visibility = if (vs.loading) View.GONE else View.VISIBLE
        vs.placeDetailItem?.let { item ->
            tvTitle.text = item.title
            item.description?.let {
                tvDesc.text = HtmlCompat.fromHtml(it, HtmlCompat.FROM_HTML_MODE_COMPACT)
            }

            Glide.with(this)
                .load(item.photoUrl)
                .into(ivImage)

            item.addresses.takeIf { it.isNotEmpty() }?.let {
                rvAddresses.visibility = View.VISIBLE
                tvAddressTitle.visibility = View.VISIBLE
                placeDetailAddressAdapter.updateAddresses(item.addresses)
            } ?: run {
                rvAddresses.visibility = View.GONE
                tvAddressTitle.visibility = View.GONE
            }

            tvContactInfoTitle.visibility = if (item.contactInformation.isEmpty()) View.GONE else View.VISIBLE
            infoEmail.setAndShow(item.contactInformation.email)
            infoFax.setAndShow(item.contactInformation.faxNumber)
            infoPhone.setAndShow(item.contactInformation.phoneNumber)
            infoTollFree.setAndShow(item.contactInformation.tollFree)
            infoWebsite.setAndShow(item.contactInformation.webSite)
        }
    }

    private fun addressClicked(address: PlaceDetailViewState.Address) {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(address.toMapIntentAddress()))
        startActivity(intent)
    }

    private fun PlaceDetailElementView.setAndShow(value: String?) {
        value?.takeIf { value.isNotEmpty() }?.let {
            this.visibility = View.VISIBLE
            this.setValue(it)
        } ?: run { this.visibility = View.GONE }
    }

    companion object {
        private const val EXTRA_PLACE_ID = "PLACE_ID"
        private const val EXTRA_CATEGORY_ID = "CATEGORY_ID"

        fun intent(context: Context, placeId: String, categoryId: String): Intent {
            val intent = Intent(context, PlaceDetailActivity::class.java)
            intent.putExtra(EXTRA_PLACE_ID, placeId)
            intent.putExtra(EXTRA_CATEGORY_ID, categoryId)
            return intent
        }
    }
}

private fun PlaceDetailViewState.Address.toMapIntentAddress(): String {
    val latitude = gps?.latitude ?: "0"
    val longitude = gps?.longitude ?: "0"

    return "geo:$latitude,$longitude?q=$address1, $city, $state, $zip, $country"
}

private fun PlaceDetailViewState.ContactInformation.isEmpty(): Boolean {
    return webSite.isNullOrEmpty() && email.isNullOrEmpty() && faxNumber.isNullOrEmpty()
            && phoneNumber.isNullOrEmpty() && tollFree.isNullOrEmpty()
}

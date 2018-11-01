package com.quickseries.mobiletest.fragments.resourceDetail


import android.arch.lifecycle.Observer
import android.arch.lifecycle.ViewModelProviders
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.support.v4.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup

import com.quickseries.mobiletest.R
import com.quickseries.mobiletest.activities.webView.WebViewActivity
import com.quickseries.mobiletest.components.DetailRowView
import com.quickseries.mobiletest.util.Extras
import com.quickseries.mobiletest.util.TextUtil
import com.quickseries.mobiletestcore.models.AddressModelBase
import com.quickseries.mobiletestcore.models.ResourceModelBase
import com.quickseries.mobiletestcore.util.UUIDUtil
import com.quickseries.mobiletestcore.viewModels.CategoryDetailViewModel
import com.quickseries.mobiletestcore.viewModels.ResourceDetailViewModel
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.fragment_resource_detail.*
import java.util.*

class ResourceDetailFragment : Fragment() {

    private var resourceId: UUID = UUIDUtil.emptyUUID()

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_resource_detail, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        this.arguments?.let {
            resourceId = UUID.fromString(it.getString(Extras.EXTRA_ID, UUIDUtil.emptyUUID().toString()))
        }

        val viewModel = ViewModelProviders.of(this).get(ResourceDetailViewModel::class.java)
        viewModel.getResource().observe(this, Observer { resource ->
            if (resource != null) {
                setupUi(resource)
            }
        })
        viewModel.setResourceId(resourceId)
    }

    private fun setupUi(resource: ResourceModelBase) {
        Picasso.get()
            .load(resource.photo)
            .placeholder(R.drawable.progress_animation)
            .error(R.drawable.ic_no_image)
            .into(resourceImageView)

        titleTextView.text = resource.title
        descriptionTextView.text = TextUtil.textFromHtml(resource.description)

        notesTextView.visibility = View.GONE
        notesTitleTextView.visibility = View.GONE


        resource.contactInfo?.let { contactInfo ->
            contactInfo.phoneNumber.filter { !it.isBlank() }.forEach {
                val component = DetailRowView(this.requireContext())
                component.rowType = DetailRowView.RowType.PHONE
                component.titleTextView.setText(R.string.phone_number)
                component.contentTextView.text = it
                component.refresh()
                component.button1OnClick = {
                    sendSms(it)
                }
                component.button2OnClick = {
                    makeCall(it)
                }
                contactInformationLayout.addView(component)
            }

            contactInfo.tollFree.filter { !it.isBlank() }.forEach {
                val component = DetailRowView(this.requireContext())
                component.rowType = DetailRowView.RowType.PHONE
                component.titleTextView.setText(R.string.toll_free_number)
                component.contentTextView.text = it
                component.refresh()
                component.button1OnClick = {
                    sendSms(it)
                }
                component.button2OnClick = {
                    makeCall(it)
                }
                contactInformationLayout.addView(component)
            }

            contactInfo.faxNumber.filter { !it.isBlank() }.forEach {
                val component = DetailRowView(this.requireContext())
                component.rowType = DetailRowView.RowType.FAX
                component.titleTextView.setText(R.string.fax_number)
                component.contentTextView.text = it
                component.refresh()
                contactInformationLayout.addView(component)
            }

            contactInfo.email.filter { !it.isBlank() }.forEach {
                val component = DetailRowView(this.requireContext())
                component.rowType = DetailRowView.RowType.EMAIL
                component.titleTextView.setText(R.string.email_address)
                component.contentTextView.text = it
                component.refresh()
                component.button1OnClick = {
                    sendEmail(it)
                }
                contactInformationLayout.addView(component)
            }

            contactInfo.website.filter { !it.isBlank() }.forEach {
                val component = DetailRowView(this.requireContext())
                component.rowType = DetailRowView.RowType.WEBSITE
                component.titleTextView.setText(R.string.website)
                component.contentTextView.text = it
                component.refresh()
                component.button1OnClick = {
                    naviageWeb(it)
                }
                contactInformationLayout.addView(component)
            }
        }

        resource.addresses.forEach {
            var address = it.address1 + "\n"
            address += "${it.city ?: ""}, ${it.state ?: ""} ${it.zipCode ?: ""} \n"
            address += it.country ?: ""


            val component = DetailRowView(this.requireContext())
            component.rowType = DetailRowView.RowType.ADDRESS
            component.titleTextView.setText(R.string.address)
            component.contentTextView.text = address
            component.refresh()
            component.button1OnClick = {
                openGoogleMaps(it)
            }
            addressLayout.addView(component)
        }

        sundayBusinessHoursRowView.detailTextView.setText(R.string.closed)
        mondayBusinessHoursRowView.detailTextView.setText(R.string.closed)
        tuesdayBusinessHoursRowView.detailTextView.setText(R.string.closed)
        wednesdayBusinessHoursRowView.detailTextView.setText(R.string.closed)
        thursdayBusinessHoursRowView.detailTextView.setText(R.string.closed)
        fridayBusinessHoursRowView.detailTextView.setText(R.string.closed)
        saturdayBusinessHoursRowView.detailTextView.setText(R.string.closed)

        resource.businessHours?.let { b ->
            if (b.sunday != null) {
                val text = "${b.sunday!!.from} ${b.sunday!!.to}"
                sundayBusinessHoursRowView.detailTextView.text = text
            }

            if (b.monday != null) {
                val text = "${b.monday!!.from} ${b.monday!!.to}"
                mondayBusinessHoursRowView.detailTextView.text = text
            }

            if (b.tuesday != null) {
                val text = "${b.tuesday!!.from} ${b.tuesday!!.to}"
                tuesdayBusinessHoursRowView.detailTextView.text = text
            }

            if (b.wednesday != null) {
                val text = "${b.wednesday!!.from} ${b.wednesday!!.to}"
                wednesdayBusinessHoursRowView.detailTextView.text = text
            }

            if (b.thursday != null) {
                val text = "${b.thursday!!.from} ${b.thursday!!.to}"
                thursdayBusinessHoursRowView.detailTextView.text = text
            }

            if (b.friday != null) {
                val text = "${b.friday!!.from} ${b.friday!!.to}"
                fridayBusinessHoursRowView.detailTextView.text = text
            }

            if (b.saturday != null) {
                val text = "${b.saturday!!.from} ${b.saturday!!.to}"
                saturdayBusinessHoursRowView.detailTextView.text = text
            }
        }


        facebookImageView.visibility =
                if (resource.socialMedia?.facebook?.size ?: 0 > 0 && resource.socialMedia!!.facebook[0].isNotBlank()) View.VISIBLE else View.GONE
        twitterImageView.visibility =
                if (resource.socialMedia?.twitter?.size ?: 0 > 0 && resource.socialMedia!!.twitter[0].isNotBlank()) View.VISIBLE else View.GONE
        youtubeImageView.visibility =
                if (resource.socialMedia?.youtubeChannel?.size ?: 0 > 0 && resource.socialMedia!!.youtubeChannel[0].isNotBlank()) View.VISIBLE else View.GONE

        socialMediaTextView.visibility = if (facebookImageView.visibility == View.GONE
            && twitterImageView.visibility == View.GONE
            && youtubeImageView.visibility == View.GONE
        ) View.GONE else View.VISIBLE

        facebookImageView.setOnClickListener {

        }

        twitterImageView.setOnClickListener {

        }

        youtubeImageView.setOnClickListener {

        }

    }

    private fun sendSms(phone: String) {
        val intent = Intent(Intent.ACTION_VIEW, Uri.fromParts("sms", phone, ""))
        startActivity(intent)
    }

    private fun makeCall(phone: String) {
        val intent = Intent(Intent.ACTION_CALL, Uri.fromParts("tel", phone, ""))
        startActivity(intent)
    }

    private fun openGoogleMaps(address: AddressModelBase) {
        val uri = if (address.gps != null) {
            Uri.parse("geo:${address.gps!!.latitude},${address.gps!!.longitude}")
        } else {
            Uri.parse("geo:0,0?q=${address.address1}+${address.city}+${address.state}+${address.zipCode}")
        }
        val intent = Intent(Intent.ACTION_VIEW, uri)
        intent.setPackage("com.google.android.apps.maps")
        startActivity(intent)
    }

    private fun sendEmail(emailAddress: String) {
        val intent = Intent(Intent.ACTION_SENDTO, Uri.fromParts("mailto", emailAddress, ""))
        startActivity(Intent.createChooser(intent, "Send Email..."))
    }

    private fun naviageWeb(url: String) {
        val intent = Intent(this.requireContext(), WebViewActivity::class.java)
        intent.putExtra(Extras.EXTRA_URL, url)
        startActivity(intent)
    }

}

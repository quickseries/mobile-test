package com.android.kotlin.ui

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v7.widget.LinearLayoutManager
import android.support.v7.widget.RecyclerView
import android.widget.TextView
import com.android.kotlin.adapter.AddressDisplayAdapter
import com.android.kotlin.adapter.BusinessHoursDisplayAdapter
import com.android.kotlin.adapter.ContactInfoDisplayAdapter
import com.android.kotlin.adapter.SocialMediaDisplayAdapter
import com.android.kotlin.entities.BizDayItem
import com.android.kotlin.entities.ContactItem
import com.android.kotlin.model.RestaurantItem
import com.android.kotlindemo.R
import com.google.gson.Gson


class RestaurantDetailActivity : AppCompatActivity() {

    companion object {
        const val KEY_RESTAURANT_ITEM = "KEY_RESTAURANT_ITEM"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_restaurent_detail)
        val restaurantString = intent.getStringExtra(KEY_RESTAURANT_ITEM)
        val gson = Gson()
        val restaurantItem = gson.fromJson(restaurantString, RestaurantItem::class.java)
        val titleTextView: TextView = findViewById(R.id.activity_restaurant_title_text_view)
        val descriptionTextView: TextView = findViewById(R.id.activity_restaurant_description_text_view)


        val daysRecyclerView: RecyclerView = findViewById(R.id.activity_restaurant_detail_days_recycler_view)
        val linearLayoutManager = LinearLayoutManager(this)
        daysRecyclerView.layoutManager = linearLayoutManager
        titleTextView.text = restaurantItem.title
        descriptionTextView.text = restaurantItem.description
        setDetailUI(restaurantItem)
    }

    private fun setDetailUI(restaurantItem: RestaurantItem) {
        setContactInfoUI(restaurantItem)
        setAddressUI(restaurantItem)
        setSocialMedialUI(restaurantItem)
        setBizDaysInfoUI(restaurantItem)
    }

    private fun setAddressUI(restaurantItem: RestaurantItem) {
        val addressRecyclerView: RecyclerView = findViewById(R.id.activity_restaurant_detail_address_recycler_view)
        val linearLayoutManager = LinearLayoutManager(this)
        addressRecyclerView.layoutManager = linearLayoutManager
        val addressAdapter = restaurantItem.addresses?.let { AddressDisplayAdapter(it) }
        addressRecyclerView.adapter = addressAdapter

    }

    private fun setSocialMedialUI(restaurantItem: RestaurantItem) {
        val mediaHorizontalRecyclerView: RecyclerView = findViewById(R.id.activity_restaurant_detail_media_recycler_view);
        val horizontalLayoutManager = LinearLayoutManager(this)
        horizontalLayoutManager.orientation = LinearLayoutManager.HORIZONTAL
        mediaHorizontalRecyclerView.layoutManager = horizontalLayoutManager
        val socialMediaList = ArrayList<String>()
        restaurantItem.socialMedia?.facebook?.let { socialMediaList.addAll(it) }
        restaurantItem.socialMedia?.twitter?.let { socialMediaList.addAll(it) }
        restaurantItem.socialMedia?.youtubeChannel?.let { socialMediaList.addAll(it) }
        val mediaAdapter = SocialMediaDisplayAdapter(socialMediaList)
        mediaHorizontalRecyclerView.adapter = mediaAdapter
    }

    private fun setContactInfoUI(restaurantItem: RestaurantItem) {
        val contactRecyclerView: RecyclerView = findViewById(R.id.activity_restaurant_detail_contact_recycler_view)
        val linearLayoutManager = LinearLayoutManager(this)
        contactRecyclerView.layoutManager = linearLayoutManager
        val contactItemList = ArrayList<ContactItem>()
        restaurantItem.contactInfo.phoneNumber?.let { ContactItem("Phone Number", it) }?.let { contactItemList.add(it) }
        restaurantItem.contactInfo.tollFree?.let { ContactItem("Toll Free", it) }?.let { contactItemList.add(it) }
        restaurantItem.contactInfo.faxNumber?.let { ContactItem("Fax", it) }?.let { contactItemList.add(it) }
        restaurantItem.contactInfo.email?.let { ContactItem("Email", it) }?.let { contactItemList.add(it) }
        restaurantItem.contactInfo.website?.let { ContactItem("Website", it) }?.let { contactItemList.add(it) }
        val contactAdapter = ContactInfoDisplayAdapter(contactItemList)
        contactRecyclerView.adapter = contactAdapter
    }

    private fun setBizDaysInfoUI(restaurantItem: RestaurantItem) {
        val contactRecyclerView: RecyclerView = findViewById(R.id.activity_restaurant_detail_days_recycler_view)
        val linearLayoutManager = LinearLayoutManager(this)
        contactRecyclerView.layoutManager = linearLayoutManager
        val bizDayItemList = ArrayList<BizDayItem>()
        restaurantItem.bizHours?.sunday ?.let { BizDayItem("Sunday",restaurantItem.bizHours.sunday?.from+" - "+restaurantItem.bizHours.sunday?.to ) }?.let { bizDayItemList.add(it) }
        restaurantItem.bizHours?.monday ?.let { BizDayItem("Monday", restaurantItem.bizHours.monday!!.from+" - "+restaurantItem.bizHours.monday?.to) }?.let { bizDayItemList.add(it) }
        val contactAdapter = BusinessHoursDisplayAdapter(bizDayItemList)
        contactRecyclerView.adapter = contactAdapter
    }
}

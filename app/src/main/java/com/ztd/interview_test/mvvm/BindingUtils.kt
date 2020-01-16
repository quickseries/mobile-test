package com.ztd.interview_test.mvvm

import android.widget.ImageView
import androidx.databinding.BindingAdapter
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.ztd.interview_test.R
import com.ztd.interview_test.infrustructure.data.models.AddressesItem
import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.infrustructure.data.models.vacationspot.FreeTextItem
import com.ztd.interview_test.mvvm.categorydetailfragment.adapter.CategoryDetailAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.addressadapter.AddressAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.businesshouradapter.BusinessHourAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.contactinfoadapter.ContactInfoAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.noteadapter.NoteItemAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.socialmediaadapter.SocialMediaAdapter
import com.ztd.interview_test.mvvm.detailfragment.model.BusinessHours
import com.ztd.interview_test.mvvm.detailfragment.model.ContactItem
import com.ztd.interview_test.mvvm.detailfragment.model.SocialMediaItem
import com.ztd.interview_test.mvvm.homefragment.adapter.CategoryAdapter


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * mahdiZTD@gmail.com
 */
object BindingUtils {

    @JvmStatic
    @BindingAdapter("categoryAdapter")
    fun addCategoryItems(recyclerView: RecyclerView, categories: MutableList<CategoryModel>?) {
        if (categories!=null) {
            val adapter = recyclerView.adapter as CategoryAdapter?
            adapter?.clearItems()
            adapter?.addItems(categories)
        }
    }

    @JvmStatic
    @BindingAdapter("categoryDetailAdapter")
    fun addCategoryDetailItems(recyclerView: RecyclerView, categories: MutableList<Any>?) {
        if (categories!=null) {
            val adapter = recyclerView.adapter as CategoryDetailAdapter?
            adapter?.clearItems()
            adapter?.addItems(categories)
        }
    }

    @JvmStatic
    @BindingAdapter("contactAdapter")
    fun addContactsItems(recyclerView: RecyclerView, contact: MutableList<ContactItem>?) {
        if (contact!=null) {
            val adapter = recyclerView.adapter as ContactInfoAdapter?
            adapter?.clearItems()
            adapter?.addItems(contact)
        }
    }


    @JvmStatic
    @BindingAdapter("imageGlide")
    fun addImageAdapter(imageView: ImageView, imageUrl: String?) {
        if (imageUrl != null) {
            Glide.with(imageView.context)
                .load(imageUrl)
                .into(imageView)
        }
    }


    @JvmStatic
    @BindingAdapter("addressAdapter")
    fun addAddressAdapter(recyclerView: RecyclerView, address: MutableList<AddressesItem>?) {
        if (address!=null) {
            val adapter = recyclerView.adapter as AddressAdapter?
            adapter?.clearItems()
            adapter?.addItems(address)
        }
    }


    @JvmStatic
    @BindingAdapter("noteAdapter")
    fun addNoteAdapter(recyclerView: RecyclerView, notes: MutableList<FreeTextItem>?) {
        if (notes!=null) {
            val adapter = recyclerView.adapter as NoteItemAdapter?
            adapter?.clearItems()
            adapter?.addItems(notes)
        }
    }


    @JvmStatic
    @BindingAdapter("socialMediaAdapter")
    fun addSocialMediaAdapter(recyclerView: RecyclerView, socialMedias: MutableList<SocialMediaItem>?) {
        if (socialMedias!=null) {
            val adapter = recyclerView.adapter as SocialMediaAdapter?
            adapter?.clearItems()
            adapter?.addItems(socialMedias)
        }
    }


    @JvmStatic
    @BindingAdapter("businessHourAdapter")
    fun addBusinessHourAdapter(recyclerView: RecyclerView, businessHours: MutableList<BusinessHours>?) {
        if (businessHours!=null) {
            val adapter = recyclerView.adapter as BusinessHourAdapter?
            adapter?.clearItems()
            adapter?.addItems(businessHours)
        }
    }


    @JvmStatic
    @BindingAdapter("socialImageAdapter")
    fun addSocialImageAdapter(imageView: ImageView,socialType:String?){
        if(socialType!=null){
            when(socialType){
                "youtube" -> imageView.setImageResource(R.drawable.svg_ic_youtube)
                "facebook" -> imageView.setImageResource(R.drawable.svg_ic_facebook)
                "twitter" -> imageView.setImageResource(R.drawable.svg_ic_twitter)
            }
        }
    }
}
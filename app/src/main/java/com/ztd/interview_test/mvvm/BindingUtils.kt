package com.ztd.interview_test.mvvm

import android.widget.ImageView
import androidx.databinding.BindingAdapter
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.ztd.interview_test.R
import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.mvvm.categorydetailfragment.adapter.CategoryDetailAdapter
import com.ztd.interview_test.mvvm.detailfragment.adapter.contactinfoadapter.ContactInfoAdapter
import com.ztd.interview_test.mvvm.detailfragment.model.ContactItem
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

}
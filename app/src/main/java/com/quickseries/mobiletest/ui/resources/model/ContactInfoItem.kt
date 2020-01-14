package com.quickseries.mobiletest.ui.resources.model

import android.content.Context
import android.telephony.PhoneNumberUtils
import android.widget.ImageView
import android.widget.TextView
import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import androidx.databinding.BindingAdapter
import com.quickseries.mobiletest.R
import com.quickseries.mobiletest.domain.resources.model.ContactInfo
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext
import org.koin.core.KoinComponent
import org.koin.core.inject


data class ContactInfoItem(
    val type: Type,
    val info: String
) {

    enum class Type(@StringRes val titleResId: Int, @DrawableRes val drawableRes1: Int? = null) {
        WEBSITE(R.string.resource_details_contact_info_website_title, android.R.drawable.ic_menu_view),
        EMAIL(R.string.resource_details_contact_info_email_title, android.R.drawable.ic_dialog_email),
        PHONE_NUMBER(R.string.resource_details_contact_info_phone_number_title, android.R.drawable.ic_menu_call),
        FAX_NUMBER(R.string.resource_details_contact_info_fax_number_title),
        TOLL_FREE_NUMBER(R.string.resource_details_contact_info_toll_free_number_title, android.R.drawable.ic_menu_call)
    }

    companion object : KoinComponent {
        private val context: Context by inject()

        @JvmStatic
        @BindingAdapter("android:src")
        fun setImageViewResource(imageView: ImageView, resource: Int?) {
            if (resource != null) imageView.setImageResource(resource)
        }

        @JvmStatic
        @BindingAdapter("android:text")
        fun setStringResource(textView: TextView, resource: Int) {
            textView.text = context.getString(resource)
        }
    }
}

suspend fun ContactInfo.toContactInfosItems() = withContext(Dispatchers.Default) {
    val list = mutableListOf<ContactInfoItem>()

    if (!website.isNullOrBlank()) list.add(ContactInfoItem(ContactInfoItem.Type.WEBSITE, website))
    if (!email.isNullOrBlank()) list.add(ContactInfoItem(ContactInfoItem.Type.EMAIL, email))
    if (!phoneNmber.isNullOrBlank()) list.add(ContactInfoItem(ContactInfoItem.Type.PHONE_NUMBER, PhoneNumberUtils.formatNumber(phoneNmber)))
    if (!faxNumber.isNullOrBlank()) list.add(ContactInfoItem(ContactInfoItem.Type.FAX_NUMBER, PhoneNumberUtils.formatNumber(faxNumber)))
    if (!tollFree.isNullOrBlank()) list.add(ContactInfoItem(ContactInfoItem.Type.TOLL_FREE_NUMBER, PhoneNumberUtils.formatNumber(tollFree)))

    list
}
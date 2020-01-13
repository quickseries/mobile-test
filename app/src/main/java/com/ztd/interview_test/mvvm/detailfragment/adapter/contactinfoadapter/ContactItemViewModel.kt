package com.ztd.interview_test.mvvm.detailfragment.adapter.contactinfoadapter

import androidx.databinding.ObservableField
import com.ztd.interview_test.mvvm.detailfragment.model.ContactItem

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/13/2020.
 */
class ContactItemViewModel(contactItem: ContactItem) {

    val title: ObservableField<String> = when (contactItem.type) {
        "phone" -> {
            ObservableField("PHONE NUMBER")
        }
        "tollPhone" -> {
            ObservableField("TOLL-FREE NUMBER")
        }
        "emails" -> {
            ObservableField("EMAIL")
        }
        "faxes" -> {
            ObservableField("FAX NUMBER")
        }
        "webSites" -> {
            ObservableField("WEB SITE")
        }
        else -> {
            ObservableField()
        }
    }

    val value :ObservableField<String> = ObservableField(contactItem.value)

    fun onCallClicked(){

    }

    fun onTextClicked(){

    }

    fun onMailClicked(){

    }

    fun onWebSiteClicked(){

    }
}
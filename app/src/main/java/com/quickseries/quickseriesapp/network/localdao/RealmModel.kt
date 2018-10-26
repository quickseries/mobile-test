package com.quickseries.quickseriesapp.network.localdao

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import io.realm.RealmList
import io.realm.RealmObject
import lombok.Data

@Data
open class QSCategories(
    open var categoryId: String = "",
    open var slug: String = "",
    open var eid: String = "",
    open var title: String = "",
    open var description: String = "",
    open var _active: Boolean = true
) : RealmObject() {
    override fun toString(): String {
        return "Categories(categoryId='$categoryId', slug='$slug', eid='$eid', title='$title', description='$description', _active=$_active)"
    }
}


@Data
open class QSCategoriesData(
    open var id: String = "",
    open var slug: String = "",
    open var eid: String = "",
    open var title: String = "",
    open var description: String = "",
    open var category_eid: String = "",
    open var photo: String = "",
    open var _active: Boolean = true,
    open var addressList: RealmList<QSAddress> = RealmList(),
    open var contactInfo: RealmList<QSContactInfo> = RealmList(),
    open var freeText: RealmList<QSFreeText> = RealmList(),
    open var bizHours: RealmList<QSBizHours> = RealmList(),
    open var socialMedia: RealmList<QSSocialMedia> = RealmList()

) : RealmObject() {

    fun addAddresssList(contact: QSAddress) {
        try {
            if (addressList != null) {
                addressList.add(contact)
            } else {
                addressList = RealmList()
                addressList.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }

    fun addContactList(contact: QSContactInfo) {
        try {
            if (contactInfo != null) {
                contactInfo.add(contact)
            } else {
                contactInfo = RealmList()
                contactInfo.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }

    fun addTextList(contact: QSFreeText) {
        try {
            if (freeText != null) {
                freeText.add(contact)
            } else {
                freeText = RealmList()
                freeText.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }

    fun addbizHourList(contact: QSBizHours) {
        try {
            if (bizHours != null) {
                bizHours.add(contact)
            } else {
                bizHours = RealmList()
                bizHours.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }

    fun addSocialMediaList(contact: QSSocialMedia) {
        try {
            if (socialMedia != null) {
                socialMedia.add(contact)
            } else {
                socialMedia = RealmList()
                socialMedia.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }
}

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSAddress(
    open var address1: String = "",
    open var label: String = "",
    open var zipCode: String = "",
    open var city: String = "",
    open var state: String = "",
    open var country: String = "",
    open var gps: QSGps = QSGps()
) : RealmObject()


@JsonIgnoreProperties(ignoreUnknown = true)
open class QSGps(
    open var latitude: String = "",
    open var longitude: String = ""
) : RealmObject()

open class QSContactInfo(
    open var website: List<String> = emptyList(),
    open var email: List<String> = emptyList(),
    open var phoneNumber: List<String> = emptyList(),
    open var faxNumber: List<String> = emptyList(),
    open var tollFree: List<String> = emptyList()
) : RealmObject()

open class QSFreeText(
    open var text: String? = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSBizHours(
    open var sunday: QSTime = QSTime(),
    open var monday: QSTime = QSTime(),
    open var tuesday: QSTime = QSTime(),
    open var wednesday: QSTime = QSTime(),
    open var thursday: QSTime = QSTime(),
    open var friday: QSTime = QSTime(),
    open var saturday: QSTime = QSTime()
) : RealmObject()


@JsonIgnoreProperties(ignoreUnknown = true)
open class QSTime(
    var from: String = "",
    var to: String = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSSocialMedia(
    open var youtubeChannel: List<String> = emptyList(),
    open var twitter: List<String> = emptyList(),
    open var facebook: List<String> = emptyList()
) : RealmObject()

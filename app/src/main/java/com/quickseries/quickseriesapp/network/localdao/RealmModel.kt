package com.quickseries.quickseriesapp.network.localdao

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import io.realm.RealmList
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import java.util.*

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSCategories(
    @PrimaryKey
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

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSCategoriesData(
    @PrimaryKey
    open var id: String = "",
    open var slug: String = "",
    open var eid: String = "",
    open var title: String = "",
    open var description: String = "",
    open var category_eid: String = "",
    open var parentCategorySlug: String = "",
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
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var address1: String = "",
    open var label: String = "",
    open var zipCode: String = "",
    open var city: String = "",
    open var state: String = "",
    open var country: String = "",
    open var gps: QSGps? = null
) : RealmObject()


@JsonIgnoreProperties(ignoreUnknown = true)
open class QSGps(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var latitude: String = "",
    open var longitude: String = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSContactInfo(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var website: RealmList<QSWebsite> = RealmList(),
    open var email: RealmList<QSEmail> = RealmList(),
    open var phoneNumber: RealmList<QSPhone> = RealmList(),
    open var faxNumber: RealmList<QSFax> = RealmList(),
    open var tollFree: RealmList<QSToll> = RealmList()
) : RealmObject() {
    fun addWebsiteList(contact: QSWebsite) {
        try {
            if (website != null) {
                website.add(contact)
            } else {
                website = RealmList()
                website.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }

    fun addEmailList(contact: QSEmail) {
        try {
            if (email != null) {
                email.add(contact)
            } else {
                email = RealmList()
                email.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }

    fun addPhoneList(contact: QSPhone) {
        try {
            if (phoneNumber != null) {
                phoneNumber.add(contact)
            } else {
                phoneNumber = RealmList()
                phoneNumber.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }

    fun addFaxList(contact: QSFax) {
        try {
            if (faxNumber != null) {
                faxNumber.add(contact)
            } else {
                faxNumber = RealmList()
                faxNumber.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }

    fun addTollList(contact: QSToll) {
        try {
            if (tollFree != null) {
                tollFree.add(contact)
            } else {
                tollFree = RealmList()
                tollFree.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }
}

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSWebsite(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var name: String? = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSEmail(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var name: String? = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSPhone(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var name: String? = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSFax(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var name: String? = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSToll(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var name: String? = ""
) : RealmObject()


@JsonIgnoreProperties(ignoreUnknown = true)
open class QSFreeText(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var text: String? = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSBizHours(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var sunday: QSTime? = null,
    open var monday: QSTime? = null,
    open var tuesday: QSTime? = null,
    open var wednesday: QSTime? = null,
    open var thursday: QSTime? = null,
    open var friday: QSTime? = null,
    open var saturday: QSTime? = null
) : RealmObject()


@JsonIgnoreProperties(ignoreUnknown = true)
open class QSTime(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var from: String = "",
    open var to: String = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSSocialMedia(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var youtubeChannel: RealmList<QSYoutube> = RealmList(),
    open var twitter: RealmList<QSTwitter> = RealmList(),
    open var facebook: RealmList<QSFb> = RealmList()
) : RealmObject() {
    fun addYoutubeList(contact: QSYoutube) {
        try {
            if (youtubeChannel != null) {
                youtubeChannel.add(contact)
            } else {
                youtubeChannel = RealmList()
                youtubeChannel.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }

    fun addTwitterList(contact: QSTwitter) {
        try {
            if (twitter != null) {
                twitter.add(contact)
            } else {
                twitter = RealmList()
                twitter.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }

    fun addFbList(contact: QSFb) {
        try {
            if (facebook != null) {
                facebook.add(contact)
            } else {
                facebook = RealmList()
                facebook.add(contact)
            }
        } catch (e: IllegalStateException) {
            e.printStackTrace()
        }

    }
}

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSYoutube(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var name: String? = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSTwitter(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var name: String? = ""
) : RealmObject()

@JsonIgnoreProperties(ignoreUnknown = true)
open class QSFb(
    @PrimaryKey
    open var _id: String = UUID.randomUUID().toString(),
    open var name: String? = ""
) : RealmObject()

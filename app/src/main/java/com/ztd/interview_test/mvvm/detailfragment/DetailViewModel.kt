package com.ztd.interview_test.mvvm.detailfragment

import androidx.databinding.ObservableArrayList
import androidx.databinding.ObservableField
import androidx.lifecycle.MutableLiveData
import com.ztd.interview_test.infrustructure.DataManager
import com.ztd.interview_test.infrustructure.data.models.AddressesItem
import com.ztd.interview_test.infrustructure.data.models.SocialMedia
import com.ztd.interview_test.infrustructure.data.models.vacationspot.FreeTextItem
import com.ztd.interview_test.mvvm.base.BaseViewModel
import com.ztd.interview_test.mvvm.detailfragment.model.BusinessHours
import com.ztd.interview_test.mvvm.detailfragment.model.ContactItem
import com.ztd.interview_test.mvvm.detailfragment.model.SocialMediaItem
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/13/2020.
 */
class DetailViewModel @Inject constructor(private val dataManager: DataManager) : BaseViewModel<DetailNavigator>() {

    val VACATION_SPOT = "vacation-spots"
    val RESTAURANT = "restaurants"

    var imageUrl: ObservableField<String> = ObservableField()
    var title: ObservableField<String> = ObservableField()
    var description: ObservableField<String> = ObservableField(" ")


    var contacts: ObservableArrayList<ContactItem> = ObservableArrayList()
    var addresses: ObservableArrayList<AddressesItem> = ObservableArrayList()
    var socialMedia: ObservableArrayList<SocialMedia> = ObservableArrayList()
    var notes: ObservableArrayList<FreeTextItem> = ObservableArrayList()
    var bizHours: ObservableArrayList<BusinessHours> = ObservableArrayList()

    var contactsLiveData: MutableLiveData<MutableList<ContactItem>> = MutableLiveData()
    var addressesLiveData: MutableLiveData<MutableList<AddressesItem?>> = MutableLiveData()
    var socialMediaLiveData: MutableLiveData<MutableList<SocialMediaItem>> = MutableLiveData()
    var notesLiveData: MutableLiveData<MutableList<FreeTextItem?>> = MutableLiveData()
    var bizHoursLiveData: MutableLiveData<MutableList<BusinessHours>> = MutableLiveData()

    fun getItemDetailById(id: String, type: String) {

        when (type) {
            VACATION_SPOT -> {
                dataManager.getAllVacationSpots().find { it.id == id }.let {
                    if (it != null) {
                        imageUrl.set(it.photo)
                        title.set(it.title)
                        description.set(it.description)

                        val contacts: MutableList<ContactItem> = mutableListOf()

                        val phones =
                            it.contactInfo?.phoneNumber?.map { ph -> ContactItem("phone", ph!!) }?.toMutableList()
                        val tollPhone =
                            it.contactInfo?.tollFree?.map { ph -> ContactItem("tollPhone", ph!!) }?.toMutableList()
                        val emails = it.contactInfo?.email?.map { ph -> ContactItem("emails", ph!!) }?.toMutableList()
                        val faxes = it.contactInfo?.faxNumber?.map { ph -> ContactItem("faxes", ph!!) }?.toMutableList()
                        val webSites =
                            it.contactInfo?.website?.map { ph -> ContactItem("webSites", ph!!) }?.toMutableList()

                        contacts.addAll(phones ?: arrayListOf())
                        contacts.addAll(tollPhone ?: arrayListOf())
                        contacts.addAll(emails ?: arrayListOf())
                        contacts.addAll(faxes ?: arrayListOf())
                        contacts.addAll(webSites ?: arrayListOf())

                        contactsLiveData.value = contacts

                        addressesLiveData.value = it.addresses?.toMutableList()

                        val socialMedias: MutableList<SocialMediaItem> = mutableListOf()

                        val twitter =
                            it.socialMedia?.twitter?.map { ph -> SocialMediaItem("twitter", ph!!) }?.toMutableList()
                        val youTube = it.socialMedia?.youtubeChannel?.map { ph -> SocialMediaItem("youtube", ph!!) }
                            ?.toMutableList()
                        val faceBook =
                            it.socialMedia?.facebook?.map { ph -> SocialMediaItem("facebook", ph!!) }?.toMutableList()

                        socialMedias.addAll(twitter ?: arrayListOf())
                        socialMedias.addAll(youTube ?: arrayListOf())
                        socialMedias.addAll(faceBook ?: arrayListOf())

                        socialMediaLiveData.value = socialMedias

                        notesLiveData.value = it.freeText?.toMutableList()

                    }

                }

            }
            RESTAURANT -> {
                dataManager.getAllRestaurants().find { it.id == id }.let {
                    if (it != null) {
                        imageUrl.set(it.photo)
                        title.set(it.title)
                        description.set(it.description)

                        val contacts: MutableList<ContactItem> = mutableListOf()

                        val phones =
                            it.contactInfo?.phoneNumber?.map { ph -> ContactItem("phone", ph!!) }?.toMutableList()
                        val tollPhone =
                            it.contactInfo?.tollFree?.map { ph -> ContactItem("tollPhone", ph!!) }?.toMutableList()
                        val emails = it.contactInfo?.email?.map { ph -> ContactItem("emails", ph!!) }?.toMutableList()
                        val faxes = it.contactInfo?.faxNumber?.map { ph -> ContactItem("faxes", ph!!) }?.toMutableList()
                        val webSites =
                            it.contactInfo?.website?.map { ph -> ContactItem("webSites", ph!!) }?.toMutableList()

                        contacts.addAll(phones ?: arrayListOf())
                        contacts.addAll(tollPhone ?: arrayListOf())
                        contacts.addAll(emails ?: arrayListOf())
                        contacts.addAll(faxes ?: arrayListOf())
                        contacts.addAll(webSites ?: arrayListOf())

                        contactsLiveData.value = contacts

                        addressesLiveData.value = it.addresses?.toMutableList()

                        val socialMedias: MutableList<SocialMediaItem> = mutableListOf()

                        val twitter =
                            it.socialMedia?.twitter?.map { ph -> SocialMediaItem("twitter", ph!!) }?.toMutableList()
                        val youTube = it.socialMedia?.youtubeChannel?.map { ph -> SocialMediaItem("youtube", ph!!) }
                            ?.toMutableList()
                        val faceBook =
                            it.socialMedia?.facebook?.map { ph -> SocialMediaItem("facebook", ph!!) }?.toMutableList()

                        socialMedias.addAll(twitter ?: arrayListOf())
                        socialMedias.addAll(youTube ?: arrayListOf())
                        socialMedias.addAll(faceBook ?: arrayListOf())

                        socialMediaLiveData.value = socialMedias

                        notesLiveData.value = it.freeText?.toMutableList()

                        val businessHours: MutableList<BusinessHours> = mutableListOf()

                        businessHours.addAll(it.bizHours?.map { bh ->
                            BusinessHours(
                                bh.key,
                                bh.value.fromTime,
                                bh.value.toTime
                            )
                        }?.toMutableList() ?: mutableListOf())

                        bizHoursLiveData.value = businessHours
                    }
                }
            }
        }

    }
}
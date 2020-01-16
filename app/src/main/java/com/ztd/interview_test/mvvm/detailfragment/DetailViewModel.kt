package com.ztd.interview_test.mvvm.detailfragment

import androidx.databinding.ObservableArrayList
import androidx.databinding.ObservableField
import androidx.lifecycle.MutableLiveData
import com.ztd.interview_test.infrustructure.DataManager
import com.ztd.interview_test.infrustructure.data.models.AddressesItem
import com.ztd.interview_test.infrustructure.data.models.restaurant.RestaurantModel
import com.ztd.interview_test.infrustructure.data.models.vacationspot.FreeTextItem
import com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpotModel
import com.ztd.interview_test.mvvm.base.BaseViewModel
import com.ztd.interview_test.mvvm.detailfragment.model.BusinessHours
import com.ztd.interview_test.mvvm.detailfragment.model.ContactItem
import com.ztd.interview_test.mvvm.detailfragment.model.SocialMediaItem
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/13/2020.
 */

const val VACATION_SPOT = "vacation-spots"
const val RESTAURANT = "restaurants"


class DetailViewModel @Inject constructor(private val dataManager: DataManager) :
    BaseViewModel<DetailNavigator>() {

    var imageUrl: ObservableField<String> = ObservableField()
    var title: ObservableField<String> = ObservableField()
    var description: ObservableField<String> = ObservableField(" ")


    var contacts: ObservableArrayList<ContactItem> = ObservableArrayList()
    var addresses: ObservableArrayList<AddressesItem> = ObservableArrayList()
    var socialMedia: ObservableArrayList<SocialMediaItem> = ObservableArrayList()
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
                vacationSpotResultHandler(dataManager.getAllVacationSpots().find { it.id == id })

            }
            RESTAURANT -> {
                restaurantResultHandler(dataManager.getAllRestaurants().find { it.id == id })
            }
        }

    }

    private fun vacationSpotResultHandler(vacationSpot:VacationSpotModel?){
        if (vacationSpot != null) {
            imageUrl.set(vacationSpot.photo)
            title.set(vacationSpot.title)
            description.set(vacationSpot.description)

            val contacts: MutableList<ContactItem> = mutableListOf()

            val phones =
                vacationSpot.contactInfo?.phoneNumber?.map { ph -> ContactItem("phone", ph!!) }
                    ?.toMutableList()
            val tollPhone =
                vacationSpot.contactInfo?.tollFree?.map { ph -> ContactItem("tollPhone", ph!!) }
                    ?.toMutableList()
            val emails =
                vacationSpot.contactInfo?.email?.map { ph -> ContactItem("emails", ph!!) }
                    ?.toMutableList()
            val faxes =
                vacationSpot.contactInfo?.faxNumber?.map { ph -> ContactItem("faxes", ph!!) }
                    ?.toMutableList()
            val webSites =
                vacationSpot.contactInfo?.website?.map { ph -> ContactItem("webSites", ph!!) }
                    ?.toMutableList()

            contacts.addAll(phones ?: arrayListOf())
            contacts.addAll(tollPhone ?: arrayListOf())
            contacts.addAll(emails ?: arrayListOf())
            contacts.addAll(faxes ?: arrayListOf())
            contacts.addAll(webSites ?: arrayListOf())


            contactsLiveData.value =
                contacts.filter { contact -> contact.value.isNotEmpty() }
                    .toMutableList()

            addressesLiveData.value = vacationSpot.addresses?.filter { addressesItem -> addressesItem?.address1 != null }?.toMutableList()

            val socialMedias: MutableList<SocialMediaItem> = mutableListOf()

            val twitter =
                vacationSpot.socialMedia?.twitter?.map { ph -> SocialMediaItem("twitter", ph!!) }
                    ?.toMutableList()
            val youTube = vacationSpot.socialMedia?.youtubeChannel?.map { ph ->
                SocialMediaItem(
                    "youtube",
                    ph!!
                )
            }
                ?.toMutableList()
            val faceBook =
                vacationSpot.socialMedia?.facebook?.map { ph ->
                    SocialMediaItem(
                        "facebook",
                        ph!!
                    )
                }?.toMutableList()

            socialMedias.addAll(twitter ?: arrayListOf())
            socialMedias.addAll(youTube ?: arrayListOf())
            socialMedias.addAll(faceBook ?: arrayListOf())

            socialMediaLiveData.value = socialMedias

            notesLiveData.value =
                vacationSpot.freeText?.filter { notes -> notes?.textItem?.length ?: 0 > 0 }
                    ?.toMutableList()

        }
    }

    private fun restaurantResultHandler(restaurant: RestaurantModel?){
        if (restaurant != null) {
            imageUrl.set(restaurant.photo)
            title.set(restaurant.title)
            description.set(restaurant.description)

            val contacts: MutableList<ContactItem> = mutableListOf()

            val phones =
                restaurant.contactInfo?.phoneNumber?.map { ph -> ContactItem("phone", ph!!) }
                    ?.toMutableList()
            val tollPhone =
                restaurant.contactInfo?.tollFree?.map { ph -> ContactItem("tollPhone", ph!!) }
                    ?.toMutableList()
            val emails =
                restaurant.contactInfo?.email?.map { ph -> ContactItem("emails", ph!!) }
                    ?.toMutableList()
            val faxes =
                restaurant.contactInfo?.faxNumber?.map { ph -> ContactItem("faxes", ph!!) }
                    ?.toMutableList()
            val webSites =
                restaurant.contactInfo?.website?.map { ph -> ContactItem("webSites", ph!!) }
                    ?.toMutableList()

            contacts.addAll(phones ?: arrayListOf())
            contacts.addAll(tollPhone ?: arrayListOf())
            contacts.addAll(emails ?: arrayListOf())
            contacts.addAll(faxes ?: arrayListOf())
            contacts.addAll(webSites ?: arrayListOf())

            contactsLiveData.value = contacts

            addressesLiveData.value = restaurant.addresses?.toMutableList()

            val socialMedias: MutableList<SocialMediaItem> = mutableListOf()

            val twitter =
                restaurant.socialMedia?.twitter?.map { ph -> SocialMediaItem("twitter", ph!!) }
                    ?.toMutableList()
            val youTube = restaurant.socialMedia?.youtubeChannel?.map { ph ->
                SocialMediaItem(
                    "youtube",
                    ph!!
                )
            }
                ?.toMutableList()
            val faceBook =
                restaurant.socialMedia?.facebook?.map { ph ->
                    SocialMediaItem(
                        "facebook",
                        ph!!
                    )
                }?.toMutableList()

            socialMedias.addAll(twitter ?: arrayListOf())
            socialMedias.addAll(youTube ?: arrayListOf())
            socialMedias.addAll(faceBook ?: arrayListOf())

            socialMediaLiveData.value = socialMedias

            notesLiveData.value = restaurant.freeText?.toMutableList()

            val businessHours: MutableList<BusinessHours> = mutableListOf()

            businessHours.addAll(restaurant.bizHours?.map { bh ->
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
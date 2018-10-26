package com.quickseries.quickseriesapp.network.wrapper

import com.quickseries.quickseriesapp.Injector
import com.quickseries.quickseriesapp.QuickSeriesApp
import com.quickseries.quickseriesapp.network.api.model.Categories
import com.quickseries.quickseriesapp.network.api.model.Restaurants
import com.quickseries.quickseriesapp.network.localdao.*
import io.realm.Realm

class RealmWrapper(val app: QuickSeriesApp) {

    init {
        Injector.get().inject(this)
    }

    fun saveCategories(result: List<Categories>) {
        if (result.isNotEmpty()) {
            val realm = Realm.getDefaultInstance()
            try {

                realm.executeTransaction { realm1 ->
                    result.map {
                        QSCategories(
                            categoryId = it.categoryId,
                            slug = it.slug ?: "",
                            eid = it.eid ?: "",
                            title = it.title ?: "",
                            description = it.description ?: "",
                            _active = it._active
                        )
                    }.forEach {
                        realm1.copyToRealmOrUpdate(it)
                    }
                }
            } catch (e: Exception) {
                e.printStackTrace()
            } finally {
                realm.close()
            }

        }
    }

    fun saveCategoriesData(result: List<Restaurants>) {
        if (result.isNotEmpty()) {
            val realm = Realm.getDefaultInstance()
            try {
                realm.executeTransaction { realm1 ->
                    result.forEach { it: Restaurants ->
                        val categoryData = QSCategoriesData(
                            id = it.restaurantsId,
                            _active = it._active,
                            description = it.description ?: "",
                            title = it.title ?: "",
                            eid = it.eid ?: "",
                            slug = it.slug ?: "",
                            category_eid = it.category_eid ?: "",
                            photo = it.photo ?: ""
                        )

                        it.addressList.let { list ->
                            list.map {
                                QSAddress(
                                    address1 = it.address1,
                                    city = it.city ?: "",
                                    country = it.country ?: "",
                                    label = it.label ?: "",
                                    state = it.state ?: "",
                                    zipCode = it.zipCode ?: "",
                                    gps = QSGps(latitude = it.gps?.latitude ?: "", longitude = it.gps?.longitude ?: "")
                                )
                            }.forEach {
                                categoryData.addAddresssList(realm1.copyToRealmOrUpdate(it))
                            }
                        }

                        it.contactInfo.let { list ->
                            list.map {
                                QSContactInfo(
                                    website = it.website,
                                    phoneNumber = it.phoneNumber,
                                    email = it.email,
                                    faxNumber = it.faxNumber,
                                    tollFree = it.tollFree
                                )
                            }.forEach {
                                categoryData.addContactList(realm1.copyToRealmOrUpdate(it))
                            }
                        }

                        it.freeText.let {
                            it.map {
                                QSFreeText(
                                    text = it.text
                                )
                            }.forEach {
                                categoryData.addTextList(realm1.copyToRealmOrUpdate(it))
                            }
                        }

                        it.bizHours.let {
                            it.map {
                                QSBizHours(
                                    sunday = QSTime(it.sunday?.from ?: "", it.sunday?.to ?: ""),
                                    monday = QSTime(it.monday?.from ?: "", it.monday?.to ?: ""),
                                    tuesday = QSTime(it.tuesday?.from ?: "", it.tuesday?.to ?: ""),
                                    wednesday = QSTime(it.wednesday?.from ?: "", it.wednesday?.to ?: ""),
                                    thursday = QSTime(it.thursday?.from ?: "", it.thursday?.to ?: ""),
                                    friday = QSTime(it.friday?.from ?: "", it.friday?.to ?: ""),
                                    saturday = QSTime(it.saturday?.from ?: "", it.saturday?.to ?: "")
                                )
                            }.forEach {
                                categoryData.addbizHourList(realm1.copyToRealmOrUpdate(it))
                            }
                        }
                        it.socialMedia.let {
                            it.map {
                                QSSocialMedia(
                                    youtubeChannel = it.youtubeChannel,
                                    twitter = it.twitter,
                                    facebook = it.facebook
                                )
                            }.forEach {
                                categoryData.addSocialMediaList(realm1.copyToRealmOrUpdate(it))
                            }
                        }

                        realm1.copyToRealmOrUpdate(categoryData)
                    }
                }
            } catch (e: Exception) {
                e.printStackTrace()
            } finally {
                realm.close()
            }

        }
    }


}

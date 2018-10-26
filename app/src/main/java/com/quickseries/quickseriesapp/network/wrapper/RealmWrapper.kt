package com.quickseries.quickseriesapp.network.wrapper

import com.google.common.collect.Lists
import com.quickseries.quickseriesapp.Injector
import com.quickseries.quickseriesapp.QuickSeriesApp
import com.quickseries.quickseriesapp.network.api.model.Categories
import com.quickseries.quickseriesapp.network.api.model.Restaurants
import com.quickseries.quickseriesapp.network.localdao.*
import com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter.model.ICategoryItem
import io.reactivex.Observable
import io.realm.Case
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
                    realm.where(QSCategories::class.java).findAll().deleteAllFromRealm()
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

    fun saveCategoriesData(result: List<Restaurants>, slugParentCategory: String) {
        if (result.isNotEmpty()) {
            val realm = Realm.getDefaultInstance()
            try {
                realm.executeTransaction { realm1 ->
                    realm.where(QSCategoriesData::class.java).findAll().deleteAllFromRealm()
                    result.forEach { it: Restaurants ->
                        val categoryData = QSCategoriesData(
                            id = it.restaurantsId,
                            _active = it._active,
                            description = it.description ?: "",
                            parentCategorySlug = slugParentCategory,
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

                        it.contactInfo.let { it ->
                            val contact = QSContactInfo()
                            it?.email?.map { QSEmail(name = it) }?.forEach { contact.addEmailList(it) }
                            it?.website?.map { QSWebsite(name = it) }?.forEach { contact.addWebsiteList(it) }
                            it?.phoneNumber?.map { QSPhone(name = it) }?.forEach { contact.addPhoneList(it) }
                            it?.faxNumber?.map { QSFax(name = it) }?.forEach { contact.addFaxList(it) }
                            it?.tollFree?.map { QSToll(name = it) }?.forEach { contact.addTollList(it) }
                            categoryData.contactInfo = contact
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
                            val biz = QSBizHours(
                                sunday = QSTime(it?.sunday?.from ?: "", it?.sunday?.to ?: ""),
                                monday = QSTime(it?.monday?.from ?: "", it?.monday?.to ?: ""),
                                tuesday = QSTime(it?.tuesday?.from ?: "", it?.tuesday?.to ?: ""),
                                wednesday = QSTime(it?.wednesday?.from ?: "", it?.wednesday?.to ?: ""),
                                thursday = QSTime(it?.thursday?.from ?: "", it?.thursday?.to ?: ""),
                                friday = QSTime(it?.friday?.from ?: "", it?.friday?.to ?: ""),
                                saturday = QSTime(it?.saturday?.from ?: "", it?.saturday?.to ?: "")
                            )
                            categoryData.bizHours = biz
                        }
                        it.socialMedia.let {
                            val contact = QSSocialMedia()
                            it?.youtubeChannel?.map { QSYoutube(name = it) }?.forEach { contact.addYoutubeList(it) }
                            it?.twitter?.map { QSTwitter(name = it) }?.forEach { contact.addTwitterList(it) }
                            it?.facebook?.map { QSFb(name = it) }?.forEach { contact.addFbList(it) }
                            categoryData.socialMedia = contact
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

    fun getCategories(): MutableList<QSCategories> {
        val realm = Realm.getDefaultInstance()
        return try {
            val data = realm.where(QSCategories::class.java).findAll()
            if (data != null && data.isNotEmpty()) {
                realm.copyFromRealm(data)
            } else {
                ArrayList()
            }
        } catch (e: Exception) {
            e.printStackTrace()
            return ArrayList()
        } finally {
            realm.close()
        }
    }


    fun getCategoryItemById(id: String): QSCategoriesData? {
        val realm = Realm.getDefaultInstance()
        return try {
            val data = realm.where(QSCategoriesData::class.java).equalTo("id", id).findFirst()
            if (data != null) {
                realm.copyFromRealm(data)
            } else {
                null
            }
        } catch (e: Exception) {
            e.printStackTrace()
            return null
        } finally {
            realm.close()
        }
    }

    fun getCategoryItemBySlug(slug: String, ascen: Boolean): Observable<MutableList<ICategoryItem>> {
        return Observable.create<MutableList<ICategoryItem>> { e ->
            var folksCachedContacts: MutableList<ICategoryItem> = mutableListOf()
            val realm = Realm.getDefaultInstance()
            try {
                val data =
                    if (ascen)
                        realm.where(QSCategoriesData::class.java).equalTo("parentCategorySlug", slug, Case.INSENSITIVE)
                            .findAll().sortedBy { qsCategoriesData -> qsCategoriesData.title }
                    else
                        realm.where(QSCategoriesData::class.java).equalTo("parentCategorySlug", slug, Case.INSENSITIVE)
                            .findAll().sortedByDescending { qsCategoriesData -> qsCategoriesData.title }
                if (data != null && data.isNotEmpty()) {
                    folksCachedContacts.addAll(
                        transformQSCategoryDataToICategoryItem(realm.copyFromRealm(data))
                    )
                    e.onNext(folksCachedContacts)
                    e.onComplete()
                } else {
                    e.onNext(ArrayList())
                    e.onComplete()
                }
            } catch (ex: Exception) {
                ex.printStackTrace()
                e.onError(ex)
            } finally {
                realm.close()
            }
        }
    }

    fun transformQSCategoryDataToICategoryItem(contact: List<QSCategoriesData>): List<ICategoryItem> {
        return Lists.transform<QSCategoriesData, ICategoryItem>(contact, TRANSFORM_CATEGORY_FUNCTION)
    }

    private val TRANSFORM_CATEGORY_FUNCTION = com.google.common.base.Function<QSCategoriesData, ICategoryItem> { it ->

        ICategoryItem(id = it?.id, photo = it?.photo, title = it?.title, slug = it?.slug)

    }

}

package com.quickseries.quickseriesapp.ui.categories.categoryitem

import android.annotation.SuppressLint
import com.quickseries.quickseriesapp.Injector
import com.quickseries.quickseriesapp.network.wrapper.ApiWrapper
import com.quickseries.quickseriesapp.network.wrapper.RealmWrapper
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import javax.inject.Inject

class CategoryItemPresenter(val view: CategoryItemContract.View) : CategoryItemContract.Presenter {


    @Inject
    lateinit var apiWrapper: ApiWrapper

    @Inject
    lateinit var realmProvider: RealmWrapper


    init {
        Injector.get().inject(this)
    }

    override fun load(status: Boolean, slug: String) {
        if (status)
            loadFromServer(slug)

        loadCategoryItem(slug)
    }

    @SuppressLint("CheckResult")
    fun loadFromServer(slug: String) {
        view.showProgress(true)
        apiWrapper.getCategoryData(slug)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe({ response ->
                loadCategoryItem(slug)
                view.showProgress(false)
            }) { throwable ->
                run {
                    view.updateRecentList(ArrayList())
                    throwable.printStackTrace()
                    view.showProgress(false)
                    view.showError(throwable.localizedMessage)
                }
            }
    }

    @SuppressLint("CheckResult")
    fun loadCategoryItem(slug: String) {
        view.showProgress(true)
        realmProvider.getCategoryItemBySlug(slug)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe({ response ->
                view.updateRecentList(response)
                view.showProgress(false)
            }) { throwable ->
                run {
                    view.updateRecentList(ArrayList())
                    throwable.printStackTrace()
                    view.showProgress(false)
                    view.showError(throwable.localizedMessage)
                }
            }
    }


    override fun filter(newText: String) {
        TODO("not implemented") //To change body of created functions use File | Settings | File Templates.
    }
}
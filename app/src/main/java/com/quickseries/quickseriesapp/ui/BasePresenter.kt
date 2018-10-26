package com.quickseries.quickseriesapp.ui

import android.annotation.SuppressLint
import com.quickseries.quickseriesapp.Injector
import com.quickseries.quickseriesapp.network.wrapper.ApiWrapper
import com.quickseries.quickseriesapp.network.wrapper.RealmWrapper
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import javax.inject.Inject

class BasePresenter(val view: BaseContract.View) : BaseContract.Presenter {


    @Inject
    lateinit var apiWrapper: ApiWrapper

    @Inject
    lateinit var realmProvider: RealmWrapper

    init {
        Injector.get().inject(this)
    }


    @SuppressLint("CheckResult")
    override fun load(status: Boolean) {
        view.showProgress(true)
        apiWrapper.getCategories()
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe({ response ->
                view.updateRecentList(realmProvider.getCategories())
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

}
package com.quickseries.quickseriesapp.ui.categorydetail

import com.quickseries.quickseriesapp.Injector
import com.quickseries.quickseriesapp.network.wrapper.ApiWrapper
import com.quickseries.quickseriesapp.network.wrapper.RealmWrapper
import javax.inject.Inject

class CategoryDetailPresenter(val view: CategoryDetailContract.View) : CategoryDetailContract.Presenter {


    @Inject
    lateinit var apiWrapper: ApiWrapper

    @Inject
    lateinit var realmProvider: RealmWrapper

    init {
        Injector.get().inject(this)
    }


    override fun getItemDetails(id: String) {
        view.setupView(realmProvider.getCategoryItemById(id)!!)
    }

}
package com.quickseries.quickseriesapp.ui.categories.categoryitem

import android.annotation.SuppressLint
import android.text.TextUtils
import android.widget.Filter
import com.quickseries.quickseriesapp.Injector
import com.quickseries.quickseriesapp.network.wrapper.ApiWrapper
import com.quickseries.quickseriesapp.network.wrapper.RealmWrapper
import com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter.model.ICategoryItem
import io.reactivex.android.schedulers.AndroidSchedulers
import io.reactivex.schedulers.Schedulers
import javax.inject.Inject

class CategoryItemPresenter(val view: CategoryItemContract.View) : CategoryItemContract.Presenter {


    @Inject
    lateinit var apiWrapper: ApiWrapper

    @Inject
    lateinit var realmProvider: RealmWrapper

    private var itemFilter = ItemFilter()
    var filterCharSequence = ""
    private var categoryItem = mutableListOf<ICategoryItem>()
    var unfilteredCategoryItem = mutableListOf<ICategoryItem>()

    init {
        Injector.get().inject(this)
    }

    override fun load(status: Boolean, slug: String, ascendingSort: Boolean) {
        if (status)
            loadFromServer(slug, ascendingSort)

        loadCategoryItem(slug, ascendingSort)
    }

    @SuppressLint("CheckResult")
    fun loadFromServer(slug: String, ascendingSort: Boolean) {
        view.showProgress(true)
        apiWrapper.getCategoryData(slug)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe({ response ->
                loadCategoryItem(slug, ascendingSort)
                view.showProgress(false)
            }) { throwable ->
                run {
                    view.updateRecentList(emptyList())
                    throwable.printStackTrace()
                    view.showProgress(false)
                    view.showError(throwable.localizedMessage)
                }
            }
    }

    @SuppressLint("CheckResult")
    fun loadCategoryItem(slug: String, ascendingSort: Boolean) {
        view.showProgress(true)
        realmProvider.getCategoryItemBySlug(slug, ascendingSort)
            .subscribeOn(Schedulers.io())
            .observeOn(AndroidSchedulers.mainThread())
            .subscribe({ response ->
                categoryItem = response
                unfilteredCategoryItem = response
                view.updateRecentList(response)
                view.showProgress(false)
            }) { throwable ->
                run {
                    view.updateRecentList(emptyList())
                    throwable.printStackTrace()
                    view.showProgress(false)
                    view.showError(throwable.localizedMessage)
                }
            }
    }


    override fun filter(newText: String) {
        if (!TextUtils.isEmpty(newText)) {
            itemFilter.filter(newText)
        } else {
            view.updateRecentList(categoryItem)
        }
    }

    inner class ItemFilter : Filter() {

        override fun performFiltering(charSequence: CharSequence): Filter.FilterResults {
            return FilterResults()
        }

        override fun publishResults(charSequence: CharSequence, filterResults: Filter.FilterResults) {
            if (TextUtils.isEmpty(charSequence)) {
                filterResults.values = unfilteredCategoryItem
                filterResults.count = unfilteredCategoryItem.size
                filterCharSequence = ""
            } else {
                filterResults.values = ArrayList<ICategoryItem>()
                filterResults.count = 0
                filterCharSequence = charSequence.toString().toLowerCase()
                val filtered = ArrayList<ICategoryItem>()
                for (cont in unfilteredCategoryItem) {
                    try {
                        if (cont.title!!.toUpperCase().contains(charSequence.toString().toUpperCase())) {
                            filtered.add(cont)
                        }
                    } catch (e: Exception) {
                        e.printStackTrace()
                    }
                }

                filterResults.values = filtered
                filterResults.count = filtered.size
            }


            if (filterResults.values != null) {
                view.updateRecentList(filterResults.values as List<ICategoryItem>)
            }
        }
    }
}
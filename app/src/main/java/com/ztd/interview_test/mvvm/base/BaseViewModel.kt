package com.ztd.interview_test.mvvm.base

import androidx.lifecycle.ViewModel
import io.reactivex.disposables.CompositeDisposable
import java.lang.ref.WeakReference

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */

abstract class BaseViewModel<N> : ViewModel() {

    var compositeDisposable: CompositeDisposable = CompositeDisposable()
    lateinit var mNavigator: WeakReference<N>

    fun setNavigator(navigator: N) {
        this.mNavigator = WeakReference(navigator)
    }

    override fun onCleared() {
        compositeDisposable.dispose()
        super.onCleared()
    }

}
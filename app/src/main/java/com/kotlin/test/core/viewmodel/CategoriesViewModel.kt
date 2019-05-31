package com.kotlin.test.core.viewmodel

import android.arch.lifecycle.ViewModel
import com.kotlin.test.core.ApiHelper
import com.kotlin.test.core.rx.SchedulerProvider
import io.reactivex.disposables.CompositeDisposable

class CategoriesViewModel (private val schedulerProvider: SchedulerProvider, apiHelper: ApiHelper) : ViewModel(){

    private val compositeDisposable by lazy { CompositeDisposable() }


}
package com.android.kotlin.utils

import com.android.kotlin.model.CategoryItem
import io.reactivex.Observable
import java.util.*
import javax.inject.Inject
import javax.inject.Singleton

@Singleton
class DataManager @Inject constructor(private var apiInterface: ApiInterface) {

    fun getCategories(): Observable<List<CategoryItem>>{
        return apiInterface.getCategories()
    }

}
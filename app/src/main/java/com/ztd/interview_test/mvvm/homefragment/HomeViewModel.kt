package com.ztd.interview_test.mvvm.homefragment

import android.util.Log
import com.ztd.interview_test.infrustructure.DataManager
import com.ztd.interview_test.mvvm.base.BaseViewModel
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
class HomeViewModel @Inject constructor(private val dataManager: DataManager):BaseViewModel<HomeNavigator>() {


    fun retrieveCategories(){
        val a = dataManager.getAllCategories()
        Log.d("aaa","sssss")
    }
}
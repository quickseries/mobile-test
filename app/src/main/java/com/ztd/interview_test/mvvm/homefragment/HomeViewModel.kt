package com.ztd.interview_test.mvvm.homefragment

import android.util.Log
import androidx.databinding.ObservableArrayList
import androidx.databinding.ObservableList
import androidx.lifecycle.MutableLiveData
import com.ztd.interview_test.infrustructure.DataManager
import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.mvvm.base.BaseViewModel
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
class HomeViewModel @Inject constructor(private val dataManager: DataManager):BaseViewModel<HomeNavigator>() {


    val categories:ObservableList<CategoryModel> = ObservableArrayList()
    val categoryLiveData = MutableLiveData<MutableList<CategoryModel>>()

    fun retrieveCategories(){
        categoryLiveData.value = dataManager.getAllCategories()
        Log.d("aaa","sssss")
    }
}
package com.ztd.interview_test.mvvm.categorydetailfragment

import androidx.databinding.ObservableArrayList
import androidx.databinding.ObservableList
import androidx.lifecycle.MutableLiveData
import com.ztd.interview_test.infrustructure.DataManager
import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.infrustructure.data.models.restaurant.RestaurantModel
import com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpotModel
import com.ztd.interview_test.mvvm.base.BaseViewModel
import javax.inject.Inject


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * mahdiZTD@gmail.com
 */
class CategoryDetailViewModel @Inject constructor(private val dataManager: DataManager): BaseViewModel<CategoryDetailNavigator>() {
    val VACATION_SPOT = "vacation-spots"
    val RESTAURANT = "restaurants"

    val catDetail: ObservableList<Any> = ObservableArrayList()
    val catDetailLiveData = MutableLiveData<MutableList<*>>()
    private var catType:String? = null

    fun retrieveCategoryDetail(cat:String){
        when(cat){
            VACATION_SPOT -> {
                val vacationSpotModels = dataManager.getAllVacationSpots()
                vacationSpotModels.sortBy { vacationSpotModel -> vacationSpotModel.title }
                catDetailLiveData.value = vacationSpotModels
            }
            RESTAURANT -> {
                val restaurantModels = dataManager.getAllRestaurants()
                restaurantModels.sortBy { restaurantModel -> restaurantModel.title }
                catDetailLiveData.value = restaurantModels
            }
        }
    }

    fun sortCatDetailList(){
        catDetail.reverse()
    }
}
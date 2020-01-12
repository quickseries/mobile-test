package com.ztd.interview_test.infrustructure

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.ztd.interview_test.infrustructure.data.AssetHelper
import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.infrustructure.data.models.restaurant.Restaurant
import com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpot
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/11/2020.
 */
class AppDataManager @Inject constructor(private val assetHelper: AssetHelper,private val gson: Gson): DataManager {

    override fun getAllCategories():MutableList<CategoryModel> {
        val catJson = assetHelper.loadCategoriesJson()
        var a = gson.fromJson(catJson,Array<CategoryModel>::class.java)
        return mutableListOf()
    }

    override fun getAllRestaurants():MutableList<Restaurant> {
        val restJson = assetHelper.loadCategoriesJson()
        return gson.fromJson(restJson,Array<Restaurant>::class.java).toMutableList()
    }

    override fun getAllVacationSpots():MutableList<VacationSpot> {
        val vacJson = assetHelper.loadCategoriesJson()
        return gson.fromJson(vacJson,Array<VacationSpot>::class.java).toMutableList()
    }
}
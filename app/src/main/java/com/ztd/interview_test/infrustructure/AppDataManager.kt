package com.ztd.interview_test.infrustructure

import com.google.gson.Gson
import com.ztd.interview_test.infrustructure.data.AssetHelper
import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.infrustructure.data.models.restaurant.RestaurantModel
import com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpotModel
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/11/2020.
 */
class AppDataManager @Inject constructor(private val assetHelper: AssetHelper,private val gson: Gson): DataManager {

    override fun getAllCategories():MutableList<CategoryModel> {
        val catJson = assetHelper.loadCategoriesJson()
        return gson.fromJson(catJson,Array<CategoryModel>::class.java).toMutableList()
    }

    override fun getAllRestaurants():MutableList<RestaurantModel> {
        val restJson = assetHelper.loadRestaurantsJson()
        return gson.fromJson(restJson,Array<RestaurantModel>::class.java).toMutableList()
    }

    override fun getAllVacationSpots():MutableList<VacationSpotModel> {
        val vacJson = assetHelper.loadVacationSpotsJson()
        return gson.fromJson(vacJson,Array<VacationSpotModel>::class.java).toMutableList()
    }
}
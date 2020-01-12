package com.ztd.interview_test.infrustructure

import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.infrustructure.data.models.restaurant.RestaurantModel
import com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpotModel

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/11/2020.
 */
interface DataManager {

    fun getAllCategories():MutableList<CategoryModel>

    fun getAllRestaurants():MutableList<RestaurantModel>

    fun getAllVacationSpots():MutableList<VacationSpotModel>
}
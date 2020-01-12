package com.ztd.interview_test.infrustructure

import com.ztd.interview_test.infrustructure.data.models.category.CategoryModel
import com.ztd.interview_test.infrustructure.data.models.restaurant.Restaurant
import com.ztd.interview_test.infrustructure.data.models.vacationspot.VacationSpot

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/11/2020.
 */
interface DataManager {

    fun getAllCategories():MutableList<CategoryModel>

    fun getAllRestaurants():MutableList<Restaurant>

    fun getAllVacationSpots():MutableList<VacationSpot>
}
package com.ztd.interview_test.infrustructure.data

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/11/2020.
 */
interface AssetHelper {

    fun loadCategoriesJson():String?

    fun loadRestaurantsJson():String?

    fun loadVacationSpotsJson():String?
}
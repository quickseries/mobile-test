package com.ztd.interview_test.infrustructure.data

import android.content.Context
import java.io.IOException
import javax.inject.Inject

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/11/2020.
 */
class AssetHelperImp @Inject constructor(private val context: Context):AssetHelper {

    override fun loadCategoriesJson():String?{
        var json: String? = null
        try {
            val inputStream = context.assets.open("data/categories.json")
            val size = inputStream.available()
            val buffer = ByteArray(size)
            inputStream.read(buffer)
            inputStream.close()
            json = String(buffer, Charsets.UTF_8)
        } catch (ex: IOException) {
            ex.printStackTrace()
            return null
        }
        return json
    }

    override fun loadRestaurantsJson():String?{
        var json: String? = null
        try {
            val inputStream = context.assets.open("data/restaurants.json")
            val size = inputStream.available()
            val buffer = ByteArray(size)
            inputStream.read(buffer)
            inputStream.close()
            json = String(buffer, Charsets.UTF_8)
        } catch (ex: IOException) {
            ex.printStackTrace()
            return null
        }
        return json
    }

    override fun loadVacationSpotsJson():String?{
        var json: String? = null
        try {
            val inputStream = context.assets.open("data/vacation-spot.json")
            val size = inputStream.available()
            val buffer = ByteArray(size)
            inputStream.read(buffer)
            inputStream.close()
            json = String(buffer, Charsets.UTF_8)
        } catch (ex: IOException) {
            ex.printStackTrace()
            return null
        }
        return json
    }
}
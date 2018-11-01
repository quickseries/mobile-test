package com.quickseries.mobiletestcore.data

import android.content.Context
import com.quickseries.mobiletestcore.models.CategoryModelBase
import com.quickseries.mobiletestcore.models.ResourceModelBase
import com.quickseries.mobiletestcore.util.AssetUtil
import com.quickseries.mobiletestcore.util.GsonUtil
import timber.log.Timber

class DemoDatabase private constructor() {

    val categoryDao = CategoryDao()
    val resourceDao = ResourceDao()

    init {
    }

    companion object {
        @Volatile
        private var instance: DemoDatabase? = null

        fun getInstance(context: Context): DemoDatabase {
            return instance ?: synchronized(this) {
                instance ?: DemoDatabase().also {
                    instance = it
                }
                try {
                    //Loading the fixed data
                    val categoriesJson = AssetUtil.loadJsonFromAsset(context, "categories.json")
                    val restaurantsJson = AssetUtil.loadJsonFromAsset(context, "restaurants.json")
                    val vacationspotJson = AssetUtil.loadJsonFromAsset(context, "vacationspot.json")

                    val gson = GsonUtil.createGson()
                    val categories = gson.fromJson(categoriesJson, Array<CategoryModelBase>::class.java)
                    instance!!.categoryDao.setCategories(categories)

                    val restaurants = gson.fromJson(restaurantsJson, Array<ResourceModelBase>::class.java)
                    val vacationSpot = gson.fromJson(vacationspotJson, Array<ResourceModelBase>::class.java)

                    instance!!.resourceDao.addResources(restaurants)
                    instance!!.resourceDao.addResources(vacationSpot)
                } catch (ex: Throwable) {
                    Timber.e(ex)
                }

                instance!!
            }
        }
    }
}
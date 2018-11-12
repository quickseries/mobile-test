package com.rodionov.igor.mobiletest.repository

import android.arch.lifecycle.LiveData
import android.content.Context
import com.rodionov.igor.mobiletest.data.CategoryDao
import com.rodionov.igor.mobiletest.data.DataBaseProvider
import com.rodionov.igor.mobiletest.data.SettingsHelper
import com.rodionov.igor.mobiletest.json.JsonDataSource
import com.rodionov.igor.mobiletest.model.Category
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class CategoriesRepository(context: Context) {

    var categoryListData: LiveData<List<Category>>
        private set
    private val mCategoryDao: CategoryDao
    private val mContext: Context
    private val uiScope = CoroutineScope(Dispatchers.IO)

    init {
        mContext = context
        val database = DataBaseProvider.PROVIDER.getDatabase(context)
        mCategoryDao = database!!.categoryDao()
        categoryListData = mCategoryDao.fetchAll()
        if (!SettingsHelper.getValue(SettingsHelper.CATEGORIES_SAVED, mContext)) {
            uiScope.launch { loadCategories() }
        }
    }

    fun loadCategories() {
        val jsonHelper = JsonDataSource(mContext)
        val categoryList = jsonHelper.readCategories()
        mCategoryDao.insert(categoryList)
        SettingsHelper.setValue(SettingsHelper.CATEGORIES_SAVED, mContext)
    }
}

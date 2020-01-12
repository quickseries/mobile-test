package com.ztd.interview_test.mvvm.homefragment

import com.ztd.interview_test.infrustructure.AppDataManager
import com.ztd.interview_test.infrustructure.DataManager
import com.ztd.interview_test.mvvm.homefragment.adapter.CategoryAdapter
import dagger.Module
import dagger.Provides

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
@Module
class HomeModule {
    @Provides
    fun provideViewModel(dataManager: DataManager):HomeViewModel = HomeViewModel(dataManager)

    @Provides
    fun provideDataManager(appDataManager: AppDataManager):DataManager = appDataManager

    @Provides
    fun provideCategoryAdapter():CategoryAdapter = CategoryAdapter(mutableListOf())
}
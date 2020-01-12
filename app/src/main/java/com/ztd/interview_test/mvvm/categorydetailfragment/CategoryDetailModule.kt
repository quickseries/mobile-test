package com.ztd.interview_test.mvvm.categorydetailfragment

import com.ztd.interview_test.infrustructure.AppDataManager
import com.ztd.interview_test.infrustructure.DataManager
import com.ztd.interview_test.mvvm.categorydetailfragment.adapter.CategoryDetailAdapter
import dagger.Module
import dagger.Provides


/**
 * Created by Mahdi zarre Tahghigh doost on 1/12/2020.
 * mahdiZTD@gmail.com
 */
@Module
class CategoryDetailModule {

    @Provides
    fun provideViewModel(dataManager: DataManager):CategoryDetailViewModel= CategoryDetailViewModel(dataManager)

    @Provides
    fun provideDataManager(appDataManager: AppDataManager):DataManager = appDataManager

    @Provides
    fun provideCategoryAdapter():CategoryDetailAdapter = CategoryDetailAdapter(mutableListOf())
}
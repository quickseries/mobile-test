package com.ztd.interview_test.mvvm.detailfragment

import com.ztd.interview_test.infrustructure.AppDataManager
import com.ztd.interview_test.infrustructure.DataManager
import com.ztd.interview_test.mvvm.detailfragment.adapter.contactinfoadapter.ContactInfoAdapter
import dagger.Module
import dagger.Provides

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/13/2020.
 */
@Module
class DetailModule {

    @Provides
    fun provideViewModel(dataManager: DataManager):DetailViewModel= DetailViewModel(dataManager)

    @Provides
    fun provideDataManager(appDataManager: AppDataManager):DataManager = appDataManager

    @Provides
    fun provideContactAdapter():ContactInfoAdapter= ContactInfoAdapter(arrayListOf())

}
package com.ztd.interview_test.mvvm.homefragment

import dagger.Module
import dagger.Provides

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
@Module
class HomeModule {
    @Provides
    fun provideViewModel():HomeViewModel = HomeViewModel()
}
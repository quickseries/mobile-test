package com.ztd.interview_test.mvvm.mainactivity

import androidx.lifecycle.ViewModelProvider
import com.ztd.interview_test.mvvm.ViewModelProviderFactory
import dagger.Module
import dagger.Provides

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
@Module
class MainModule {

    @Provides
    fun provideViewModel(mainViewModel: MainViewModel): ViewModelProvider.Factory =
        ViewModelProviderFactory(mainViewModel)

    @Provides
    fun provideMainViewModel(): MainViewModel = MainViewModel()
}
package com.android.kotlin.di.modules

import com.android.kotlin.ui.MainActivityViewModel
import com.android.kotlin.utils.DataManager
import com.android.kotlin.utils.SchedulerProvider
import dagger.Module
import dagger.Provides

@Module
class ActivityModule (val schedulerProvider: SchedulerProvider){

    @Provides
    fun provideMainViewModel(dataManager: DataManager)
            : MainActivityViewModel {
        return MainActivityViewModel(dataManager, schedulerProvider)
    }
}
package com.android.kotlin.di.modules

import com.android.kotlin.ui.MainViewModel
import com.android.kotlin.utils.DataManager
import com.android.kotlin.utils.SchedulerProvider
import dagger.Module
import dagger.Provides

@Module
class ActivityModule (val schedulerProvider: SchedulerProvider){

    @Provides
    fun provideMainViewModel(dataManager: DataManager)
            : MainViewModel {
        return MainViewModel(dataManager, schedulerProvider)
    }
}
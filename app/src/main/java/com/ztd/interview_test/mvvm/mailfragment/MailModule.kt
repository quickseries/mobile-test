package com.ztd.interview_test.mvvm.mailfragment

import dagger.Module
import dagger.Provides


/**
 * Created by Mahdi zarre Tahghigh doost on 1/15/2020.
 * mahdiZTD@gmail.com
 */
@Module
class MailModule {

    @Provides
    fun provideMailViewModel():MailViewModel = MailViewModel()
}
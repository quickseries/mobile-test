package com.ztd.interview_test.infrustructure.di

import android.app.Application
import android.content.Context
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.ztd.interview_test.infrustructure.data.AssetHelper
import com.ztd.interview_test.infrustructure.data.AssetHelperImp
import dagger.Module
import dagger.Provides
import io.reactivex.disposables.CompositeDisposable
import javax.inject.Singleton

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
@Module
class AppModule {

    @Provides
    @Singleton
    internal fun provideCompositeDisposable(): CompositeDisposable {
        return CompositeDisposable()
    }

    @Provides
    @Singleton
    fun provideContext(application: Application): Context {
        return application
    }

    @Provides
    @Singleton
    fun provideGson(): Gson {return GsonBuilder().excludeFieldsWithoutExposeAnnotation().create()}


    @Provides
    @Singleton
    fun provideAssetHelper(assetHelperImp: AssetHelperImp):AssetHelper = assetHelperImp


}
package com.ztd.interview_test.infrustructure.di

import com.ztd.interview_test.mvvm.categorydetailfragment.CategoryDetailFragment
import com.ztd.interview_test.mvvm.categorydetailfragment.CategoryDetailModule
import com.ztd.interview_test.mvvm.detailfragment.DetailFragment
import com.ztd.interview_test.mvvm.detailfragment.DetailModule
import com.ztd.interview_test.mvvm.homefragment.HomeFragment
import com.ztd.interview_test.mvvm.homefragment.HomeModule
import com.ztd.interview_test.mvvm.mainactivity.MainActivity
import com.ztd.interview_test.mvvm.mainactivity.MainModule
import dagger.Module
import dagger.android.ContributesAndroidInjector

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */
@Module
abstract class ActivityBuilder {

    @ContributesAndroidInjector(modules = [MainModule::class])
    abstract fun bindMainActivity():MainActivity

    @ContributesAndroidInjector(modules = arrayOf(HomeModule::class))
    abstract fun provideHomeFragmentFactory(): HomeFragment

    @ContributesAndroidInjector(modules = arrayOf(CategoryDetailModule::class))
    abstract fun provideCategoryDetailFactory(): CategoryDetailFragment

    @ContributesAndroidInjector(modules = arrayOf(DetailModule::class))
    abstract fun provideDetailFactory(): DetailFragment
}
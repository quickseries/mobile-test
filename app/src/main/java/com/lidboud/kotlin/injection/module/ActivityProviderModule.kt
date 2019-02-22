package com.lidboud.kotlin.injection.module

import com.lidboud.kotlin.injection.PerActivity
import com.lidboud.kotlin.ui.category.CategoryActivity
import com.lidboud.kotlin.ui.category.CategoryActivityModule
import com.lidboud.kotlin.ui.category.CategoryViewModelModule
import com.lidboud.kotlin.ui.detailresource.DetailResourceActivity
import com.lidboud.kotlin.ui.detailresource.DetailResourceActivityModule
import com.lidboud.kotlin.ui.detailresource.DetailResourceViewModelModule
import com.lidboud.kotlin.ui.resource.ResourceActivity
import com.lidboud.kotlin.ui.resource.ResourceActivityModule
import com.lidboud.kotlin.ui.resource.ResourceViewModelModule

import dagger.Module
import dagger.android.ContributesAndroidInjector

@Module
abstract class ActivityProviderModule {

    @PerActivity
    @ContributesAndroidInjector(modules = [CategoryActivityModule::class, CategoryViewModelModule::class])
    internal abstract fun contributeCategoryActivity(): CategoryActivity

    @PerActivity
    @ContributesAndroidInjector(modules = [ResourceActivityModule::class, ResourceViewModelModule::class])
    internal abstract fun contributeResourceActivity(): ResourceActivity

    @PerActivity
    @ContributesAndroidInjector(modules = [DetailResourceActivityModule::class, DetailResourceViewModelModule::class])
    internal abstract fun contributeDetailResourceActivity(): DetailResourceActivity
}

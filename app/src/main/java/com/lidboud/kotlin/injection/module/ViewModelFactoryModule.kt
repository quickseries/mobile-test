package com.lidboud.kotlin.injection.module

import androidx.lifecycle.ViewModelProvider

import com.lidboud.kotlin.injection.ViewModelFactory

import dagger.Binds
import dagger.Module

@Module
abstract class ViewModelFactoryModule {

    @Binds
    internal abstract fun bindViewModelFactory(factory: ViewModelFactory): ViewModelProvider.Factory
}

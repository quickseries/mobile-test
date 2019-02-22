package com.lidboud.kotlin.ui.resource

import androidx.lifecycle.ViewModel

import com.lidboud.kotlin.injection.ViewModelKey

import dagger.Binds
import dagger.Module
import dagger.multibindings.IntoMap

@Module
abstract class ResourceViewModelModule {

    @Binds
    @IntoMap
    @ViewModelKey(ResourceViewModel::class)
    internal abstract fun bindResourceViewModel(resourceViewModel: ResourceViewModel): ViewModel
}

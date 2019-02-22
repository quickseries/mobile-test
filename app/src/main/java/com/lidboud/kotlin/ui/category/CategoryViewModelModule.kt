package com.lidboud.kotlin.ui.category

import androidx.lifecycle.ViewModel

import com.lidboud.kotlin.injection.ViewModelKey

import dagger.Binds
import dagger.Module
import dagger.multibindings.IntoMap

@Module
abstract class CategoryViewModelModule {

    @Binds
    @IntoMap
    @ViewModelKey(CategoryViewModel::class)
    internal abstract fun bindCategoryViewModel(categoryViewModel: CategoryViewModel): ViewModel
}

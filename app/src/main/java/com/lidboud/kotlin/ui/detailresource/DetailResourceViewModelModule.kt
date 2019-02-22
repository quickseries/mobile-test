package com.lidboud.kotlin.ui.detailresource

import androidx.lifecycle.ViewModel

import com.lidboud.kotlin.injection.ViewModelKey

import dagger.Binds
import dagger.Module
import dagger.multibindings.IntoMap

@Module
abstract class DetailResourceViewModelModule {

    @Binds
    @IntoMap
    @ViewModelKey(DetailResourceViewModel::class)
    internal abstract fun bindResourceViewModel(detailResourceViewModel: DetailResourceViewModel): ViewModel
}

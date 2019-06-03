package com.mohamadk.quickseries.pages.detail

import com.mohamadk.quickseries.pages.gride.items.places.ItemPlace
import org.koin.android.viewmodel.dsl.viewModel
import org.koin.dsl.module

val detailModule = module {

    viewModel { (itemPlace: ItemPlace) ->
        DetailFragmentViewModel(itemPlace = itemPlace)
    }

}
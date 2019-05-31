package com.mohamadk.quickseries.pages.gride

import com.mohamadk.quickseries.pages.gride.repo.CategoriesApi
import com.mohamadk.quickseries.pages.gride.repo.CategoriesApiImpl
import com.mohamadk.quickseries.pages.gride.repo.CategoriesRepository
import com.mohamadk.quickseries.pages.gride.repo.CategoriesRepositoryImpl
import org.koin.android.viewmodel.dsl.viewModel
import org.koin.dsl.module

val categoryModule=module{

    viewModel {
        GridFragmentViewModel(categoryRepository = get())
    }

    factory <CategoriesRepository>{
        CategoriesRepositoryImpl(categoriesApi = get())
    }

    single<CategoriesApi> {
        CategoriesApiImpl(get())
    }

}
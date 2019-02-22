package com.lidboud.kotlin.ui.category

import androidx.lifecycle.MutableLiveData
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import com.lidboud.kotlin.data.model.domain.Category
import com.lidboud.kotlin.ui.common.SingleLiveEvent
import com.lidboud.kotlin.usecase.FetchCategoriesUseCase
import com.lidboud.kotlin.usecase.FetchCategoriesUseCaseImpl
import dagger.Module
import dagger.Provides

@Module
class CategoryActivityModule {

    @Provides
    internal fun provideCategoryDataModel(): MutableLiveData<CategoryDataModel> {
        return MutableLiveData()
    }

    @Provides
    internal fun provideCategoryData(): SingleLiveEvent<Category> {
        return SingleLiveEvent()
    }

    @Provides
    internal fun provideFetchCategoriesUseCase(fetchCategoriesUseCase: FetchCategoriesUseCaseImpl): FetchCategoriesUseCase {
        return fetchCategoriesUseCase
    }

    @Provides
    internal fun provideCategoryListAdapter(categoryAdapter: CategoryListAdapter): ListAdapter<Category, CategoryListAdapter.ViewHolder> {
        return categoryAdapter
    }

    @Provides
    internal fun provideCategoryItemCallback(): DiffUtil.ItemCallback<Category> {
        return CategoryDiffCallback()
    }
}

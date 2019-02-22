package com.lidboud.kotlin.ui.resource

import androidx.lifecycle.MutableLiveData
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import com.lidboud.kotlin.data.model.domain.Resource
import com.lidboud.kotlin.ui.common.SingleLiveEvent
import com.lidboud.kotlin.usecase.FetchResourcesUseCase
import com.lidboud.kotlin.usecase.FetchResourcesUseCaseImpl
import dagger.Module
import dagger.Provides

@Module
class ResourceActivityModule {

    @Provides
    internal fun provideResourceDataModel(): MutableLiveData<ResourceDataModel> {
        return MutableLiveData()
    }

    @Provides
    internal fun provideResource(): SingleLiveEvent<Resource> {
        return SingleLiveEvent()
    }

    @Provides
    internal fun provideFetchCategoriesUseCase(fetchResourcesUseCase: FetchResourcesUseCaseImpl): FetchResourcesUseCase {
        return fetchResourcesUseCase
    }

    @Provides
    internal fun provideResourceListAdapter(resourceAdapter: ResourceListAdapter): ListAdapter<Resource, ResourceListAdapter.ViewHolder> {
        return resourceAdapter
    }

    @Provides
    internal fun provideResourceItemCallback(): DiffUtil.ItemCallback<Resource> {
        return ResourceDiffCallback()
    }
}

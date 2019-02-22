package com.lidboud.kotlin.ui.detailresource

import androidx.lifecycle.MutableLiveData
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.ListAdapter
import com.lidboud.kotlin.data.model.domain.Address
import com.lidboud.kotlin.ui.common.NavigationInfo
import com.lidboud.kotlin.ui.common.SingleLiveEvent
import com.lidboud.kotlin.usecase.FetchResourceUseCase
import com.lidboud.kotlin.usecase.FetchResourceUseCaseImpl
import dagger.Module
import dagger.Provides

@Module
class DetailResourceActivityModule {

    @Provides
    internal fun provideDetailResourceDataModel(): MutableLiveData<DetailResourceDataModel> {
        return MutableLiveData()
    }

    @Provides
    internal fun provideNavigationInfo(): SingleLiveEvent<NavigationInfo> {
        return SingleLiveEvent()
    }

    @Provides
    internal fun provideFetchCategoriesUseCase(fetchResourceUseCase: FetchResourceUseCaseImpl): FetchResourceUseCase {
        return fetchResourceUseCase
    }

    @Provides
    internal fun provideAddressListAdapter(addressAdapter: AddressListAdapter): ListAdapter<Address, AddressListAdapter.ViewHolder> {
        return addressAdapter
    }

    @Provides
    internal fun provideAddressItemCallback(): DiffUtil.ItemCallback<Address> {
        return AddressDiffCallback()
    }
}

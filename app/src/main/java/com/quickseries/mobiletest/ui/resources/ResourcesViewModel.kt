package com.quickseries.mobiletest.ui.resources

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.quickseries.mobiletest.data.ServiceException
import com.quickseries.mobiletest.domain.categories.model.Slug
import com.quickseries.mobiletest.domain.resources.ResourcesRepository
import com.quickseries.mobiletest.ui.resources.model.ResourceItem
import com.quickseries.mobiletest.ui.resources.model.toResourcesItems
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch
import kotlinx.coroutines.withContext

class ResourcesViewModel(val slug: Slug) : ViewModel() {

    private val uiScope = CoroutineScope(Dispatchers.Main + SupervisorJob())

    private val stateMutableLiveData = MutableLiveData<ResourcesState>()
    val stateLiveData: LiveData<ResourcesState> = stateMutableLiveData

    private var sortAscending = true

    override fun onCleared() {
        uiScope.cancel()
        super.onCleared()
    }

    /**
     * Fetch the resources and update the live data with the list if success.
     */
    fun fetchResources() {
        uiScope.launch {
            try {
                stateMutableLiveData.value = ResourcesState.Success(
                    ResourcesRepository.resources(slug).toResourcesItems()
                )
            } catch (e: ServiceException) {
                stateMutableLiveData.value = ResourcesState.Error(e.message)
            }
        }
    }

    /**
     * Event called when an resource item has been clicked. It lets us change state to Details.
     */
    fun resourceItemSelected(resourceItem: ResourceItem) {
        stateMutableLiveData.value = ResourcesState.Details(resourceItem)
    }

    /**
     * Sort ascending or descending depending on the last sorting. We update the state with the new list.
     */
    fun sort() {
        uiScope.launch {
            val state = stateMutableLiveData.value
            if (state is ResourcesState.Success) {
                if (sortAscending) {
                    stateMutableLiveData.value = withContext(Dispatchers.Default) {
                        ResourcesState.Success(state.list.sortedBy { it.resourceInfo.title })
                    }
                } else {
                    stateMutableLiveData.value = withContext(Dispatchers.Default) {
                        ResourcesState.Success(state.list.sortedByDescending { it.resourceInfo.title })
                    }
                }
                sortAscending = !sortAscending
            }
        }
    }


    class Factory(val slug: Slug) : ViewModelProvider.Factory {
        override fun <T : ViewModel?> create(modelClass: Class<T>): T {
            return ResourcesViewModel(slug) as T
        }
    }
}
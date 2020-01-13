package com.quickseries.mobiletest.ui.resources

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import androidx.lifecycle.ViewModelProvider
import com.quickseries.mobiletest.data.ServiceException
import com.quickseries.mobiletest.domain.categories.model.Slug
import com.quickseries.mobiletest.domain.resources.ResourcesRepository
import com.quickseries.mobiletest.ui.resources.model.toResourcesItems
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

class ResourcesViewModel(val slug: Slug) : ViewModel() {

    private val uiScope = CoroutineScope(Dispatchers.Main + SupervisorJob())

    private val stateMutableLiveData = MutableLiveData<ResourcesState>()
    val stateLiveData: LiveData<ResourcesState> = stateMutableLiveData

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

    override fun onCleared() {
        uiScope.cancel()
        super.onCleared()
    }


    class Factory(val slug: Slug) : ViewModelProvider.Factory {
        override fun <T : ViewModel?> create(modelClass: Class<T>): T {
            return ResourcesViewModel(slug) as T
        }
    }
}
package com.lidboud.kotlin.ui.resource

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.lidboud.kotlin.R
import com.lidboud.kotlin.data.model.domain.Resource
import com.lidboud.kotlin.ui.common.SingleLiveEvent
import com.lidboud.kotlin.usecase.FetchResourcesUseCase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import javax.inject.Inject
import kotlin.coroutines.CoroutineContext

class ResourceViewModel @Inject
constructor(application: Application,
            private val navigationData: SingleLiveEvent<Resource>,
            private val resourceData: MutableLiveData<ResourceDataModel>,
            private val fetchResourcesUseCase: FetchResourcesUseCase) : AndroidViewModel(application), CoroutineScope {

    var isSortedAz = false

    var lastResources = listOf<Resource>()

    val resourceDataModel: LiveData<ResourceDataModel>
        get() = resourceData

    val navigationDataModel: SingleLiveEvent<Resource>
        get() = navigationData

    private val genericMessage: String
        get() = getApplication<Application>().getString(R.string.genericError)

    override val coroutineContext: CoroutineContext =
            Dispatchers.Main + SupervisorJob()

    override fun onCleared() {
        super.onCleared()
        coroutineContext[Job]?.cancel()
    }

    fun fetchResources(categoryId: String) {
        launch {
            try {
                val resources = fetchResourcesUseCase.fetchResource(categoryId)
                lastResources = resources
                updateResources(resources)
            } catch (exception: Exception) {
                handleError()
            }
        }
    }

    fun handleResourceClicked(positionData: Int) {
        val resource = lastResources[positionData]
        navigationData.postValue(resource)
    }

    private fun updateResources(resources: List<Resource>) {
        val searchDataModel = ResourceDataModel()
        searchDataModel.resources = resources
        resourceData.postValue(searchDataModel)
    }

    private fun handleError() {
        notifyError(genericMessage)
    }

    private fun notifyError(errorMessage: String) {
        val searchDataModel = ResourceDataModel()
        searchDataModel.errorMessage = errorMessage
        resourceData.postValue(searchDataModel)
    }

    fun handleSortedClick() {
        val sortedList: List<Resource>
        if (isSortedAz) {
            sortedList = azOrderList(lastResources)
        } else {
            sortedList = revertList(lastResources)
        }
        isSortedAz = !isSortedAz
        lastResources = sortedList
        updateResources(sortedList)
    }

    private fun azOrderList(resources: List<Resource>): List<Resource> {
        return resources.sortedWith(compareBy { it.title })
    }

    private fun revertList(resources: List<Resource>): List<Resource> {
        return resources.reversed()
    }
}

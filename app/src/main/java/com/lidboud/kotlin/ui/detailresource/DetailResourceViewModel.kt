package com.lidboud.kotlin.ui.detailresource

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.lidboud.kotlin.R
import com.lidboud.kotlin.data.model.domain.Resource
import com.lidboud.kotlin.ui.common.NavigationInfo
import com.lidboud.kotlin.ui.common.NavigationType
import com.lidboud.kotlin.ui.common.SingleLiveEvent
import com.lidboud.kotlin.usecase.FetchResourceUseCase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import javax.inject.Inject
import kotlin.coroutines.CoroutineContext

class DetailResourceViewModel @Inject
constructor(application: Application,
            private val navigationData: SingleLiveEvent<NavigationInfo>,
            private val resourceData: MutableLiveData<DetailResourceDataModel>,
            private val fetchResourceUseCase: FetchResourceUseCase) : AndroidViewModel(application), CoroutineScope {

    var lastResource: Resource? = null

    val resourceDataModel: LiveData<DetailResourceDataModel>
        get() = resourceData

    val navigationDataModel: SingleLiveEvent<NavigationInfo>
        get() = navigationData

    private val genericMessage: String
        get() = getApplication<Application>().getString(R.string.genericError)

    override val coroutineContext: CoroutineContext =
            Dispatchers.Main + SupervisorJob()

    override fun onCleared() {
        super.onCleared()
        coroutineContext[Job]?.cancel()
    }

    fun fetchResource(resourceId: String) {
        launch {
            try {
                val resource = fetchResourceUseCase.fetchResource(resourceId)
                lastResource = resource
                updateResource(resource)
            } catch (exception: Exception) {
                handleError()
            }
        }
    }

    private fun updateResource(resource: Resource?) {
        resource?.let { it ->
            val detailResourceDataModel = DetailResourceDataModel()
            detailResourceDataModel.resource = it
            resourceData.postValue(detailResourceDataModel)
        } ?: kotlin.run { handleError() }
    }

    private fun handleError() {
        notifyError(genericMessage)
    }

    private fun notifyError(errorMessage: String) {
        val detailResourceDataModel = DetailResourceDataModel()
        detailResourceDataModel.errorMessage = errorMessage
        resourceData.postValue(detailResourceDataModel)
    }

    fun handleWebsiteClicked() {
        lastResource?.let { it ->
            it.contactInfo.website?.let {
                if (it[0].isNotEmpty()) {
                    val navigationInfo = NavigationInfo(NavigationType.WEBSITE, it[0])
                    navigationData.postValue(navigationInfo)
                }
            }
        }
    }

    fun handleEmailClicked() {
        lastResource?.let { it ->
            it.contactInfo.email?.let {
                if (it[0].isNotEmpty()) {
                    val navigationInfo = NavigationInfo(NavigationType.EMAIL, it[0])
                navigationData.postValue(navigationInfo)
                }
            }
        }
    }

    fun handleAddressClicked(position: Int) {
        lastResource?.let { it ->
            val address = it.addresses[position].address
            val city = it.addresses[position].city
            val fullAddress = String.format("%s,%s", address, city)
            if (address.isNotEmpty()) {
                val navigationInfo = NavigationInfo(NavigationType.ADDRESS, fullAddress)
                navigationData.postValue(navigationInfo)
            }
        }
    }
}

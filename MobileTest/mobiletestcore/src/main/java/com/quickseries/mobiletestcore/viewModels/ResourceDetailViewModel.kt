package com.quickseries.mobiletestcore.viewModels

import android.app.Application
import android.arch.lifecycle.AndroidViewModel
import android.arch.lifecycle.LiveData
import android.arch.lifecycle.MutableLiveData
import com.quickseries.mobiletestcore.data.DemoDatabase
import com.quickseries.mobiletestcore.models.ResourceModelBase
import java.util.*

class ResourceDetailViewModel : AndroidViewModel {
    private val database: DemoDatabase
    private val resource = MutableLiveData<ResourceModelBase?>()

    constructor(application: Application) : super(application) {
        database = DemoDatabase.getInstance(application.applicationContext)
    }

    fun setResourceId(resourceId: UUID) {
        resource.value = database.resourceDao.getResources().value?.firstOrNull { c -> c.id == resourceId }
    }

    fun getResource() = resource as LiveData<ResourceModelBase?>
}
package com.mohamadk.quickseries.pages.categories.repo.paging

import androidx.lifecycle.MutableLiveData
import androidx.paging.DataSource
import com.mohamadk.middleman.model.BaseModel

class DataSourceFactory(
    private val source: PageKeyedDataSource
) : DataSource.Factory<String, BaseModel>() {

    val sourceLiveData = MutableLiveData<PageKeyedDataSource>()

    override fun create(): DataSource<String, BaseModel> {

        sourceLiveData.postValue(source)
        return source
    }
}

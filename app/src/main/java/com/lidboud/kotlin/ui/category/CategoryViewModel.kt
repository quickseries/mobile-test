package com.lidboud.kotlin.ui.category

import android.app.Application
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import com.lidboud.kotlin.R
import com.lidboud.kotlin.data.model.domain.Category
import com.lidboud.kotlin.ui.common.SingleLiveEvent
import com.lidboud.kotlin.usecase.FetchCategoriesUseCase
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.Job
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import javax.inject.Inject
import kotlin.coroutines.CoroutineContext

class CategoryViewModel @Inject
constructor(application: Application,
            private val navigationData: SingleLiveEvent<Category>,
            private val categoryData: MutableLiveData<CategoryDataModel>,
            private val fetchCategoriesUseCase: FetchCategoriesUseCase) : AndroidViewModel(application), CoroutineScope {

    var lastCategories = listOf<Category>()

    val categoryDataModel: LiveData<CategoryDataModel>
        get() = categoryData

    val navigationDataModel: SingleLiveEvent<Category>
        get() = navigationData

    private val genericMessage: String
        get() = getApplication<Application>().getString(R.string.genericError)

    override val coroutineContext: CoroutineContext =
            Dispatchers.Main + SupervisorJob()

    override fun onCleared() {
        super.onCleared()
        coroutineContext[Job]?.cancel()
    }

    fun fetchCategories() {
        launch {
            try {
                val categories = fetchCategoriesUseCase.fetchCategories()
                lastCategories = categories
                updateCategories(categories)
            } catch (exception: Exception) {
                handleError()
            }
        }
    }

    fun handleCategoryClicked(positionData: Int) {
        val category = lastCategories[positionData]
        navigationData.postValue(category)
    }

    private fun updateCategories(categories: List<Category>) {
        val searchDataModel = CategoryDataModel()
        searchDataModel.categories = categories
        categoryData.postValue(searchDataModel)
    }

    private fun handleError() {
        notifyError(genericMessage)
    }

    private fun notifyError(errorMessage: String) {
        val searchDataModel = CategoryDataModel()
        searchDataModel.errorMessage = errorMessage
        categoryData.postValue(searchDataModel)
    }
}

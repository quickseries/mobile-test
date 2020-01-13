package com.quickseries.mobiletest.ui.categories

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.quickseries.mobiletest.data.ServiceException
import com.quickseries.mobiletest.domain.CategoriesRepository
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

class CategoriesViewModel : ViewModel() {

    private val uiScope = CoroutineScope(Dispatchers.Main + SupervisorJob())

    private val categoriesMutableLiveData = MutableLiveData<CategoriesState>()
    val categoriesLiveData: LiveData<CategoriesState> = categoriesMutableLiveData

    init {
        fetchCategories()
    }

    fun fetchCategories() {
        uiScope.launch {
            categoriesMutableLiveData.value = CategoriesState.Loading
            try {
                categoriesMutableLiveData.value = CategoriesState.Success(
                    CategoriesRepository.categories().toCategoriesItems()
                )
            } catch (e: ServiceException) {
                categoriesMutableLiveData.value = CategoriesState.Error(e.message)
            }
        }
    }

    override fun onCleared() {
        uiScope.cancel()
        super.onCleared()
    }
}
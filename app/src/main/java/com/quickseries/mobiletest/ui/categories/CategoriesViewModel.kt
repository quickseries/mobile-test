package com.quickseries.mobiletest.ui.categories

import androidx.lifecycle.LiveData
import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.quickseries.mobiletest.data.ServiceException
import com.quickseries.mobiletest.domain.categories.CategoriesRepository
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

class CategoriesViewModel : ViewModel() {

    private val uiScope = CoroutineScope(Dispatchers.Main + SupervisorJob())

    private val stateMutableLiveData = MutableLiveData<CategoriesState>()
    val stateLiveData: LiveData<CategoriesState> = stateMutableLiveData

    init {
        fetchCategories()
    }

    /**
     * Fetch the categories and update the live data.
     */
    fun fetchCategories() {
        uiScope.launch {
            stateMutableLiveData.value = CategoriesState.Loading
            try {
                stateMutableLiveData.value = CategoriesState.Success(
                    CategoriesRepository.categories().toCategoriesItems()
                )
            } catch (e: ServiceException) {
                stateMutableLiveData.value = CategoriesState.Error(e.message)
            }
        }
    }

    override fun onCleared() {
        uiScope.cancel()
        super.onCleared()
    }
}
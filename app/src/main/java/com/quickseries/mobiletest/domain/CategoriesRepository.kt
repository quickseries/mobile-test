package com.quickseries.mobiletest.domain

import com.quickseries.mobiletest.data.HttpServiceException
import com.quickseries.mobiletest.data.PayloadServiceException
import com.quickseries.mobiletest.data.QuickSeriesService
import com.quickseries.mobiletest.data.ServiceException
import com.quickseries.mobiletest.data.UnauthorizeServiceException
import com.quickseries.mobiletest.domain.model.toCategories
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

/**
 * A repository for managing categories.
 */
object CategoriesRepository {

    /**
     * Fetch a list of response categories and convert them to the right model.
     *
     * @return List<Category>
     * @throws [ServiceException], [HttpServiceException], [UnauthorizeServiceException], [PayloadServiceException]
     */
    @Throws(
        ServiceException::class,
        HttpServiceException::class,
        UnauthorizeServiceException::class,
        PayloadServiceException::class
    )
    suspend fun categories() = withContext(Dispatchers.IO) {
        QuickSeriesService.categories().toCategories()
    }
}
package com.quickseries.mobiletest.domain.resources

import com.quickseries.mobiletest.data.QuickSeriesService
import com.quickseries.mobiletest.domain.categories.model.Slug
import com.quickseries.mobiletest.domain.resources.model.toResources
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

/**
 * A repository for managing resources.
 */
object ResourcesRepository {

    suspend fun resources(slug: Slug) = withContext(Dispatchers.IO) {
        when (slug) {
            Slug.RESTAURANTS -> QuickSeriesService.restaurants().toResources()
            Slug.VACATION_SPOTS -> QuickSeriesService.vacationSpots().toResources()
            Slug.UNKNOWN -> emptyList()
        }
    }
}
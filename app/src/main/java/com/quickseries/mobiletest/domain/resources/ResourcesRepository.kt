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

    /**
     * Fetch the resources for a certain slug (restaurants or vacation-spots).
     * For the moment, we only fetch from the service. In future, we could cache the data that we receive.
     *
     * @param slug
     * @return List<Resource>
     */
    suspend fun resources(slug: Slug) = withContext(Dispatchers.IO) {
        when (slug) {
            Slug.RESTAURANTS -> QuickSeriesService.restaurants().toResources()
            Slug.VACATION_SPOTS -> QuickSeriesService.vacationSpots().toResources()
            Slug.UNKNOWN -> emptyList()
        }
    }
}
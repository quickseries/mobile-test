package com.quickseries.mobiletest.ui.resources

import com.quickseries.mobiletest.ui.resources.model.ResourceItem

/**
 * A class representing the state for the resources.
 */
sealed class ResourcesState {

    /**
     * Success state containing the result.
     *
     * @param list list of resource items.
     */
    class Success(val list: List<ResourceItem>) : ResourcesState()

    /**
     * Details state containing the resource item details.
     *
     * @param resourceItem
     */
    class Details(val resourceItem: ResourceItem) : ResourcesState()

    /**
     * Loading State.
     */
    object Loading : ResourcesState()

    /**
     * Error state containing the message.
     *
     * @param message the message to show to the user.
     */
    class Error(val message: String) : ResourcesState()
}
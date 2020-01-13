package com.quickseries.mobiletest.ui.categories

/**
 * A class representing the state for the categories.
 */
sealed class CategoriesState {

    /**
     * Success state containing the result.
     *
     * @param list list of category items.
     */
    class Success(val list: List<CategoryItem>) : CategoriesState()

    /**
     * Loading State.
     */
    object Loading : CategoriesState()

    /**
     * Error state containing the message.
     *
     * @param message the message to show to the user.
     */
    class Error(val message: String) : CategoriesState()
}
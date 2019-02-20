package org.johny.quickseries.view.fragments

import androidx.navigation.Navigation
import org.johny.quickseries.model.Category

class SubcategoryListFragment : CategoryListFragment() {
    override fun onCategoryClicked(category: Category) {
        val navDirections =
            SubcategoryListFragmentDirections.actionSubcategoryToDetail(category.title, category._id, slug)
        view?.let {
            Navigation.findNavController(it).navigate(navDirections)
        }
    }
}
package com.mohamadk.quickseries.pages.categories

import android.os.Bundle
import android.view.View
import com.mohamadk.pagingfragment.base.factories.PageFactory
import com.mohamadk.pagingfragment.base.pagelist.BasePagingFragment
import org.koin.android.viewmodel.ext.android.viewModel

class CategoriesFragment: BasePagingFragment<CategoriesFragmentViewModel>() {
    override val viewModel: CategoriesFragmentViewModel by viewModel()

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        loadItems()

    }

    class CategoriesPage() : PageFactory(CategoriesFragment::class.java) {

    }

}
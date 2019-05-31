package com.mohamadk.quickseries.pages.gride

import android.os.Bundle
import android.view.View
import androidx.core.os.bundleOf
import androidx.recyclerview.widget.GridLayoutManager
import com.mohamadk.middleman.AdapterProvider
import com.mohamadk.middleman.adapter.GeneralViewAdapter
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.pagingfragment.base.factories.PageFactory
import com.mohamadk.pagingfragment.base.list.BaseListFragment
import com.mohamadk.quickseries.R
import org.koin.android.viewmodel.ext.android.viewModel

const val ARG_SLUG = "argSlug"
const val ARG_TITLE = "argTitle"

class GridFragment : BaseListFragment<List<BaseModel>, GridFragmentViewModel>() {


    lateinit var slug: String
    override val viewModel: GridFragmentViewModel by viewModel()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments!!.apply {
            slug = getString(ARG_SLUG)!!
            titlePage = getString(ARG_TITLE)
        }

        loadItems(slug)
    }

    override fun provideAdapter(): AdapterProvider<List<BaseModel>> {
        return GeneralViewAdapter(this)
    }

    override fun submitList(it: List<BaseModel>?) {
        adapterProvider.submitList(it)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        getRecycler(view).apply {
            layoutManager = GridLayoutManager(context,resources.getInteger(R.integer.gridSpanCount))
        }

    }


    class GridPage(
        private val slug: String
        , private val title: String
        , private val addToBackStack: Boolean = true
    ) :
        PageFactory(GridFragment::class.java) {
        override fun args(): Bundle? {
            return bundleOf(
                ARG_SLUG to slug
                , ARG_TITLE to title
            )
        }

        override fun addToBackStack(): Boolean {
            return addToBackStack
        }
    }

}
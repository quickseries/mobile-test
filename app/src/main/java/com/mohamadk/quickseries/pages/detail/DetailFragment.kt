package com.mohamadk.quickseries.pages.detail

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.os.bundleOf
import androidx.recyclerview.widget.RecyclerView
import com.mohamadk.middleman.AdapterProvider
import com.mohamadk.middleman.adapter.GeneralViewAdapter
import com.mohamadk.middleman.model.BaseModel
import com.mohamadk.pagingfragment.base.factories.PageFactory
import com.mohamadk.pagingfragment.base.list.BaseListFragment
import com.mohamadk.quickseries.R
import com.mohamadk.quickseries.core.intractors.ToolbarIntractor
import com.mohamadk.quickseries.pages.gride.items.places.ItemPlace
import org.koin.android.viewmodel.ext.android.viewModel
import org.koin.core.parameter.parametersOf

const val ARG_PLACE = "place"

class DetailFragment : BaseListFragment<List<BaseModel>, DetailFragmentViewModel>() {

    lateinit var place: ItemPlace
    override val viewModel: DetailFragmentViewModel by viewModel {
        parametersOf(place)
    }

    override fun onResume() {
        super.onResume()
        (listener as ToolbarIntractor).hideSort()
    }

    override fun provideAdapter(): AdapterProvider<List<BaseModel>> {
        return GeneralViewAdapter(this)
    }

    override fun submitList(it: List<BaseModel>?) {
        adapterProvider.submitList(it)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.detail_fragment, container, false)
    }

    override fun getRecycler(baseView: View): RecyclerView {
        return baseView.findViewById(R.id.rc_list)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        place = arguments!!.getParcelable(ARG_PLACE)!!
        titlePage = getString(R.string.detail)
    }

    class DetailPage(private val place: ItemPlace) : PageFactory(DetailFragment::class.java) {
        override fun args(): Bundle? {
            return bundleOf(
                ARG_PLACE to place
            )
        }
    }
}
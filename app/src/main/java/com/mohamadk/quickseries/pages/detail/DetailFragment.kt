package com.mohamadk.quickseries.pages.detail

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.core.os.bundleOf
import com.mohamadk.pagingfragment.base.BaseFragmentOpenerFragment
import com.mohamadk.pagingfragment.base.factories.PageFactory
import com.mohamadk.quickseries.R
import com.mohamadk.quickseries.pages.gride.items.places.ItemPlace

const val ARG_PLACE="place"

class DetailFragment: BaseFragmentOpenerFragment() {

    lateinit var place: ItemPlace

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        place=arguments!!.getParcelable(ARG_PLACE)!!
        titlePage=getString(R.string.detail)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.detail_fragment,container,false)
    }


    class DetailPage(private val place: ItemPlace) : PageFactory(DetailFragment::class.java) {
        override fun args(): Bundle? {
            return bundleOf(
                ARG_PLACE to place
            )
        }
    }
}
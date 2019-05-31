package com.mohamadk.quickseries.pages.gride.items.places

import android.content.Context
import android.util.AttributeSet
import androidx.cardview.widget.CardView
import com.mohamadk.middleman.Binder
import com.mohamadk.middleman.intractors.RequireInteractor
import com.mohamadk.pagingfragment.intractors.FragmentOpener
import com.mohamadk.quickseries.core.GlideApp
import com.mohamadk.quickseries.pages.detail.DetailFragment
import kotlinx.android.synthetic.main.item_place.view.*

class ItemPlaceView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0
) :
    CardView(context, attributeSet, defStyleAttr)
    , Binder<ItemPlace>
    , RequireInteractor<FragmentOpener> {

    lateinit var fragmentOpener: FragmentOpener

    override fun bind(item: ItemPlace?) {

        tv_title.text=item!!.title

        GlideApp.with(this).load(item.photo).into(iv_background)

        setOnClickListener {
            fragmentOpener.open(DetailFragment.DetailPage(item))
        }

    }

    override fun setInteractor(intractor: FragmentOpener) {
        this.fragmentOpener = intractor
    }
}
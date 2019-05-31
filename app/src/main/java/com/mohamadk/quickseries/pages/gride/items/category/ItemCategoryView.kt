package com.mohamadk.quickseries.pages.gride.items.category

import android.content.Context
import android.util.AttributeSet
import androidx.cardview.widget.CardView
import com.mohamadk.middleman.Binder
import com.mohamadk.middleman.intractors.RequireInteractor
import com.mohamadk.pagingfragment.intractors.FragmentOpener
import com.mohamadk.quickseries.R
import com.mohamadk.quickseries.core.GlideApp
import com.mohamadk.quickseries.pages.gride.GridFragment
import kotlinx.android.synthetic.main.item_category.view.*

class ItemCategoryView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0
) :
    CardView(context, attributeSet, defStyleAttr)
    , Binder<ItemCategory>
    , RequireInteractor<FragmentOpener>
{

    lateinit var fragmentOpener: FragmentOpener

    override fun setInteractor(intractor: FragmentOpener) {
        this.fragmentOpener=intractor
    }


    override fun bind(item: ItemCategory?) {
        tv_title.text = item!!.title
        tv_description.text = item.description




        if(item.slug=="restaurants"){
            iv_background.setImageResource(R.drawable.resturants)
        }else if(item.slug=="vacation-spots"){
            iv_background.setImageResource(R.drawable.places)
        }
        setOnClickListener {
            fragmentOpener.open(GridFragment.GridPage(item.slug,item.title))
        }

    }
}
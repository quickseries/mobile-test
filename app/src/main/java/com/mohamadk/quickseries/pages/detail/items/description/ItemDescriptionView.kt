package com.mohamadk.quickseries.pages.detail.items.description

import android.content.Context
import android.util.AttributeSet
import androidx.constraintlayout.widget.ConstraintLayout
import androidx.core.text.HtmlCompat
import com.mohamadk.middleman.Binder
import kotlinx.android.synthetic.main.item_description.view.*

class ItemDescriptionView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0
) : ConstraintLayout(context, attributeSet, defStyleAttr)
    , Binder<ItemDescription> {
    override fun bind(item: ItemDescription?) {
        tv_title.text = item!!.title
        tv_description.text = HtmlCompat.fromHtml(item.description, HtmlCompat.FROM_HTML_MODE_COMPACT)

    }
}
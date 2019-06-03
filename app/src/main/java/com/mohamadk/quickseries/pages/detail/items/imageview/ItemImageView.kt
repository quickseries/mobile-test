package com.mohamadk.quickseries.pages.detail.items.imageview

import android.content.Context
import android.util.AttributeSet
import androidx.appcompat.widget.AppCompatImageView
import com.mohamadk.middleman.Binder
import com.mohamadk.quickseries.core.imageloader.GlideApp


class ItemImageView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0
) : AppCompatImageView(context, attributeSet, defStyleAttr)
    , Binder<ItemImage> {

    override fun bind(item: ItemImage?) {
        GlideApp.with(this).load(item!!.img).into(this)
    }
}


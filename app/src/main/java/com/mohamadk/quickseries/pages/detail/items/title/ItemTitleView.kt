package com.mohamadk.quickseries.pages.detail.items.title

import android.content.Context
import android.util.AttributeSet
import androidx.appcompat.widget.AppCompatTextView
import com.mohamadk.middleman.Binder

class ItemTitleView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0
) : AppCompatTextView(context, attributeSet, defStyleAttr)
    , Binder<ItemTitle> {
    override fun bind(item: ItemTitle?) {
        this.text = item!!.title
    }
}
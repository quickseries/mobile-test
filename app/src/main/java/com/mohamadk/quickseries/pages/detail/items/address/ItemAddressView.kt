package com.mohamadk.quickseries.pages.detail.items.address

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.util.AttributeSet
import androidx.cardview.widget.CardView
import com.mohamadk.middleman.Binder
import kotlinx.android.synthetic.main.item_address.view.*


class ItemAddressView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0
) : CardView(context, attributeSet, defStyleAttr)
    , Binder<ItemAddress> {
    override fun bind(item: ItemAddress?) {
        tv_address.text = item!!.address11()
        setOnClickListener {
            if (item.gps != null) {
                val uri = "geo:${item.gps.latitude},%${item.gps.longitude}"
                val intent = Intent(Intent.ACTION_VIEW, Uri.parse(uri))
                context.startActivity(intent)
            }
        }
    }
}
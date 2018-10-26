package com.quickseries.quickseriesapp.ui.utils

import android.databinding.BindingAdapter
import android.text.TextUtils
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import com.squareup.picasso.Picasso


/**
 * Created by parth.gadhiya on 2018-10-26.
 */


fun ViewGroup.inflate(layoutId: Int): View {
    return LayoutInflater.from(context).inflate(layoutId, this, false)
}

@BindingAdapter(value = "loadImg", requireAll = false)
fun ImageView.loadImg(imageUrl: String?) {
    if (TextUtils.isEmpty(imageUrl)) {
        Picasso.with(context)
            .load("https://www.gravatar.com/avatar/$imageUrl?s=200&r=pg&d=404")
            .into(this)
    } else {
        Picasso.with(context)
            .load("https://www.gravatar.com/avatar/$imageUrl?s=200&r=pg&d=404")
            .into(this)
    }
}



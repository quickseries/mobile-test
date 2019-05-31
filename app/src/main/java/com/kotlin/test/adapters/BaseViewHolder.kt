package com.kotlin.test.adapters

import android.support.v7.widget.RecyclerView
import android.view.View

abstract class BaseViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
    var currentPosition: Int = 0
        private set

    protected abstract fun clear()

    open fun onBind(position: Int) {
        currentPosition = position
        clear()
    }
}

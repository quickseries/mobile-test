package com.quickseries.quickseriesapp.ui.view

import android.support.v7.widget.RecyclerView
import android.view.ViewGroup
import com.myfolks.android.folks.view.adapter.ViewType
import com.myfolks.android.folks.view.adapter.ViewTypeDelegateAdapter
import com.quickseries.quickseriesapp.R
import com.quickseries.quickseriesapp.ui.utils.inflate

class LoadingDelegateAdapter : ViewTypeDelegateAdapter {


    override fun onCreateViewHolder(parent: ViewGroup) = TurnsViewHolder(parent)

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, item: ViewType) {
    }

    class TurnsViewHolder(parent: ViewGroup) : RecyclerView.ViewHolder(
        parent.inflate(R.layout.list_item_loading)
    )
}
package com.myfolks.android.folks.view.adapter

import android.support.v7.widget.RecyclerView
import android.view.ViewGroup

/**
 * Created by parth.gadhiya on 2018-10-26.
 */
interface ViewTypeDelegateAdapter {
    fun onCreateViewHolder(parent: ViewGroup): RecyclerView.ViewHolder

    fun onBindViewHolder(holder: RecyclerView.ViewHolder, item: ViewType)
}
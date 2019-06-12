package com.android.kotlin.adapter

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.android.kotlin.entities.BizDayItem
import com.android.kotlindemo.R

class BusinessHoursDisplayAdapter(val items: List<BizDayItem>) : RecyclerView.Adapter<BusinessHoursDisplayAdapter.BizDayViewHolder>() {


    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): BizDayViewHolder {
        val view = LayoutInflater.from(viewGroup.context).inflate(R.layout.row_layout_biz_days_item, viewGroup, false)
        return BizDayViewHolder(view)
    }

    override fun onBindViewHolder(bizDayViewHolder: BizDayViewHolder, i: Int) {
        bizDayViewHolder.mDayTextView.text = items.get(i).dayName
        bizDayViewHolder.mTimeTextView.text = items.get(i).value
    }

    override fun getItemCount(): Int {
        return items.size
    }

    inner class BizDayViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val mDayTextView: TextView = itemView.findViewById(R.id.row_layout_day_text_view)
        val mTimeTextView: TextView = itemView.findViewById(R.id.row_layout_time_text_view)

    }
}
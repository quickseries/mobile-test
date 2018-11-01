package com.quickseries.mobiletest.components

import android.content.Context
import android.text.TextUtils
import android.util.AttributeSet
import android.view.LayoutInflater
import android.view.View
import android.widget.LinearLayout
import android.widget.TextView
import com.quickseries.mobiletest.R

class BusinessHoursRowView @JvmOverloads constructor(context: Context, attrs: AttributeSet? = null, defStyle: Int = 0) :
    LinearLayout(context, attrs, defStyle) {

    val dayTextView: TextView
    val detailTextView: TextView

    init {
        isClickable = true
        orientation = LinearLayout.VERTICAL
        LayoutInflater.from(context).inflate(R.layout.component_business_hours_row_view, this, true)
        dayTextView = findViewById(R.id.dayTextView)
        detailTextView = findViewById(R.id.detailTextView)

        attrs?.let {
            val a = context.theme.obtainStyledAttributes(it, R.styleable.BusinessHourRowView, defStyle, 0)
            try {
                dayTextView.text = a.getString(R.styleable.BusinessHourRowView_bhr_day) ?: ""
                detailTextView.text = a.getString(R.styleable.BusinessHourRowView_bhr_detail) ?: ""
            } finally {
                a.recycle()
            }
        }
    }

}



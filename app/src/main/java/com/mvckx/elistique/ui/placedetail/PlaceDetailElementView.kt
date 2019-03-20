package com.mvckx.elistique.ui.placedetail

import android.content.Context
import android.util.AttributeSet
import androidx.constraintlayout.widget.ConstraintLayout
import android.view.View
import com.mvckx.elistique.R


class PlaceDetailElementView @JvmOverloads constructor(
    context: Context?,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : ConstraintLayout(context, attrs, defStyleAttr) {
    init {
        View.inflate(context, R.layout.view_place_detail_element, this)
    }
}
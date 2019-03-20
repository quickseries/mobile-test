package com.mvckx.elistique.ui.placedetail

import android.content.Context
import android.content.res.TypedArray
import android.graphics.drawable.Drawable
import android.util.AttributeSet
import android.view.View
import androidx.appcompat.content.res.AppCompatResources
import androidx.constraintlayout.widget.ConstraintLayout
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.view_place_detail_element.view.*


class PlaceDetailElementView @JvmOverloads constructor(
    context: Context,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : ConstraintLayout(context, attrs, defStyleAttr) {
    init {
        View.inflate(context, R.layout.view_place_detail_element, this)

        val ta = getContext().obtainStyledAttributes(attrs, R.styleable.PlaceDetailElementView)
        try {
            ta.getSafeDrawable(R.styleable.PlaceDetailElementView_icon1, context)?.let {
                setIcon1(it)
            }
            ta.getSafeDrawable(R.styleable.PlaceDetailElementView_icon2, context)?.let {
                setIcon2(it)
            }
            ta.getString(R.styleable.PlaceDetailElementView_title)?.let {
                setTitle(it)
            }
            ta.getString(R.styleable.PlaceDetailElementView_value)?.let {
                setValue(it)
            }
        } finally {
            ta.recycle()
        }
    }

    fun setValue(string: String) {
        tvValue.text = string
    }

    fun setTitle(string: String) {
        tvTitle.text = string
    }

    fun setIcon1(drawable: Drawable) {
        ivIcon1.setImageDrawable(drawable)
    }

    fun setIcon2(drawable: Drawable) {
        ivIcon2.setImageDrawable(drawable)
    }
}

fun TypedArray.getSafeDrawable(attr: Int, context: Context): Drawable? {
    return this.getResourceId(attr, 0)
        .takeIf { it != 0 }
        ?.let {
            AppCompatResources.getDrawable(context, it)
        }
}
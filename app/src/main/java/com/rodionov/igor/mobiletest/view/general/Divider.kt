package com.rodionov.igor.mobiletest.view.general

import android.content.Context
import android.graphics.Canvas
import android.graphics.drawable.Drawable
import android.support.v4.content.ContextCompat
import android.support.v7.widget.RecyclerView
import com.rodionov.igor.mobiletest.R

/**
 * Created by Igor Rodionov.
 */
class Divider(context: Context) : RecyclerView.ItemDecoration() {
    private val mDivider: Drawable?

    init {
        mDivider = ContextCompat.getDrawable(context, R.drawable.divider)
    }

    override fun onDraw(c: Canvas, parent: RecyclerView, state: RecyclerView.State) {
        val left = parent.paddingLeft
        val right = parent.width - parent.paddingRight

        val childCount = parent.childCount
        for (i in 0 until childCount) {
            val child = parent.getChildAt(i)

            val params = child.layoutParams as RecyclerView.LayoutParams

            val top = child.bottom + params.bottomMargin
            val bottom = top + mDivider!!.intrinsicHeight

            mDivider.setBounds(left, top, right, bottom)
            mDivider.draw(c)
        }
    }
}

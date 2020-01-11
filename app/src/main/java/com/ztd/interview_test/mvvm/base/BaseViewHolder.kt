package com.ztd.interview_test.mvvm.base

import android.view.View
import androidx.recyclerview.widget.RecyclerView

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 *  on 1/10/2020.
 */

abstract class BaseViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {

    abstract fun onBind(position: Int)
}

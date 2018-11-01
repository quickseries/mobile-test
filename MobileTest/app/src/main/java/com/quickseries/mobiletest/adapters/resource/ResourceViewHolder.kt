package com.quickseries.mobiletest.adapters.resource

import android.support.v7.widget.AppCompatImageView
import android.support.v7.widget.RecyclerView
import android.view.View
import android.widget.TextView
import com.facebook.drawee.view.SimpleDraweeView
import com.quickseries.mobiletest.R
import com.quickseries.mobiletestcore.models.ResourceModelBase
import com.squareup.picasso.Picasso

class ResourceViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
    var itemClick: ResourceClickDelegate? = null
    private lateinit var resource: ResourceModelBase
    private var resourceImageView = itemView.findViewById<AppCompatImageView>(R.id.resourceImageView)
    private var titleTextView = itemView.findViewById<TextView>(R.id.titleTextView)

    init {
        itemView.isClickable = true
        itemView.setOnClickListener {
            itemClick?.invoke(resource)
        }
    }

    fun dataBind(resource: ResourceModelBase) {
        this.resource = resource
        titleTextView.text = resource.title
        Picasso.get()
            .load(resource.photo)
            .fit()
            .placeholder(R.drawable.progress_animation)
            .error(R.drawable.ic_no_image)
            .into(resourceImageView)
    }
}
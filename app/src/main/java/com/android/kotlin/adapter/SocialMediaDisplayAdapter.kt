package com.android.kotlin.adapter

import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import com.android.kotlin.utils.PicassoCache
import com.android.kotlindemo.R
import com.squareup.picasso.Picasso

class SocialMediaDisplayAdapter(val items : List<String>) : RecyclerView.Adapter<SocialMediaDisplayAdapter.SocialMediaViewHolder>() {



    override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): SocialMediaViewHolder {
        val view = LayoutInflater.from(viewGroup.context).inflate(R.layout.row_layout_social_media_item, viewGroup, false)
        return SocialMediaViewHolder(view)
    }

    override fun onBindViewHolder(socialMediaViewHolder: SocialMediaViewHolder, i: Int) {
        try {
            Picasso.get()
                    .load(items[i])
                    .into(socialMediaViewHolder.mSocialMediaImageView)
        } catch (e: Exception) {
            e.printStackTrace()
        }

    }

    override fun getItemCount(): Int {
        return items.size
    }

    inner class SocialMediaViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
         val mSocialMediaImageView: ImageView = itemView.findViewById(R.id.row_layout_social_media_image_view)

    }
}
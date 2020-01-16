package com.ztd.interview_test.mvvm.detailfragment.adapter.socialmediaadapter

import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.ztd.interview_test.databinding.LayoutItemSocialMediaBinding
import com.ztd.interview_test.mvvm.base.BaseViewHolder
import com.ztd.interview_test.mvvm.detailfragment.model.SocialMediaItem


/**
 * Created by Mahdi zarre Tahghigh doost on 1/14/2020.
 * mahdiZTD@gmail.com
 */
class SocialMediaAdapter(private var socials: MutableList<SocialMediaItem>) :
    RecyclerView.Adapter<SocialMediaAdapter.SocialMediaViewHolder>() {

    var clickListener: OnSocialMediaClickListenr? = null

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): SocialMediaViewHolder {
        return SocialMediaViewHolder(
            LayoutItemSocialMediaBinding.inflate(
                LayoutInflater.from(parent.context),
                parent,
                false
            )
        )
    }

    override fun getItemCount(): Int {
        return socials.size
    }

    override fun onBindViewHolder(holder: SocialMediaViewHolder, position: Int) {
        holder.onBind(position)
    }

    fun addItems(socials: MutableList<SocialMediaItem>) {
        this.socials.clear()
        this.socials.addAll(socials)
        notifyDataSetChanged()
    }

    fun clearItems() {
        this.socials.clear()
    }

    inner class SocialMediaViewHolder(var mBinding: LayoutItemSocialMediaBinding) :
        BaseViewHolder(mBinding.root) {

        override fun onBind(position: Int) {
            mBinding.vm = SocialMediaItemViewModel(socials[position],clickListener)
            mBinding.executePendingBindings()
        }
    }

    interface OnSocialMediaClickListenr {
        fun onSocialMediaClicked(url: String)
    }
}
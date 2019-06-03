package com.mohamadk.quickseries.pages.detail.items.social

import android.content.Context
import android.content.Intent
import android.util.AttributeSet
import androidx.cardview.widget.CardView
import androidx.core.net.toUri
import com.mohamadk.middleman.Binder
import com.mohamadk.middleman.intractors.RequireInteractor
import com.mohamadk.middleman.toVisibility
import com.mohamadk.pagingfragment.intractors.FragmentOpener
import kotlinx.android.synthetic.main.item_social.view.*


class ItemSocialView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0
) : CardView(context, attributeSet, defStyleAttr)
    , Binder<ItemSocial>
    , RequireInteractor<FragmentOpener> {

    lateinit var intractor: FragmentOpener

    override fun setInteractor(intractor: FragmentOpener) {
        this.intractor = intractor
    }

    override fun bind(item: ItemSocial?) {

        ib_facebook.visibility = item!!.facebook.toVisibility()
        ib_twitter.visibility = item.twitter.toVisibility()
        ib_youtube.visibility = item.youtubeChannel.toVisibility()

        ib_facebook.setOnClickListener {
            openSocialUrl(item.facebook!!)
        }
        ib_twitter.setOnClickListener {
            openSocialUrl(item.twitter!!)
        }
        ib_youtube.setOnClickListener {
            openSocialUrl(item.youtubeChannel!!)
        }

    }

    private fun openSocialUrl(url: String) {
        val intent = Intent(Intent.ACTION_VIEW, url.toUri())
        context.startActivity(intent)
    }
}
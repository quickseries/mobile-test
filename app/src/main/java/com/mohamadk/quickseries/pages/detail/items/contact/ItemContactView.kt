package com.mohamadk.quickseries.pages.detail.items.contact

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.util.AttributeSet
import androidx.cardview.widget.CardView
import com.mohamadk.middleman.Binder
import com.mohamadk.middleman.intractors.RequireInteractor
import com.mohamadk.middleman.toVisibility
import com.mohamadk.pagingfragment.intractors.FragmentOpener
import com.mohamadk.quickseries.pages.webpage.WebViewFragment
import kotlinx.android.synthetic.main.item_contact.view.*

class ItemContactView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0
) : CardView(context, attributeSet, defStyleAttr)
    , Binder<ItemContact>
    , RequireInteractor<FragmentOpener> {

    lateinit var intractor: FragmentOpener

    override fun setInteractor(intractor: FragmentOpener) {
        this.intractor = intractor
    }

    override fun bind(item: ItemContact?) {

        ib_call.visibility = item!!.call.toVisibility()
        ib_sms.visibility = item.sms.toVisibility()
        ib_email.visibility = item.email.toVisibility()
        ib_website.visibility = item.website.toVisibility()


        ib_call.setOnClickListener {
            println("tel:${item.info}")
            val call = Uri.parse("tel:${item.info}")
            val intent = Intent(Intent.ACTION_DIAL, call)
            context.startActivity(intent)
        }

        ib_sms.setOnClickListener {
            val intent = Intent(Intent.ACTION_VIEW, Uri.parse("sms:${item.info}"))
            context.startActivity(intent)
        }

        ib_website.setOnClickListener {
            intractor.open(WebViewFragment.WebViewPage(item.info))
        }

        ib_email.setOnClickListener {
            val emailArray: Array<String> = arrayOf(item.info)
            val intent = Intent(Intent.ACTION_SENDTO)
            intent.data = Uri.parse("mailto:")
            intent.putExtra(Intent.EXTRA_EMAIL, emailArray)
            if (intent.resolveActivity(context.packageManager) != null) {
                context.startActivity(intent)
            }
        }

        tv_number.text = item.info
        tv_title.text = item.title

    }
}
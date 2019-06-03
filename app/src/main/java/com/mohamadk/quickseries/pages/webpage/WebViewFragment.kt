package com.mohamadk.quickseries.pages.webpage

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.webkit.WebView
import androidx.core.os.bundleOf
import com.mohamadk.pagingfragment.base.BaseFragmentOpenerFragment
import com.mohamadk.pagingfragment.base.factories.PageFactory
import com.mohamadk.quickseries.R


const val ARG_URL = "url"

class WebViewFragment : BaseFragmentOpenerFragment() {
    lateinit var url: String
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        url = arguments!!.getString(ARG_URL)!!

    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.webview_fragment, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        (view as WebView).loadUrl(url)

    }


    class WebViewPage(val url: String) : PageFactory(WebViewFragment::class.java) {
        override fun args(): Bundle? {
            return bundleOf(
                ARG_URL to url
            )
        }
    }

}
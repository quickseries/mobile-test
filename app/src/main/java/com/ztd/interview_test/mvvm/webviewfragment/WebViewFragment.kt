package com.ztd.interview_test.mvvm.webviewfragment

import android.content.ActivityNotFoundException
import android.graphics.Bitmap
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.webkit.WebResourceRequest
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.annotation.RequiresApi
import androidx.browser.customtabs.CustomTabsIntent
import androidx.core.content.ContextCompat
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.Fragment
import com.ztd.interview_test.R
import com.ztd.interview_test.databinding.FragmentWebviewBinding


/**
 * Created by Mahdi zarre Tahghigh doost on 1/16/2020.
 * mahdiZTD@gmail.com
 */
class WebViewFragment : Fragment() {

    private lateinit var viewDataBinding: FragmentWebviewBinding

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        viewDataBinding =
            DataBindingUtil.inflate(inflater, R.layout.fragment_webview, container, false)
        return viewDataBinding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        viewDataBinding.webview.webViewClient = object : WebViewClient() {


            override fun onPageFinished(view: WebView, url: String) {
                viewDataBinding.webview?.visibility = View.VISIBLE
            }

            override fun shouldOverrideUrlLoading(view: WebView?, url: String?): Boolean {
                val isHttpScheme = url?.trimUrl()?.startsWith("http:") == true ||
                        url?.trimUrl()?.startsWith("https:") == true
                val shouldOverride = !isHttpScheme
                if (shouldOverride) {
                    url?.let {
                        openCustomTab(it)
                    }
                }
                return shouldOverride
            }

            @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
            override fun shouldOverrideUrlLoading(view: WebView?, request: WebResourceRequest?): Boolean {
                val isHttpScheme = request?.url?.scheme.equals("http", true) ||
                        request?.url?.scheme.equals("https", true)

                val shouldOverride = !isHttpScheme
                if (shouldOverride) {
                    request?.url?.let {
                        openCustomTab(it.toString())
                    }
                }
                return shouldOverride
            }
        }

        viewDataBinding.webview.settings.apply {
            javaScriptEnabled = true
            javaScriptCanOpenWindowsAutomatically = true
            domStorageEnabled = true
            blockNetworkLoads = false
            setAppCacheEnabled(true)
            loadsImagesAutomatically = true
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                mixedContentMode = WebSettings.MIXED_CONTENT_ALWAYS_ALLOW
            }
        }

        viewDataBinding.webview.loadUrl(WebViewFragmentArgs.fromBundle(arguments!!).url)
    }

    private fun openCustomTab(url: String) {
        val builder = CustomTabsIntent.Builder()
        builder.setToolbarColor(ContextCompat.getColor(activity!!, R.color.colorPrimaryDark))
        val customTabsIntent = builder.build()
        try {
            customTabsIntent.launchUrl(activity, Uri.parse(url))
        } catch (ex: ActivityNotFoundException) {
            Log.w("CHROME",ex.message)
        }
    }

    private fun String.trimUrl(): String {
        return replaceFirst(Regex("^(http[s]?://www\\.|http[s]?://|www\\.)"), "").replace(Regex("/\\z"), "")
    }
}
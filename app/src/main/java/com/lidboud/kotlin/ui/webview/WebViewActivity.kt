package com.lidboud.kotlin.ui.webview

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.webkit.WebResourceRequest
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.appcompat.app.AppCompatActivity
import com.lidboud.kotlin.R
import kotlinx.android.synthetic.main.web_layout.custom_webView

class WebViewActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.web_layout)
        val url = intent.getStringExtra(EXTRA_URL)
        custom_webView.webViewClient = getWebClient(false, url)
        custom_webView.settings.useWideViewPort = true
        custom_webView.settings.loadWithOverviewMode = true
        custom_webView.loadUrl(url)
    }

    private fun getWebClient(shouldNavigate: Boolean, url: String) = object : WebViewClient() {
        override fun shouldOverrideUrlLoading(view: WebView?, request: WebResourceRequest?): Boolean {
            return !shouldNavigate || request?.url.toString() == url
        }
    }

    companion object {
        const val EXTRA_URL = "extra_url"
        fun getIntent(context: Context, url: String): Intent {
            val intent = Intent(context, WebViewActivity::class.java)
            intent.putExtra(EXTRA_URL, url)
            return intent
        }
    }
}



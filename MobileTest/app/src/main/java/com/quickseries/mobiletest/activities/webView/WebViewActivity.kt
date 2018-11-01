package com.quickseries.mobiletest.activities.webView

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.MenuItem
import com.quickseries.mobiletest.R
import com.quickseries.mobiletest.util.Extras
import kotlinx.android.synthetic.main.activity_web_view.*

class WebViewActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_web_view)

        supportActionBar?.let {
            it.setDisplayHomeAsUpEnabled(true)
        }

        val url = intent.getStringExtra(Extras.EXTRA_URL)
        webView.loadUrl(url)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            android.R.id.home -> {
                finish()
                true
            }
            else -> {
                super.onOptionsItemSelected(item)
            }
        }
    }
}

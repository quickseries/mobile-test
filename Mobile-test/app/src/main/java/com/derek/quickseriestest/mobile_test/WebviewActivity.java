package com.derek.quickseriestest.mobile_test;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.webkit.WebView;

/**
 * Created by ddibblee on 8/15/2017.
 */

public class WebviewActivity extends AppCompatActivity {

    WebView webview;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_webpage);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        webview = (WebView) findViewById(R.id.webview);

        Intent intent = getIntent();
        String url = intent.getStringExtra("url");
        webview.loadUrl(url);
    }
}

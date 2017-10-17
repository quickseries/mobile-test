package com.test.quickseries.base;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.graphics.Bitmap;
import android.os.Bundle;
import android.view.Window;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

public class WebviewActivity extends BaseActivity {

    private String mCurrentUrl;
    WebView mWebView;

    @SuppressLint("SetJavaScriptEnabled")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        getWindow().requestFeature(Window.FEATURE_PROGRESS);
        super.onCreate(savedInstanceState);

        mWebView = new WebView(this);
        setContentView(mWebView);

        if (mCurrentUrl == null) {
            if (getIntent().getData() == null) {
                finish();
                return;
            }
        }

        String urlToLoad = savedInstanceState != null ? savedInstanceState.getString("url") : getIntent().getData().toString();
        if (!urlToLoad.startsWith("http://") && !urlToLoad.startsWith("https://")) {
            urlToLoad = "http://" + urlToLoad;
        }

        mWebView.getSettings().setJavaScriptEnabled(true);

        final Activity activity = this;
        mWebView.setWebChromeClient(new WebChromeClient() {
            public void onProgressChanged(WebView view, int progress) {
                activity.setProgress(progress * 1000);
            }
        });

        mWebView.setWebViewClient(new WebViewClient() {

            public void onReceivedError(WebView view, int errorCode, String description, String
                    failingUrl) {
                Toast.makeText(activity, "Oh no! " + description, Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                super.onPageStarted(view, url, favicon);
                setCurrentUrl(url);
            }
        });

        mWebView.loadUrl(urlToLoad);

    }


    private void setCurrentUrl(String url) {
        mCurrentUrl = url;
    }


    @Override
    public void onSaveInstanceState(Bundle outState) {
        outState.putString("url", mCurrentUrl);
        super.onSaveInstanceState(outState);
    }

    @Override
    public void onBackPressed() {
        if (mWebView.canGoBack()) {
            mWebView.goBack();
        } else {
            super.onBackPressed();
        }
    }


    public void goBack() {
        mWebView.goBack();
    }

    public boolean canGoBack() {
        return mWebView.canGoBack();
    }


}

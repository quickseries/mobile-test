package ca.ivasenko.mobiletest.details.ui;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.webkit.WebView;

import ca.ivasenko.mobiletest.R;

public class WebActivity extends AppCompatActivity
{
    public static final String URL = "url";

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_web);

        WebView webview = findViewById(R.id.webview);

        Intent intent = getIntent();
        String url = intent.getStringExtra(URL);
        webview.loadUrl(url);
    }
}

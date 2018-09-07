package com.books.quickseries.ui.base;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

/**
 * Created by zakir on 06/09/2018.
 */

public abstract class BaseActivity extends AppCompatActivity {

    public abstract void initUI();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    protected void onResume() {
        super.onResume();
        initUI();
    }
}

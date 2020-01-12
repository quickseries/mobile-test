package com.quickseries.mobiletest.ui

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.quickseries.mobiletest.R
import com.quickseries.mobiletest.ui.main.MainFragment

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.main_activity)
        if (savedInstanceState == null) {
            supportFragmentManager.beginTransaction()
                .replace(R.id.container, MainFragment.newInstance())
                .commitNow()
        }
    }

}

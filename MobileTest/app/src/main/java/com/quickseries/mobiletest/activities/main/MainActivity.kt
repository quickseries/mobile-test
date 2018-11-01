package com.quickseries.mobiletest.activities.main

import android.arch.lifecycle.Observer
import android.arch.lifecycle.ViewModelProvider
import android.arch.lifecycle.ViewModelProviders
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v4.app.FragmentManager
import android.view.MenuItem
import com.quickseries.mobiletest.R
import com.quickseries.mobiletest.fragments.main.MainFragment
import com.quickseries.mobiletestcore.viewModels.CategoryViewModel
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {

    private var fragmentStack = mutableListOf<Fragment>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        navigateToFragment(MainFragment(), false)
    }

    fun navigateToFragment(fragment: Fragment, animated: Boolean = true) {
        fragmentStack.add(fragment)
        supportFragmentManager.beginTransaction()
            .replace(R.id.containerLayout, fragment)
            .commitNow()
        refreshBackButton()
    }

    private fun refreshBackButton() {
        supportActionBar?.setDisplayHomeAsUpEnabled(fragmentStack.size > 1)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            android.R.id.home -> {
                onBackPressed()
                true
            }
            else -> {
                super.onOptionsItemSelected(item)
            }
        }
    }

    override fun onBackPressed() {
        if (fragmentStack.size <= 1) {
            this.finish()
        } else {
            fragmentStack.removeAt(fragmentStack.size - 1)
            supportFragmentManager.beginTransaction()
                .replace(R.id.containerLayout, fragmentStack[fragmentStack.size - 1])
                .commitNow()
            refreshBackButton()
        }
    }
}

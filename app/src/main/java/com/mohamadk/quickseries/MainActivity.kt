package com.mohamadk.quickseries

import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.appcompat.app.AppCompatActivity
import com.mohamadk.pagingfragment.base.factories.DialogPageFactory
import com.mohamadk.pagingfragment.base.factories.PageFactory
import com.mohamadk.pagingfragment.intractors.FragmentOpener
import com.mohamadk.quickseries.core.Sortable
import com.mohamadk.quickseries.core.intractors.ToolbarIntractor
import com.mohamadk.quickseries.pages.gride.GridFragment
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(),
    FragmentOpener
    , ToolbarIntractor {
    var sortASC = false
    var sortVisibility = false
    override fun open(page: DialogPageFactory) {
        //we don't have dialog in this application
    }

    override fun open(page: PageFactory) {
        supportFragmentManager.beginTransaction()
            .replace(R.id.fl_content, page.build(), page.tag())
            .also {
                if (page.addToBackStack()) {
                    it.addToBackStack(page.tag())
                }
            }
            .commit()
    }

    override fun setTitle(title: String?) {
        this.title = title
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        setSupportActionBar(toolbar)

        open(GridFragment.GridPage("categories", getString(R.string.categories), false))

    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.main_menu, menu)

        val itemSort = menu!!.findItem(R.id.sort)
        itemSort.isVisible = sortVisibility

        return true
    }

    override fun onOptionsItemSelected(item: MenuItem?): Boolean {
        val id = item!!.itemId

        return if (id == R.id.sort) {
            supportFragmentManager.fragments.forEach {
                if (it is Sortable) {
                    it.sort(sortASC)
                    sortASC = !sortASC
                }
            }
            true
        } else super.onOptionsItemSelected(item)

    }


    override fun hideSort() {
        val itemSort = toolbar.menu.findItem(R.id.sort)
        if (itemSort == null) {
            sortVisibility = false
        } else {
            itemSort.isVisible = false
        }
    }

    override fun showSort() {
        val itemSort = toolbar.menu.findItem(R.id.sort)
        if (itemSort == null) {
            sortVisibility = true
        } else {
            itemSort.isVisible = true
        }
    }



}

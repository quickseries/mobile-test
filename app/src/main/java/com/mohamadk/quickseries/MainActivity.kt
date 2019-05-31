package com.mohamadk.quickseries

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.mohamadk.pagingfragment.base.factories.DialogPageFactory
import com.mohamadk.pagingfragment.base.factories.PageFactory
import com.mohamadk.pagingfragment.intractors.FragmentOpener
import com.mohamadk.quickseries.pages.categories.CategoriesFragment

class MainActivity : AppCompatActivity(),
    FragmentOpener {
    override fun open(page: DialogPageFactory) {
        //we don't have dialog in this application
    }

    override fun open(page: PageFactory) {
        supportFragmentManager.beginTransaction()
            .replace(R.id.fl_content,page.build(),page.tag())
            .also {
                if(page.addToBackStack()){
                    it.addToBackStack(page.tag())
                }
            }
            .commit()
    }

    override fun setTitle(title: String?) {
        this.title=title
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        open(CategoriesFragment.CategoriesPage())

    }
}

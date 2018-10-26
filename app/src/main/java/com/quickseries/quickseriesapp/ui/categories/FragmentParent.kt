package com.quickseries.quickseriesapp.ui.categories

import android.os.Bundle
import android.support.design.widget.TabLayout
import android.support.v4.app.Fragment
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.quickseries.quickseriesapp.R
import com.quickseries.quickseriesapp.ui.categories.categoryitem.CategoryItemFragment
import kotlinx.android.synthetic.main.fragment_parent.*

class FragmentParent : Fragment() {
    private var adapter: ViewPagerAdapter? = null

    internal var selectedTabPosition: Int = 0


    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.fragment_parent, container, false)
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        adapter = ViewPagerAdapter(fragmentManager, activity, my_viewpager, my_tab_layout)
        my_viewpager!!.adapter = adapter
        setEvents()
    }

    private fun setEvents() {

        my_tab_layout!!.setOnTabSelectedListener(object : TabLayout.ViewPagerOnTabSelectedListener(my_viewpager) {
            override fun onTabSelected(tab: TabLayout.Tab) {
                super.onTabSelected(tab)
                my_viewpager!!.currentItem = tab.position
                selectedTabPosition = my_viewpager!!.currentItem
                Log.d("Selected", "Selected " + tab.position)
            }

            override fun onTabUnselected(tab: TabLayout.Tab?) {
                super.onTabUnselected(tab)
                Log.d("Unselected", "Unselected " + tab!!.position)
            }
        })
    }

    fun addPage(pagename: String, slugName: String) {
        val bundle = Bundle()
        bundle.putString("data", pagename)
        bundle.putString("slug", slugName)
        val fragmentChild = CategoryItemFragment()
        fragmentChild.arguments = bundle
        adapter!!.addFrag(fragmentChild, pagename)
        adapter!!.notifyDataSetChanged()
        if (adapter!!.count > 0) my_tab_layout!!.setupWithViewPager(my_viewpager)

        my_viewpager!!.currentItem = 0
        setupTabLayout()
    }

    fun setupTabLayout() {
        selectedTabPosition = my_viewpager!!.currentItem
        for (i in 0 until my_tab_layout!!.tabCount) {
            my_tab_layout!!.getTabAt(i)!!.customView = adapter!!.getTabView(i)
        }
    }
}

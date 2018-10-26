package com.quickseries.quickseriesapp.ui.categories.categoryitem

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.app.AlertDialog
import android.support.v7.widget.SearchView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.quickseries.quickseriesapp.R
import com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter.CategoryItemAdapter
import com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter.model.ICategoryItem
import com.quickseries.quickseriesapp.ui.categorydetail.CategoryDetailActivity
import kotlinx.android.synthetic.main.fragment_category_items.*


class CategoryItemFragment : Fragment(), CategoryItemContract.View {

    lateinit var presenter: CategoryItemContract.Presenter
    lateinit var categoryAdapter: CategoryItemAdapter

    var slug: String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        categoryAdapter =
                CategoryItemAdapter(categoryClicked)
        presenter = CategoryItemPresenter(this)
    }


    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.fragment_category_items, container, false)
        val bundle = arguments
        val title = bundle?.getString("data")
        slug = bundle?.getString("slug")!!
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        recycler_view?.adapter = categoryAdapter
        presenter.load(true, slug, true)
        swipeRefreshLayout.setOnRefreshListener { presenter.load(true, slug, sortSwitch.isChecked) }
        contactSearch.setOnQueryTextListener(object : SearchView.OnQueryTextListener {
            override fun onQueryTextSubmit(query: String): Boolean {
                println("search query submit")
                return false
            }

            override fun onQueryTextChange(newText: String): Boolean {
                presenter.filter(newText)
                return false
            }
        })
        sortSwitch.setOnCheckedChangeListener { compoundButton, isChecked ->
            if (isChecked) {
                presenter.load(false, slug, true)
                sortSwitch.text = "A-Z"
            } else {
                presenter.load(false, slug, false)
                sortSwitch.text = "Z-A"
            }
        }
    }

    override fun showProgress(show: Boolean) {
        activity?.runOnUiThread {
            if (show)
                progressBar.visibility = View.VISIBLE
            else
                progressBar.visibility = View.GONE
        }
    }

    override fun showError(message: String) {
        activity?.runOnUiThread {
            AlertDialog.Builder(activity!!)
                .setTitle("Uh-oh!")
                .setMessage(message)
                .setPositiveButton("Ok", null)
                .show()
        }
    }

    override fun getContext(): Context {
        return activity?.baseContext!!
    }

    override fun updateRecentList(data: List<ICategoryItem>) {

        if (categoryAdapter != null) {
            if (data.isEmpty()) {
                noResultFound!!.visibility = View.VISIBLE
                categoryAdapter.clear()
            } else {
                categoryAdapter.addRecent(data.toMutableList())
                noResultFound!!.visibility = View.GONE
            }
        }
        if (swipeRefreshLayout.isRefreshing) {
            swipeRefreshLayout.isRefreshing = false
        }
    }

    override fun notifyItemChanged(position: Int, event: ICategoryItem) {
    }


    private val categoryClicked = object : CategoryItemClickListener {
        override fun onItemClick(event: ICategoryItem) {
            startDetailActivity(event.id!!)
        }

    }

    fun startDetailActivity(itemId: String) {
        val intent = Intent(activity, CategoryDetailActivity::class.java)
        intent.putExtra("itemId", itemId)
        startActivity(intent)
    }

}

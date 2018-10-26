package com.quickseries.quickseriesapp.ui.categories.categoryitem

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.support.v4.app.Fragment
import android.support.v7.app.AlertDialog
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.quickseries.quickseriesapp.R
import com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter.CategoryItemAdapter
import com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter.model.ICategoryItem
import com.quickseries.quickseriesapp.ui.categorydetail.CategoryDetailActivity
import kotlinx.android.synthetic.main.fragment_child.*


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
        val view = inflater.inflate(R.layout.fragment_child, container, false)
        val bundle = arguments
        val title = bundle?.getString("data")
        slug = bundle?.getString("slug")!!
        return view
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        recycler_view?.adapter = categoryAdapter
        presenter.load(true, slug)
        swipeRefreshLayout.setOnRefreshListener { presenter.load(true, slug) }
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

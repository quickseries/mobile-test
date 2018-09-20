package com.quickseries.codetest

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.DividerItemDecoration
import android.support.v7.widget.LinearLayoutManager
import com.quickseries.codetest.adapter.RecyclerCategoriesAdapter
import com.quickseries.codetest.model.Categorie
import com.quickseries.codetest.services.CategoriesService.getCategories
import com.quickseries.codetest.util.jsonUtil.loadJSONFromAsset
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {

    private var categories: MutableList<Categorie> = mutableListOf()
    lateinit var categorieSorted: List<Categorie>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        title = "Categories"


        val json = loadJSONFromAsset(application, "categories.json")
        categories = getCategories(json!!)
        categorieSorted = categories.sortedWith(compareBy {it.title})
        
        setupCategoriesRecycler()
    }

    private fun setupCategoriesRecycler() {
        categories_recycler.adapter = RecyclerCategoriesAdapter(categorieSorted)
        categories_recycler.layoutManager = LinearLayoutManager(this@MainActivity, LinearLayoutManager.VERTICAL, false)
        categories_recycler.addItemDecoration(DividerItemDecoration(this, DividerItemDecoration.VERTICAL))
    }

}

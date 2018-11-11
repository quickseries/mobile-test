package com.example.mhamed.demo.ui.activity

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.RecyclerView
import android.widget.Toast
import com.example.mhamed.demo.R
import com.example.mhamed.demo.events.CategoriesEvent
import com.example.mhamed.demo.vo.Category

class MainActivity : AppCompatActivity(), CategoryListener {

    var recyclerView : RecyclerView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        recyclerView = findViewById(R.id.recycler)
        // in content do not change the layout size of the RecyclerView
        recyclerView?.setHasFixedSize(true)
    }

    fun onCategoriesEvent(event: CategoriesEvent) {
        if (event.successful) {
            // pass the data to it to the recycler view
            recyclerView?.adapter = CategoryAdapter(event.categoriesEvent, this)
        } else {
            // show error message
            Toast.makeText(this, "Error! Oups, we couldn't get the categories", Toast.LENGTH_SHORT).show()
        }
    }


    override fun onCategoryClick(category: Category) {
        // TODO start the next activity
    }
}

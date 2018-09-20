package com.quickseries.codetest

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import android.support.v7.widget.DividerItemDecoration
import android.support.v7.widget.LinearLayoutManager
import com.quickseries.codetest.adapter.RecyclerResourcesAdapter
import com.quickseries.codetest.model.Resource
import com.quickseries.codetest.services.ResourcesService
import com.quickseries.codetest.util.jsonUtil
import kotlinx.android.synthetic.main.activity_resources.*

class ResourcesActivity : AppCompatActivity() {

    private var resources: MutableList<Resource> = mutableListOf()
    lateinit var resourcesSorted: List<Resource>
    companion object {
        private const val INTENT_CATEGORIE = "categorie"

        fun newIntent(context: Context, id: String): Intent {
            val intent = Intent(context, ResourcesActivity::class.java)
            intent.putExtra(INTENT_CATEGORIE, id)
            return intent
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_resources)

        title = "Resources"
        val categorie: String = intent.getStringExtra(INTENT_CATEGORIE)


        val json = jsonUtil.loadJSONFromAsset(application, if (categorie == "restaurants") "restaurants.json" else "vacation-spot.json")
        resources = ResourcesService.getResouces(json!!)

        resourcesSorted = resources.sortedWith(compareBy {it.title})

        setupResoucesRecycler()
    }

    private fun setupResoucesRecycler() {
        resources_recycler.adapter = RecyclerResourcesAdapter(resourcesSorted)
        resources_recycler.layoutManager = LinearLayoutManager(this@ResourcesActivity, LinearLayoutManager.VERTICAL, false)
        resources_recycler.addItemDecoration(DividerItemDecoration(this, DividerItemDecoration.VERTICAL))
    }
}

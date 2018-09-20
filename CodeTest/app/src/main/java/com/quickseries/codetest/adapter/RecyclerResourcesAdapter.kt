package com.quickseries.codetest.adapter

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.quickseries.codetest.DetailActivity
import com.quickseries.codetest.R
import com.quickseries.codetest.ResourcesActivity
import com.quickseries.codetest.model.Categorie
import com.quickseries.codetest.model.Resource
import kotlinx.android.synthetic.main.list_item_categorie.view.*

class RecyclerResourcesAdapter(private val resources: List<Resource>) : RecyclerView.Adapter<RecyclerResourcesAdapter.RecyclerResourcesViewHolder>() {

    private lateinit var context: Context

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerResourcesViewHolder {
        context = parent.context
        val view = LayoutInflater.from(parent.context).inflate(R.layout.list_item_categorie, parent, false)
        return RecyclerResourcesViewHolder(view)
    }

    override fun getItemCount(): Int {
        return resources.size
    }

    override fun onBindViewHolder(holder: RecyclerResourcesViewHolder, position: Int) {
        holder.title.text = resources[position].title
    }

    inner class RecyclerResourcesViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var title: TextView = itemView.title

        init {
            itemView.setOnClickListener { view ->
                val intent = DetailActivity.newIntent(context, resources[adapterPosition])
                context.startActivity(intent)
            }
        }
    }
}
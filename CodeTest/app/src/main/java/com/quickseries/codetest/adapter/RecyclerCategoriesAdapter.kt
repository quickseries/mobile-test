package com.quickseries.codetest.adapter

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.quickseries.codetest.R
import com.quickseries.codetest.ResourcesActivity
import com.quickseries.codetest.model.Categorie
import kotlinx.android.synthetic.main.list_item_categorie.view.*

class RecyclerCategoriesAdapter(private val categories: List<Categorie>) : RecyclerView.Adapter<RecyclerCategoriesAdapter.RecyclerCategoriesViewHolder>() {

    private lateinit var context: Context

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerCategoriesViewHolder {
        context = parent.context
        val view = LayoutInflater.from(parent.context).inflate(R.layout.list_item_categorie, parent, false)
        return RecyclerCategoriesViewHolder(view)
    }

    override fun getItemCount(): Int {
        return categories.size
    }

    override fun onBindViewHolder(holder: RecyclerCategoriesViewHolder, position: Int) {
        holder.title.text = categories[position].title
    }

    inner class RecyclerCategoriesViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var title: TextView = itemView.title

        init {
            itemView.setOnClickListener { view ->
                val intent = ResourcesActivity.newIntent(context, categories[adapterPosition].slug)
                context.startActivity(intent)
            }
        }
    }
}
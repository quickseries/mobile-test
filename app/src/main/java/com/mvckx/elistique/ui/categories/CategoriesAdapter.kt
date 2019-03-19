package com.mvckx.elistique.ui.categories

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.mvckx.elistique.R
import kotlinx.android.synthetic.main.item_category.view.*

class CategoriesAdapter(private val listener: ((String) -> (Unit))) :
    RecyclerView.Adapter<CategoriesAdapter.ViewHolder>() {
    private var categoryList = emptyList<CategoriesViewState.CategoryItem>()
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater
            .from(parent.context)
            .inflate(R.layout.item_category, parent, false)
        return ViewHolder(view, listener)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val category = categoryList[position]
        holder.bind(category)
    }

    override fun getItemCount() = categoryList.size

    fun updateCategories(categoryList: List<CategoriesViewState.CategoryItem>) {
        this.categoryList = categoryList
        notifyDataSetChanged()
    }

    class ViewHolder(itemView: View, private val listener: ((String) -> (Unit))) : RecyclerView.ViewHolder(itemView) {
        private var categoryId: String? = null

        init {
            itemView.setOnClickListener {
                categoryId?.let {
                    listener.invoke(it)
                }
            }
        }

        fun bind(category: CategoriesViewState.CategoryItem) {
            itemView.tvTitle.text = category.title
            itemView.tvDesc.text = category.description
            categoryId = category.id
        }
    }
}
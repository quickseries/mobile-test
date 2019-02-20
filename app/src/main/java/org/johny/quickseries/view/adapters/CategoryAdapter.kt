package org.johny.quickseries.view.adapters

import android.os.Build
import android.text.Html
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.DiffUtil
import androidx.recyclerview.widget.DiffUtil.calculateDiff
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
import org.johny.quickseries.R
import org.johny.quickseries.model.Category

typealias ClickListener = (Category) -> Unit

class CategoryAdapter(private val clickListener: ClickListener) : RecyclerView.Adapter<CategoryAdapter.ViewHolder>() {

    private var categoryList = emptyList<Category>()

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val itemContainer = LayoutInflater.from(parent.context)
            .inflate(R.layout.listitem_category, parent, false) as ViewGroup
        val viewHolder = ViewHolder(itemContainer)
        itemContainer.setOnClickListener {
            clickListener(categoryList[viewHolder.adapterPosition])
        }
        return viewHolder
    }

    @Suppress("DEPRECATION")
    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val category = categoryList[position]
        holder.title.text = category.title
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            holder.description.text = Html.fromHtml(category.description, Html.FROM_HTML_MODE_COMPACT)
        } else {
            holder.description.text = Html.fromHtml(category.description)
        }
        if (category.photo.isNullOrEmpty()) {
            holder.photoIv.visibility = View.GONE
        } else {
            holder.photoIv.visibility = View.VISIBLE
            Glide.with(holder.photoIv.context)
                .load(category.photo)
                .transition(DrawableTransitionOptions.withCrossFade())
                .into(holder.photoIv)
        }
    }

    override fun getItemCount() = categoryList.size

    fun updateCategories(categoryList: List<Category>) {
        val diffResult = calculateDiff(
            CategoryDiffCallback(this.categoryList, categoryList)
        )
        this.categoryList = categoryList
        diffResult.dispatchUpdatesTo(this)
    }

    class ViewHolder(itemViewGroup: ViewGroup) : RecyclerView.ViewHolder(itemViewGroup) {
        val title: TextView = itemViewGroup.findViewById(R.id.category_title)
        val description: TextView = itemViewGroup.findViewById(R.id.category_description)
        val photoIv: ImageView = itemViewGroup.findViewById(R.id.category_image)
    }

    class CategoryDiffCallback(
        private val old: List<Category>,
        private val new: List<Category>
    ) : DiffUtil.Callback() {
        override fun getOldListSize() = old.size

        override fun getNewListSize() = new.size

        override fun areItemsTheSame(oldIndex: Int, newIndex: Int): Boolean {
            return old[oldIndex].title == new[newIndex].title
        }

        override fun areContentsTheSame(oldIndex: Int, newIndex: Int): Boolean {
            return old[oldIndex] == new[newIndex]
        }
    }
}
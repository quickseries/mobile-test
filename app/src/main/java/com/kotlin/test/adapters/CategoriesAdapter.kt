package com.kotlin.test.adapters

import android.content.Context
import android.support.v7.widget.RecyclerView
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import butterknife.BindView
import butterknife.ButterKnife
import com.kotlin.test.R
import com.kotlin.test.models.Category

class CategoriesAdapter(
    private val mContext: Context, private val categoryList: MutableList<Category>,
    private val categoriesClickListener: CategoriesClickListener
) : RecyclerView.Adapter<BaseViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): BaseViewHolder {
        return DeliveriesViewHolder(
            LayoutInflater.from(parent.context)
                .inflate(R.layout.categories_list_row_layout, parent, false)
        )
    }

    override fun onBindViewHolder(holder: BaseViewHolder, position: Int) {
        holder.onBind(position)
    }

    override fun getItemCount(): Int {
        return categoryList.size
    }

    internal inner class DeliveriesViewHolder(itemView: View) : BaseViewHolder(itemView) {
        @BindView(R.id.cardview)
        var cardView: View? = null
        @BindView(R.id.textView_description)
        var descriptionTxtV: TextView? = null
        @BindView(R.id.textView_address)
        var addressTxtV: TextView? = null

        init {
            ButterKnife.bind(this, itemView)
        }

        override fun clear() {}

        override fun onBind(position: Int) {
            super.onBind(position)

            try {
                val category = categoryList[position]
                descriptionTxtV!!.text = category.description
                /**
                 * @IMAGE_LOADING
                 * It will load the Image from URL into an ImageView once it receive the image URL
                 * It also Cache the Image from the URL
                 */
                /* Glide.with(mContext)
                        .load(.getImageUrl())
                        .centerCrop()
                        .diskCacheStrategy(DiskCacheStrategy.ALL)
                        .placeholder(R.mipmap.placeholder_image)
                        .into();*/


            } catch (e: Exception) {
                e.printStackTrace()
            }

        }
    }

    fun addItems(deliveriesList: List<Category>) {
        try {
            val positionStart = categoryList.size + 1
            categoryList.addAll(deliveriesList)
            notifyItemRangeInserted(positionStart, deliveriesList.size)
        } catch (e: Exception) {
            e.printStackTrace()
        }

    }

    /**
     * @CATEGORIES Item Listener
     */
    interface CategoriesClickListener {
        fun onCategoryItem(category: Category)
    }
}

package com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter

import android.support.v4.util.SparseArrayCompat
import android.support.v7.widget.RecyclerView
import android.view.ViewGroup
import com.myfolks.android.folks.view.adapter.ViewType
import com.myfolks.android.folks.view.adapter.ViewTypeDelegateAdapter
import com.quickseries.quickseriesapp.R
import com.quickseries.quickseriesapp.ui.categories.categoryitem.CategoryItemClickListener
import com.quickseries.quickseriesapp.ui.categories.categoryitem.adapter.model.ICategoryItem
import com.quickseries.quickseriesapp.ui.utils.inflate
import com.quickseries.quickseriesapp.ui.view.AdapterConstants
import com.quickseries.quickseriesapp.ui.view.LoadingDelegateAdapter
import com.simplecityapps.recyclerview_fastscroll.views.FastScrollRecyclerView
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.list_item_category.view.*

class CategoryItemAdapter(val contactClickListener: CategoryItemClickListener) :
    RecyclerView.Adapter<RecyclerView.ViewHolder>(),
    FastScrollRecyclerView.SectionedAdapter, FastScrollRecyclerView.MeasurableAdapter {
    private var items: ArrayList<ViewType> = ArrayList()
    private var itemsName: ArrayList<String> = ArrayList()
    private var delegateAdapters = SparseArrayCompat<ViewTypeDelegateAdapter>()
    private val loadingItem = object : ViewType {
        override fun getViewType() = AdapterConstants.LOADING
    }

    init {
        delegateAdapters.put(AdapterConstants.LOADING, LoadingDelegateAdapter())
        delegateAdapters.put(AdapterConstants.CATEGORY_ITEM, CategoryDelegateAdapter())
        items.add(loadingItem)
    }

    fun clear() {
        items.clear()
        notifyDataSetChanged()
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerView.ViewHolder {
        return delegateAdapters.get(viewType).onCreateViewHolder(parent)
    }

    override fun getItemCount(): Int {
        return items.size
    }

    override fun onBindViewHolder(holder: RecyclerView.ViewHolder, position: Int) {
        delegateAdapters.get(getItemViewType(position)).onBindViewHolder(holder, this.items[position])
    }

    override fun getItemViewType(position: Int): Int {
        return this.items[position].getViewType()
    }

    fun addRecent(recents: MutableList<ViewType>) {
        items.clear()
        itemsName.clear()
        items.addAll(recents)

        recents.asSequence().filter { viewType -> viewType.getViewType() == AdapterConstants.CATEGORY_ITEM }
            .map { it as ICategoryItem }.toList()
            .forEach { itemsName.add(it.title!!) }
        notifyDataSetChanged()
    }


    inner class CategoryDelegateAdapter : ViewTypeDelegateAdapter {
        override fun onCreateViewHolder(parent: ViewGroup) = ContactViewHolder(parent)

        override fun onBindViewHolder(holder: RecyclerView.ViewHolder, item: ViewType) {
            (holder as ContactViewHolder).bind(item as ICategoryItem)
        }

        inner class ContactViewHolder(parent: ViewGroup) : RecyclerView.ViewHolder(
            parent.inflate(R.layout.list_item_category)
        ) {

            fun bind(item: ICategoryItem) = with(itemView) {

                if (!item.photo.isNullOrEmpty()) {
                    try {
                        Picasso.with(context).load(item.photo).fit()
                            .placeholder(R.drawable.rounded_image_placeholder_white).into(itemImageView)
                    } catch (e: Exception) {
                        Picasso.with(context).load(R.drawable.rounded_image_placeholder_white).into(itemImageView)
                    }
                } else {
                    Picasso.with(context).load(R.drawable.rounded_image_placeholder_white).into(itemImageView)
                }

                itemTitle.text = item.title
                categoryLayout.setOnClickListener { view ->
                    contactClickListener.onItemClick(item)
                }
            }
        }
    }

    override fun getSectionName(position: Int): String {
        return if (position < itemsName.size)
            itemsName[position][0].toString().toUpperCase()
        else
            ""
    }

    override fun getViewTypeHeight(recyclerView: RecyclerView?, viewType: Int): Int {
        return recyclerView?.resources?.getDimensionPixelSize(R.dimen.contact_list_item)!!
    }

}
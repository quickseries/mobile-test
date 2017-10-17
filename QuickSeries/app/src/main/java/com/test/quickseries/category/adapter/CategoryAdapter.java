package com.test.quickseries.category.adapter;

import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.test.quickseries.R;
import com.test.quickseries.base.ListInteractor;
import com.test.quickseries.base.model.Category;

import java.util.List;

/**
 * Created by elton on 2017-10-15.
 */

public class CategoryAdapter extends RecyclerView.Adapter<CategoryViewHolder> {

    private List<Category> items;
    private ListInteractor<Category> listInteractor;


    public CategoryAdapter(ListInteractor<Category> listInteractor) {
        this.listInteractor = listInteractor;
    }

    @Override
    public CategoryViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.category_item, parent, false);
        return new CategoryViewHolder(view);
    }

    @Override
    public void onBindViewHolder(CategoryViewHolder holder, int position) {
        Category item = items.get(position);
        holder.binding.categoryTitle.setText(item.getTitle());
        holder.binding.categoryDescription.setText(item.getDescription());
        holder.binding.getRoot().setOnClickListener((v) -> listInteractor.onClick(item));
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    public void setItems(List<Category> items) {
        this.items = items;
        notifyDataSetChanged();
    }

}

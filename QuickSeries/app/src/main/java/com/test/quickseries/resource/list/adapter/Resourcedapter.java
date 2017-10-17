package com.test.quickseries.resource.list.adapter;

import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.squareup.picasso.Picasso;
import com.test.quickseries.R;
import com.test.quickseries.base.ListInteractor;
import com.test.quickseries.base.model.Resource;

import java.util.List;

/**
 * Created by elton on 2017-10-15.
 */

public class Resourcedapter extends RecyclerView.Adapter<ResourceViewHolder> {

    private List<Resource> items;
    private ListInteractor<Resource> listInteractor;


    public Resourcedapter(ListInteractor<Resource> listInteractor) {
        this.listInteractor = listInteractor;
    }

    @Override
    public ResourceViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext()).inflate(R.layout.resource_item, parent, false);
        return new ResourceViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ResourceViewHolder holder, int position) {
        Resource item = items.get(position);
        holder.binding.categoryTitle.setText(item.getTitle());
        holder.binding.categoryDescription.setText(Html.fromHtml(item.getDescription()));
        Picasso.with(holder.itemView.getContext())
                .load(item.getPhoto())
                .placeholder(holder.itemView.getContext().getResources().getDrawable(R.drawable.placeholder_with_frame))
                .fit()
                .centerInside()
                .into(holder.binding.image);
        holder.binding.getRoot().setOnClickListener((v) -> listInteractor.onClick(item));
    }

    @Override
    public int getItemCount() {
        return items.size();
    }

    public void setItems(List<Resource> items) {
        this.items = items;
        notifyDataSetChanged();
    }

}

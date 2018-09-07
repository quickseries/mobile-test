package com.books.quickseries.ui.resource;

import android.support.annotation.NonNull;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.books.quickseries.R;
import com.books.quickseries.data.model.Category;
import com.books.quickseries.data.model.Resource;
import com.books.quickseries.data.model.Restaurant;
import com.books.quickseries.data.model.Vacation;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by zakir on 06/09/2018.
 */

public class ResourceAdapter extends RecyclerView.Adapter<ResourceAdapter.CategoryViewHolder> {


    private final String LOG = "ResourceAdapter";
    private final List<Resource> mResources;
    private Callback callback;

    public ResourceAdapter(ArrayList<Resource> categories) {
        mResources = categories;
    }

    @NonNull
    @Override
    public CategoryViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

        View v = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.item_category_view, parent, false);


        return new CategoryViewHolder(v, callback);
    }

    @Override
    public void onBindViewHolder(@NonNull CategoryViewHolder holder, int position) {
        final Resource resource = mResources.get(position);

        try {
            if (resource instanceof Restaurant) {
                holder.mCategoryTitle.setText(((Restaurant) resource).getTitle());
            } else if (resource instanceof Vacation) {
                holder.mCategoryTitle.setText(((Vacation) resource).getTitle());
            }
        } catch (Exception e) {
            Log.e(LOG, e.getMessage());
        }

        holder.itemView.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                callback.onCategoryItemClicked(resource);
            }
        });
    }

    public void addItems(List<Resource> resources) {
        mResources.addAll(resources);
        notifyDataSetChanged();
    }

    @Override
    public int getItemCount() {
        return mResources.size();
    }

    public void setCallback(Callback callback) {
        this.callback = callback;
    }

    public static class CategoryViewHolder extends RecyclerView.ViewHolder {


        @BindView(R.id.category_title)
        TextView mCategoryTitle;

        View itemView;

//        @BindView(R.id.category_desc) // hiding this desc is not there for vacation spots
//        TextView mCategoryDesc;


        public CategoryViewHolder(View itemView, final Callback callback) {
            super(itemView);
            this.itemView = itemView;
            ButterKnife.bind(this, itemView);
        }

    }

    public interface Callback {
        void onCategoryItemClicked(Resource category);
    }
}

package com.quickseries.mobiletest.adapters;

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.quickseries.mobiletest.R;
import com.quickseries.mobiletest.ResourceListActivity;
import com.quickseries.mobiletest.entities.Category;

import java.util.List;

public class CategoryRecyclerViewAdapter
        extends RecyclerView.Adapter<CategoryRecyclerViewAdapter.ViewHolder> {

    private final List<Category> mValues;
    private final View.OnClickListener mOnClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            Category item = (Category) view.getTag();
            Context context = view.getContext();
            Intent intent = new Intent(context, ResourceListActivity.class);
            intent.putExtra(ResourceListActivity.CATEGORY_ID, item.getSlug());

            context.startActivity(intent);
        }
    };

    public CategoryRecyclerViewAdapter(List<Category> items) {
        mValues = items;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.category_list_content, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(final ViewHolder holder, int position) {
        holder.mContentView.setText(mValues.get(position).getTitle());

        holder.itemView.setTag(mValues.get(position));
        holder.itemView.setOnClickListener(mOnClickListener);
    }

    @Override
    public int getItemCount() {
        return mValues.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder {
        final TextView mContentView;

        ViewHolder(View view) {
            super(view);
            mContentView = view.findViewById(R.id.content);
        }
    }
}

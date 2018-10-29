package com.quickseries.mobiletest.adapters;

import android.content.Context;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.quickseries.mobiletest.R;
import com.quickseries.mobiletest.ResourceDetailActivity;
import com.quickseries.mobiletest.entities.Resource;
import com.quickseries.mobiletest.ui.ResourceDetailFragment;

import java.util.List;

public class RestaurantRecyclerViewAdapter
        extends RecyclerView.Adapter<RestaurantRecyclerViewAdapter.ViewHolder> {

    private final List<Resource> mValues;
    private final View.OnClickListener mOnClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            Resource item = (Resource) view.getTag();
            Context context = view.getContext();
            Intent intent = new Intent(context, ResourceDetailActivity.class);
            intent.putExtra(ResourceDetailFragment.ARG_ITEM_ID, item);

            context.startActivity(intent);
        }
    };

    public RestaurantRecyclerViewAdapter(List<Resource> items) {
        mValues = items;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(parent.getContext())
                .inflate(R.layout.resource_list_content, parent, false);
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

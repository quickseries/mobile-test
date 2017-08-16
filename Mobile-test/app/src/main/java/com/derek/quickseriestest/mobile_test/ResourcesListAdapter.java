package com.derek.quickseriestest.mobile_test;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.derek.quickseriestest.mobile_test.entities.Category;
import com.google.gson.Gson;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by ddibblee on 8/14/2017.
 */

public class ResourcesListAdapter extends RecyclerView.Adapter<ResourcesListAdapter.ViewHolder> {
    private Activity mContext;
    private List<Category> mCategories;

    ResourcesListAdapter(Activity context, List<Category> categories) {
        this.mContext = context;
        this.mCategories = categories;
    }

    @Override
    public ResourcesListAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());

        View view = inflater.inflate(R.layout.category_row_item, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ResourcesListAdapter.ViewHolder holder, int position) {
        final Category currentCategory = mCategories.get(position);
        final String title = currentCategory.getTitle();
        String description = currentCategory.getDescription();
        if (description != null && description.length() > 0){
            description = Html.fromHtml(description).toString().trim();
        }

        holder.mTitle.setText(title);
        holder.mDescription.setText(description);

        holder.layout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(mContext, DetailsActivity.class);
                Gson gson = new Gson();
                intent.putExtra("category", gson.toJson(currentCategory));
                mContext.startActivity(intent);
            }
        });
    }

    @Override
    public int getItemCount() {
        return mCategories.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder {

        View layout;
        TextView mTitle;
        TextView mDescription;

        ViewHolder(View itemView) {
            super(itemView);
            layout = itemView;
            mTitle = (TextView) itemView.findViewById(R.id.category_title);
            mDescription = (TextView) itemView.findViewById(R.id.category_description);
        }
    }

    public void sort(final boolean alphabetical) {
        Collections.sort(mCategories, new Comparator<Category>() {
            @Override
            public int compare(Category lhs, Category rhs) {
                if (alphabetical)
                    return lhs.getTitle().compareTo(rhs.getTitle());
                else
                    return rhs.getTitle().compareTo((lhs.getTitle()));
            }
        });
        notifyDataSetChanged();
    }
}

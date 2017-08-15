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

import java.util.List;

/**
 * Created by ddibblee on 8/14/2017.
 */

public class CategoryListAdapter extends RecyclerView.Adapter<CategoryListAdapter.ViewHolder> {
    private Activity mContext;
    private List<Category> mCategories;
    private final String RESTAURANT_FILENAME_EID_TAG = "ac5bd194-11de-48f6-94db-fd16cfccb570";
    private final String VACATION_SPOT_EID_TAG = "83a5bc0d-bae7-4b3f-b8d9-01c969785783";

    CategoryListAdapter (Activity context, List<Category> categories) {
        this.mContext = context;
        this.mCategories = categories;
    }

    @Override
    public CategoryListAdapter.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inflater = LayoutInflater.from(parent.getContext());

        View view = inflater.inflate(R.layout.category_row_item, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(CategoryListAdapter.ViewHolder holder, int position) {
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
                Intent intent = new Intent(mContext, ResourcesActivity.class);
                switch(currentCategory.getEid()){
                    case RESTAURANT_FILENAME_EID_TAG:
                        intent.putExtra("filename", "restaurants.json");
                        break;
                    case VACATION_SPOT_EID_TAG:
                        intent.putExtra("filename", "vacation-spot.json");
                        break;
                }
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
}

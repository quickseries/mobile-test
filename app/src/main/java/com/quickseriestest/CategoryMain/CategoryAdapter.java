package com.quickseriestest.CategoryMain;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.quickseriestest.R;
import com.quickseriestest.models.Category;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public class CategoryAdapter extends ArrayAdapter<Category> implements View.OnClickListener {

    private List<Category> categories;
    Context mContext;


    // View lookup cache
    private static class ViewHolder {
        TextView txtTitle;
        TextView txtDescription;

    }

    public CategoryAdapter(List<Category> categories, Context context) {
        super(context, R.layout.row_item, categories);
        this.categories = categories;
        this.mContext = context;

    }

    @Override
    public void onClick(View v) {

        int position = (Integer) v.getTag();
        Object object = getItem(position);
        Category category = (Category) object;

        switch (v.getId()) {
            case R.id.title:

                Log.d("", "Clicked" + " " + category.getTitle());
                break;
        }
    }

    private int lastPosition = -1;

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        // Get the data item for this position
        Category category = getItem(position);
        // Check if an existing view is being reused, otherwise inflate the view
        ViewHolder viewHolder; // view lookup cache stored in tag

        final View result;

        if (convertView == null) {

            viewHolder = new ViewHolder();
            LayoutInflater inflater = LayoutInflater.from(getContext());
            convertView = inflater.inflate(R.layout.row_item, parent, false);
            viewHolder.txtTitle = (TextView) convertView.findViewById(R.id.title);
            viewHolder.txtDescription = (TextView) convertView.findViewById(R.id.description);

            result = convertView;

            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
            result = convertView;
        }
        lastPosition = position;
        viewHolder.txtTitle.setText(category.getTitle());
        viewHolder.txtDescription.setText(category.getDescription());
        // Return the completed view to render on screen
        return result;
    }
}

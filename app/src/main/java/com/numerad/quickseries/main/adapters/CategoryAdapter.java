package com.numerad.quickseries.main.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.numerad.quickseries.R;
import com.numerad.quickseries.json.Category;

import java.util.ArrayList;

public class CategoryAdapter extends ArrayAdapter<Category> {

    public CategoryAdapter(Context context, ArrayList<Category> cats) {
        super(context, 0, cats);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.category_line, parent, false);
        }

        TextView title = convertView.findViewById(R.id.title);
        TextView description = convertView.findViewById(R.id.description);
        ImageView image = convertView.findViewById(R.id.image);

        Category category = getItem(position);

        if (category == null) {
            return convertView;
        }

        if (title != null) {
            title.setText(category.getTitle());
        }

        if (description != null) {
            description.setText(category.getDescription());
        }

        image.setVisibility(View.GONE);

        return convertView;
    }
}

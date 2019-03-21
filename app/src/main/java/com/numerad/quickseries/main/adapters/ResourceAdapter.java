package com.numerad.quickseries.main.adapters;

import android.content.Context;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.numerad.quickseries.R;
import com.numerad.quickseries.json.Resource;
import com.numerad.quickseries.main.LoadImageTask;

import java.util.ArrayList;

import static androidx.core.text.HtmlCompat.FROM_HTML_SEPARATOR_LINE_BREAK_PARAGRAPH;

public class ResourceAdapter extends ArrayAdapter<Resource> {

    private ListView listView;

    public ResourceAdapter(Context context, ArrayList<Resource> resources, ListView listView) {
        super(context, 0, resources);
        this.listView = listView;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.category_line, parent, false);
        }

        TextView title = convertView.findViewById(R.id.title);
        TextView description = convertView.findViewById(R.id.description);
        ImageView image = convertView.findViewById(R.id.image);

        Resource resource = getItem(position);

        if (resource == null) {
            return convertView;
        }

        if (title != null) {
            title.setText(resource.getTitle());
        }

        if (description != null && resource.getDescription() != null) {
            description.setText(Html.fromHtml(resource.getDescription(), FROM_HTML_SEPARATOR_LINE_BREAK_PARAGRAPH));
        }

        String url = resource.getPhoto();
        if (url != null) {
            // fetch asynchronously on another thread
            new LoadImageTask(image, listView).execute(url);
        } else {
            image.setVisibility(View.GONE);
        }

        return convertView;
    }
}

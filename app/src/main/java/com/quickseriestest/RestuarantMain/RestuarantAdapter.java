package com.quickseriestest.RestuarantMain;

import android.content.Context;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.quickseriestest.R;
import com.quickseriestest.models.Restuarant;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public class RestuarantAdapter extends ArrayAdapter<Restuarant>  {

    private List<Restuarant> restuarantList;
    Context mContext;
    private int lastPosition = -1;

    // View lookup cache
    private static class ViewHolder {
        TextView txtTitle;
        TextView txtDescription;

    }

    public RestuarantAdapter(List<Restuarant> restuarantList, Context context) {
        super(context, R.layout.row_item, restuarantList);
        this.restuarantList = restuarantList;
        this.mContext = context;
        

    }

    
    
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        // Get the data item for this position
        Restuarant restuarant = getItem(position);
        // Check if an existing view is being reused, otherwise inflate the view
        ViewHolder viewHolder; // view lookup cache stored in tag

        final View view;

        if (convertView == null) {

            viewHolder = new ViewHolder();
            LayoutInflater inflater = LayoutInflater.from(getContext());
            convertView = inflater.inflate(R.layout.row_item, parent, false);
            viewHolder.txtTitle = (TextView) convertView.findViewById(R.id.title);
            viewHolder.txtDescription = (TextView) convertView.findViewById(R.id.description);

            view = convertView;

            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
            view = convertView;
        }
        lastPosition = position;
        viewHolder.txtTitle.setText(restuarant.getTitle());
        viewHolder.txtDescription.setText(Html.fromHtml(restuarant.getDescription()));
        // Return the completed view to render on screen
        return view;
    }
}

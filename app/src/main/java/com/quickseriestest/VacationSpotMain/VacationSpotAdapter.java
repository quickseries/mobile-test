package com.quickseriestest.VacationSpotMain;

import android.content.Context;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.quickseriestest.R;
import com.quickseriestest.models.VacationSpot;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public class VacationSpotAdapter extends ArrayAdapter<VacationSpot> implements View.OnClickListener {

    private List<VacationSpot> vacationSpotList;
    Context mContext;


    // View lookup cache
    private static class ViewHolder {
        TextView txtTitle;
        TextView txtDescription;

    }

    public VacationSpotAdapter(List<VacationSpot> vacationSpotList, Context context) {
        super(context, R.layout.row_item, vacationSpotList);
        this.vacationSpotList = vacationSpotList;
        this.mContext = context;

    }

    @Override
    public void onClick(View v) {

        int position = (Integer) v.getTag();
        Object object = getItem(position);
        VacationSpot vacationSpot = (VacationSpot) object;

        switch (v.getId()) {
            case R.id.title:

                Log.d("", "Clicked" + " " + vacationSpot.getTitle());
                break;
        }
    }

    private int lastPosition = -1;

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        // Get the data item for this position
        VacationSpot vacationSpot = getItem(position);
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
        viewHolder.txtTitle.setText(vacationSpot.getTitle());
        viewHolder.txtDescription.setText(Html.fromHtml(vacationSpot.getDescription()));
        // Return the completed view to render on screen
        return result;
    }
}

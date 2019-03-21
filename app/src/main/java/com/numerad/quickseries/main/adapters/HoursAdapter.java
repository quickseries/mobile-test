package com.numerad.quickseries.main.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.TextView;

import com.numerad.quickseries.R;
import com.numerad.quickseries.domain.Day;

import java.util.ArrayList;

public class HoursAdapter extends ArrayAdapter<Day> {
    public HoursAdapter(Context context, ArrayList<Day> days) {
        super(context, 0, days);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        Day day = getItem(position);

        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.bizhours_line, parent, false);
        }

        TextView title = convertView.findViewById(R.id.title);
        TextView description = convertView.findViewById(R.id.description);

        if (title != null) {
            title.setText(day.getName());
        }

        if (description != null) {
            description.setText(day.getDescription());
        }

        return convertView;
    }
}

package com.numerad.quickseries.main.adapters;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.net.Uri;
import android.telephony.PhoneNumberUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageButton;
import android.widget.TextView;

import com.numerad.quickseries.R;
import com.numerad.quickseries.domain.Contact;

import java.util.ArrayList;
import java.util.Locale;

public class DetailsAdapter extends ArrayAdapter<Contact> {
    public DetailsAdapter(Context context, ArrayList<Contact> contacts) {
        super(context, 0, contacts);
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        Contact contact = getItem(position);

        if (convertView == null) {
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.contact_line, parent, false);
        }

        TextView title = convertView.findViewById(R.id.title);
        TextView description = convertView.findViewById(R.id.description);

        title.setText(contact.getTitle());
        String descr = contact.getDescription();
        description.setText(descr);

        ImageButton buttonEnd = convertView.findViewById(R.id.buttonEnd);
        ImageButton buttonStart = convertView.findViewById(R.id.buttonStart);
        buttonEnd.setVisibility(View.GONE);
        buttonStart.setVisibility(View.GONE);

        Resources res = getContext().getResources();
        if (contact.isPhone()) {
            String formattedNumber = PhoneNumberUtils.formatNumber(descr, Locale.US.getCountry());
            description.setText(formattedNumber);

            buttonEnd.setImageDrawable(res.getDrawable(R.drawable.baseline_phone_black_24, null));
            buttonEnd.setOnClickListener(v -> {
                Intent intent = new Intent(Intent.ACTION_DIAL);
                intent.setData(Uri.parse("tel:" + descr));
                getContext().startActivity(intent);
            });
            buttonEnd.setVisibility(View.VISIBLE);

            buttonStart.setImageDrawable(res.getDrawable(R.drawable.baseline_chat_black_24, null));
            buttonStart.setOnClickListener(v -> {
                Intent intent = new Intent(Intent.ACTION_VIEW);
                intent.setData(Uri.parse("sms:" + descr));
                getContext().startActivity(intent);
            });
            buttonStart.setVisibility(View.VISIBLE);
        }

        if (contact.isFax()) {
            String formattedNumber = PhoneNumberUtils.formatNumber(descr, Locale.US.getCountry());
            description.setText(formattedNumber);
        }

        if (contact.isEmail()) {
            buttonEnd.setImageDrawable(res.getDrawable(R.drawable.baseline_email_black_24, null));
            buttonEnd.setOnClickListener(v -> {
                try {
                    Intent intent = new Intent(Intent.ACTION_VIEW);
                    intent.setData(Uri.parse(descr));
                    getContext().startActivity(intent);
                } catch (ActivityNotFoundException e) {
                    Log.d("DetailsAdapter", "No email app installed");
                }
            });
            buttonEnd.setVisibility(View.VISIBLE);
        }

        if (contact.isWebsite()) {
            buttonEnd.setImageDrawable(res.getDrawable(R.drawable.baseline_open_in_new_black_24, null));
            buttonEnd.setOnClickListener(v -> {
                Intent intent = new Intent(Intent.ACTION_VIEW);
                intent.setData(Uri.parse(descr));
                getContext().startActivity(intent);
            });
            buttonEnd.setVisibility(View.VISIBLE);
        }

        if (contact.isAddress()) {
            buttonEnd.setImageDrawable(res.getDrawable(R.drawable.baseline_place_black_24, null));
            buttonEnd.setOnClickListener(v -> {
                Intent intent = new Intent(Intent.ACTION_VIEW);
                intent.setData(Uri.parse("geo:0,0?q=" + descr));
                intent.setPackage("com.google.android.apps.maps");
                getContext().startActivity(intent);
            });
            buttonEnd.setVisibility(View.VISIBLE);
        }

        return convertView;
    }
}

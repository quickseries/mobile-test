package com.example.aliafzal.mobiletest;

import android.content.Context;
import android.content.pm.ActivityInfo;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import java.util.ArrayList;

import models.ResourceModel;

public class ResourceListActivity extends AppCompatActivity {


    private ArrayList<ResourceModel> resourceList;
    private ListItemsAdapter adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        setContentView(R.layout.activity_main);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        String type = getIntent().getStringExtra("resourceType");

        if (type.equals("restaurants")) {
            getSupportActionBar().setTitle(R.string.text_restaurants);
        } else if (type.equals("vacation-spot")) {
            getSupportActionBar().setTitle(R.string.text_vaction_spot);
        }

        resourceList = getIntent().getParcelableArrayListExtra("resources");


        ListView resourcesListView = findViewById(R.id.resources_list_view);
        adapter = new ListItemsAdapter(getApplicationContext());
        resourcesListView.setAdapter(adapter);

    }

    public class ListItemsAdapter extends BaseAdapter {

        private Context mContext;
        private LayoutInflater mInflater;

        ListItemsAdapter(Context context) {
            mContext = context;
            mInflater = (LayoutInflater) mContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        }
        @Override
        public int getCount() {
            return resourceList.size();
        }

        @Override
        public Object getItem(int position) {
            return resourceList.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(final int position, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView =mInflater.inflate(R.layout.list_item_resource, parent, false);
            }

            LinearLayout itemRow = convertView.findViewById(R.id.item_row);
            TextView txtTitle = convertView.findViewById(R.id.item_title);
            TextView txtCountry = convertView.findViewById(R.id.item_country);
            txtTitle.setText(resourceList.get(position).getTitle());

            if(resourceList.get(position).getAddresses() != null) {
                txtCountry.setText(resourceList.get(position).getAddresses().get(0).getCountry());
            }

            itemRow.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {

                }
            });
            return convertView;
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                onBackPressed();
                return true;
        }

        return super.onOptionsItemSelected(item);
    }

}

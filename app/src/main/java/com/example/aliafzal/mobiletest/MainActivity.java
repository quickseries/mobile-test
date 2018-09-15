package com.example.aliafzal.mobiletest;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

import factory.CategoryModelFactory;
import factory.ResourceModelFactory;
import models.CategoryModel;
import models.ResourceModel;

public class MainActivity extends AppCompatActivity {

    private ArrayList<CategoryModel> categoryList;
    private ArrayList<ResourceModel> resourceList;
    private ResourcesAdapter adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
        setContentView(R.layout.activity_main);
        getSupportActionBar().setTitle(R.string.text_resources);

        getData("categories");

        ListView categoriesListView = findViewById(R.id.resources_list_view);
        adapter = new ResourcesAdapter(getApplicationContext());
        categoriesListView.setAdapter(adapter);
    }


    public class ResourcesAdapter extends BaseAdapter {

        private Context mContext;
        private LayoutInflater mInflater;

        ResourcesAdapter(Context context) {
            mContext = context;
            mInflater = (LayoutInflater) mContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        }
        @Override
        public int getCount() {
            return categoryList.size();
        }

        @Override
        public Object getItem(int position) {
            return categoryList.get(position);
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(final int position, View convertView, ViewGroup parent) {
            if (convertView == null) {
                convertView =mInflater.inflate(R.layout.list_item_category, parent, false);
            }

            LinearLayout resourceRow = convertView.findViewById(R.id.resource_row);
            TextView title = convertView.findViewById(R.id.resource_title);
            title.setText(categoryList.get(position).getTitle());

            resourceRow.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {

                    final Intent resourseDetailsIntent = new Intent(MainActivity.this, ResourceListActivity.class);

                    Bundle bundle = new Bundle();

                    if (categoryList.get(position).getSlug().toLowerCase().equals("restaurants")) {
                        getData("restaurants");
                        String type = "restaurants";
                        bundle.putString("resourceType", type);
                    } else if (categoryList.get(position).getSlug().toLowerCase().equals("vacation-spots")) {
                        getData("vacation-spot");
                        String type = "vacation-spot";
                        bundle.putString("resourceType", type);
                    }

                    bundle.putParcelableArrayList("resources", resourceList);
                    resourseDetailsIntent.putExtras(bundle);
                    startActivity(resourseDetailsIntent);
                }
            });
            return convertView;
        }
    }


    public String loadJSONResources(String type) {
        String jsonString = readFromFile(type);
        return jsonString;
    }

    public void getData(String type) {

       categoryList = new ArrayList<>();
       resourceList = new ArrayList<>();
       String jsonResponse = loadJSONResources(type);

       try {
           final JSONObject root = new JSONObject(jsonResponse);
           final JSONArray resourcesArray = root.getJSONArray(type);


           if (type.equals("categories")) {

               for (int i = 0; i < resourcesArray.length(); i++) {
                   JSONObject jsonResource = resourcesArray.getJSONObject(i);
                   CategoryModel category = CategoryModelFactory.decodeJSON(jsonResource);
                   categoryList.add(category);
               }
           } else {

               for (int i = 0; i < resourcesArray.length(); i++) {
                   JSONObject jsonResource = resourcesArray.getJSONObject(i);
                   ResourceModel resource = ResourceModelFactory.decodeJSON(jsonResource);
                   resourceList.add(resource);
               }
           }

       } catch (JSONException e) {
           e.printStackTrace();
       }
    }

    private String readFromFile(String type) {

        String jsonString = "";

        try {
            InputStream inputStream = null;

            if (type.equals("categories")) {
                inputStream = getResources().openRawResource(R.raw.categories);
            } else if (type.equals("restaurants")) {
                inputStream = getResources().openRawResource(R.raw.restaurants);
            } else if (type.equals("vacation-spot")) {
                inputStream = getResources().openRawResource(R.raw.vacationspot);
            }

            if (inputStream != null ) {
                InputStreamReader inputStreamReader = new InputStreamReader(inputStream);
                BufferedReader bufferedReader = new BufferedReader(inputStreamReader);
                String receiveString = "";
                StringBuilder stringBuilder = new StringBuilder();

                while ((receiveString = bufferedReader.readLine()) != null ) {
                    stringBuilder.append(receiveString);
                }

                inputStream.close();
                jsonString = stringBuilder.toString();
            }
        }
        catch (FileNotFoundException e) {
            Log.e("No File Error", "File not found: " + e.toString());
        } catch (IOException e) {
            Log.e("Read Error", "Can not read file: " + e.toString());
        }

        return jsonString;
    }
}

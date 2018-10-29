package com.quickseries.mobiletest.tasks;

import android.content.Context;
import android.os.AsyncTask;
import android.support.v7.widget.RecyclerView;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.quickseries.mobiletest.adapters.CategoryRecyclerViewAdapter;
import com.quickseries.mobiletest.entities.Category;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

public class GenerateCategoryTask extends AsyncTask<Void, Void, Void> {
    private WeakReference<Context> contextRef;
    private WeakReference<RecyclerView> recyclerViewRef;

    public GenerateCategoryTask(Context context, RecyclerView recyclerView) {
        this.contextRef = new WeakReference<>(context);
        this.recyclerViewRef = new WeakReference<>(recyclerView);
    }

    protected Void doInBackground(Void... voids) {
        String url = "https://raw.githubusercontent.com/quickseries/mobile-test/master/data/categories.json";

        JsonArrayRequest jsonArrayRequest = new JsonArrayRequest
                (Request.Method.GET, url, null, new Response.Listener<JSONArray>() {

                    @Override
                    public void onResponse(JSONArray response) {
                        List<Category> categories = new ArrayList<>();

                        for (int i = 0; i < response.length(); i++) {
                            try {
                                JSONObject jsonObject = response.getJSONObject(i);
                                Category category = new Category(jsonObject);
                                categories.add(category);
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                        recyclerViewRef.get().setAdapter(new CategoryRecyclerViewAdapter(categories));
                    }
                }, new Response.ErrorListener() {

                    @Override
                    public void onErrorResponse(VolleyError error) {
                        // TODO: Handle error

                    }
                });

        // Access the RequestQueue through your singleton class.
        VolleySingleton.getInstance(contextRef.get()).addToRequestQueue(jsonArrayRequest);
        return null;
    }
}
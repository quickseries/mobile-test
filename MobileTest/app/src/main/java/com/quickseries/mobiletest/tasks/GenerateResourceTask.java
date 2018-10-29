package com.quickseries.mobiletest.tasks;

import android.content.Context;
import android.os.AsyncTask;
import android.support.v7.widget.RecyclerView;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.quickseries.mobiletest.adapters.RestaurantRecyclerViewAdapter;
import com.quickseries.mobiletest.entities.Resource;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

public class GenerateResourceTask extends AsyncTask<String, Void, Void> {
    private WeakReference<Context> contextRef;
    private WeakReference<RecyclerView> recyclerViewRef;

    public GenerateResourceTask(Context context, RecyclerView recyclerView) {
        this.contextRef = new WeakReference<>(context);
        this.recyclerViewRef = new WeakReference<>(recyclerView);
    }

    protected Void doInBackground(String... urls) {
        JsonArrayRequest jsonArrayRequest = new JsonArrayRequest
                (Request.Method.GET, urls[0], null, new Response.Listener<JSONArray>() {

                    @Override
                    public void onResponse(JSONArray response) {
                        List<Resource> resources = new ArrayList<>();

                        for (int i = 0; i < response.length(); i++) {
                            try {
                                JSONObject jsonObject = response.getJSONObject(i);
                                Resource resource = new Resource(jsonObject);
                                resources.add(resource);
                            } catch (JSONException e) {
                                e.printStackTrace();
                            }
                        }
                        recyclerViewRef.get().setAdapter(new RestaurantRecyclerViewAdapter(resources));
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
package com.rodionov.igor.mobiletest.json;

import android.content.Context;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.rodionov.igor.mobiletest.model.Category;
import com.rodionov.igor.mobiletest.model.Restaurant;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.util.List;

public class JsonDataSource {
    private static final String CATEGORY_PATH = "categories.json";
    private static final String RESTAURANTS_PATH = "restaurants.json";
    private static final String VACATIONS_PATH = "vacation-spot.json";

    private Context mContext;

    public JsonDataSource(Context context) {
        mContext = context;
    }

    public List<Category> readCategories() {
        String jsonStr = readJsonFromFile(CATEGORY_PATH);
        Type listType = new TypeToken<List<Category>>(){}.getType();
        return new Gson().fromJson(jsonStr, listType);
    }

    public List<Restaurant> readRestaurants() {
        String jsonStr = readJsonFromFile(RESTAURANTS_PATH);
        Type listType = new TypeToken<List<Restaurant>>(){}.getType();
        return new Gson().fromJson(jsonStr, listType);
    }

    private String readJsonFromFile(String fileName) {
        String jsonString = null;
        try {
            InputStream is = mContext.getAssets().open(fileName);
            byte[] buffer = new byte[is.available()];
            is.read(buffer);
            is.close();
            jsonString = new String(buffer);
        }
        catch (IOException exception){
            exception.printStackTrace();
        }
        return jsonString;
    }
}

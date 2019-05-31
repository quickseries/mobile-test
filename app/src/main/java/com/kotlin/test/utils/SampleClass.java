package com.kotlin.test.utils;

import android.content.Context;
import android.util.Log;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.kotlin.test.models.Category;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class SampleClass {
    private static SampleClass instance;

    public static SampleClass getInstance(){
        if (instance == null) {
            instance = new SampleClass();
        }
        return instance;
    }

    public List<Category> returnList(Context context, JsonFileType categories){
        List<Category> categoryList = new Gson().fromJson(loadJSONFromAsset(categories, context), new TypeToken<List<Category>>(){}.getType());
        for (Category category : categoryList){
            Log.d("SampleClass", category.getTitle());
        }
        return categoryList;
    }

    public String loadJSONFromAsset(JsonFileType jsonFileType, Context context) {
        String json = null;
        try {
            InputStream is = null;
            if (jsonFileType == JsonFileType.CATEGORIES)
                is = context.getAssets().open("data/categories.json");
            else if (jsonFileType == JsonFileType.RESTAURANTS)
                is = context.getAssets().open("data/restaurants.json");
            else if (jsonFileType == JsonFileType.VACATION_SPOTS)
                is = context.getAssets().open("data/vacation-spot.json");
            int size = is.available();

            byte[] buffer = new byte[size];
            is.read(buffer);
            is.close();
            json = new String(buffer, "UTF-8");
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }
        return json;
    }
}

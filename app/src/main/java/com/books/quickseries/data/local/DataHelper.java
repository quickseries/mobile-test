package com.books.quickseries.data.local;

import android.content.Context;

import com.books.quickseries.data.model.Category;
import com.books.quickseries.data.model.Resource;
import com.books.quickseries.data.model.Restaurant;
import com.books.quickseries.data.model.Vacation;
import com.books.quickseries.utils.CommonUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.List;

import javax.inject.Singleton;

/**
 * Created by zakir on 06/09/2018.
 */

@Singleton
public class DataHelper {


    public List<Category> loadCategory(Context context) {
        String categoryJson
                = CommonUtils
                .loadStringFromJson(context, "categories.json");
        Type collectionType = new TypeToken<List<Category>>() {
        }.getType();
        Gson gson = new Gson();
        List<Category> category = gson.fromJson(categoryJson, collectionType);

        return category;
    }


    public List<Resource> loadRestaurants(Context context) {
        String categoryJson
                = CommonUtils
                .loadStringFromJson(context, "restaurants.json");
        Type collectionType = new TypeToken<List<Restaurant>>() {
        }.getType();
        Gson gson = new Gson();
        List<Resource> restaurants = gson.fromJson(categoryJson, collectionType);

        return restaurants;
    }


    public List<Resource> loadVacation(Context context) {
        String categoryJson
                = CommonUtils
                .loadStringFromJson(context, "vacation-spot.json");
        Type collectionType = new TypeToken<List<Vacation>>() {
        }.getType();
        Gson gson = new Gson();
        List<Resource> vacations = gson.fromJson(categoryJson, collectionType);

        return vacations;
    }

}

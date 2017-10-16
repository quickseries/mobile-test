package com.test.quickseries.category.datasource;

import android.content.Context;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.test.quickseries.base.model.Category;
import com.test.quickseries.base.utils.AssetsUtil;
import com.test.quickseries.base.utils.Callback;

import java.util.List;

/**
 * Created by elton on 2017-10-15.
 */

public class CategoryLocalDataSource implements CategoryDatasource {


    @Override
    public void load(Context context, Callback<List<Category>> callback) {
        try {
            String jsonFile = AssetsUtil.readFile(context, "categories.json");
            List<Category> categories = new Gson().fromJson(jsonFile, new TypeToken<List<Category>>() {
            }.getType());
            callback.onSuccess(categories);
        } catch (Exception e) {
            callback.onFailure(e);
        }
    }
}

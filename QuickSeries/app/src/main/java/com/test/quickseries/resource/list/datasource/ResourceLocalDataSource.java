package com.test.quickseries.resource.list.datasource;

import android.content.Context;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.test.quickseries.base.model.Resource;
import com.test.quickseries.base.utils.AssetsUtil;
import com.test.quickseries.base.utils.Callback;

import java.util.List;

/**
 * Created by elton on 2017-10-15.
 */

public class ResourceLocalDataSource implements ResourceDatasource {

    @Override
    public void loadByCategory(Context context, String category_eid, Callback<List<Resource>> callback) {
        try {
            String jsonFile = AssetsUtil.readFile(context, String.format("%s.json", category_eid));
            List<Resource> contents = new Gson().fromJson(jsonFile, new TypeToken<List<Resource>>() {
            }.getType());
            callback.onSuccess(contents);
        } catch (Exception e) {
            callback.onFailure(e);
        }
    }
}

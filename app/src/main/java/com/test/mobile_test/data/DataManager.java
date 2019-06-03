package com.test.mobile_test.data;

import android.content.Context;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.test.mobile_test.common.RESOURCE_TYPE;
import com.test.mobile_test.model.CategoryListModel;
import com.test.mobile_test.model.resource.ResourceModel;
import com.test.mobile_test.utils.FileUtils;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import io.reactivex.Observable;

public class DataManager {

    public Observable<List<CategoryListModel>> getCategoryList(final Context context) {
        return Observable.fromCallable(() -> {
            String data = FileUtils.readFile(context, "categories.json");
            Gson gson = new Gson();
            List<CategoryListModel> enums = gson.fromJson(data, getType(CategoryListModel.class));
            return enums;
        });
    }


    public Observable<List<ResourceModel>> getResourceList(final Context context, RESOURCE_TYPE resourceType) {
        return Observable.fromCallable(() -> {
            String data = FileUtils.readFile(context, resourceType.getJsonFileName());
            Gson gson = new Gson();
            List<ResourceModel> resourceModelList = gson.fromJson(data, getType(ResourceModel.class));
            return resourceModelList;
        });
    }


    private <T> Type getType(Class<T> clazz) {
        Type collectionType = TypeToken.getParameterized(ArrayList.class, clazz).getType();
        return collectionType;
    }

}

package com.books.quickseries.data;

import android.content.Context;

import com.books.quickseries.data.local.DataHelper;
import com.books.quickseries.data.model.Category;
import com.books.quickseries.data.model.Resource;
import com.books.quickseries.data.model.Restaurant;
import com.books.quickseries.data.preference.PrefHelper;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Singleton;

/**
 * Created by zakir on 06/09/2018.
 */

@Singleton
public class DataManager {

    private static final String TAG = "DataManager";

    private Context mContext;
    private DataHelper dataHelper;
    private PrefHelper prefHelper;

    private static DataManager dataManager;

    public static DataManager getInstance(Context context, DataHelper dataHelper, PrefHelper prefHelper) {
        if(dataManager == null) {
            dataManager = new DataManager(context, dataHelper, prefHelper);
        }
        return dataManager;
    }


    private DataManager(Context context, DataHelper dataHelper, PrefHelper prefHelper) {
        this.mContext = context;
        this.dataHelper = dataHelper;
        this.prefHelper = prefHelper;
    }

    public List<Category> getAllCategories() {
        return dataHelper.loadCategory(mContext);
    }

    public List<Resource> getAllRestaurants() {
        return dataHelper.loadRestaurants(mContext);
    }

    public List<Resource> getAllVacation() {
        return dataHelper.loadVacation(mContext);
    }

    public PrefHelper getPreferences() {
        return prefHelper;
    }
}

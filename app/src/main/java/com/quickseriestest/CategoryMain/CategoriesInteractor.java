package com.quickseriestest.CategoryMain;

import com.quickseriestest.models.Category;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public interface CategoriesInteractor {

    interface OnFinishedListener {
        void onFinished(List<Category> categories);
        void onError(Exception e);
    }

    void searchCategories(OnFinishedListener listener);
}

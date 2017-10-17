package com.test.quickseries.category.view;

import android.content.Context;

import com.test.quickseries.base.BasePresenter;
import com.test.quickseries.base.model.Category;
import com.test.quickseries.base.utils.Callback;
import com.test.quickseries.category.datasource.CategoryDatasource;
import com.test.quickseries.category.datasource.CategoryLocalDataSource;

import java.util.List;

/**
 * Created by elton on 2017-10-14.
 */

class CategoryPresenter extends BasePresenter {

    private final Viewable viewable;
    private CategoryDatasource datasource;


    interface Viewable {
        void showContent(List<Category> result);

        void showError(Throwable thowable);
    }

    CategoryPresenter(Viewable viewable) {
        this.viewable = viewable;
        this.datasource = new CategoryLocalDataSource();
    }

    void load(Context context) {
        datasource.load(context, new Callback<List<Category>>() {
            @Override
            public void onSuccess(final List<Category> result) {
                post(() -> viewable.showContent(result));
            }

            @Override
            public void onFailure(final Throwable thowable) {
                post(() -> viewable.showError(thowable));

            }
        });
    }

}
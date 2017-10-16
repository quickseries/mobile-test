package com.test.quickseries.category.datasource;

import android.content.Context;

import com.test.quickseries.base.model.Category;
import com.test.quickseries.base.utils.Callback;

import java.util.List;

/**
 * Created by elton on 2017-10-15.
 */

public interface CategoryDatasource {

    void load(Context context, Callback<List<Category>> callback);

}

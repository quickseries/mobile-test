package com.books.quickseries.ui.main.contract;

import android.content.Context;

import com.books.quickseries.data.model.Category;

import java.util.List;

/**
 * Created by zakir on 06/09/2018.
 */

public interface MainViewContract {

    void showCategories(List<Category> categories);
    Context getContext();
    void openResourceActivity(int category);
}

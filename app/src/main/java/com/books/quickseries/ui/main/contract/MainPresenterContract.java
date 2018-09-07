package com.books.quickseries.ui.main.contract;

import com.books.quickseries.data.model.Category;

import java.util.List;

/**
 * Created by zakir on 06/09/2018.
 */

public interface MainPresenterContract {


    void onViewCreated();
    void onCategoryItemClicked(int category);
    void sortList(List<Category> categories);
}

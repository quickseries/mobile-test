package com.quickseriestest.CategoryMain;

import com.quickseriestest.models.Category;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public interface CategoryView {

    void showProgress();

    void hideProgress();

    void setCategory(List<Category> categories);

    void showMessage(String message);

    void navigateToRestuarant();

    void navigateToVacationSpot();
}

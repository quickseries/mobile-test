package com.numerad.quickseries.main;

import com.numerad.quickseries.common.BasePresenter;
import com.numerad.quickseries.common.BaseView;
import com.numerad.quickseries.json.Category;
import com.numerad.quickseries.json.Resource;

import java.util.List;

public interface MainContract {

    // presenter -> view
    interface View extends BaseView<Presenter> {

        List<Category> getCategories();
        List<Resource> getResources(int id);

        void showCategories(List<Category> categories);
        void showRestaurants(List<Resource> restaurants);
        void showVacations(List<Resource> vacations);
        void showResourceDetail(Resource resource);
        void updateSortDirection(boolean isAlphabetical);

    }

    // view -> presenter
    interface Presenter extends BasePresenter<View> {
        void onCategoryClicked(int position);
        void onRestaurantClicked(int position);
        void onVacationClicked(int position);
        void toggleSortOrder();
    }

}

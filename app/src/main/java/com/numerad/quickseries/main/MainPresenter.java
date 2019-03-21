package com.numerad.quickseries.main;

import com.numerad.quickseries.R;
import com.numerad.quickseries.domain.Storage;
import com.numerad.quickseries.json.Category;
import com.numerad.quickseries.json.Resource;

import java.util.List;

public class MainPresenter implements
        MainContract.Presenter {

    private Storage storage;

    private MainContract.View view;
    private List<Category> categories;
    private List<Resource> restaurants;
    private List<Resource> vacations;

    private boolean isAlphabetical = true;

    public MainPresenter(Storage storage) {
        this.storage = storage;
    }

    // BasePresenter

    @Override
    public void onViewAttached(MainContract.View view) {
        this.view = view;

        // load from raw json restaurants
        // todo use AsyncTask
        categories = view.getCategories();
        restaurants = view.getResources(R.raw.restaurants);
        vacations = view.getResources(R.raw.vacation_spot);

        sortCategories();
        view.showCategories(categories);
    }

    @Override
    public void onCategoryClicked(int position) {
        switch (categories.get(position).getTitle().toLowerCase()) {
            case "restaurants":
                view.showRestaurants(restaurants);
                break;
            case "vacation spots":
                view.showVacations(vacations);
                break;
        }
    }

    @Override
    public void onRestaurantClicked(int position) {
        view.showResourceDetail(restaurants.get(position));
    }

    @Override
    public void onVacationClicked(int position) {
        view.showResourceDetail(restaurants.get(position));
    }

    @Override
    public void toggleSortOrder() {
        isAlphabetical = !isAlphabetical;
        sortCategories();
        view.updateSortDirection(isAlphabetical);
        view.showCategories(categories);
    }

    @Override
    public void onViewDetached() {
        view = null;
    }

    @Override
    public void onDestroyed() {
    }

    public MainContract.View getView() {
        return view;
    }

    void onBackPressed() {
        view.showCategories(categories);
    }

    public boolean isAlphabetical() {
        return isAlphabetical;
    }

    public void setAlphabetical(boolean alphabetical) {
        isAlphabetical = alphabetical;
    }

    // privates

    private void sortCategories() {
        if (isAlphabetical) {
            categories.sort((o1, o2) -> o1.getTitle().compareTo(o2.getTitle()));
        } else {
            categories.sort((o1, o2) -> o2.getTitle().compareTo(o1.getTitle()));
        }
    }
}

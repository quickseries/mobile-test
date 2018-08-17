package com.quickseriestest.CategoryMain;

import com.quickseriestest.models.Category;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public class CategoryPresenterImpl implements CategoryPresenter, CategoriesInteractor.OnFinishedListener {

    private CategoryView categoryView;
    private CategoriesInteractor categoriesInteractor;

    public CategoryPresenterImpl(CategoryView categoryView, CategoriesInteractor categoriesInteractor) {
        this.categoryView = categoryView;
        this.categoriesInteractor = categoriesInteractor;
    }

    @Override public void onResume() {
        if (categoryView != null) {
            categoryView.showProgress();
        }

        categoriesInteractor.searchCategories(this);
    }

    @Override public void onItemClicked(int position) {
        if (categoryView != null) {
            if(position==0){
                categoryView.navigateToRestuarant();
            } else {
                categoryView.navigateToVacationSpot();
            }
        }
    }

    @Override public void onDestroy() {
        categoryView = null;
    }

    @Override public void onFinished(List<Category> categories) {
        if (categoryView != null) {
            categoryView.setCategory(categories);
            categoryView.hideProgress();
        }
    }

    @Override
    public void onError(Exception e) {
        if (categoryView != null) {
            categoryView.showMessage(String.format("Exception:", e));
        }
    }

    public CategoryView getCategoryView() {
        return categoryView;
    }
}

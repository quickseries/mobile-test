package com.books.quickseries.ui.main;

import com.books.quickseries.data.DataManager;
import com.books.quickseries.data.local.DataHelper;
import com.books.quickseries.data.model.Category;
import com.books.quickseries.data.preference.PrefHelper;
import com.books.quickseries.ui.base.BasePresenter;
import com.books.quickseries.ui.main.contract.MainPresenterContract;
import com.books.quickseries.ui.main.contract.MainViewContract;
import com.books.quickseries.utils.sort.SortCategory;

import java.util.Collections;
import java.util.List;

/**
 * Created by zakir on 06/09/2018.
 */

public class MainPresenter extends BasePresenter implements MainPresenterContract {


    private MainViewContract viewContract;

    public MainPresenter(DataManager dataManager) {
        super(dataManager);
    }

    public MainPresenter(MainViewContract viewContract) {
        super(DataManager.getInstance(viewContract.getContext(), new DataHelper(), new PrefHelper()));
        this.viewContract = viewContract;
    }

    @Override
    public void onViewCreated() {
        viewContract.showCategories(getDataManager().getAllCategories());
    }

    @Override
    public void onCategoryItemClicked(int category) {
        viewContract.openResourceActivity(category);
    }

    @Override
    public void sortList(List<Category> categories) {
        Collections.sort(categories, new SortCategory());
        viewContract.showCategories(categories);
    }
}

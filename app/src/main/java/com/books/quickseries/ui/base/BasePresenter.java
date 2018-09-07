package com.books.quickseries.ui.base;

import com.books.quickseries.data.DataManager;

/**
 * Created by zakir on 06/09/2018.
 */

public class BasePresenter {

    private DataManager mDataManager;

    public BasePresenter (DataManager dataManager) {
        this.mDataManager = dataManager;
    }

    public DataManager getDataManager() {
        return mDataManager;
    }
}

package com.test.mobile_test.common;

import android.content.Context;

import androidx.lifecycle.ViewModel;
import androidx.lifecycle.ViewModelProvider;

import com.test.mobile_test.categories.CategoryViewModel;
import com.test.mobile_test.data.DataManager;
import com.test.mobile_test.resources.ResourceViewModel;

public class AppViewModelFactory implements ViewModelProvider.Factory {
    private Context mContext;
    private DataManager mDataManager;


    public AppViewModelFactory(Context context) {
        this.mDataManager = new DataManager();
        this.mContext = context;
    }


    @Override
    public <T extends ViewModel> T create(Class<T> modelClass) {
        if (modelClass.isAssignableFrom(CategoryViewModel.class)) {
            return (T) new CategoryViewModel(mContext, mDataManager);
        } else if (modelClass.isAssignableFrom(ResourceViewModel.class)) {
            return (T) new ResourceViewModel(mContext, mDataManager);
        } else {
            throw new IllegalArgumentException("Exception occurred");
        }
    }
}
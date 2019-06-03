package com.test.mobile_test.common;

import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import com.test.mobile_test.base.BaseFragment;

public class SharedViewModel<T> extends ViewModel {

    private MutableLiveData<T> mutableLiveData;

    public SharedViewModel() {
        this.mutableLiveData = new MutableLiveData<>();
    }

    public MutableLiveData<T> getMutableLiveData() {
        return mutableLiveData;
    }
}

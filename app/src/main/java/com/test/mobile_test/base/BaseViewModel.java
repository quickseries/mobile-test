package com.test.mobile_test.base;

import android.content.Context;

import androidx.lifecycle.MutableLiveData;
import androidx.lifecycle.ViewModel;

import com.test.mobile_test.data.DataManager;

import io.reactivex.disposables.CompositeDisposable;

public class BaseViewModel<T> extends ViewModel {
    protected Context context;
    protected MutableLiveData<T> mutableLiveData;
    protected CompositeDisposable compositeDisposable = new CompositeDisposable();
    protected DataManager mDataManager;

    public BaseViewModel(Context context, DataManager mDataManager) {
        this.context = context;
        this.mDataManager = mDataManager;
        mutableLiveData = new MutableLiveData<>();
    }

    public MutableLiveData<T> getMutableLiveData() {
        return mutableLiveData;
    }

    @Override
    protected void onCleared() {
        super.onCleared();
        if (compositeDisposable != null) {
            compositeDisposable.dispose();
        }
    }
}

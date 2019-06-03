package com.test.mobile_test.categories;

import android.content.Context;

import androidx.annotation.NonNull;

import com.test.mobile_test.base.BaseViewModel;
import com.test.mobile_test.data.DataManager;
import com.test.mobile_test.model.CategoryListModel;

import java.util.List;

import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.observers.DisposableObserver;
import io.reactivex.schedulers.Schedulers;

public class CategoryViewModel extends BaseViewModel<List<CategoryListModel>> {

    public CategoryViewModel(@NonNull Context context, DataManager dataManager) {
        super(context, dataManager);
    }

    public void fetchCategoryList() {
        compositeDisposable.add(mDataManager.getCategoryList(context).subscribeOn(Schedulers.io())
                .observeOn(AndroidSchedulers.mainThread()).subscribeWith(new DisposableObserver<List<CategoryListModel>>() {

                    @Override
                    public void onError(Throwable e) {
                        mutableLiveData.setValue(null);
                    }

                    @Override
                    public void onComplete() {
                    }

                    @Override
                    public void onNext(List<CategoryListModel> categoryListModels) {
                        mutableLiveData.setValue(categoryListModels);

                    }
                }));
    }

}

package com.test.mobile_test.resources;

import android.content.Context;

import com.test.mobile_test.base.BaseViewModel;
import com.test.mobile_test.common.RESOURCE_TYPE;
import com.test.mobile_test.data.DataManager;
import com.test.mobile_test.model.CategoryListModel;
import com.test.mobile_test.model.resource.ResourceModel;

import java.util.List;

import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.observers.DisposableObserver;
import io.reactivex.schedulers.Schedulers;

public class ResourceViewModel extends BaseViewModel<List<ResourceModel>> {

    public ResourceViewModel(Context context, DataManager mDataManager) {
        super(context, mDataManager);
    }

    public void fetchData(CategoryListModel model) {
        if (model != null) {

            RESOURCE_TYPE type = RESOURCE_TYPE.RESTAURANT.getResourceVal().equalsIgnoreCase(model.getEid()) ?
                    RESOURCE_TYPE.RESTAURANT : RESOURCE_TYPE.VACATION_SPOT;

            compositeDisposable.add(mDataManager.getResourceList(context, type).subscribeOn(Schedulers.io())
                    .observeOn(AndroidSchedulers.mainThread()).subscribeWith(new DisposableObserver<List<ResourceModel>>() {
                        @Override
                        public void onNext(List<ResourceModel> resourceModels) {
                            mutableLiveData.setValue(resourceModels);
                        }

                        @Override
                        public void onError(Throwable e) {
                            mutableLiveData.setValue(null);
                        }

                        @Override
                        public void onComplete() {

                        }

                    }));
        }
    }

}
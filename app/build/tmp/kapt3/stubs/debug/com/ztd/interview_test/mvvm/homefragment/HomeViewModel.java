package com.ztd.interview_test.mvvm.homefragment;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/10/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010!\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\b\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005J\u0006\u0010\u0010\u001a\u00020\u0011R\u0017\u0010\u0006\u001a\b\u0012\u0004\u0012\u00020\b0\u0007\u00a2\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u001d\u0010\u000b\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\b0\r0\f\u00a2\u0006\b\n\u0000\u001a\u0004\b\u000e\u0010\u000fR\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"}, d2 = {"Lcom/ztd/interview_test/mvvm/homefragment/HomeViewModel;", "Lcom/ztd/interview_test/mvvm/base/BaseViewModel;", "Lcom/ztd/interview_test/mvvm/homefragment/HomeNavigator;", "dataManager", "Lcom/ztd/interview_test/infrustructure/DataManager;", "(Lcom/ztd/interview_test/infrustructure/DataManager;)V", "categories", "Landroidx/databinding/ObservableList;", "Lcom/ztd/interview_test/infrustructure/data/models/category/CategoryModel;", "getCategories", "()Landroidx/databinding/ObservableList;", "categoryLiveData", "Landroidx/lifecycle/MutableLiveData;", "", "getCategoryLiveData", "()Landroidx/lifecycle/MutableLiveData;", "retrieveCategories", "", "app_debug"})
public final class HomeViewModel extends com.ztd.interview_test.mvvm.base.BaseViewModel<com.ztd.interview_test.mvvm.homefragment.HomeNavigator> {
    @org.jetbrains.annotations.NotNull()
    private final androidx.databinding.ObservableList<com.ztd.interview_test.infrustructure.data.models.category.CategoryModel> categories = null;
    @org.jetbrains.annotations.NotNull()
    private final androidx.lifecycle.MutableLiveData<java.util.List<com.ztd.interview_test.infrustructure.data.models.category.CategoryModel>> categoryLiveData = null;
    private final com.ztd.interview_test.infrustructure.DataManager dataManager = null;
    
    @org.jetbrains.annotations.NotNull()
    public final androidx.databinding.ObservableList<com.ztd.interview_test.infrustructure.data.models.category.CategoryModel> getCategories() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final androidx.lifecycle.MutableLiveData<java.util.List<com.ztd.interview_test.infrustructure.data.models.category.CategoryModel>> getCategoryLiveData() {
        return null;
    }
    
    public final void retrieveCategories() {
    }
    
    @javax.inject.Inject()
    public HomeViewModel(@org.jetbrains.annotations.NotNull()
    com.ztd.interview_test.infrustructure.DataManager dataManager) {
        super();
    }
}
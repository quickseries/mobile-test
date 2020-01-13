package com.ztd.interview_test.mvvm.homefragment;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/10/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u00012\u00020\u00042\u00020\u0005B\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u001dH\u0016J\u0012\u0010\u001e\u001a\u00020\u001b2\b\u0010\u001f\u001a\u0004\u0018\u00010 H\u0016J\u001a\u0010!\u001a\u00020\u001b2\u0006\u0010\"\u001a\u00020#2\b\u0010\u001f\u001a\u0004\u0018\u00010 H\u0016R\u0014\u0010\u0007\u001a\u00020\b8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\b\t\u0010\nR\u001e\u0010\u000b\u001a\u00020\f8\u0006@\u0006X\u0087.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\r\u0010\u000e\"\u0004\b\u000f\u0010\u0010R\u001e\u0010\u0011\u001a\u00020\u00038\u0006@\u0006X\u0087.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0012\u0010\u0013\"\u0004\b\u0014\u0010\u0015R\u0014\u0010\u0016\u001a\u00020\b8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\b\u0017\u0010\nR\u0014\u0010\u0018\u001a\u00020\u00038VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\b\u0019\u0010\u0013\u00a8\u0006$"}, d2 = {"Lcom/ztd/interview_test/mvvm/homefragment/HomeFragment;", "Lcom/ztd/interview_test/mvvm/base/BaseFragment;", "Lcom/ztd/interview_test/databinding/FragmentHomeBinding;", "Lcom/ztd/interview_test/mvvm/homefragment/HomeViewModel;", "Lcom/ztd/interview_test/mvvm/homefragment/HomeNavigator;", "Lcom/ztd/interview_test/mvvm/homefragment/adapter/CategoryAdapter$CategoryClickListener;", "()V", "bindingVariable", "", "getBindingVariable", "()I", "categoryAdapter", "Lcom/ztd/interview_test/mvvm/homefragment/adapter/CategoryAdapter;", "getCategoryAdapter", "()Lcom/ztd/interview_test/mvvm/homefragment/adapter/CategoryAdapter;", "setCategoryAdapter", "(Lcom/ztd/interview_test/mvvm/homefragment/adapter/CategoryAdapter;)V", "homeViewModel", "getHomeViewModel", "()Lcom/ztd/interview_test/mvvm/homefragment/HomeViewModel;", "setHomeViewModel", "(Lcom/ztd/interview_test/mvvm/homefragment/HomeViewModel;)V", "layoutId", "getLayoutId", "viewModel", "getViewModel", "onCategoryClicked", "", "category", "Lcom/ztd/interview_test/infrustructure/data/models/category/CategoryModel;", "onCreate", "savedInstanceState", "Landroid/os/Bundle;", "onViewCreated", "view", "Landroid/view/View;", "app_debug"})
public final class HomeFragment extends com.ztd.interview_test.mvvm.base.BaseFragment<com.ztd.interview_test.databinding.FragmentHomeBinding, com.ztd.interview_test.mvvm.homefragment.HomeViewModel> implements com.ztd.interview_test.mvvm.homefragment.HomeNavigator, com.ztd.interview_test.mvvm.homefragment.adapter.CategoryAdapter.CategoryClickListener {
    @org.jetbrains.annotations.NotNull()
    @javax.inject.Inject()
    public com.ztd.interview_test.mvvm.homefragment.HomeViewModel homeViewModel;
    @org.jetbrains.annotations.NotNull()
    @javax.inject.Inject()
    public com.ztd.interview_test.mvvm.homefragment.adapter.CategoryAdapter categoryAdapter;
    private java.util.HashMap _$_findViewCache;
    
    @org.jetbrains.annotations.NotNull()
    public final com.ztd.interview_test.mvvm.homefragment.HomeViewModel getHomeViewModel() {
        return null;
    }
    
    public final void setHomeViewModel(@org.jetbrains.annotations.NotNull()
    com.ztd.interview_test.mvvm.homefragment.HomeViewModel p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final com.ztd.interview_test.mvvm.homefragment.adapter.CategoryAdapter getCategoryAdapter() {
        return null;
    }
    
    public final void setCategoryAdapter(@org.jetbrains.annotations.NotNull()
    com.ztd.interview_test.mvvm.homefragment.adapter.CategoryAdapter p0) {
    }
    
    @java.lang.Override()
    public int getBindingVariable() {
        return 0;
    }
    
    @java.lang.Override()
    public int getLayoutId() {
        return 0;
    }
    
    @org.jetbrains.annotations.NotNull()
    @java.lang.Override()
    public com.ztd.interview_test.mvvm.homefragment.HomeViewModel getViewModel() {
        return null;
    }
    
    @java.lang.Override()
    public void onCreate(@org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    @java.lang.Override()
    public void onViewCreated(@org.jetbrains.annotations.NotNull()
    android.view.View view, @org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    @java.lang.Override()
    public void onCategoryClicked(@org.jetbrains.annotations.NotNull()
    com.ztd.interview_test.infrustructure.data.models.category.CategoryModel category) {
    }
    
    public HomeFragment() {
        super();
    }
}
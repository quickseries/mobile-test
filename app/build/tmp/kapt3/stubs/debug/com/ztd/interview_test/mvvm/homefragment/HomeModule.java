package com.ztd.interview_test.mvvm.homefragment;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/10/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0007\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\b\u0010\u0003\u001a\u00020\u0004H\u0007J\u0010\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\bH\u0007J\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0006H\u0007\u00a8\u0006\f"}, d2 = {"Lcom/ztd/interview_test/mvvm/homefragment/HomeModule;", "", "()V", "provideCategoryAdapter", "Lcom/ztd/interview_test/mvvm/homefragment/adapter/CategoryAdapter;", "provideDataManager", "Lcom/ztd/interview_test/infrustructure/DataManager;", "appDataManager", "Lcom/ztd/interview_test/infrustructure/AppDataManager;", "provideViewModel", "Lcom/ztd/interview_test/mvvm/homefragment/HomeViewModel;", "dataManager", "app_debug"})
@dagger.Module()
public final class HomeModule {
    
    @org.jetbrains.annotations.NotNull()
    @dagger.Provides()
    public final com.ztd.interview_test.mvvm.homefragment.HomeViewModel provideViewModel(@org.jetbrains.annotations.NotNull()
    com.ztd.interview_test.infrustructure.DataManager dataManager) {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    @dagger.Provides()
    public final com.ztd.interview_test.infrustructure.DataManager provideDataManager(@org.jetbrains.annotations.NotNull()
    com.ztd.interview_test.infrustructure.AppDataManager appDataManager) {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    @dagger.Provides()
    public final com.ztd.interview_test.mvvm.homefragment.adapter.CategoryAdapter provideCategoryAdapter() {
        return null;
    }
    
    public HomeModule() {
        super();
    }
}
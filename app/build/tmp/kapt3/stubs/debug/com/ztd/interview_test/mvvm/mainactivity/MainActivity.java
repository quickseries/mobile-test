package com.ztd.interview_test.mvvm.mainactivity;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/10/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000p\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u00012\u00020\u00042\u00020\u0005B\u0005\u00a2\u0006\u0002\u0010\u0006J\b\u0010 \u001a\u00020!H\u0016J\u0012\u0010\"\u001a\u00020!2\b\u0010#\u001a\u0004\u0018\u00010$H\u0014J\u0010\u0010%\u001a\u00020&2\u0006\u0010\'\u001a\u00020(H\u0016J\u0012\u0010)\u001a\u00020&2\b\u0010*\u001a\u0004\u0018\u00010+H\u0016J\u0018\u0010,\u001a\u00020!2\u0006\u0010-\u001a\u00020.2\u0006\u0010/\u001a\u00020\bH\u0002J\u0010\u00100\u001a\u00020!2\u0006\u0010-\u001a\u00020.H\u0002J\u000e\u00101\u001a\b\u0012\u0004\u0012\u00020\u000f02H\u0016R\u000e\u0010\u0007\u001a\u00020\bX\u0082.\u00a2\u0006\u0002\n\u0000R\u0014\u0010\t\u001a\u00020\n8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\b\u000b\u0010\fR$\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u000e8\u0006@\u0006X\u0087.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013R\u0014\u0010\u0014\u001a\u00020\n8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\b\u0015\u0010\fR\u000e\u0010\u0016\u001a\u00020\u0002X\u0082.\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0017\u001a\u00020\u00038VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\b\u0018\u0010\u0019R\u001e\u0010\u001a\u001a\u00020\u001b8\u0006@\u0006X\u0087.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001c\u0010\u001d\"\u0004\b\u001e\u0010\u001f\u00a8\u00063"}, d2 = {"Lcom/ztd/interview_test/mvvm/mainactivity/MainActivity;", "Lcom/ztd/interview_test/mvvm/base/BaseActivity;", "Lcom/ztd/interview_test/databinding/ActivityMainBinding;", "Lcom/ztd/interview_test/mvvm/mainactivity/MainViewModel;", "Lcom/ztd/interview_test/mvvm/mainactivity/MainNavigator;", "Ldagger/android/support/HasSupportFragmentInjector;", "()V", "appBarConfiguration", "Landroidx/navigation/ui/AppBarConfiguration;", "bindingVariable", "", "getBindingVariable", "()I", "fragmentDispatchingAndroidInjector", "Ldagger/android/DispatchingAndroidInjector;", "Landroidx/fragment/app/Fragment;", "getFragmentDispatchingAndroidInjector", "()Ldagger/android/DispatchingAndroidInjector;", "setFragmentDispatchingAndroidInjector", "(Ldagger/android/DispatchingAndroidInjector;)V", "layoutId", "getLayoutId", "mBinding", "mViewModel", "getMViewModel", "()Lcom/ztd/interview_test/mvvm/mainactivity/MainViewModel;", "mainViewModelFactory", "Landroidx/lifecycle/ViewModelProvider$Factory;", "getMainViewModelFactory", "()Landroidx/lifecycle/ViewModelProvider$Factory;", "setMainViewModelFactory", "(Landroidx/lifecycle/ViewModelProvider$Factory;)V", "onBackPressed", "", "onCreate", "savedInstanceState", "Landroid/os/Bundle;", "onCreateOptionsMenu", "", "menu", "Landroid/view/Menu;", "onOptionsItemSelected", "item", "Landroid/view/MenuItem;", "setupActionBar", "navController", "Landroidx/navigation/NavController;", "appBarConfig", "setupNavigation", "supportFragmentInjector", "Ldagger/android/AndroidInjector;", "app_debug"})
public final class MainActivity extends com.ztd.interview_test.mvvm.base.BaseActivity<com.ztd.interview_test.databinding.ActivityMainBinding, com.ztd.interview_test.mvvm.mainactivity.MainViewModel> implements com.ztd.interview_test.mvvm.mainactivity.MainNavigator, dagger.android.support.HasSupportFragmentInjector {
    @org.jetbrains.annotations.NotNull()
    @javax.inject.Inject()
    public androidx.lifecycle.ViewModelProvider.Factory mainViewModelFactory;
    @org.jetbrains.annotations.NotNull()
    @javax.inject.Inject()
    public dagger.android.DispatchingAndroidInjector<androidx.fragment.app.Fragment> fragmentDispatchingAndroidInjector;
    private com.ztd.interview_test.databinding.ActivityMainBinding mBinding;
    private androidx.navigation.ui.AppBarConfiguration appBarConfiguration;
    private java.util.HashMap _$_findViewCache;
    
    @org.jetbrains.annotations.NotNull()
    public final androidx.lifecycle.ViewModelProvider.Factory getMainViewModelFactory() {
        return null;
    }
    
    public final void setMainViewModelFactory(@org.jetbrains.annotations.NotNull()
    androidx.lifecycle.ViewModelProvider.Factory p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final dagger.android.DispatchingAndroidInjector<androidx.fragment.app.Fragment> getFragmentDispatchingAndroidInjector() {
        return null;
    }
    
    public final void setFragmentDispatchingAndroidInjector(@org.jetbrains.annotations.NotNull()
    dagger.android.DispatchingAndroidInjector<androidx.fragment.app.Fragment> p0) {
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
    public com.ztd.interview_test.mvvm.mainactivity.MainViewModel getMViewModel() {
        return null;
    }
    
    @java.lang.Override()
    protected void onCreate(@org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    private final void setupActionBar(androidx.navigation.NavController navController, androidx.navigation.ui.AppBarConfiguration appBarConfig) {
    }
    
    private final void setupNavigation(androidx.navigation.NavController navController) {
    }
    
    @java.lang.Override()
    public boolean onCreateOptionsMenu(@org.jetbrains.annotations.NotNull()
    android.view.Menu menu) {
        return false;
    }
    
    @java.lang.Override()
    public boolean onOptionsItemSelected(@org.jetbrains.annotations.Nullable()
    android.view.MenuItem item) {
        return false;
    }
    
    @java.lang.Override()
    public void onBackPressed() {
    }
    
    @org.jetbrains.annotations.NotNull()
    @java.lang.Override()
    public dagger.android.AndroidInjector<androidx.fragment.app.Fragment> supportFragmentInjector() {
        return null;
    }
    
    public MainActivity() {
        super();
    }
}
package com.ztd.interview_test.mvvm.mainactivity;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/10/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u00012\u00020\u00042\u00020\u0005B\u0005\u00a2\u0006\u0002\u0010\u0006J\b\u0010\u001e\u001a\u00020\u001fH\u0016J\u0012\u0010 \u001a\u00020\u001f2\b\u0010!\u001a\u0004\u0018\u00010\"H\u0014J\b\u0010#\u001a\u00020$H\u0016J\b\u0010%\u001a\u00020\u001fH\u0002J\u000e\u0010&\u001a\b\u0012\u0004\u0012\u00020\r0\'H\u0016R\u0014\u0010\u0007\u001a\u00020\b8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\b\t\u0010\nR$\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\f8\u0006@\u0006X\u0087.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011R\u0014\u0010\u0012\u001a\u00020\b8VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\b\u0013\u0010\nR\u000e\u0010\u0014\u001a\u00020\u0002X\u0082.\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0015\u001a\u00020\u00038VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\b\u0016\u0010\u0017R\u001e\u0010\u0018\u001a\u00020\u00198\u0006@\u0006X\u0087.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u001a\u0010\u001b\"\u0004\b\u001c\u0010\u001d\u00a8\u0006("}, d2 = {"Lcom/ztd/interview_test/mvvm/mainactivity/MainActivity;", "Lcom/ztd/interview_test/mvvm/base/BaseActivity;", "Lcom/ztd/interview_test/databinding/ActivityMainBinding;", "Lcom/ztd/interview_test/mvvm/mainactivity/MainViewModel;", "Lcom/ztd/interview_test/mvvm/mainactivity/MainNavigator;", "Ldagger/android/support/HasSupportFragmentInjector;", "()V", "bindingVariable", "", "getBindingVariable", "()I", "fragmentDispatchingAndroidInjector", "Ldagger/android/DispatchingAndroidInjector;", "Landroidx/fragment/app/Fragment;", "getFragmentDispatchingAndroidInjector", "()Ldagger/android/DispatchingAndroidInjector;", "setFragmentDispatchingAndroidInjector", "(Ldagger/android/DispatchingAndroidInjector;)V", "layoutId", "getLayoutId", "mBinding", "mViewModel", "getMViewModel", "()Lcom/ztd/interview_test/mvvm/mainactivity/MainViewModel;", "mainViewModelFactory", "Landroidx/lifecycle/ViewModelProvider$Factory;", "getMainViewModelFactory", "()Landroidx/lifecycle/ViewModelProvider$Factory;", "setMainViewModelFactory", "(Landroidx/lifecycle/ViewModelProvider$Factory;)V", "onBackPressed", "", "onCreate", "savedInstanceState", "Landroid/os/Bundle;", "onSupportNavigateUp", "", "setupNavigation", "supportFragmentInjector", "Ldagger/android/AndroidInjector;", "app_debug"})
public final class MainActivity extends com.ztd.interview_test.mvvm.base.BaseActivity<com.ztd.interview_test.databinding.ActivityMainBinding, com.ztd.interview_test.mvvm.mainactivity.MainViewModel> implements com.ztd.interview_test.mvvm.mainactivity.MainNavigator, dagger.android.support.HasSupportFragmentInjector {
    @org.jetbrains.annotations.NotNull()
    @javax.inject.Inject()
    public androidx.lifecycle.ViewModelProvider.Factory mainViewModelFactory;
    @org.jetbrains.annotations.NotNull()
    @javax.inject.Inject()
    public dagger.android.DispatchingAndroidInjector<androidx.fragment.app.Fragment> fragmentDispatchingAndroidInjector;
    private com.ztd.interview_test.databinding.ActivityMainBinding mBinding;
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
    
    @java.lang.Override()
    public boolean onSupportNavigateUp() {
        return false;
    }
    
    @java.lang.Override()
    public void onBackPressed() {
    }
    
    private final void setupNavigation() {
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
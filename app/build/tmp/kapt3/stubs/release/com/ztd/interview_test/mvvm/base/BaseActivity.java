package com.ztd.interview_test.mvvm.base;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/10/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u000e\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\b&\u0018\u0000*\b\b\u0000\u0010\u0001*\u00020\u0002*\f\b\u0001\u0010\u0003*\u0006\u0012\u0002\b\u00030\u00042\u00020\u00052\u00020\u0006B\u0005\u00a2\u0006\u0002\u0010\u0007J\u0012\u0010\u0017\u001a\u00020\u00182\b\u0010\u0019\u001a\u0004\u0018\u00010\u001aH\u0014J\b\u0010\u001b\u001a\u00020\u0018H\u0016J\u0010\u0010\u001c\u001a\u00020\u00182\u0006\u0010\u001d\u001a\u00020\u001eH\u0016J\b\u0010\u001f\u001a\u00020\u0018H\u0002J\b\u0010 \u001a\u00020\u0018H\u0002R\u0012\u0010\b\u001a\u00020\tX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\b\n\u0010\u000bR\u0014\u0010\f\u001a\u00020\t8gX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\b\r\u0010\u000bR\u0012\u0010\u000e\u001a\u00028\u0001X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\b\u000f\u0010\u0010R\u001c\u0010\u0011\u001a\u00028\u0000X\u0086.\u00a2\u0006\u0010\n\u0002\u0010\u0016\u001a\u0004\b\u0012\u0010\u0013\"\u0004\b\u0014\u0010\u0015\u00a8\u0006!"}, d2 = {"Lcom/ztd/interview_test/mvvm/base/BaseActivity;", "T", "Landroidx/databinding/ViewDataBinding;", "V", "Lcom/ztd/interview_test/mvvm/base/BaseViewModel;", "Landroidx/appcompat/app/AppCompatActivity;", "Lcom/ztd/interview_test/mvvm/base/BaseFragment$Callback;", "()V", "bindingVariable", "", "getBindingVariable", "()I", "layoutId", "getLayoutId", "mViewModel", "getMViewModel", "()Lcom/ztd/interview_test/mvvm/base/BaseViewModel;", "viewDataBinding", "getViewDataBinding", "()Landroidx/databinding/ViewDataBinding;", "setViewDataBinding", "(Landroidx/databinding/ViewDataBinding;)V", "Landroidx/databinding/ViewDataBinding;", "onCreate", "", "savedInstanceState", "Landroid/os/Bundle;", "onFragmentAttached", "onFragmentDetached", "tag", "", "performDataBinding", "performDependencyInjection", "app_release"})
public abstract class BaseActivity<T extends androidx.databinding.ViewDataBinding, V extends com.ztd.interview_test.mvvm.base.BaseViewModel<?>> extends androidx.appcompat.app.AppCompatActivity implements com.ztd.interview_test.mvvm.base.BaseFragment.Callback {
    @org.jetbrains.annotations.NotNull()
    public T viewDataBinding;
    private java.util.HashMap _$_findViewCache;
    
    @org.jetbrains.annotations.NotNull()
    public final T getViewDataBinding() {
        return null;
    }
    
    public final void setViewDataBinding(@org.jetbrains.annotations.NotNull()
    T p0) {
    }
    
    /**
     * Override for set binding variable
     *
     * @return variable id
     */
    public abstract int getBindingVariable();
    
    /**
     * @return layout resource id
     */
    @androidx.annotation.LayoutRes()
    public abstract int getLayoutId();
    
    /**
     * Override for set view model
     *
     * @return view model instance
     */
    @org.jetbrains.annotations.NotNull()
    public abstract V getMViewModel();
    
    @java.lang.Override()
    protected void onCreate(@org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    @java.lang.Override()
    public void onFragmentAttached() {
    }
    
    @java.lang.Override()
    public void onFragmentDetached(@org.jetbrains.annotations.NotNull()
    java.lang.String tag) {
    }
    
    private final void performDependencyInjection() {
    }
    
    private final void performDataBinding() {
    }
    
    public BaseActivity() {
        super();
    }
}
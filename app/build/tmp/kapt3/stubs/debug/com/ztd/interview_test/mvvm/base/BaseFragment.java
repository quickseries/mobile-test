package com.ztd.interview_test.mvvm.base;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/10/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\b&\u0018\u0000*\b\b\u0000\u0010\u0001*\u00020\u0002*\f\b\u0001\u0010\u0003*\u0006\u0012\u0002\b\u00030\u00042\u00020\u0005:\u00010B\u0005\u00a2\u0006\u0002\u0010\u0006J\u0010\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\"H\u0016J\u0012\u0010#\u001a\u00020 2\b\u0010$\u001a\u0004\u0018\u00010%H\u0016J&\u0010&\u001a\u0004\u0018\u00010\u00152\u0006\u0010\'\u001a\u00020(2\b\u0010)\u001a\u0004\u0018\u00010*2\b\u0010$\u001a\u0004\u0018\u00010%H\u0016J\b\u0010+\u001a\u00020 H\u0016J\b\u0010,\u001a\u00020 H\u0016J\u001a\u0010-\u001a\u00020 2\u0006\u0010.\u001a\u00020\u00152\b\u0010$\u001a\u0004\u0018\u00010%H\u0016J\b\u0010/\u001a\u00020 H\u0002R6\u0010\t\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0002\b\u0003\u0018\u00010\b2\u0012\u0010\u0007\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0002\b\u0003\u0018\u00010\b@BX\u0086\u000e\u00a2\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0012\u0010\f\u001a\u00020\rX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\b\u000e\u0010\u000fR\u0014\u0010\u0010\u001a\u00020\r8gX\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\b\u0011\u0010\u000fR\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0012\u0010\u0016\u001a\u0004\u0018\u00018\u0001X\u0082\u000e\u00a2\u0006\u0004\n\u0002\u0010\u0017R \u0010\u0018\u001a\u00028\u00002\u0006\u0010\u0007\u001a\u00028\u0000@BX\u0086.\u00a2\u0006\n\n\u0002\u0010\u001b\u001a\u0004\b\u0019\u0010\u001aR\u0012\u0010\u001c\u001a\u00028\u0001X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\b\u001d\u0010\u001e\u00a8\u00061"}, d2 = {"Lcom/ztd/interview_test/mvvm/base/BaseFragment;", "T", "Landroidx/databinding/ViewDataBinding;", "V", "Lcom/ztd/interview_test/mvvm/base/BaseViewModel;", "Landroidx/fragment/app/Fragment;", "()V", "<set-?>", "Lcom/ztd/interview_test/mvvm/base/BaseActivity;", "baseActivity", "getBaseActivity", "()Lcom/ztd/interview_test/mvvm/base/BaseActivity;", "bindingVariable", "", "getBindingVariable", "()I", "layoutId", "getLayoutId", "mProgressDialog", "Landroid/app/ProgressDialog;", "mRootView", "Landroid/view/View;", "mViewModel", "Lcom/ztd/interview_test/mvvm/base/BaseViewModel;", "viewDataBinding", "getViewDataBinding", "()Landroidx/databinding/ViewDataBinding;", "Landroidx/databinding/ViewDataBinding;", "viewModel", "getViewModel", "()Lcom/ztd/interview_test/mvvm/base/BaseViewModel;", "onAttach", "", "context", "Landroid/content/Context;", "onCreate", "savedInstanceState", "Landroid/os/Bundle;", "onCreateView", "inflater", "Landroid/view/LayoutInflater;", "container", "Landroid/view/ViewGroup;", "onDetach", "onResume", "onViewCreated", "view", "performDependencyInjection", "Callback", "app_debug"})
public abstract class BaseFragment<T extends androidx.databinding.ViewDataBinding, V extends com.ztd.interview_test.mvvm.base.BaseViewModel<?>> extends androidx.fragment.app.Fragment {
    @org.jetbrains.annotations.Nullable()
    private com.ztd.interview_test.mvvm.base.BaseActivity<T, ?> baseActivity;
    private android.view.View mRootView;
    @org.jetbrains.annotations.NotNull()
    private T viewDataBinding;
    private V mViewModel;
    private android.app.ProgressDialog mProgressDialog;
    private java.util.HashMap _$_findViewCache;
    
    @org.jetbrains.annotations.Nullable()
    public final com.ztd.interview_test.mvvm.base.BaseActivity<T, ?> getBaseActivity() {
        return null;
    }
    
    @org.jetbrains.annotations.NotNull()
    public final T getViewDataBinding() {
        return null;
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
    public abstract V getViewModel();
    
    @java.lang.Override()
    public void onAttach(@org.jetbrains.annotations.NotNull()
    android.content.Context context) {
    }
    
    @java.lang.Override()
    public void onCreate(@org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    @java.lang.Override()
    public void onResume() {
    }
    
    @org.jetbrains.annotations.Nullable()
    @java.lang.Override()
    public android.view.View onCreateView(@org.jetbrains.annotations.NotNull()
    android.view.LayoutInflater inflater, @org.jetbrains.annotations.Nullable()
    android.view.ViewGroup container, @org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
        return null;
    }
    
    @java.lang.Override()
    public void onDetach() {
    }
    
    @java.lang.Override()
    public void onViewCreated(@org.jetbrains.annotations.NotNull()
    android.view.View view, @org.jetbrains.annotations.Nullable()
    android.os.Bundle savedInstanceState) {
    }
    
    private final void performDependencyInjection() {
    }
    
    public BaseFragment() {
        super();
    }
    
    @kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\bf\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&J\u0010\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u0006H&\u00a8\u0006\u0007"}, d2 = {"Lcom/ztd/interview_test/mvvm/base/BaseFragment$Callback;", "", "onFragmentAttached", "", "onFragmentDetached", "tag", "", "app_debug"})
    public static abstract interface Callback {
        
        public abstract void onFragmentAttached();
        
        public abstract void onFragmentDetached(@org.jetbrains.annotations.NotNull()
        java.lang.String tag);
    }
}
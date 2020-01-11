package com.ztd.interview_test.mvvm.base;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/10/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0004\b&\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002B\u0005\u00a2\u0006\u0002\u0010\u0003J\b\u0010\u0010\u001a\u00020\u0011H\u0014J\u0013\u0010\u0012\u001a\u00020\u00112\u0006\u0010\u0013\u001a\u00028\u0000\u00a2\u0006\u0002\u0010\u0014R\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\u0006\u0010\u0007\"\u0004\b\b\u0010\tR \u0010\n\u001a\b\u0012\u0004\u0012\u00028\u00000\u000bX\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\b\f\u0010\r\"\u0004\b\u000e\u0010\u000f\u00a8\u0006\u0015"}, d2 = {"Lcom/ztd/interview_test/mvvm/base/BaseViewModel;", "N", "Landroidx/lifecycle/ViewModel;", "()V", "compositeDisposable", "Lio/reactivex/disposables/CompositeDisposable;", "getCompositeDisposable", "()Lio/reactivex/disposables/CompositeDisposable;", "setCompositeDisposable", "(Lio/reactivex/disposables/CompositeDisposable;)V", "mNavigator", "Ljava/lang/ref/WeakReference;", "getMNavigator", "()Ljava/lang/ref/WeakReference;", "setMNavigator", "(Ljava/lang/ref/WeakReference;)V", "onCleared", "", "setNavigator", "navigator", "(Ljava/lang/Object;)V", "app_debug"})
public abstract class BaseViewModel<N extends java.lang.Object> extends androidx.lifecycle.ViewModel {
    @org.jetbrains.annotations.NotNull()
    private io.reactivex.disposables.CompositeDisposable compositeDisposable;
    @org.jetbrains.annotations.NotNull()
    public java.lang.ref.WeakReference<N> mNavigator;
    
    @org.jetbrains.annotations.NotNull()
    public final io.reactivex.disposables.CompositeDisposable getCompositeDisposable() {
        return null;
    }
    
    public final void setCompositeDisposable(@org.jetbrains.annotations.NotNull()
    io.reactivex.disposables.CompositeDisposable p0) {
    }
    
    @org.jetbrains.annotations.NotNull()
    public final java.lang.ref.WeakReference<N> getMNavigator() {
        return null;
    }
    
    public final void setMNavigator(@org.jetbrains.annotations.NotNull()
    java.lang.ref.WeakReference<N> p0) {
    }
    
    public final void setNavigator(N navigator) {
    }
    
    @java.lang.Override()
    protected void onCleared() {
    }
    
    public BaseViewModel() {
        super();
    }
}
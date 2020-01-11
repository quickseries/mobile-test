package com.ztd.interview_test.infrustructure.di;

import java.lang.System;

/**
 * Created by Mahdi_ZareTahghighDoost(ZTD)
 * on 1/10/2020.
 */
@kotlin.Metadata(mv = {1, 1, 15}, bv = {1, 0, 3}, k = 1, d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\b\'\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\b\u0010\u0003\u001a\u00020\u0004H\'J\b\u0010\u0005\u001a\u00020\u0006H\'\u00a8\u0006\u0007"}, d2 = {"Lcom/ztd/interview_test/infrustructure/di/ActivityBuilder;", "", "()V", "bindMainActivity", "Lcom/ztd/interview_test/mvvm/mainactivity/MainActivity;", "provideHomeFragmentFactory", "Lcom/ztd/interview_test/mvvm/homefragment/HomeFragment;", "app_debug"})
@dagger.Module()
public abstract class ActivityBuilder {
    
    @org.jetbrains.annotations.NotNull()
    @dagger.android.ContributesAndroidInjector(modules = {com.ztd.interview_test.mvvm.mainactivity.MainModule.class})
    public abstract com.ztd.interview_test.mvvm.mainactivity.MainActivity bindMainActivity();
    
    @org.jetbrains.annotations.NotNull()
    @dagger.android.ContributesAndroidInjector(modules = {com.ztd.interview_test.mvvm.homefragment.HomeModule.class})
    public abstract com.ztd.interview_test.mvvm.homefragment.HomeFragment provideHomeFragmentFactory();
    
    public ActivityBuilder() {
        super();
    }
}
package com.anoulong.quickseries;

import android.content.Context;
import android.content.SharedPreferences;

import com.anoulong.quickseries.manager.EncryptionManager;
import com.anoulong.quickseries.manager.EndpointManager;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import okhttp3.Cache;
import rx.subscriptions.CompositeSubscription;

/**
 * Created by Anou on 2017-10-14.
 */

@Module
public class ApplicationModule {
    private static final int HTTP_CACHE_SIZE = 10 * 1024 * 1024; // 10 MB

    protected final AnouQuickSeriesApplication application;

    public ApplicationModule(AnouQuickSeriesApplication application) {
        this.application = application;
    }

    @Provides
    @Singleton
    CompositeSubscription provideCompositeSubscription() {
        return new CompositeSubscription();
    }

    @Provides
    @Singleton
    Cache provideCache() {
        return new Cache(application.getCacheDir(), HTTP_CACHE_SIZE);
    }

    @Provides
    @Singleton
    SharedPreferences provideSharedPreferences() {
        return application.getSharedPreferences(application.getPackageName(), Context.MODE_PRIVATE);
    }

    @Provides
    @Singleton
    EncryptionManager provideEncryptionManager(SharedPreferences sharedPreferences) {
        return new EncryptionManager(sharedPreferences);
    }

    @Provides
    @Singleton
    EndpointManager provideEndpointManager() {
        return new EndpointManager(application);
    }

}

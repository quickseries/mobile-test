package com.anoulong.quickseries;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import com.anoulong.quickseries.manager.EncryptionManager;
import com.anoulong.quickseries.manager.EndpointManager;
import com.google.gson.FieldNamingPolicy;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.quickseries.restaurant.RestaurantContract;
import com.quickseries.restaurant.RestaurantPresenter;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import okhttp3.Cache;
import okhttp3.OkHttpClient;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava.RxJavaCallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;
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
    SharedPreferences providesSharedPreferences(Application application) {
        return PreferenceManager.getDefaultSharedPreferences(application);
    }

    @Provides
    @Singleton
    Cache provideHttpCache() {
        return new Cache(application.getCacheDir(), HTTP_CACHE_SIZE);
    }

    @Provides
    @Singleton
    Gson provideGson() {
        GsonBuilder gsonBuilder = new GsonBuilder();
        gsonBuilder.setFieldNamingPolicy(FieldNamingPolicy.LOWER_CASE_WITH_UNDERSCORES);
        return gsonBuilder.create();
    }

    @Provides
    @Singleton
    OkHttpClient provideOkhttpClient(Cache cache) {
        OkHttpClient.Builder client = new OkHttpClient.Builder();
        client.cache(cache);
        return client.build();
    }

    @Provides
    @Singleton
    Retrofit provideRetrofit(Gson gson, OkHttpClient okHttpClient, EndpointManager endpointManager) {
        Retrofit retrofit = new Retrofit.Builder()
                .addConverterFactory(GsonConverterFactory.create(gson))
                .addCallAdapterFactory(RxJavaCallAdapterFactory.create())
                .baseUrl(endpointManager.getBackendBaseUrl())
                .client(okHttpClient)
                .build();
        return retrofit;
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

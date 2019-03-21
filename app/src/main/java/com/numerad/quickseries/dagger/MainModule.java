package com.numerad.quickseries.dagger;

import android.content.Context;

import com.numerad.quickseries.domain.Storage;
import com.numerad.quickseries.domain.StorageImpl;
import com.numerad.quickseries.main.MainPresenter;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class MainModule {

    @Provides
    @Singleton
    Storage provideStorage(Context context) {
        return new StorageImpl(context);
    }

    @Provides
    @Singleton
    MainPresenter provideMainPresenter(Storage storage) {
        return new MainPresenter(storage);
    }

}

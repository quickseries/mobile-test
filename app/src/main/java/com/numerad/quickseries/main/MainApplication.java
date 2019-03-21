package com.numerad.quickseries.main;

import android.app.Application;
import android.content.Context;

import com.numerad.quickseries.dagger.AppModule;
import com.numerad.quickseries.dagger.DaggerMainComponent;
import com.numerad.quickseries.dagger.MainComponent;

public class MainApplication extends Application {

    static public boolean PRODUCTION = false;

    private MainComponent mainComponent;

    public MainComponent getMainComponent() {
        return mainComponent;
    }

    @Override
    protected void attachBaseContext(Context base) {
        super.attachBaseContext(base);
    }

    @Override
    public void onCreate() {
        super.onCreate();

        mainComponent = DaggerMainComponent.builder()
                .appModule(new AppModule(this))
                .build();
    }
}

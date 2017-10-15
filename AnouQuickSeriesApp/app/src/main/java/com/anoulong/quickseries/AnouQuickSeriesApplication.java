package com.anoulong.quickseries;

import android.app.Application;
import android.content.Context;

import timber.log.Timber;

/**
 * Created by Anou on 2017-10-14.
 */

public class AnouQuickSeriesApplication extends Application{

    private ApplicationComponent mApplicationComponent;

    @Override
    public void onCreate() {
        super.onCreate();
        AnouQuickSeriesApplication.getApplicationComponent(this).inject(this);


        if (BuildConfig.DEBUG) {
            Timber.plant(new Timber.DebugTree() {

                @Override
                protected String createStackElementTag(StackTraceElement element) {
                    return super.createStackElementTag(element) + ":" + element.getLineNumber();
                }
            });
        }
    }

    protected ApplicationModule getApplicationModule() {
        return new ApplicationModule(this);
    }

    public static ApplicationComponent getApplicationComponent(Context context) {
        AnouQuickSeriesApplication application = (AnouQuickSeriesApplication) context.getApplicationContext();
        if (application.mApplicationComponent == null) {
            application.mApplicationComponent = DaggerApplicationComponent.builder()
                    .applicationModule(application.getApplicationModule())
                    .build();
        }
        return application.mApplicationComponent;
    }

}

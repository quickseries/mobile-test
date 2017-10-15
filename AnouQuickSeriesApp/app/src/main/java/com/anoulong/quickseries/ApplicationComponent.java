package com.anoulong.quickseries;

import com.anoulong.quickseries.screen.BaseActivity;
import com.anoulong.quickseries.screen.MainActivity;

import javax.inject.Singleton;

import dagger.Component;

/**
 * Created by Anou on 2017-10-14.
 */
@Singleton
@Component(modules = {ApplicationModule.class})
public interface ApplicationComponent {

    void inject(AnouQuickSeriesApplication target);

    //Activity
    void inject(BaseActivity target);
//    void inject(SplashActivity target);
    void inject(MainActivity target);
}

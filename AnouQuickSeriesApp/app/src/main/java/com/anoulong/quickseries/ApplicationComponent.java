package com.anoulong.quickseries;

import com.anoulong.quickseries.screen.BaseActivity;
import com.anoulong.quickseries.screen.BaseFragment;
import com.anoulong.quickseries.screen.main.MainActivity;
import com.anoulong.quickseries.screen.main.MainFragment;
import com.anoulong.quickseries.screen.restaurant.RestaurantDetailsActivity;
import com.anoulong.quickseries.screen.restaurant.RestaurantDetailsFragment;
import com.anoulong.quickseries.screen.tab.TabRestaurantFragment;
import com.anoulong.quickseries.screen.tab.TabVacationFragment;
import com.anoulong.quickseries.screen.vacation.VacationDetailsActivity;
import com.anoulong.quickseries.screen.vacation.VacationDetailsFragment;

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
    void inject(MainActivity target);
    void inject(RestaurantDetailsActivity target);
    void inject(VacationDetailsActivity target);

    //fragment
    void inject(BaseFragment target);
    void inject(MainFragment target);
    void inject(TabRestaurantFragment target);
    void inject(TabVacationFragment target);
    void inject(RestaurantDetailsFragment target);
    void inject(VacationDetailsFragment target);
}

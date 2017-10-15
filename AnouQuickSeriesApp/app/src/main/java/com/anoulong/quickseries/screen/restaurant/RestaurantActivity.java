package com.anoulong.quickseries.screen.restaurant;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;
import com.anoulong.quickseries.screen.BaseActivity;

/**
 * Created by Anou on 2017-10-15.
 */

public class RestaurantActivity extends BaseActivity {

    public static Intent intent(Context context) {
        return new Intent(context, RestaurantActivity.class);
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(this).inject(this);
        setContentView(R.layout.activity_restaurant);
    }

    @Override
    public void onBackPressed() {
        //At the last fragment we just minimize the app in the background
        if (getSupportFragmentManager().getBackStackEntryCount() > 1) {
            getSupportFragmentManager().popBackStack();
        } else {
            finish();
        }
    }
}

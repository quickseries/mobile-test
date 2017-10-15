package com.anoulong.quickseries.screen.restaurant;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.ColorRes;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;
import com.anoulong.quickseries.screen.BaseActivity;
import com.quickseries.restaurant.RestaurantContract;

/**
 * Created by Anou on 2017-10-15.
 */

public class RestaurantActivity extends BaseActivity {
    private static final String TAG = RestaurantActivity.class.getSimpleName();

    public static final String KEY_RESTAURANT = TAG + "_KEY_RESTAURANT";

    private static Intent intent(Context context) {
        return new Intent(context, RestaurantActivity.class);
    }

    public static Intent intent(Context context, RestaurantContract.Restaurant restaurant) {
        Intent intent = intent(context);
        intent.putExtra(KEY_RESTAURANT, restaurant);
        return intent;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(this).inject(this);
        setContentView(R.layout.activity_restaurant);
        if (getIntent().getExtras() != null && getIntent().getExtras().size() > 0) {
            RestaurantContract.Restaurant restaurant = (RestaurantContract.Restaurant) getIntent().getSerializableExtra(KEY_RESTAURANT);

            replaceFragment(RestaurantFragment.newInstance(restaurant), true);
        }

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

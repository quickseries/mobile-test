package com.anoulong.quickseries.screen.vacation;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;
import com.anoulong.quickseries.screen.BaseActivity;
import com.quickseries.restaurant.RestaurantContract;
import com.quickseries.vacation.VacationContract;

/**
 * Created by Anou on 2017-10-15.
 */

public class VacationDetailsActivity extends BaseActivity {
    private static final String TAG = VacationDetailsActivity.class.getSimpleName();

    public static final String KEY_VACATION = TAG + "_KEY_VACATION";

    private static Intent intent(Context context) {
        return new Intent(context, VacationDetailsActivity.class);
    }

    public static Intent intent(Context context, VacationContract.Vacation vacation) {
        Intent intent = intent(context);
        intent.putExtra(KEY_VACATION, vacation);
        return intent;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(this).inject(this);
        setContentView(R.layout.activity_details_vacation);
        if (getIntent().getExtras() != null && getIntent().getExtras().size() > 0) {
            VacationContract.Vacation vacation = (VacationContract.Vacation) getIntent().getSerializableExtra(KEY_VACATION);

            replaceFragment(VacationDetailsFragment.newInstance(vacation), true);
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

package com.anoulong.quickseries.screen.main;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.TabLayout;

import android.support.v4.view.ViewPager;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;
import com.anoulong.quickseries.screen.BaseActivity;
import com.anoulong.quickseries.screen.restaurant.RestaurantDetailsActivity;
import com.anoulong.quickseries.screen.vacation.VacationDetailsActivity;
import com.quickseries.restaurant.RestaurantContract;
import com.quickseries.vacation.VacationContract;

import butterknife.BindView;

public class MainActivity extends BaseActivity implements RestaurantContract.Router, VacationContract.Router{

    private static final String TAG = MainActivity.class.getSimpleName();
    private static final String TAB_INDEX = TAG + "TAB_INDEX";


    @BindView(R.id.main_container)
    ViewPager mViewPager;

    @BindView(R.id.tab_layout)
    TabLayout mTabLayout;

    private MainPagerAdapter mMainPagerAdapter;

    public static Intent intent(Context context) {
        return new Intent(context, MainActivity.class);
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(this).inject(this);
        setContentView(R.layout.activity_main);
        this.setupView();
    }

    @Override
    protected void onResume() {
        super.onResume();
        mTabLayout.invalidate();
    }

    @Override
    public void onBackPressed() {
        //last screen must be home screen
        if (mViewPager.getCurrentItem() > 0) {
            mViewPager.setCurrentItem(0);
        } else {
            super.onBackPressed();
            finish();
        }
    }

    protected void setupView() {
        int tabIndex = 0;
        if (getIntent().getExtras() != null && getIntent().getExtras().size() > 0) {
            tabIndex = getIntent().getIntExtra(TAB_INDEX, tabIndex);
        }

        initializeBottomNavBar();
        mViewPager.setCurrentItem(tabIndex);
    }

    private void initializeBottomNavBar() {

        // Setup the viewPager
        mMainPagerAdapter = new MainPagerAdapter(getSupportFragmentManager(), MainActivity.this);
        mViewPager.setAdapter(mMainPagerAdapter);
        mTabLayout.setupWithViewPager(mViewPager);
        for (int i = 0; i < mTabLayout.getTabCount(); i++) {
            TabLayout.Tab tab = mTabLayout.getTabAt(i);
            if (tab != null)
                tab.setCustomView(mMainPagerAdapter.getTabItemView(i));
        }

    }

    @Override
    public void showRestaurantDetailsScreen(RestaurantContract.Restaurant restaurant) {
        startActivity(RestaurantDetailsActivity.intent(this, restaurant));

    }

    @Override
    public void showVacationDetailsScreen(VacationContract.Vacation vacation) {
        startActivity(VacationDetailsActivity.intent(this, vacation));

    }
}

package com.test.mobile_test.base;

import android.os.Bundle;
import android.util.Log;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import androidx.lifecycle.ViewModelProviders;

import com.test.mobile_test.common.SharedViewModel;

public abstract class BaseActivity extends AppCompatActivity {

    protected abstract int getLayoutById();

    protected abstract void initView();

    protected SharedViewModel sharedViewModel;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(getLayoutById());
        sharedViewModel = ViewModelProviders.of(this).get(SharedViewModel.class);
        initView();
        addFragmentBackStackListener();
    }

    private void addFragmentBackStackListener() {
        getSupportFragmentManager().addOnBackStackChangedListener(new FragmentManager.OnBackStackChangedListener() {
            @Override
            public void onBackStackChanged() {
                int index = getSupportFragmentManager().getBackStackEntryCount() - 1;
                if (index > -1) {
                    FragmentManager.BackStackEntry backEntry = getSupportFragmentManager().getBackStackEntryAt(index);
                    String tag = backEntry.getName();
                    BaseFragment mCurrentFragment = (BaseFragment) getSupportFragmentManager().findFragmentByTag(tag);
                    if (mCurrentFragment != null) {
                        setTitle(mCurrentFragment.getTitle());
                    }
                }
            }
        });
    }

    public void replaceFragment(int containerId, BaseFragment fragment, boolean addToBackStack) {
        if (fragment == null) {
            Log.i("", "Fragment to add is null.");
            return;
        }
        FragmentManager fragmentManager = getSupportFragmentManager();
        FragmentTransaction transaction = fragmentManager.beginTransaction();
        transaction.replace(containerId, fragment, fragment.getClass().getSimpleName());

        if (addToBackStack)
            transaction.addToBackStack(fragment.getClass().getSimpleName());
        transaction.commitAllowingStateLoss();
    }


    public void setTitle(String title) {
        getSupportActionBar().setTitle(title);
    }

    @Override
    public void onBackPressed() {

        if (getSupportFragmentManager().getBackStackEntryCount() <= 1) {
            finish();
        } else {
            super.onBackPressed();
        }

    }
}

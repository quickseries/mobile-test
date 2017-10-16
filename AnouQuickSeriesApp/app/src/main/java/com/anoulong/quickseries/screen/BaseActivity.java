package com.anoulong.quickseries.screen;

import android.os.Bundle;
import android.os.PersistableBundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.ViewGroup;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;

import java.util.Collections;
import java.util.List;

import javax.inject.Inject;

import butterknife.ButterKnife;
import rx.Subscription;
import rx.subscriptions.CompositeSubscription;

/**
 * Created by Anou on 2017-10-14.
 */

public class BaseActivity extends AppCompatActivity {

    @Inject
    CompositeSubscription compositeSubscription;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState, @Nullable PersistableBundle persistentState) {
        super.onCreate(savedInstanceState, persistentState);
        AnouQuickSeriesApplication.getApplicationComponent(this).inject(this);

    }

    @Override
    public void setContentView(int layoutResID) {
        super.setContentView(layoutResID);
        ButterKnife.bind(this);
    }

    @Override
    public void setContentView(View view) {
        super.setContentView(view);
        ButterKnife.bind(this);
    }

    @Override
    public void setContentView(View view, ViewGroup.LayoutParams params) {
        super.setContentView(view, params);
        ButterKnife.bind(this);
    }

    @Override
    protected void onStop() {
        super.onStop();
        clearObservables();
    }


    protected void addSubscription(Subscription subscription) {
        compositeSubscription.add(subscription);
    }

    protected void clearObservables() {
        if (compositeSubscription != null && !compositeSubscription.isUnsubscribed()) {
            compositeSubscription.unsubscribe();
        }

    }

    protected void setupObservables() {
        if (compositeSubscription == null) {
            compositeSubscription = new CompositeSubscription();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        clearObservables();
    }

    protected void replaceFragment(BaseFragment fragment, boolean addToBackStack) {
        replaceFragment(fragment, addToBackStack, true);
    }

    protected void replaceFragment(BaseFragment fragment, boolean addToBackStack, boolean animate) {
        if (fragment != null && !fragment.isVisible()) {
            FragmentTransaction transaction = getSupportFragmentManager().beginTransaction();
            Fragment currentFragment = getVisibleFragment();
            if (currentFragment != null) {
                if (animate) {
//                    transaction.setCustomAnimations(R.anim.fragment_slide_left_enter, R.anim.fragment_slide_left_exit, R.anim.fragment_slide_right_enter, R.anim.fragment_slide_right_exit);
                }
                transaction.hide(currentFragment);
            }
            transaction.add(getFragmentRoot(), fragment, fragment.getFragmentTag());
            if (addToBackStack) {
                transaction.addToBackStack(fragment.getFragmentTag());
            }
            transaction.commit();
        }
    }


    protected Fragment getVisibleFragment() {
        FragmentManager fragmentManager = this.getSupportFragmentManager();
        List<Fragment> fragments = fragmentManager.getFragments();
        Collections.reverse(fragments);
        if(fragments != null){
            for(Fragment fragment : fragments){
                if(fragment != null && fragment.isVisible()) {
                    return fragment;
                }
            }
        }
        return null;
    }

    protected int getFragmentRoot() {
        return R.id.container;
    }

}

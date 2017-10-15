package com.anoulong.quickseries.screen.main;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.screen.BaseFragment;
import butterknife.ButterKnife;

/**
 * This class is only a wrapper to contain common methods to be use by the child fragment
 * It repesents the main screens of the app : Shortcut, Home, Account and Rule Fragment
 */
public abstract class MainFragment extends BaseFragment {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(getActivity()).inject(this);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ButterKnife.bind(this, view);
    }
}

package com.anoulong.quickseries.screen.main;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;

/**
 * Created by Anou on 2017-10-14.
 */

public class TabRestaurantFragment extends MainFragment {

    private static final String TAG = TabRestaurantFragment.class.getSimpleName();

    public static TabRestaurantFragment newInstance() {
        return new TabRestaurantFragment();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(getActivity()).inject(this);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_vacation, container, false);
    }


    @Override
    protected String getFragmentTitle() {
        return getString(R.string.tab_bar_restaurant);
    }
}

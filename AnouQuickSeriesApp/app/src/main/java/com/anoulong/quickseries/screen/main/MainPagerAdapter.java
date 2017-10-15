package com.anoulong.quickseries.screen.main;

import android.app.Activity;
import android.content.Context;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.anoulong.quickseries.R;

public class MainPagerAdapter extends FragmentPagerAdapter {
    public final int PAGE_COUNT = 2;
    private final int[] mTabsTitle = {
            R.string.tab_bar_restaurant,
            R.string.tab_bar_vacation};

    private int[] mTabsIcons = {
            R.drawable.item_tab_restaurant_selector,
            R.drawable.item_tab_vacation_selector};

    Context mContext;

    public MainPagerAdapter(FragmentManager fragmentManager, Activity context) {
        super(fragmentManager);
        mContext = context;
    }


    @Override
    public Fragment getItem(int position) {
        switch (position) {

            case 0:
                return TabRestaurantFragment.newInstance();
            case 1:
                return TabVacationFragment.newInstance();

        }
        return null;
    }

    @Override
    public int getCount() {
        return PAGE_COUNT;
    }


    public View getTabItemView(int position) {
        // Given you have a custom layout in `res/layout/custom_tab.xml` with a TextView and ImageView
        LayoutInflater inflater = (LayoutInflater) mContext.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        View view = inflater.inflate(R.layout.view_tab_item, null);

        TextView title = (TextView) view.findViewById(R.id.title);
        title.setText(mTabsTitle[position]);
        ImageView icon = (ImageView) view.findViewById(R.id.icon);
        icon.setImageResource(mTabsIcons[position]);
        return view;
    }
}
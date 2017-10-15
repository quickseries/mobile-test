package com.anoulong.quickseries.screen.restaurant;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;
import com.anoulong.quickseries.screen.BaseFragment;
import com.quickseries.restaurant.RestaurantContract;

import javax.inject.Inject;

import butterknife.BindView;
import retrofit2.Retrofit;

/**
 * Created by Anou on 2017-10-14.
 */

public class RestaurantDetailsFragment extends BaseFragment{

    private static final String TAG = RestaurantDetailsFragment.class.getSimpleName();
    public static final String KEY_RESTAURANT = TAG + "_KEY_RESTAURANT";

    @Inject
    Retrofit retrofit;

    private RestaurantContract.Restaurant restaurant;

    @BindView(R.id.fragment_restaurant_title)
    TextView fragmentRestaurantTitle;

    public static RestaurantDetailsFragment newInstance(RestaurantContract.Restaurant restaurant) {
        Bundle args = new Bundle();
        args.putSerializable(KEY_RESTAURANT, restaurant);
        RestaurantDetailsFragment fragment = new RestaurantDetailsFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(getActivity()).inject(this);
        if (getArguments() != null) {
            restaurant = (RestaurantContract.Restaurant)getArguments().getSerializable(KEY_RESTAURANT);
        }
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_details_restaurant, container, false);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.setupView();
    }

    private void setupView() {
        if(restaurant != null) {
            fragmentRestaurantTitle.setText(restaurant.getTitle());
        }

    }

    @Override
    protected String getFragmentTitle() {
        return getString(R.string.tab_bar_restaurant);
    }

    @Override
    protected String getFragmentTag() {
        return TAG;
    }

}

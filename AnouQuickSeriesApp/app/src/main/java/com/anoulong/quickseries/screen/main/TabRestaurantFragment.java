package com.anoulong.quickseries.screen.main;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;
import com.quickseries.restaurant.RestaurantContract;
import com.quickseries.restaurant.RestaurantPresenter;

import java.util.List;

import javax.inject.Inject;

import retrofit2.Retrofit;

/**
 * Created by Anou on 2017-10-14.
 */

public class TabRestaurantFragment extends MainFragment implements RestaurantContract.View{

    private static final String TAG = TabRestaurantFragment.class.getSimpleName();

    @Inject
    Retrofit retrofit;

    RestaurantPresenter presenter;

    public static TabRestaurantFragment newInstance() {
        return new TabRestaurantFragment();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(getActivity()).inject(this);
        presenter = new RestaurantPresenter(retrofit, this);
        presenter.loadRestaurants();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_restaurant, container, false);
    }

    @Override
    protected String getFragmentTitle() {
        return getString(R.string.tab_bar_restaurant);
    }

    @Override
    public void showRestaurant(List<RestaurantContract.Restaurant> restaurants) {

    }

    @Override
    public void showError(String message) {
        Toast.makeText(getActivity(), message, Toast.LENGTH_LONG).show();
    }

    @Override
    public void showComplete() {
    }
}

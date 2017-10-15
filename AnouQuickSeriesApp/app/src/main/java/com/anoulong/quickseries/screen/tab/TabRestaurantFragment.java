package com.anoulong.quickseries.screen.tab;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;
import com.anoulong.quickseries.screen.main.MainFragment;
import com.quickseries.restaurant.RestaurantContract;
import com.quickseries.restaurant.RestaurantPresenter;

import java.util.List;

import javax.inject.Inject;

import butterknife.BindView;
import retrofit2.Retrofit;

/**
 * Created by Anou on 2017-10-14.
 */

public class TabRestaurantFragment extends MainFragment implements RestaurantContract.View{

    private static final String TAG = TabRestaurantFragment.class.getSimpleName();

    @Inject
    Retrofit retrofit;

    @BindView(R.id.fragment_restaurant_recyclerview)
    RecyclerView recyclerview;

    private TabRestaurantAdapter adapter;

    RestaurantPresenter presenter;

    public static TabRestaurantFragment newInstance() {
        return new TabRestaurantFragment();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(getActivity()).inject(this);
        presenter = new RestaurantPresenter(retrofit, this, (RestaurantContract.Router)getActivity());
        presenter.loadRestaurants();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_tab_restaurant, container, false);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.setupView();
    }

    private void setupView() {
        adapter = new TabRestaurantAdapter(getActivity());
        recyclerview.setLayoutManager(new LinearLayoutManager(getActivity(), LinearLayoutManager.VERTICAL, false));
        recyclerview.setAdapter(adapter);
        adapter.setListener(new TabRestaurantAdapter.TabRestaurantAdapterClickListener() {
            @Override
            public void onAdapterClicked(RestaurantContract.Restaurant restaurant) {
                presenter.didSelectRestaurant(restaurant);
            }
        });

    }

    @Override
    protected String getFragmentTitle() {
        return getString(R.string.tab_bar_restaurant);
    }

    @Override
    protected String getFragmentTag() {
        return TAG;
    }

    // RestaurantContract.View
    @Override
    public void showRestaurant(List<RestaurantContract.Restaurant> restaurants) {
        adapter.setData(restaurants);
        adapter.notifyDataSetChanged();
    }

    @Override
    public void showError(String message) {
        Toast.makeText(getActivity(), message, Toast.LENGTH_LONG).show();
    }

    @Override
    public void showComplete() {

    }
}

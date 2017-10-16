package com.anoulong.quickseries.screen.tab;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.PopupMenu;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.Toast;

import com.annimon.stream.Collectors;
import com.annimon.stream.Stream;
import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;
import com.anoulong.quickseries.screen.main.MainFragment;
import com.quickseries.restaurant.RestaurantContract;
import com.quickseries.restaurant.RestaurantPresenter;

import org.apache.commons.lang3.StringUtils;

import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import butterknife.BindView;
import retrofit2.Retrofit;

/**
 * Created by Anou on 2017-10-14.
 */

public class TabRestaurantFragment extends MainFragment implements RestaurantContract.View {

    private static final String TAG = TabRestaurantFragment.class.getSimpleName();

    @Inject
    Retrofit retrofit;
    RestaurantPresenter presenter;

    @BindView(R.id.fragment_restaurant_recyclerview)
    RecyclerView recyclerview;
    @BindView(R.id.fragment_restaurant_overflow)
    ImageButton fragmentRestaurantOverflow;

    private TabRestaurantAdapter adapter;

    public static TabRestaurantFragment newInstance() {
        return new TabRestaurantFragment();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(getActivity()).inject(this);
        presenter = new RestaurantPresenter(retrofit, this, (RestaurantContract.Router) getActivity());
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

            @Override
            public void onAdapterOverflowClicked(View v, RestaurantContract.Restaurant.ContactInfo contactInfo) {
                showRestaurantPopup(v, contactInfo);
            }
        });
        fragmentRestaurantOverflow.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showRestaurantListPopup(v);
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

    // Implementation RestaurantContract.View
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
        // stop loading
    }

    public void showRestaurantListPopup(View v) {
        PopupMenu popup = new PopupMenu(getActivity(), v);
        MenuInflater inflater = popup.getMenuInflater();
        inflater.inflate(R.menu.menu_restaurant_list, popup.getMenu());
        popup.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {
                switch (item.getItemId()) {
                    case R.id.menu_restaurant_list_sort_ascending:
                        presenter.sortAscending(adapter.getData());
                        return true;
                    case R.id.menu_restaurant_list_descending:
                        presenter.sortDescending(adapter.getData());
                        return true;
                    default:
                        return false;
                }
            }
        });
        popup.show();
    }

    public void showRestaurantPopup(View v, final RestaurantContract.Restaurant.ContactInfo contactInfo) {
        PopupMenu popup = new PopupMenu(getActivity(), v);
        MenuInflater inflater = popup.getMenuInflater();
        inflater.inflate(R.menu.menu_restaurant, popup.getMenu());
        popup.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {
            @Override
            public boolean onMenuItemClick(MenuItem item) {

                switch (item.getItemId()) {
                    case R.id.menu_restaurant_website:
//                        showWebsite(contactInfo.getWebsite());
                        showWebsite("https://www.google.com");
                        return true;
                    case R.id.menu_restaurant_email:
//                        showEmail(contactInfo.getEmail());
                        showEmail("email@domain.com");
                        return true;
                    case R.id.menu_restaurant_phone:
//                            showPhone(contactInfo.getPhoneNumber());
                            showPhone("15147028287");
                        return true;
                    default:
                        return false;
                }
            }
        });
        popup.show();
    }

}

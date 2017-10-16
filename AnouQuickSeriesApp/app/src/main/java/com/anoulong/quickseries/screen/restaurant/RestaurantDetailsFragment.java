package com.anoulong.quickseries.screen.restaurant;

import android.graphics.Typeface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.AppBarLayout;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.anoulong.quickseries.AnouQuickSeriesApplication;
import com.anoulong.quickseries.R;
import com.anoulong.quickseries.screen.BaseFragment;
import com.quickseries.restaurant.RestaurantContract;
import com.squareup.picasso.Picasso;

import javax.inject.Inject;

import butterknife.BindView;
import retrofit2.Retrofit;

/**
 * Created by Anou on 2017-10-14.
 */

public class RestaurantDetailsFragment extends BaseFragment {

    private static final String TAG = RestaurantDetailsFragment.class.getSimpleName();
    public static final String KEY_RESTAURANT = TAG + "_KEY_RESTAURANT";

    @Inject
    Retrofit retrofit;

    private RestaurantContract.Restaurant restaurant;

    @BindView(R.id.collapsing_toolbar)
    CollapsingToolbarLayout collapsingToolbarLayout;
    @BindView(R.id.app_bar_layout)
    AppBarLayout appBarLayout;
    @BindView(R.id.toolbar_layout)
    Toolbar toolbar;
    @BindView(R.id.header_image)
    ImageView headerImage;
    @BindView(R.id.fragment_restaurant_details_address)
    TextView fragmentRestaurantDetailsAddress;
    @BindView(R.id.fragment_restaurant_details_description)
    TextView fragmentRestaurantDetailsDescription;
    @BindView(R.id.fragment_restaurant_details_phone_button)
    Button fragmentRestaurantDetailsPhoneButton;
    @BindView(R.id.fragment_restaurant_details_email_button)
    Button fragmentRestaurantDetailsEmailButton;
    @BindView(R.id.fragment_restaurant_details_website_button)
    Button fragment_restaurantDetailsWebsiteButton;
    @BindView(R.id.fragment_restaurant_details_direction_button)
    Button fragmentRestaurantDetailsDirectionButton;


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
            restaurant = (RestaurantContract.Restaurant) getArguments().getSerializable(KEY_RESTAURANT);
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
        this.setupToolbar();
        this.setupView();
        this.setupListener();
    }

    private void setupToolbar() {
        ((AppCompatActivity) getActivity()).setSupportActionBar(toolbar);
        ((AppCompatActivity) getActivity()).getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        // TODO: 2017-10-16 should be in a presenter
        toolbar.setNavigationOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                getActivity().onBackPressed();
            }
        });
    }

    private void setupView() {
        //collapsing parallax
        if (restaurant != null) {
            Picasso.with(getContext()).load(restaurant.getPhoto()).into(headerImage);
            collapsingToolbarLayout.setTitle(restaurant.getTitle());
            fragmentRestaurantDetailsDescription.setText(Html.fromHtml(restaurant.getDescription()));
            if (restaurant.getAddresses() != null && !restaurant.getAddresses().isEmpty()) {
                RestaurantContract.Restaurant.Address address = restaurant.getAddresses().get(0);

                if(address != null) {
                    fragmentRestaurantDetailsAddress.setText(address.getAddress1() + "\n" +
                            address.getCity() + ", " +
                            address.getState() + ", " +
                            address.getCountry() + "\n " +
                            address.getZipCode());
                }
            }
        }
    }

    private void setupListener() {
        fragmentRestaurantDetailsPhoneButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //showPhone(restaurant.getContactInfo().getPhoneNumber());
                showPhone("15147028287");
            }
        });

        fragmentRestaurantDetailsEmailButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //showEmail(restaurant.getContactInfo().getEmail());
                showEmail("email@domain.com");
            }
        });

        fragment_restaurantDetailsWebsiteButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //showWebsite(restaurant.getContactInfo().getWebsite());
                showWebsite("https://www.google.com");
            }
        });

        fragmentRestaurantDetailsDirectionButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (restaurant.getAddresses() != null && !restaurant.getAddresses().isEmpty()) {
                    RestaurantContract.Restaurant.Address address = restaurant.getAddresses().get(0);
                    if(address != null) {
                        RestaurantContract.Restaurant.Address.Gps gps = address.getGps();
                        if(gps != null) {
                            showMap(gps.getLatitude(), gps.getLongitude());
                        }
                    }
                }
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

}

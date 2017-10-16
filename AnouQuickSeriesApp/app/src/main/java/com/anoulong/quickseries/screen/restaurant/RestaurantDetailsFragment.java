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
    @BindView(R.id.fragment_restaurant_details_description)
    TextView fragmentRestaurantDetailsDescription;
    @BindView(R.id.fragment_restaurant_details_phone)
    TextView fragmentRestaurantDetailsPhone;
    @BindView(R.id.fragment_restaurant_details_email)
    TextView fragmentRestaurantDetailsEmail;
    @BindView(R.id.fragment_restaurant_details_website)
    TextView fragmentRestaurantDetailsWebsite;
    @BindView(R.id.fragment_restaurant_details_address)
    TextView fragmentRestaurantDetailsAddress;
    @BindView(R.id.fragment_restaurant_details_open_hours)
    TextView fragmentRestaurantDetailsOpenHours;


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
            fragmentRestaurantDetailsAddress.setText(restaurant.getAddresses().get(0).getAddress1());
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

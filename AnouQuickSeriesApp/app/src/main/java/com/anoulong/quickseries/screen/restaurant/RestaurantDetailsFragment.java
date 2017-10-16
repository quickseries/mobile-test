package com.anoulong.quickseries.screen.restaurant;

import android.graphics.Typeface;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.AppBarLayout;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
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

    //    @BindView(R.id.fragment_restaurant_title)
//    TextView fragmentRestaurantTitle;
//    @BindView(R.id.fragment_restaurant_image)
//    ImageView fragmentRestaurantImage;
    @BindView(R.id.collapsing_toolbar)
    CollapsingToolbarLayout collapsingToolbarLayout;
    @BindView(R.id.app_bar_layout)
    AppBarLayout appBarLayout;
    @BindView(R.id.toolbar_layout)
    Toolbar toolbar;
    @BindView(R.id.header_image)
    ImageView headerImage;


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

        //collapsing parallax
//        collapsingToolbarLayout.setContentScrimColor(ContextCompat.getColor(getActivity(), colorResId));
//        headerImage.setBackgroundColor(ContextCompat.getColor(getActivity(), colorResId));
//        appBarLayout.setBackgroundColor(ContextCompat.getColor(getActivity(), colorResId));
        if (restaurant != null) {
            Picasso.with(getContext()).load(restaurant.getPhoto()).into(headerImage);
            collapsingToolbarLayout.setTitle(restaurant.getTitle());
        }


        //prevent from overflow to be display when all room
//        setHasOptionsMenu(roomViewData.getRoomType() == HomeContract.RoomType.normal);
    }

    private void setupView() {
        if (restaurant != null) {
//            fragmentRestaurantTitle.setText(restaurant.getTitle());
//            Picasso.with(getContext()).load(restaurant.getPhoto()).into(fragmentRestaurantImage);
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

package com.anoulong.quickseries.screen.vacation;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.AppBarLayout;
import android.support.design.widget.CollapsingToolbarLayout;
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
import com.quickseries.vacation.VacationContract;
import com.squareup.picasso.Picasso;

import javax.inject.Inject;

import butterknife.BindView;
import retrofit2.Retrofit;

/**
 * Created by Anou on 2017-10-14.
 */

public class VacationDetailsFragment extends BaseFragment{

    private static final String TAG = VacationDetailsFragment.class.getSimpleName();
    public static final String KEY_VACATION = TAG + "_KEY_VACATION";

    @Inject
    Retrofit retrofit;

    private VacationContract.Vacation vacation;

    @BindView(R.id.collapsing_toolbar)
    CollapsingToolbarLayout collapsingToolbarLayout;
    @BindView(R.id.app_bar_layout)
    AppBarLayout appBarLayout;
    @BindView(R.id.toolbar_layout)
    Toolbar toolbar;
    @BindView(R.id.header_image)
    ImageView headerImage;

    public static VacationDetailsFragment newInstance(VacationContract.Vacation vacation) {
        Bundle args = new Bundle();
        args.putSerializable(KEY_VACATION, vacation);
        VacationDetailsFragment fragment = new VacationDetailsFragment();
        fragment.setArguments(args);
        return fragment;
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(getActivity()).inject(this);
        if (getArguments() != null) {
            vacation = (VacationContract.Vacation)getArguments().getSerializable(KEY_VACATION);
        }
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_details_vacation, container, false);
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
        if (vacation != null) {
            Picasso.with(getContext()).load(vacation.getPhoto()).into(headerImage);
            collapsingToolbarLayout.setTitle(vacation.getTitle());
        }
    }

    private void setupListener() {

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

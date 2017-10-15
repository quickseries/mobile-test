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
import com.quickseries.vacation.VacationContract;
import com.quickseries.vacation.VacationPresenter;

import java.util.List;

import javax.inject.Inject;

import butterknife.BindView;
import retrofit2.Retrofit;

/**
 * Created by Anou on 2017-10-14.
 */

public class TabVacationFragment extends MainFragment implements VacationContract.View {
    private static final String TAG = TabVacationFragment.class.getSimpleName();

    @Inject
    Retrofit retrofit;

    @BindView(R.id.fragment_vacation_recyclerview)
    RecyclerView recyclerview;

    private TabVacationAdapter adapter;

    VacationPresenter presenter;

    public static TabVacationFragment newInstance() {
        return new TabVacationFragment();
    }

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(getActivity()).inject(this);
        presenter = new VacationPresenter(retrofit, this, (VacationContract.Router)getActivity());
        presenter.loadVacationSpots();
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_vacation, container, false);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        this.setupView();
    }

    private void setupView() {
        adapter = new TabVacationAdapter(getActivity());
        recyclerview.setLayoutManager(new LinearLayoutManager(getActivity(), LinearLayoutManager.VERTICAL, false));
        recyclerview.setAdapter(adapter);
        adapter.setListener(new TabVacationAdapter.TabVacationAdapterClickListener() {
            @Override
            public void onAdapterClicked(VacationContract.Vacation vacation) {
                presenter.didSelectVacation(vacation);
            }
        });

    }

    @Override
    protected String getFragmentTitle() {
        return getString(R.string.tab_bar_vacation);
    }

    @Override
    public void showVacationSpots(List<VacationContract.Vacation> vacations) {
        adapter.setData(vacations);
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

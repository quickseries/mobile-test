package com.anoulong.quickseries.screen;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;

import com.anoulong.quickseries.AnouQuickSeriesApplication;

import javax.inject.Inject;

import butterknife.ButterKnife;
import rx.Subscription;
import rx.android.schedulers.AndroidSchedulers;
import rx.subscriptions.CompositeSubscription;
import timber.log.Timber;

/**
 * Created by Anou on 2017-10-14.
 */

public abstract class BaseFragment extends Fragment {

    @Inject
    CompositeSubscription fragmentSubscription;

    @Override
    public void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AnouQuickSeriesApplication.getApplicationComponent(getActivity()).inject(this);
    }
    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        ButterKnife.bind(this, view);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        clearObservables();
    }

    @Override
    public void onResume() {
        super.onResume();
        setupObservables();
    }

    @Override
    public void onPause() {
        clearObservables();
        super.onPause();
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        menu.clear();
        super.onCreateOptionsMenu(menu, inflater);
    }

    protected void addSubscription(Subscription subscription) {
        fragmentSubscription.add(subscription);
    }

    protected void clearObservables() {
        if (fragmentSubscription != null && !fragmentSubscription.isUnsubscribed()) {
            fragmentSubscription.unsubscribe();
        }
    }

    protected void setupObservables() {
        fragmentSubscription = new CompositeSubscription();
    }

    protected abstract String getFragmentTitle();

}

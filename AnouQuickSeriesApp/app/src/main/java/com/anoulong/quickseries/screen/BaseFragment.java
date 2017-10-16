package com.anoulong.quickseries.screen;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.support.v4.app.Fragment;
import android.support.v4.content.ContextCompat;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;

import com.anoulong.quickseries.AnouQuickSeriesApplication;

import java.util.Locale;

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
    protected abstract String getFragmentTag();

    protected void showWebsite(String url){
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
        startActivity(intent);
    }

    protected void showPhone(String phone) {
        if (ContextCompat.checkSelfPermission(getActivity(),
                Manifest.permission.CALL_PHONE)
                != PackageManager.PERMISSION_GRANTED) {
            ActivityCompat.requestPermissions(getActivity(),
                    new String[]{Manifest.permission.CALL_PHONE}, 1);
        }


        if (ContextCompat.checkSelfPermission(getActivity(),
                Manifest.permission.CALL_PHONE)
                == PackageManager.PERMISSION_GRANTED) {
            Intent callIntent = new Intent(Intent.ACTION_DIAL);
            callIntent.setData(Uri.parse("tel:+" + phone));

            startActivity(callIntent);
        }
    }

    protected void showEmail(String email) {
        Intent emailIntent = new Intent(Intent.ACTION_SENDTO, Uri.parse("mailto:" + email));
//        emailIntent.putExtra(Intent.EXTRA_SUBJECT, subject);
//        emailIntent.putExtra(Intent.EXTRA_TEXT, body);
//        emailIntent.putExtra(Intent.EXTRA_HTML_TEXT, body); //For HTML body text

        startActivity(Intent.createChooser(emailIntent, email));
    }

    protected void showMap(double latitude, double longitude) {
        String uri = String.format(Locale.ENGLISH, "geo:%f,%f", latitude, longitude);
        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
        startActivity(intent);
    }

}

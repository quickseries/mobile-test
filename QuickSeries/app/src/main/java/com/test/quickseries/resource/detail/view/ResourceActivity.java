package com.test.quickseries.resource.detail.view;

import android.content.Intent;
import android.databinding.DataBindingUtil;
import android.net.Uri;
import android.os.Bundle;
import android.telephony.PhoneNumberUtils;
import android.text.Html;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.MenuItem;

import com.squareup.picasso.Picasso;
import com.test.quickseries.R;
import com.test.quickseries.base.BaseActivity;
import com.test.quickseries.base.WebviewActivity;
import com.test.quickseries.base.model.Address;
import com.test.quickseries.base.model.Resource;
import com.test.quickseries.databinding.ActivityResourceBinding;
import com.test.quickseries.databinding.AddressCellBinding;
import com.test.quickseries.databinding.ContactInfoEmailCellBinding;
import com.test.quickseries.databinding.ContactInfoPhoneCellBinding;
import com.test.quickseries.databinding.ContactInfoWebsiteCellBinding;

import java.util.List;

import static android.view.View.GONE;
import static android.view.View.VISIBLE;

public class ResourceActivity extends BaseActivity implements ResourcePresenter.Viewable {

    public static final String RESOURCE = "RESOURCE";

    ActivityResourceBinding binding;
    private ResourcePresenter presenter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = DataBindingUtil.setContentView(this, R.layout.activity_resource);
        presenter = new ResourcePresenter(this);
        setupActionBar();
        onNewIntent(getIntent());
    }

    private void setupActionBar() {
        setSupportActionBar(binding.toolbar);
        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setDisplayShowTitleEnabled(true);
        }
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        presenter.load(getIntent().getParcelableExtra(RESOURCE));
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case android.R.id.home:
                onBackPressed();
                return true;
        }
        return (super.onOptionsItemSelected(item));
    }

    @Override
    public void showContent(Resource resource) {
        getSupportActionBar().setTitle(resource.getTitle());
        Picasso.with(this)
                .load(resource.getPhoto())
                .placeholder(getResources().getDrawable(R.drawable.placeholder_with_frame))
                .fit()
                .centerInside()
                .into(binding.image);
        assert binding.resourceDetail != null;
        binding.resourceDetail.resourceDescription.setText(Html.fromHtml(resource.getDescription()));

        buildContactInfo(resource);
        buildAddresses(resource);

    }

    private void buildAddresses(Resource resource) {
        binding.resourceDetail.addressContainer.removeAllViews();

        if (resource.getAddresses() != null && !resource.getAddresses().isEmpty()) {
            for (Address address : resource.getAddresses()) {
                if( TextUtils.isEmpty(address.getAddress1()) )
                    continue;
                AddressCellBinding addressCellBinding = DataBindingUtil.inflate(LayoutInflater.from(this), R.layout.address_cell, binding.resourceDetail.addressContainer, false);
                addressCellBinding.address1.setText(address.getAddress1());
                addressCellBinding.address2.setText(String.format("%s,%s %s", address.getCity(), address.getState(), address.getZipCode()));
                addressCellBinding.address3.setText(address.getCountry());
                if (address.getGps() != null && !TextUtils.isEmpty(address.getGps().getLatitude()) && !TextUtils.isEmpty(address.getGps().getLongitude())){
                    addressCellBinding.addressActions.setVisibility(VISIBLE);
                    addressCellBinding.addressActions.setOnClickListener(view -> showMap(address.getGps().getLatitude(), address.getGps().getLongitude()));
                } else {
                    addressCellBinding.addressActions.setVisibility(GONE);
                }
                binding.resourceDetail.addressContainer.addView(addressCellBinding.getRoot());
            }
        }
        boolean hasAddress = binding.resourceDetail.addressContainer.getChildCount() > 0;
        binding.resourceDetail.addressesTitle.setVisibility(hasAddress ? VISIBLE : GONE);
    }

    private void buildContactInfo(Resource resource) {

        binding.resourceDetail.contactInfoContainer.removeAllViews();
        if (resource.getContactInfo() != null) {
            buildContactNumber(resource.getContactInfo().getPhoneNumber(), R.string.phone_number, true);
            buildContactNumber(resource.getContactInfo().getTollFree(), R.string.toll_free_number, true);
            buildContactNumber(resource.getContactInfo().getFaxNumber(), R.string.fax_number, false);
            buildContactEmail(resource.getContactInfo().getEmail(), R.string.email);
            buildContactWebsite(resource.getContactInfo().getWebsite(), R.string.website);
        }
        boolean hasContactInfo = binding.resourceDetail.contactInfoContainer.getChildCount() > 0;
        binding.resourceDetail.contactInfoTitle.setVisibility(hasContactInfo ? VISIBLE : GONE);
    }


    private void buildContactNumber(List<String> phoneList, int titleResId, boolean allowActions) {
        if (phoneList != null) {
            for (String phoneNumber : phoneList) {
                if (TextUtils.isEmpty(phoneNumber))
                    continue;
                ContactInfoPhoneCellBinding contactInfoCellBinding = DataBindingUtil.inflate(LayoutInflater.from(this), R.layout.contact_info_phone_cell, binding.resourceDetail.contactInfoContainer, false);
                contactInfoCellBinding.phoneNumberTitle.setText(getString(titleResId));
                contactInfoCellBinding.phoneNumber.setText(PhoneNumberUtils.formatNumber(phoneNumber));
                contactInfoCellBinding.phoneActions.setVisibility(allowActions ? VISIBLE : GONE);
                contactInfoCellBinding.phoneActions.setOnClickListener(view -> callPhoneNumber(phoneNumber));
                binding.resourceDetail.contactInfoContainer.addView(contactInfoCellBinding.getRoot());
            }
        }
    }

    private void buildContactWebsite(List<String> websiteList, int titleResId) {
        if (websiteList != null) {
            for (String website : websiteList) {
                if (TextUtils.isEmpty(website))
                    continue;
                ContactInfoWebsiteCellBinding contactInfoCellBinding = DataBindingUtil.inflate(LayoutInflater.from(this), R.layout.contact_info_website_cell, binding.resourceDetail.contactInfoContainer, false);
                contactInfoCellBinding.websiteTitle.setText(getString(titleResId));
                contactInfoCellBinding.website.setText(website);
                contactInfoCellBinding.websiteActions.setOnClickListener( view -> openWebsite(website) );
                binding.resourceDetail.contactInfoContainer.addView(contactInfoCellBinding.getRoot());
            }
        }
    }

    private void buildContactEmail(List<String> emailList, int titleResId) {
        if (emailList != null) {
            for (String email : emailList) {
                if (TextUtils.isEmpty(email))
                    continue;
                ContactInfoEmailCellBinding contactInfoCellBinding = DataBindingUtil.inflate(LayoutInflater.from(this), R.layout.contact_info_email_cell, binding.resourceDetail.contactInfoContainer, false);
                contactInfoCellBinding.emailTitle.setText(getString(titleResId));
                contactInfoCellBinding.email.setText(email);
                contactInfoCellBinding.emailActions.setOnClickListener( view -> openEmail(email) );
                binding.resourceDetail.contactInfoContainer.addView(contactInfoCellBinding.getRoot());
            }
        }
    }

    private void openEmail(String email) {
        if (TextUtils.isEmpty(email))
            return;
        Intent intent = new Intent(Intent.ACTION_SENDTO);
        intent.setData(Uri.parse(String.format("mailto:%s",email)));
        if (intent.resolveActivity(getPackageManager()) != null) {
            startActivity(intent);
        }
    }

    public void callPhoneNumber(String phoneNumber) {
        if (TextUtils.isEmpty(phoneNumber))
            return;
        Intent intent = new Intent(Intent.ACTION_DIAL);
        intent.setData(Uri.parse("tel:" + phoneNumber));
        if (intent.resolveActivity(getPackageManager()) != null) {
            startActivity(intent);
        }
    }

    public void showMap(String latitude, String longitude) {
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(String.format("geo:%s,%s", latitude,longitude)));
        if (intent.resolveActivity(getPackageManager()) != null) {
            startActivity(intent);
        }
    }

    public void openWebsite(String url) {
        if (TextUtils.isEmpty(url))
            return;
        Intent intent = new Intent(this, WebviewActivity.class);
        intent.setData(Uri.parse(url));
        startActivity(intent);
    }


    @Override
    public void showError(Throwable thowable) {

    }

    @Override
    protected void onStart() {
        super.onStart();
        if (presenter != null)
            presenter.onStart();
    }

    @Override
    protected void onStop() {
        if (presenter != null)
            presenter.onStop();
        super.onStop();
    }


    @Override
    protected void onDestroy() {
        if (presenter != null)
            presenter.onDestroy();
        super.onDestroy();
    }
}

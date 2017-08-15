package com.derek.quickseriestest.mobile_test;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.derek.quickseriestest.mobile_test.entities.Address;
import com.derek.quickseriestest.mobile_test.entities.BizHours;
import com.derek.quickseriestest.mobile_test.entities.Category;
import com.derek.quickseriestest.mobile_test.entities.ContactInfo;
import com.derek.quickseriestest.mobile_test.entities.FreeText;
import com.derek.quickseriestest.mobile_test.entities.SocialMedia;
import com.google.gson.Gson;
import com.squareup.picasso.Picasso;

import java.util.List;

/**
 * Created by ddibblee on 8/14/2017.
 */

public class DetailsActivity extends AppCompatActivity {

    Category selectedCategory;
    TextView title;
    TextView description;
    ImageView photo;
    TextView contactInfoTitle;
    LinearLayout contactInfoLayout;
    TextView addressTitle;
    LinearLayout addressLayout;
    TextView notesTitle;
    LinearLayout notesLayout;
    TextView socialMediaTitle;
    LinearLayout socialMediaLayout;
    TextView businessHoursTitle;
    LinearLayout businessHoursLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_details);

        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        setupViews();
        setupDetails();
        fillContent();
    }

    public void setupViews() {
        this.title = (TextView) findViewById(R.id.details_title);
        this.description = (TextView) findViewById(R.id.details_description);
        this.contactInfoTitle = (TextView) findViewById(R.id.details_contactinfo_title);
        this.addressTitle = (TextView) findViewById(R.id.details_address_title);
        this.notesTitle = (TextView) findViewById(R.id.details_notes_title);
        this.socialMediaTitle = (TextView) findViewById(R.id.details_social_media_title);
        this.businessHoursTitle = (TextView) findViewById(R.id.details_biz_hours_title);
        this.contactInfoLayout = (LinearLayout) findViewById(R.id.details_contactinfo_content);
        this.addressLayout = (LinearLayout) findViewById(R.id.details_address_content);
        this.notesLayout = (LinearLayout) findViewById(R.id.details_notes_content);
        this.socialMediaLayout = (LinearLayout) findViewById(R.id.details_social_media_content);
        this.businessHoursLayout = (LinearLayout) findViewById(R.id.details_biz_hours_content);
        this.photo = (ImageView) findViewById(R.id.details_photo);
    }

    public void setupDetails() {
        Intent intent = getIntent();
        Gson gson = new Gson();
        this.selectedCategory = gson.fromJson(intent.getStringExtra("category"), Category.class);
    }

    public void fillContent() {
        if (selectedCategory.getTitle() != null) {
            title.setText(selectedCategory.getTitle());
        }
        if (selectedCategory.getDescription() != null) {
            title.setText(Html.fromHtml(selectedCategory.getDescription()).toString().trim());
        }

        String photoPath = selectedCategory.getPhoto();
        SocialMedia socialMedia = selectedCategory.getSocialMedia();
        List<Address> addresses = selectedCategory.getAddresses();
        ContactInfo contactInfo = selectedCategory.getContactInfo();
        BizHours businessHours = selectedCategory.getBizHours();
        List<FreeText> notes = selectedCategory.getFreeText();

        loadPhoto(photoPath);
        loadContactInfo(contactInfo);
        loadAddresses(addresses);
        //loadNotes(notes);
        //loadSocialMedia(socialMedia);
        //loadBusinessHours(businessHours);
    }

    private void loadPhoto(String photoPath) {
        if (photoPath == null) {
            photo.setVisibility(View.GONE);
        }
        else {
            Picasso.with(this).load(photoPath).into(photo);
        }
    }

    private void loadContactInfo(ContactInfo contactInfo) {
        if (contactInfo == null) {
            contactInfoTitle.setVisibility(View.GONE);
            contactInfoLayout.setVisibility(View.GONE);
        }
        else {
            //contactInfoLayout.addView(someViewForEachContactInfo);
        }
    }

    private void loadAddresses(List<Address> addresses) {
        if (addresses == null || addresses.size() == 0) {
            addressTitle.setVisibility(View.GONE);
            addressLayout.setVisibility(View.GONE);
        }
        else {

            LayoutInflater inflater = LayoutInflater.from(this);
            for (Address address : addresses) {
                View view = inflater.inflate(R.layout.address_view, addressLayout);
                TextView label = (TextView) view.findViewById(R.id.address_view_label);
                TextView address1 = (TextView) view.findViewById(R.id.address_view_address1);
                TextView cityStateZip = (TextView) view.findViewById(R.id.address_view_city_state_zipcode);
                TextView country = (TextView) view.findViewById(R.id.address_view_country);
                ImageView icon = (ImageView) view.findViewById(R.id.address_view_icon);

                label.setText(address.getLabel());
                address1.setText(address.getAddress1());
                cityStateZip.setText(address.getCity() + ", " + address.getState() + ", " + address.getZipCode());
                country.setText(address.getCountry());

            }
            //contactInfoLayout.addView(someViewForEachContactInfo);
        }
    }
}

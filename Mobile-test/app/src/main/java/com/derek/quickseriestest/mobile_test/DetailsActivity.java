package com.derek.quickseriestest.mobile_test;

import android.Manifest;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.ActivityCompat;
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
import com.derek.quickseriestest.mobile_test.entities.Friday;
import com.derek.quickseriestest.mobile_test.entities.Gps;
import com.derek.quickseriestest.mobile_test.entities.Monday;
import com.derek.quickseriestest.mobile_test.entities.Saturday;
import com.derek.quickseriestest.mobile_test.entities.SocialMedia;
import com.derek.quickseriestest.mobile_test.entities.Sunday;
import com.derek.quickseriestest.mobile_test.entities.Thursday;
import com.derek.quickseriestest.mobile_test.entities.Tuesday;
import com.derek.quickseriestest.mobile_test.entities.Wednesday;
import com.google.gson.Gson;
import com.squareup.picasso.Picasso;

import java.util.List;
import java.util.Locale;

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
    TextView socialMediaTitle;
    LinearLayout socialMediaLayout;
    TextView businessHoursTitle;
    LinearLayout businessHoursLayout;
    final int PERMISSION_REQUEST_CODE = 117;

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
        this.socialMediaTitle = (TextView) findViewById(R.id.details_social_media_title);
        this.businessHoursTitle = (TextView) findViewById(R.id.details_biz_hours_title);
        this.contactInfoLayout = (LinearLayout) findViewById(R.id.details_contactinfo_content);
        this.addressLayout = (LinearLayout) findViewById(R.id.details_address_content);
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
            description.setText(Html.fromHtml(selectedCategory.getDescription()).toString().trim());
        }

        String photoPath = selectedCategory.getPhoto();
        SocialMedia socialMedia = selectedCategory.getSocialMedia();
        List<Address> addresses = selectedCategory.getAddresses();
        ContactInfo contactInfo = selectedCategory.getContactInfo();
        BizHours businessHours = selectedCategory.getBizHours();

        loadPhoto(photoPath);
        loadContactInfo(contactInfo);
        loadAddresses(addresses);
        loadSocialMedia(socialMedia);
        loadBusinessHours(businessHours);
    }

    private void loadPhoto(String photoPath) {
        if (photoPath == null) {
            photo.setVisibility(View.GONE);
        } else {
            Picasso.with(this).load(photoPath).into(photo);
        }
    }

    private void loadContactInfo(ContactInfo contactInfo) {
        if (contactInfo == null) {
            contactInfoTitle.setVisibility(View.GONE);
            contactInfoLayout.setVisibility(View.GONE);
        } else {
            List<String> website = contactInfo.getWebsite();
            List<String> email = contactInfo.getEmail();
            List<String> phoneNumber = contactInfo.getPhoneNumber();
            List<String> faxNumber = contactInfo.getFaxNumber();
            List<String> tollFree = contactInfo.getTollFree();

            LayoutInflater inflater = LayoutInflater.from(this);

            if (website != null && website.size() > 0) {
                for (final String s : website) {
                    View view = inflater.inflate(R.layout.contact_info_view, null);
                    TextView contactInfoLabel = (TextView) view.findViewById(R.id.contact_info_label);
                    TextView contactInfoDetail = (TextView) view.findViewById(R.id.contact_info_detail);
                    ImageView contactInfoIcon1 = (ImageView) view.findViewById(R.id.contact_info_icon1);

                    contactInfoLabel.setText(R.string.website);
                    contactInfoDetail.setText(s);
                    contactInfoIcon1.setImageResource(R.drawable.ic_public_black_24dp);
                    contactInfoLayout.addView(view);

                    contactInfoIcon1.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            Intent intent = new Intent(v.getContext(), WebviewActivity.class);
                            intent.putExtra("url", s);
                            startActivity(intent);
                        }
                    });
                }
            }

            if (email != null && email.size() > 0) {
                for (final String s : email) {
                    View view = inflater.inflate(R.layout.contact_info_view, null);
                    TextView contactInfoLabel = (TextView) view.findViewById(R.id.contact_info_label);
                    TextView contactInfoDetail = (TextView) view.findViewById(R.id.contact_info_detail);
                    ImageView contactInfoIcon1 = (ImageView) view.findViewById(R.id.contact_info_icon1);

                    contactInfoLabel.setText(R.string.email);
                    contactInfoDetail.setText(s);
                    contactInfoIcon1.setImageResource(R.drawable.ic_email_black_24dp);
                    contactInfoLayout.addView(view);

                    contactInfoIcon1.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            Intent intent = new Intent(Intent.ACTION_SENDTO);
                            intent.setType("text/plain");
                            intent.putExtra(Intent.EXTRA_SUBJECT, "Hello from mobile-test");
                            intent.putExtra(Intent.EXTRA_TEXT, "Hello from mobile-test");
                            intent.setData(Uri.parse("mailto:" + s));
                            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                            startActivity(intent);
                        }
                    });
                }
            }

            if (phoneNumber != null && phoneNumber.size() > 0) {
                for (final String s : phoneNumber) {
                    View view = inflater.inflate(R.layout.contact_info_view, null);
                    TextView contactInfoLabel = (TextView) view.findViewById(R.id.contact_info_label);
                    TextView contactInfoDetail = (TextView) view.findViewById(R.id.contact_info_detail);
                    ImageView contactInfoIcon1 = (ImageView) view.findViewById(R.id.contact_info_icon1);
                    ImageView contactInfoIcon2 = (ImageView) view.findViewById(R.id.contact_info_icon2);

                    contactInfoLabel.setText(R.string.phone_number);
                    contactInfoDetail.setText(s);
                    contactInfoIcon1.setImageResource(R.drawable.ic_call_black_24dp);
                    contactInfoIcon2.setImageResource(R.drawable.ic_sms_black_24dp);
                    contactInfoLayout.addView(view);

                    contactInfoIcon1.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + s));
                            if (ActivityCompat.checkSelfPermission(v.getContext(), Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
                                ActivityCompat.requestPermissions(DetailsActivity.this, new String[]{ Manifest.permission.CALL_PHONE }, PERMISSION_REQUEST_CODE);
                                return;
                            }
                            startActivity(intent);
                        }
                    });

                    contactInfoIcon2.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            Intent intent = new Intent(Intent.ACTION_VIEW);
                            intent.setType("vnd.android-dir/mms-sms");
                            intent.putExtra("address", s);
                            startActivity(intent);
                        }
                    });
                }
            }

            if (faxNumber != null && faxNumber.size() > 0) {
                for (String s : faxNumber) {
                    View view = inflater.inflate(R.layout.contact_info_view, null);
                    TextView contactInfoLabel = (TextView) view.findViewById(R.id.contact_info_label);
                    TextView contactInfoDetail = (TextView) view.findViewById(R.id.contact_info_detail);

                    contactInfoLabel.setText(R.string.fax);
                    contactInfoDetail.setText(s);
                    contactInfoLayout.addView(view);
                }
            }

            if (tollFree != null && tollFree.size() > 0) {
                for (final String s : tollFree) {
                    View view = inflater.inflate(R.layout.contact_info_view, null);
                    TextView contactInfoLabel = (TextView) view.findViewById(R.id.contact_info_label);
                    TextView contactInfoDetail = (TextView) view.findViewById(R.id.contact_info_detail);
                    ImageView contactInfoIcon1 = (ImageView) view.findViewById(R.id.contact_info_icon1);

                    contactInfoLabel.setText(R.string.toll_free_number);
                    contactInfoDetail.setText(s);
                    contactInfoIcon1.setImageResource(R.drawable.ic_call_black_24dp);
                    contactInfoLayout.addView(view);

                    contactInfoIcon1.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + s));
                            if (ActivityCompat.checkSelfPermission(v.getContext(), Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
                                ActivityCompat.requestPermissions(DetailsActivity.this, new String[]{ Manifest.permission.CALL_PHONE }, PERMISSION_REQUEST_CODE);
                                return;
                            }
                            startActivity(intent);
                        }
                    });
                }
            }
        }
    }

    private void loadAddresses(List<Address> addresses) {
        if (addresses == null || addresses.size() == 0) {
            addressTitle.setVisibility(View.GONE);
            addressLayout.setVisibility(View.GONE);
        }
        else {
            LayoutInflater inflater = LayoutInflater.from(this);

            for (final Address address : addresses) {
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

                icon.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        Gps coordinates = address.getGps();
                        if (coordinates != null) {
                            String latitude = coordinates.getLatitude();
                            String longitude = coordinates.getLongitude();
                            String uri = String.format(Locale.ENGLISH, "geo:%s,%s?q=" + latitude + "," + longitude, latitude, longitude);
                            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
                            startActivity(intent);
                        }
                    }
                });
            }
        }
    }

    private void loadSocialMedia(final SocialMedia socialMedia) {
        if (socialMedia == null) {
            socialMediaTitle.setVisibility(View.GONE);
            socialMediaTitle.setVisibility(View.GONE);
        }
        else {
            List<String> twitter = socialMedia.getTwitter();
            List<String> facebook = socialMedia.getFacebook();
            List<String> youtube = socialMedia.getYoutubeChannel();


            float scale = getResources().getDisplayMetrics().density;
            int dbtopx = (int) (20*scale + 0.5f);

            if (twitter != null && twitter.size() > 0) {
                for (final String s : twitter) {
                    ImageView iv = new ImageView(this);
                    iv.setPadding(0, dbtopx, dbtopx, dbtopx);
                    iv.setImageResource(R.drawable.ic_twitter_social_icon_circle_color);
                    socialMediaLayout.addView(iv);

                    iv.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            if (s != null && s.length() > 0) {
                                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(s));
                                startActivity(intent);
                            }
                        }
                    });
                }
            }

            if (facebook != null && facebook.size() > 0) {
                for (final String s : facebook) {
                    ImageView iv = new ImageView(this);
                    iv.setPadding(0, dbtopx, dbtopx, dbtopx);
                    iv.setImageResource(R.drawable.ic_facebook_icon);
                    socialMediaLayout.addView(iv);

                    iv.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            if (s != null && s.length() > 0) {
                                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(s));
                                startActivity(intent);
                            }
                        }
                    });
                }
            }

            if (youtube != null && youtube.size() > 0) {
                for (final String s : youtube) {
                    ImageView iv = new ImageView(this);
                    iv.setPadding(0, dbtopx, dbtopx, dbtopx);
                    iv.setImageResource(R.drawable.ic_youtube_24dp);
                    socialMediaLayout.addView(iv);

                    iv.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            if (s != null && s.length() > 0) {
                                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(s));
                                startActivity(intent);
                            }
                        }
                    });
                }
            }
        }
    }

    private void loadBusinessHours(BizHours businessHours) {
        if (businessHours == null) {
            businessHoursTitle.setVisibility(View.GONE);
            businessHoursLayout.setVisibility(View.GONE);
        }
        else {
            Sunday sunday = businessHours.getSunday();
            Monday monday = businessHours.getMonday();
            Tuesday tuesday = businessHours.getTuesday();
            Wednesday wednesday = businessHours.getWednesday();
            Thursday thursday = businessHours.getThursday();
            Friday friday = businessHours.getFriday();
            Saturday saturday = businessHours.getSaturday();

            LayoutInflater inflater = LayoutInflater.from(this);
            View sundayView = inflater.inflate(R.layout.business_hours_view, null);
            View mondayView = inflater.inflate(R.layout.business_hours_view, null);
            View tuesdayView = inflater.inflate(R.layout.business_hours_view, null);
            View wednesdayView = inflater.inflate(R.layout.business_hours_view, null);
            View thursdayView = inflater.inflate(R.layout.business_hours_view, null);
            View fridayView = inflater.inflate(R.layout.business_hours_view, null);
            View saturdayView = inflater.inflate(R.layout.business_hours_view, null);

            ((TextView) sundayView.findViewById(R.id.business_hours_title)).setText(R.string.sunday);
            ((TextView) mondayView.findViewById(R.id.business_hours_title)).setText(R.string.monday);
            ((TextView) tuesdayView.findViewById(R.id.business_hours_title)).setText(R.string.tuesday);
            ((TextView) wednesdayView.findViewById(R.id.business_hours_title)).setText(R.string.wednesday);
            ((TextView) thursdayView.findViewById(R.id.business_hours_title)).setText(R.string.thursday);
            ((TextView) fridayView.findViewById(R.id.business_hours_title)).setText(R.string.friday);
            ((TextView) saturdayView.findViewById(R.id.business_hours_title)).setText(R.string.saturday);

            TextView sundayLabel = (TextView) sundayView.findViewById(R.id.business_hours_label);
            if (sunday != null) {
                sundayLabel.setText(sunday.getFrom() + " - " + sunday.getTo());
            }
            else {
                sundayLabel.setText("00 AM - 00 AM");
            }
            businessHoursLayout.addView(sundayView);

            TextView mondayLabel = (TextView) mondayView.findViewById(R.id.business_hours_label);
            if (monday != null) {
                mondayLabel.setText(monday.getFrom() + " - " + monday.getTo());
            }
            else {
                mondayLabel.setText("00 AM - 00 AM");
            }
            businessHoursLayout.addView(mondayView);

            TextView tuesdayLabel = (TextView) tuesdayView.findViewById(R.id.business_hours_label);
            if (tuesday != null) {
                tuesdayLabel.setText(tuesday.getFrom() + " - " + tuesday.getTo());
            }
            else {
                tuesdayLabel.setText("00 AM - 00 AM");
            }
            businessHoursLayout.addView(tuesdayView);

            TextView wednesdayLabel = (TextView) wednesdayView.findViewById(R.id.business_hours_label);
            if (wednesday != null) {
                wednesdayLabel.setText(wednesday.getFrom() + " - " + wednesday.getTo());
            }
            else {
                wednesdayLabel.setText("00 AM - 00 AM");
            }
            businessHoursLayout.addView(wednesdayView);

            TextView thursdayLabel = (TextView) thursdayView.findViewById(R.id.business_hours_label);
            if (thursday != null) {
                thursdayLabel.setText(thursday.getFrom() + " - " + thursday.getTo());
            }
            else {
                thursdayLabel.setText("00 AM - 00 AM");
            }
            businessHoursLayout.addView(thursdayView);

            TextView fridayLabel = (TextView) fridayView.findViewById(R.id.business_hours_label);
            if (friday != null) {
                fridayLabel.setText(friday.getFrom() + " - " + friday.getTo());
            }
            else {
                fridayLabel.setText("00 AM - 00 AM");
            }
            businessHoursLayout.addView(fridayView);

            TextView saturdayLabel = (TextView) saturdayView.findViewById(R.id.business_hours_label);
            if (saturday != null) {
                saturdayLabel.setText(saturday.getFrom() + " - " + saturday.getTo());
            }
            else {
                saturdayLabel.setText("00 AM - 00 AM");
            }
            businessHoursLayout.addView(saturdayView);
        }
    }
}

package ca.ivasenko.mobiletest.details.ui;

import android.Manifest;
import android.arch.lifecycle.Observer;
import android.arch.lifecycle.ViewModelProviders;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.bumptech.glide.Glide;

import java.util.List;
import java.util.Locale;

import ca.ivasenko.mobiletest.R;
import ca.ivasenko.mobiletest.resources.model.Address;
import ca.ivasenko.mobiletest.resources.model.BusinessDay;
import ca.ivasenko.mobiletest.resources.model.BusinessHours;
import ca.ivasenko.mobiletest.resources.model.ContactInfo;
import ca.ivasenko.mobiletest.resources.model.Gps;
import ca.ivasenko.mobiletest.resources.model.ResourceObject;
import ca.ivasenko.mobiletest.resources.model.SocialMedia;
import ca.ivasenko.mobiletest.resources.ui.ResourcesActivity;

public class DetailsActivity extends AppCompatActivity
{
    final int PERMISSION_REQUEST_CODE = 1;

    private ImageView imageView;
    private TextView objectTitle;
    private TextView objectDescription;
    private TextView contactInfoTitle;
    private LinearLayout contactInfoLayout;
    private TextView addressTitle;
    private LinearLayout addressLayout;
    private TextView socialMediaTitle;
    private LinearLayout socialMediaLayout;
    private TextView businessHoursTitle;
    private LinearLayout businessHoursLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_details);

        initViews();

        int objectId = getIntent().getIntExtra(ResourcesActivity.RESOURCE_OBJECT_ID_EXTRA, 0);

        DetailsViewModel detailsViewModel = ViewModelProviders.of(this).get(DetailsViewModel.class);
        detailsViewModel.getResourceObject(objectId).observe(this, new Observer<ResourceObject>()
        {
            @Override
            public void onChanged(@Nullable ResourceObject resourceObject)
            {
                updateUI(resourceObject);
            }
        });
    }

    //region PRIVATE METHODS
    private void initViews()
    {
        imageView = findViewById(R.id.image);
        objectTitle = findViewById(R.id.objectTitle);
        objectDescription = findViewById(R.id.object_description);

        contactInfoTitle = findViewById(R.id.contactinfoTitle);
        contactInfoLayout = findViewById(R.id.details_contact_info);
        addressTitle = findViewById(R.id.addressTitle);
        addressLayout = findViewById(R.id.details_address);
        socialMediaTitle = findViewById(R.id.socialMediaTitle);
        socialMediaLayout = findViewById(R.id.details_social_media);
        businessHoursTitle = findViewById(R.id.businessHoursTitle);
        businessHoursLayout = findViewById(R.id.details_business_hours);
    }

    private void updateUI(ResourceObject resourceObject)
    {
        Glide.with(getApplicationContext())
                .load(resourceObject.getPhoto())
                .into(imageView);
        objectTitle.setText(resourceObject.getTitle());
        String description = resourceObject.getDescription();
        if (description != null && !description.isEmpty())
            objectDescription.setText(Html.fromHtml(description).toString().trim());

        updateContactInfo(resourceObject.getContactInfo());
        updateSocialMedia(resourceObject.getSocialMedia());
        updateBusinessHours(resourceObject.getBizHours());
        updateAddresses(resourceObject.getAddresses());
    }

    private void updateContactInfo(ContactInfo contactInfo)
    {
        if (contactInfo == null)
        {
            contactInfoTitle.setVisibility(View.GONE);
            contactInfoLayout.setVisibility(View.GONE);
        } else
        {
            List<String> website = contactInfo.getWebsite();
            List<String> email = contactInfo.getEmail();
            List<String> phoneNumber = contactInfo.getPhoneNumber();
            List<String> faxNumber = contactInfo.getFaxNumber();
            List<String> tollFree = contactInfo.getTollFree();

            LayoutInflater inflater = LayoutInflater.from(this);

            if (phoneNumber != null && !phoneNumber.isEmpty())
            {
                for (final String s : phoneNumber)
                {
                    View view = getContactInfoView(inflater, s, R.string.phone_number, R.drawable.ic_local_phone_black_24dp);
                    if(view != null)
                    {
                        view.setOnClickListener(v ->
                        {
                            Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + s));
                            if (ActivityCompat.checkSelfPermission(v.getContext(), Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED)
                            {
                                ActivityCompat.requestPermissions(DetailsActivity.this, new String[]{Manifest.permission.CALL_PHONE}, PERMISSION_REQUEST_CODE);
                                return;
                            }
                            startActivity(intent);
                        });
                    }
                }
            }

            if (tollFree != null && !tollFree.isEmpty())
            {
                for (final String s : tollFree)
                {
                    View view = getContactInfoView(inflater, s, R.string.toll_free_number, R.drawable.ic_local_phone_black_24dp);
                    if(view != null)
                    {
                        view.setOnClickListener(v ->
                        {
                            Intent intent = new Intent(Intent.ACTION_CALL, Uri.parse("tel:" + s));
                            if (ActivityCompat.checkSelfPermission(v.getContext(), Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED)
                            {
                                ActivityCompat.requestPermissions(DetailsActivity.this, new String[]{Manifest.permission.CALL_PHONE}, PERMISSION_REQUEST_CODE);
                                return;
                            }
                            startActivity(intent);
                        });
                    }
                }
            }

            if (faxNumber != null && !faxNumber.isEmpty())
            {
                for (String s : faxNumber)
                {
                    getContactInfoView(inflater, s, R.string.fax_number, R.drawable.ic_local_phone_black_24dp);
                }
            }

            if (email != null && !email.isEmpty())
            {
                for (final String s : email)
                {
                    View view = getContactInfoView(inflater, s, R.string.email_address, R.drawable.ic_email_black_24dp);
                    if(view != null)
                    {
                        view.setOnClickListener(v ->
                        {
                            Intent intent = new Intent(Intent.ACTION_SENDTO);
                            intent.setType("text/plain");
                            intent.setData(Uri.parse("mailto:" + s));
                            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                            startActivity(intent);
                        });
                    }
                }
            }

            if (website != null && !website.isEmpty())
            {
                for (final String s : website)
                {
                    View view = getContactInfoView(inflater, s, R.string.website, R.drawable.ic_web_24dp);
                    if(view != null)
                    {
                        view.setOnClickListener(v ->
                        {
                            Intent intent = new Intent(v.getContext(), WebActivity.class);
                            intent.putExtra(WebActivity.URL, s);
                            startActivity(intent);
                        });
                    }
                }
            }
        }
    }

    private View getContactInfoView(LayoutInflater inflater, String s, int title, int icon)
    {
        if(s == null || s.isEmpty())
            return null;

        View view = inflater.inflate(R.layout.contact_info_view, null);
        TextView contactInfoLabel = view.findViewById(R.id.contact_info_label);
        TextView contactInfoDetail = view.findViewById(R.id.contact_info_detail);
        ImageView contactInfoIcon1 = view.findViewById(R.id.contact_info_icon);

        contactInfoLabel.setText(title);
        contactInfoDetail.setText(s);
        contactInfoIcon1.setImageResource(icon);
        contactInfoLayout.addView(view);
        return view;
    }

    private void updateAddresses(List<Address> addresses)
    {
        if (addresses == null || addresses.isEmpty())
        {
            addressTitle.setVisibility(View.GONE);
            addressLayout.setVisibility(View.GONE);
        } else
        {
            LayoutInflater inflater = LayoutInflater.from(this);

            for (final Address address : addresses)
            {
                if(address != null)
                {
                    View view = inflater.inflate(R.layout.address_view, addressLayout);
                    TextView label = view.findViewById(R.id.address_view_label);
                    TextView address1 = view.findViewById(R.id.address_view_address1);
                    TextView cityStateZip = view.findViewById(R.id.address_view_city_state_zipcode);
                    TextView country = view.findViewById(R.id.address_view_country);
                    ImageView icon = view.findViewById(R.id.address_view_icon);

                    label.setText(address.getLabel() == null ? "" : address.getLabel());
                    address1.setText(address.getAddress1() == null ? "" : address.getAddress1());
                    String city = address.getCity() == null ? "" : address.getCity();
                    String state = address.getState() == null ? "" : address.getState();
                    String zipCode = address.getZipCode() == null ? "" : address.getZipCode();
                    cityStateZip.setText(getString(R.string.cityStateZip, city, state, zipCode));
                    country.setText(address.getCountry());

                    view.setOnClickListener(v ->
                    {
                        Gps coordinates = address.getGps();
                        if (coordinates != null)
                        {
                            String latitude = coordinates.getLatitude();
                            String longitude = coordinates.getLongitude();
                            String uri = String.format(Locale.ENGLISH, "geo:%s,%s?q=" + latitude + "," + longitude, latitude, longitude);
                            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
                            startActivity(intent);
                        }
                    });
                }
            }
        }
    }

    private void updateBusinessHours(BusinessHours businessHours)
    {
        if (businessHours == null)
        {
            businessHoursTitle.setVisibility(View.GONE);
            businessHoursLayout.setVisibility(View.GONE);
        } else
        {
            LayoutInflater inflater = LayoutInflater.from(this);
            addBusinessHoursView(businessHours.getSunday(), inflater);
            addBusinessHoursView(businessHours.getMonday(), inflater);
            addBusinessHoursView(businessHours.getTuesday(), inflater);
            addBusinessHoursView(businessHours.getWednesday(), inflater);
            addBusinessHoursView(businessHours.getThursday(), inflater);
            addBusinessHoursView(businessHours.getFriday(), inflater);
            addBusinessHoursView(businessHours.getSaturday(), inflater);
        }
    }

    private void addBusinessHoursView(BusinessDay businessDay, LayoutInflater inflater)
    {
        if (businessDay != null)
        {
            View sundayView = inflater.inflate(R.layout.business_hours_view, null);
            TextView title = sundayView.findViewById(R.id.business_hours_title);
            title.setText(businessDay.getClass().getSimpleName());
            TextView label = sundayView.findViewById(R.id.business_hours_label);
            label.setText(getString(R.string.businessHoursFromToTime, businessDay.getFrom(), businessDay.getTo()));
            businessHoursLayout.addView(sundayView);
        }
    }

    private void updateSocialMedia(final SocialMedia socialMedia)
    {
        if (socialMedia == null)
        {
            socialMediaTitle.setVisibility(View.GONE);
            socialMediaTitle.setVisibility(View.GONE);
        } else
        {
            List<String> facebook = socialMedia.getFacebook();
            List<String> twitter = socialMedia.getTwitter();
            List<String> youtube = socialMedia.getYoutubeChannel();

            if (facebook != null && !facebook.isEmpty())
            {
                for (final String s : facebook)
                {
                    addMediaIcon(s, R.drawable.ic_facebook_box);
                }
            }

            if (twitter != null && !twitter.isEmpty())
            {
                for (final String s : twitter)
                {
                    addMediaIcon(s, R.drawable.ic_twitter_box);
                }
            }

            if (youtube != null && !youtube.isEmpty())
            {
                for (final String s : youtube)
                {
                    addMediaIcon(s, R.drawable.ic_youtube);
                }
            }
        }
    }

    private void addMediaIcon(String url, int ic_facebook_box)
    {
        ImageView iv = new ImageView(this);
        iv.setImageResource(ic_facebook_box);
        socialMediaLayout.addView(iv);

        iv.setOnClickListener(v ->
        {
            if (url != null && url.length() > 0)
            {
                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                startActivity(intent);
            }
        });
    }
    //endregion
}

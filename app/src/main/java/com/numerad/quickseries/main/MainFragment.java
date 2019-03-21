package com.numerad.quickseries.main;

import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ListView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.numerad.quickseries.R;
import com.numerad.quickseries.domain.Contact;
import com.numerad.quickseries.domain.Day;
import com.numerad.quickseries.json.Address;
import com.numerad.quickseries.json.Category;
import com.numerad.quickseries.json.ContactInfo;
import com.numerad.quickseries.json.DayInfo;
import com.numerad.quickseries.json.Hours;
import com.numerad.quickseries.json.Resource;
import com.numerad.quickseries.json.SocialMedia;
import com.numerad.quickseries.main.adapters.CategoryAdapter;
import com.numerad.quickseries.main.adapters.DetailsAdapter;
import com.numerad.quickseries.main.adapters.HoursAdapter;
import com.numerad.quickseries.main.adapters.ResourceAdapter;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import butterknife.BindView;
import butterknife.ButterKnife;

public class MainFragment extends Fragment implements
        MainContract.View {

    private MainContract.Presenter presenter;
    private ArrayList<Contact> contacts = new ArrayList<>();
    private ArrayList<Day> days = new ArrayList<>();

    // adapters

    private CategoryAdapter categoryAdapter;
    private ResourceAdapter resourceAdapter;
    private ResourceAdapter vacationAdapter;
    private DetailsAdapter detailsAdapter;
    private HoursAdapter hoursAdapter;

    // lists

    @BindView(R.id.categories_list)
    ListView categoryList;

    @BindView(R.id.restaurants_list)
    ListView restaurantList;

    @BindView(R.id.vacations_list)
    ListView vacationList;

    @BindView(R.id.contacts_list)
    ListView contactsList;

    @BindView(R.id.hours_list)
    ListView hoursList;

    // layouts

    @BindView(R.id.categories_layout)
    LinearLayout categorylayout;

    @BindView(R.id.details_layout)
    LinearLayout detailsLayout;

    @BindView(R.id.hours_layout)
    LinearLayout hoursLayout;

    @BindView(R.id.socials_layout)
    LinearLayout socialsLayout;

    // buttons

    @BindView(R.id.facebook_button)
    ImageButton facebookButton;

    @BindView(R.id.twitter_button)
    ImageButton twitterButton;

    @BindView(R.id.youtube_button)
    ImageButton youtubeButton;

    @BindView(R.id.sort_button)
    ImageButton sortButton;

    @BindView(R.id.sort_direction)
    ImageView sortDirection;

    public static MainFragment newInstance() {
        return new MainFragment();
    }

    // Fragment

    @Override public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View mainView = inflater.inflate(R.layout.content_main, container, false);
        ButterKnife.bind(this, mainView);

        categoryAdapter = new CategoryAdapter(getContext(), new ArrayList<>());
        resourceAdapter = new ResourceAdapter(getContext(), new ArrayList<>(), restaurantList);
        vacationAdapter = new ResourceAdapter(getContext(), new ArrayList<>(), vacationList);
        detailsAdapter = new DetailsAdapter(getContext(), contacts);
        hoursAdapter = new HoursAdapter(getContext(), days);

        categoryList.setAdapter(categoryAdapter);
        restaurantList.setAdapter(resourceAdapter);
        vacationList.setAdapter(vacationAdapter);
        contactsList.setAdapter(detailsAdapter);
        hoursList.setAdapter(hoursAdapter);

        categoryList.setOnItemClickListener((parent, view, position, id) -> presenter.onCategoryClicked(position));
        restaurantList.setOnItemClickListener((parent, view, position, id) -> presenter.onRestaurantClicked(position));
        vacationList.setOnItemClickListener((parent, view, position, id) -> presenter.onVacationClicked(position));

        sortButton.setOnClickListener(v -> presenter.toggleSortOrder());
        sortDirection.setOnClickListener(v -> presenter.toggleSortOrder());

        return mainView;
    }

    @Override
    public void onDestroyView() {
        presenter.onDestroyed();
        super.onDestroyView();
    }

    @Override
    public void onDetach() {
        presenter.onViewDetached();
        super.onDetach();
    }

    // BaseView

    @Override
    public void setPresenter(@Nullable MainContract.Presenter presenter) {
        this.presenter = presenter;
    }

    @Override
    public void onViewAttached() {
        clear();
    }

    @Override
    public void showCategories(List<Category> categories) {
        clear();
        categorylayout.setVisibility(View.VISIBLE);
        categoryAdapter.addAll(categories);
    }

    @Override
    public void showRestaurants(List<Resource> restaurants) {
        clear();
        restaurantList.setVisibility(View.VISIBLE);
        resourceAdapter.addAll(restaurants);
    }

    @Override
    public void showVacations(List<Resource> vacations) {
        clear();
        vacationList.setVisibility(View.VISIBLE);
        vacationAdapter.addAll(vacations);
    }

    @Override
    public void showResourceDetail(Resource resource) {
        clear();

        // process contacts
        ContactInfo contactInfo = resource.getContactInfo();
        processContact(contactInfo.getPhoneNumber(), "Phone number");
        processContact(contactInfo.getTollFree(), "Toll-free number");
        processContact(contactInfo.getFaxNumber(), "Fax number");
        processContact(contactInfo.getEmail(), "Email address");
        processContact(contactInfo.getWebsite(), "Website");

        List<Address> addresses = resource.getAddresses();
        if (addresses != null) {
            for (Address address : addresses) {
                if (address == null) {
                    continue;
                }

                Contact contact = new Contact("Address");

                String addr = address.getAddress1() + "\n" +
                        address.getCity() + ", " + address.getState() + " " + address.getZipCode() + "\n" +
                        address.getCountry();

                contact.setDescription(addr);
                contact.setAddress(true);
                contacts.add(contact);
            }
        }

        if (contacts.size() > 0) {
            detailsLayout.setVisibility(View.VISIBLE);
            detailsAdapter.notifyDataSetChanged();
        }

        // process biz hours
        Hours hours = resource.getHours();
        if (hours != null) {
            processDay(hours.getMonday(), "Monday");
            processDay(hours.getTuesday(), "Tuesday");
            processDay(hours.getWednesday(), "Wednesday");
            processDay(hours.getThursday(), "Thursday");
            processDay(hours.getFriday(), "Friday");
            processDay(hours.getSaturday(), "Saturday");
            processDay(hours.getSunday(), "Sunday");

            hoursLayout.setVisibility(days.size() > 0 ? View.VISIBLE : View.GONE);
            hoursAdapter.notifyDataSetChanged();
        }

        // process social media
        SocialMedia socialMedia = resource.getSocialMedia();
        if (socialMedia != null) {
            List<String> list = socialMedia.getFacebook();
            if (list != null && list.get(0) != null) {
                String url = list.get(0);
                facebookButton.setVisibility(View.VISIBLE);
                facebookButton.setClickable(true);
                facebookButton.setOnClickListener(v -> {
                    try {
                        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                        startActivity(intent);
                    } catch (Exception e) {
                        Log.d("MainFragment","Can't start activity");
                    }
                });
            }

            list = socialMedia.getTwitter();
            if (list != null && list.get(0) != null) {
                String url = list.get(0);
                twitterButton.setVisibility(View.VISIBLE);
                twitterButton.setClickable(true);
                twitterButton.setOnClickListener(v -> {
                    try {
                        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                        startActivity(intent);
                    } catch (Exception e) {
                        Log.d("MainFragment","Can't start activity");
                    }
                });
            }

            list = socialMedia.getYoutubeChannel();
            if (list != null && list.get(0) != null) {
                String url = list.get(0);
                youtubeButton.setVisibility(View.VISIBLE);
                youtubeButton.setClickable(true);
                youtubeButton.setOnClickListener(v -> {
                    try {
                        Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
                        startActivity(intent);
                    } catch (Exception e) {
                        Log.d("MainFragment","Can't start activity");
                    }
                });
            }
        }
    }

    @Override
    public void updateSortDirection(boolean isAlphabetical) {
        Drawable drawable = getContext().getResources().getDrawable(isAlphabetical ?
                R.drawable.baseline_arrow_downward_black_24 :
                R.drawable.baseline_arrow_upward_black_24, null);
        sortDirection.setImageDrawable(drawable);
    }

    @Override
    public List<Category> getCategories() {

        Gson gson = new Gson();
        Type type = new TypeToken<List<Category>>() {}.getType();
        String categories = loadJsonFromAsset(R.raw.categories);
        List<Category> fromJson = gson.fromJson(categories, type);

        return fromJson;
    }

    @Override
    public List<Resource> getResources(int id) {

        Gson gson = new Gson();
        Type type = new TypeToken<List<Resource>>() {}.getType();
        String string = loadJsonFromAsset(id);
        List<Resource> fromJson = gson.fromJson(string, type);

        return fromJson;
    }

    // privates

    private String loadJsonFromAsset(int resource) {
        String json = null;
        try {
            InputStream is = getContext().getResources().openRawResource(resource);
            int size = is.available();
            byte[] buffer = new byte[size];
            is.read(buffer);
            is.close();
            json = new String(buffer, "UTF-8");
        } catch (IOException ex) {
            ex.printStackTrace();
            return null;
        }

        return json;
    }

    private void clear() {

        categoryAdapter.clear();
        categorylayout.setVisibility(View.GONE);

        resourceAdapter.clear();
        vacationAdapter.clear();
        restaurantList.setVisibility(View.GONE);
        vacationList.setVisibility(View.GONE);

        detailsAdapter.clear();
        hoursAdapter.clear();
        detailsLayout.setVisibility(View.GONE);
        hoursLayout.setVisibility(View.GONE);

        twitterButton.setVisibility(View.GONE);
        facebookButton.setVisibility(View.GONE);
        youtubeButton.setVisibility(View.GONE);
    }

    private void processDay(DayInfo day, String title) {

        if (day == null) {
            return;
        }

        days.add(new Day(title, day.getFrom() + " to " + day.getTo()));
    }

    private void processContact(List<String> list, String title) {

        if (list == null || list.get(0) == null) {
            return;
        }

        Contact contact = new Contact(title);
        contact.setDescription(list.get(0));
        title = title.toLowerCase();

        if (title.contains("fax")) {
            contact.setFax(true);
        }

        if (title.contains("website")) {
            contact.setWebsite(true);
        }

        if (title.contains("email")) {
            contact.setEmail(true);
        }

        if (title.contains("address") && !title.contains("email")) {
            contact.setAddress(true);
        }

        if (title.contains("phone") || title.contains("toll")) {
            contact.setPhone(true);
        }

        contacts.add(contact);
    }
}

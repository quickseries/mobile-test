package mobiletest.yucef.ca.mobiletest;

import android.content.Context;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.CardView;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mobiletest.yucef.ca.mobiletest.model.Address;
import mobiletest.yucef.ca.mobiletest.model.BusinessHours;
import mobiletest.yucef.ca.mobiletest.model.ContactInfo;
import mobiletest.yucef.ca.mobiletest.model.Resource;

import static mobiletest.yucef.ca.mobiletest.ResourcesActivity.RESOURCES_PATH_EXTRA;

public class ResourceActivity extends AppCompatActivity {
    public static final String RESOURCE_ID_EXTRA = "resource-id";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_resource);

        Resource resource = getResourceFromFile(getIntent().getStringExtra(RESOURCES_PATH_EXTRA),
                getIntent().getStringExtra(RESOURCE_ID_EXTRA));

        resource = null;

    }

    private Resource getResourceFromFile(String path, String id){
        try {
            JSONArray categoriesJSONArray = new JSONArray(loadJSONFromAsset(this, path + ".json"));

            for (int i = 0; i < categoriesJSONArray.length(); i++) {
                JSONObject category = categoriesJSONArray.getJSONObject(i);
                String categoryId = category.optString("_id");
                if(categoryId != null && categoryId.equals(id)) {
                    JSONArray addressesJSONArray = category.optJSONArray("addresses");
                    List<Address> addresses = new ArrayList<>();
                    if (addressesJSONArray != null) {
                        for(int j = 0; j < addressesJSONArray.length(); j++) {
                            JSONObject addressJson = addressesJSONArray.optJSONObject(j);
                            if(addressJson != null) {
                                JSONObject locationJson = addressJson.optJSONObject("gps");
                                long latitude = 0;
                                long longitude = 0;
                                if (locationJson != null) {
                                    latitude = locationJson.getLong("latitude");
                                    longitude = locationJson.getLong("longitude");
                                }
                                if (addressJson.optString("address1", null) != null) {
                                    addresses.add(new Address(addressJson.getString("address1"),
                                            addressJson.getString("label"),
                                            addressJson.getString("zipCode"),
                                            addressJson.getString("city"),
                                            addressJson.getString("state"),
                                            addressJson.getString("country"),
                                            latitude,
                                            longitude));
                                }
                            }
                        }
                    }

                    JSONObject contactInfo = category.optJSONObject("contactInfo");
                    String website = null;
                    String email = null;
                    String phoneNumber = null;
                    String faxNumber = null;
                    String tollFreeNumber = null;
                    if (contactInfo != null) {
                        JSONArray websiteJSONArray = contactInfo.optJSONArray("website");
                        website = null;
                        if(websiteJSONArray != null && websiteJSONArray.length() > 0) {
                            website = (String) websiteJSONArray.get(0);
                        }
                        JSONArray emailJSONArray = contactInfo.optJSONArray("email");
                        email = null;
                        if(emailJSONArray != null && emailJSONArray.length() > 0) {
                            email = (String) emailJSONArray.get(0);
                        }
                        JSONArray phoneNumberJSONArray = contactInfo.optJSONArray("phoneNumber");
                        phoneNumber = null;
                        if(phoneNumberJSONArray != null && phoneNumberJSONArray.length() > 0) {
                            phoneNumber = (String) phoneNumberJSONArray.get(0);
                        }
                        JSONArray faxNumberJSONArray = contactInfo.optJSONArray("faxNumber");
                        faxNumber = null;
                        if(faxNumberJSONArray != null && faxNumberJSONArray.length() > 0) {
                            faxNumber = (String) faxNumberJSONArray.get(0);
                        }
                        JSONArray tollFreeJSONArray = contactInfo.optJSONArray("tollFreeNumber");
                        tollFreeNumber = null;
                        if(tollFreeJSONArray != null && tollFreeJSONArray.length() > 0) {
                            tollFreeNumber = (String) tollFreeJSONArray.get(0);
                        }
                    }

                    JSONObject bizHoursJson = category.optJSONObject("bizHours");

                    JSONObject mondayHours;
                    JSONObject tuesdayHours;
                    JSONObject wednesdayHours;
                    JSONObject thursdayHours;
                    JSONObject fridayHours;
                    JSONObject saturdayHours;
                    JSONObject sundayHours;

                    Map<String, BusinessHours> bizHours = new HashMap();

                    if (bizHoursJson != null) {
                        mondayHours = bizHoursJson.optJSONObject("monday");
                        if(mondayHours != null) {
                            bizHours.put("monday", new BusinessHours(mondayHours.getString("from"),
                                    mondayHours.getString("to")));
                        }
                        tuesdayHours = bizHoursJson.optJSONObject("tuesday");
                        if(tuesdayHours != null) {
                            bizHours.put("tuesday", new BusinessHours(tuesdayHours.getString("from"),
                                    tuesdayHours.getString("to")));
                        }
                        wednesdayHours = bizHoursJson.optJSONObject("wednesday");
                        if(wednesdayHours != null) {
                            bizHours.put("wednesday", new BusinessHours(wednesdayHours.getString("from"),
                                    wednesdayHours.getString("to")));
                        }
                        thursdayHours = bizHoursJson.optJSONObject("thursday");
                        if(thursdayHours != null) {
                            bizHours.put("thursday", new BusinessHours(thursdayHours.getString("from"),
                                    thursdayHours.getString("to")));
                        }
                        fridayHours = bizHoursJson.optJSONObject("friday");
                        if(fridayHours != null) {
                            bizHours.put("friday", new BusinessHours(fridayHours.getString("from"),
                                    fridayHours.getString("to")));
                        }
                        saturdayHours = bizHoursJson.optJSONObject("saturday");
                        if(saturdayHours != null) {
                            bizHours.put("saturday", new BusinessHours(saturdayHours.getString("from"),
                                    saturdayHours.getString("to")));
                        }
                        sundayHours = bizHoursJson.optJSONObject("sunday");
                        if(sundayHours != null) {
                            bizHours.put("sunday", new BusinessHours(sundayHours.getString("from"),
                                    sundayHours.getString("to")));
                        }
                    }

                    return new Resource(category.optString("_id", "N/A"),
                            category.optString("title", "Title"),
                            category.optString("description", "Description"),
                            category.getString("photo"),
                            addresses,
                            new ContactInfo(website, email, phoneNumber, faxNumber, tollFreeNumber),
                            bizHours);
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return null;
    }

    public String loadJSONFromAsset(Context context, String fileName) {
        String json;

        try {
            InputStream is = context.getAssets().open(fileName);
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
}

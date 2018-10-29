package com.quickseries.mobiletest.entities;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.Serializable;

public class Address implements Serializable {
    private static final String LABEL = "label";
    private static final String ADDRESS1 = "address1";
    private static final String ZIP_CODE = "zipCode";
    private static final String CITY = "city";
    private static final String STATE = "state";
    private static final String COUNTRY = "country";

    private String label;
    private String address1;
    private String zipCode;
    private String city;
    private String state;
    private String country;

    Address(JSONObject jsonObject) throws JSONException {
        if (jsonObject.has(LABEL))
            this.label = jsonObject.getString(LABEL);
        if (jsonObject.has(ADDRESS1))
            this.address1 = jsonObject.getString(ADDRESS1);
        if (jsonObject.has(ZIP_CODE))
            this.zipCode = jsonObject.getString(ZIP_CODE);
        if (jsonObject.has(CITY))
            this.city = jsonObject.getString(CITY);
        if (jsonObject.has(STATE))
            this.state = jsonObject.getString(STATE);
        if (jsonObject.has(COUNTRY))
            this.country = jsonObject.getString(COUNTRY);
    }

    public String getLabel() {
        return label;
    }

    public String getAddress1() {
        return address1;
    }

    public String getZipCode() {
        return zipCode;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getCountry() {
        return country;
    }
}

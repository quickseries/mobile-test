package com.quickseries.mobiletest.entities;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.Serializable;

public class Resource implements Serializable {
    private static final String TITLE = "title";
    private static final String DESCRIPTION = "description";
    private static final String PHOTO = "photo";
    private static final String ADDRESSES = "addresses";
    private static final String CONTACT_INFO = "contactInfo";
    private static final String SOCIAL_MEDIA = "socialMedia";
    private static final String PHONE_NUMBER = "phoneNumber";
    private static final String TOLL_FREE = "tollFree";
    private static final String FAX_NUMBER = "faxNumber";
    private static final String EMAIL = "email";
    private static final String WEBSITE = "website";

    private String title;
    private String description;
    private String photo;
    private String phoneNumber;
    private String tollFreeNumber;
    private String faxNumber;
    private String email;
    private String website;
    private String facebook;
    private String twitter;
    private String youtube;
    private Address address;

    public Resource(JSONObject jsonObject) throws JSONException {
        this.title = jsonObject.getString(TITLE);
        this.description = jsonObject.getString(DESCRIPTION);
        this.photo = jsonObject.getString(PHOTO);
        if (jsonObject.has(ADDRESSES))
            this.address = new Address(jsonObject.getJSONArray(ADDRESSES).getJSONObject(0));
        if (jsonObject.has(CONTACT_INFO))
            readContactInfo(jsonObject.getJSONObject(CONTACT_INFO));
        if (jsonObject.has(SOCIAL_MEDIA))
        readSocialMedia(jsonObject.getJSONObject(SOCIAL_MEDIA));
    }

    private void readContactInfo(JSONObject jsonObject) throws JSONException {
        if (jsonObject.has(PHONE_NUMBER))
            this.phoneNumber = jsonObject.getJSONArray(PHONE_NUMBER).getString(0);
        if (jsonObject.has(TOLL_FREE))
            this.tollFreeNumber = jsonObject.getJSONArray(TOLL_FREE).getString(0);
        if (jsonObject.has(FAX_NUMBER))
            this.faxNumber = jsonObject.getJSONArray(FAX_NUMBER).getString(0);
        if (jsonObject.has(EMAIL))
            this.email = jsonObject.getJSONArray(EMAIL).getString(0);
        if (jsonObject.has(WEBSITE))
            this.website = jsonObject.getJSONArray(WEBSITE).getString(0);
    }

    private void readSocialMedia(JSONObject jsonObject) throws JSONException {
        this.facebook = jsonObject.getJSONArray("facebook").getString(0);
        this.twitter = jsonObject.getJSONArray("twitter").getString(0);
        this.youtube = jsonObject.getJSONArray("youtubeChannel").getString(0);
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getPhoto() {
        return photo;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public String getTollFreeNumber() {
        return tollFreeNumber;
    }

    public String getFaxNumber() {
        return faxNumber;
    }

    public String getEmail() {
        return email;
    }

    public String getWebsite() {
        return website;
    }

    public String getFacebook() {
        return facebook;
    }

    public String getTwitter() {
        return twitter;
    }

    public String getYoutube() {
        return youtube;
    }

    public Address getAddress() {
        return address;
    }
}

package com.books.quickseries.data.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by zakir on 06/09/2018.
 */

public class ContactInfo {


    @SerializedName("website")
    @Expose
    private List<String> website = null;
    @SerializedName("email")
    @Expose
    private List<String> email = null;
    @SerializedName("faxNumber")
    @Expose
    private List<String> faxNumber = null;
    @SerializedName("tollFree")
    @Expose
    private List<String> tollFree = null;
    @SerializedName("phoneNumber")
    @Expose
    private List<String> phoneNumber = null;

    public List<String> getWebsite() {
        return website;
    }

    public void setWebsite(List<String> website) {
        this.website = website;
    }

    public List<String> getEmail() {
        return email;
    }

    public void setEmail(List<String> email) {
        this.email = email;
    }

    public List<String> getFaxNumber() {
        return faxNumber;
    }

    public void setFaxNumber(List<String> faxNumber) {
        this.faxNumber = faxNumber;
    }

    public List<String> getTollFree() {
        return tollFree;
    }

    public void setTollFree(List<String> tollFree) {
        this.tollFree = tollFree;
    }

    public List<String> getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(List<String> phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}

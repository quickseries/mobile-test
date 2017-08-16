package com.derek.quickseriestest.mobile_test.entities;

import java.util.List;

/**
 * Created by ddibblee on 8/14/2017.
 * This class contains information about business contact information
 */

public class ContactInfo {

    private List<String> website = null;
    private List<String> email = null;
    private List<String> phoneNumber = null;
    private List<String> faxNumber = null;
    private List<String> tollFree = null;

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

    public List<String> getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(List<String> phoneNumber) {
        this.phoneNumber = phoneNumber;
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
}

package com.quickseriestest.models;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public class Contact {
    List<String> website;
    List<String> email;
    List<String> phoneNumber;
    List<String> faxNumber;
    List<String> tollFree;

    public Contact() {
    }

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

package com.numerad.quickseries.domain;

public class Contact {
    private String title;
    private String description;
    private boolean isPhone;
    private boolean isFax;
    private boolean isWebsite;
    private boolean isEmail;
    private boolean isAddress;

    public Contact(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isPhone() {
        return isPhone;
    }

    public void setPhone(boolean phone) {
        isPhone = phone;
    }

    public boolean isWebsite() {
        return isWebsite;
    }

    public void setWebsite(boolean website) {
        isWebsite = website;
    }

    public boolean isEmail() {
        return isEmail;
    }

    public void setEmail(boolean email) {
        isEmail = email;
    }

    public boolean isFax() {
        return isFax;
    }

    public void setFax(boolean fax) {
        isFax = fax;
    }

    public boolean isAddress() {
        return isAddress;
    }

    public void setAddress(boolean address) {
        isAddress = address;
    }
}

package mobiletest.yucef.ca.mobiletest.model;

public class ContactInfo {
    String website;
    String email;
    String phoneNumber;

    public ContactInfo(String website, String email, String phoneNumber) {
        this.website = website;
        this.email = email;
        this.phoneNumber = phoneNumber;
    }

    public String getWebsite() {
        return website;
    }

    public String getEmail() {
        return email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
}

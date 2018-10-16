package mobiletest.yucef.ca.mobiletest.model;

public class ContactInfo {
    String website;
    String email;
    String phoneNumber;
    String faxNumber;
    String tollFree;

    public ContactInfo(String website, String email, String phoneNumber, String faxNumber, String tollFree) {
        this.website = website;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.faxNumber = faxNumber;
        this.tollFree = tollFree;
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

    public String getFaxNumber() {
        return faxNumber;
    }

    public String getTollFree() {
        return tollFree;
    }
}

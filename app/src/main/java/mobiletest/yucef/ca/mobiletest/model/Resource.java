package mobiletest.yucef.ca.mobiletest.model;

import java.util.List;

import mobiletest.yucef.ca.mobiletest.ResourcesActivity;

public class Resource {
    String id;
    String title;
    String description;
    String photoUrl;
    List<Address> addresses;
    List<ContactInfo> contactInfoList;

    public Resource(String id, String title, String description, String photoUrl, List<Address> addresses, List<ContactInfo> contactInfoList) {
        this.title = title;
        this.id = id;
        this.description = description;
        this.photoUrl = photoUrl;
        this.addresses = addresses;
        this.contactInfoList = contactInfoList;
    }

    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public List<Address> getAddresses() {
        return addresses;
    }

    public List<ContactInfo> getContactInfoList() {
        return contactInfoList;
    }
}

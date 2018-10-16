package mobiletest.yucef.ca.mobiletest.model;

import java.util.List;
import java.util.Map;

public class Resource {
    String id;
    String title;
    String description;
    String photoUrl;
    List<Address> addresses;
    ContactInfo contactInfo;
    Map<String, BusinessHours> businessHours;

    public Resource(String id, String title, String description, String photoUrl, List<Address> addresses, ContactInfo contactInfo,
                    Map<String, BusinessHours> businessHours) {
        this.title = title;
        this.id = id;
        this.description = description;
        this.photoUrl = photoUrl;
        this.addresses = addresses;
        this.contactInfo = contactInfo;
        this.businessHours = businessHours;
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

    public ContactInfo getContactInfo() {
        return contactInfo;
    }

    public Map<String, BusinessHours> getBusinessHours() {
        return businessHours;
    }
}

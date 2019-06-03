package com.test.mobile_test.model.resource;

import android.os.Parcel;
import android.os.Parcelable;

import java.util.Map;

public class ResourceModel implements Parcelable {
    private String eid;

    private Addresses[] addresses;

    private SocialMedia socialMedia;

    private ContactInfo contactInfo;

    private String description;

    private String photo;

    private String created_at;

    private String title;

    private String category_eid;

    private String updated_at;

    private String __v;

    private String _active;

    private String _id;

    private String slug;

    private Map<String, BizHours> bizHours;


    public ResourceModel() {
    }

    protected ResourceModel(Parcel in) {
        eid = in.readString();
        description = in.readString();
        photo = in.readString();
        created_at = in.readString();
        title = in.readString();
        category_eid = in.readString();
        updated_at = in.readString();
        __v = in.readString();
        _active = in.readString();
        _id = in.readString();
        slug = in.readString();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(eid);
        dest.writeString(description);
        dest.writeString(photo);
        dest.writeString(created_at);
        dest.writeString(title);
        dest.writeString(category_eid);
        dest.writeString(updated_at);
        dest.writeString(__v);
        dest.writeString(_active);
        dest.writeString(_id);
        dest.writeString(slug);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<ResourceModel> CREATOR = new Creator<ResourceModel>() {
        @Override
        public ResourceModel createFromParcel(Parcel in) {
            return new ResourceModel(in);
        }

        @Override
        public ResourceModel[] newArray(int size) {
            return new ResourceModel[size];
        }
    };

    public Map<String, BizHours> getBizHours() {
        return bizHours;
    }

    public SocialMedia getSocialMedia() {
        return socialMedia;
    }

    public void setSocialMedia(SocialMedia socialMedia) {
        this.socialMedia = socialMedia;
    }

    public void setBizHours(Map<String, BizHours> bizHours) {
        this.bizHours = bizHours;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public Addresses[] getAddresses() {
        return addresses;
    }

    public void setAddresses(Addresses[] addresses) {
        this.addresses = addresses;
    }

    public ContactInfo getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(ContactInfo contactInfo) {
        this.contactInfo = contactInfo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory_eid() {
        return category_eid;
    }

    public void setCategory_eid(String category_eid) {
        this.category_eid = category_eid;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public String get__v() {
        return __v;
    }

    public void set__v(String __v) {
        this.__v = __v;
    }

    public String get_active() {
        return _active;
    }

    public void set_active(String _active) {
        this._active = _active;
    }

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }


    public static class Addresses {
        private String zipCode;

        private String country;

        private String city;

        private String address1;

        private String label;

        private String state;

        private Gps gps;

        public String getZipCode() {
            return zipCode;
        }

        public void setZipCode(String zipCode) {
            this.zipCode = zipCode;
        }

        public String getCountry() {
            return country;
        }

        public void setCountry(String country) {
            this.country = country;
        }

        public String getCity() {
            return city;
        }

        public void setCity(String city) {
            this.city = city;
        }

        public String getAddress1() {
            return address1;
        }

        public void setAddress1(String address1) {
            this.address1 = address1;
        }

        public String getLabel() {
            return label;
        }

        public void setLabel(String label) {
            this.label = label;
        }

        public String getState() {
            return state;
        }

        public void setState(String state) {
            this.state = state;
        }

        public Gps getGps() {
            return gps;
        }

        public void setGps(Gps gps) {
            this.gps = gps;
        }

        @Override
        public String toString() {
            return "ClassPojo [zipCode = " + zipCode + ", country = " + country + ", city = " + city + ", address1 = " + address1 + ", label = " + label + ", state = " + state + "]";
        }
    }

    public static class SocialMedia {
        private String[] twitter;

        private String[] youtubeChannel;

        private String[] facebook;

        public String[] getTwitter() {
            return twitter;
        }

        public void setTwitter(String[] twitter) {
            this.twitter = twitter;
        }

        public String[] getYoutubeChannel() {
            return youtubeChannel;
        }

        public void setYoutubeChannel(String[] youtubeChannel) {
            this.youtubeChannel = youtubeChannel;
        }

        public String[] getFacebook() {
            return facebook;
        }

        public void setFacebook(String[] facebook) {
            this.facebook = facebook;
        }

        @Override
        public String toString() {
            return "ClassPojo [twitter = " + twitter + ", youtubeChannel = " + youtubeChannel + ", facebook = " + facebook + "]";
        }
    }

    public static class ContactInfo {
        private String[] website;

        private String[] phoneNumber;

        private String[] email;

        private String[] faxNumber;

        private String[] tollFree;

        public String[] getFaxNumber() {
            return faxNumber;
        }

        public void setFaxNumber(String[] faxNumber) {
            this.faxNumber = faxNumber;
        }

        public String[] getTollFree() {
            return tollFree;
        }

        public void setTollFree(String[] tollFree) {
            this.tollFree = tollFree;
        }

        public String[] getWebsite() {
            return website;
        }

        public void setWebsite(String[] website) {
            this.website = website;
        }

        public String[] getPhoneNumber() {
            return phoneNumber;
        }

        public void setPhoneNumber(String[] phoneNumber) {
            this.phoneNumber = phoneNumber;
        }

        public String[] getEmail() {
            return email;
        }

        public void setEmail(String[] email) {
            this.email = email;
        }

        @Override
        public String toString() {
            return "ClassPojo [website = " + website + ", phoneNumber = " + phoneNumber + ", email = " + email + "]";
        }
    }

    public static class Gps {
        private String latitude;

        private String longitude;

        public String getLatitude() {
            return latitude;
        }

        public void setLatitude(String latitude) {
            this.latitude = latitude;
        }

        public String getLongitude() {
            return longitude;
        }

        public void setLongitude(String longitude) {
            this.longitude = longitude;
        }

        @Override
        public String toString() {
            return "ClassPojo [latitude = " + latitude + ", longitude = " + longitude + "]";
        }
    }

    public static class BizHours {
        String from;

        String to;

        public String getFrom() {
            return from;
        }

        public void setFrom(String from) {
            this.from = from;
        }

        public String getTo() {
            return to;
        }

        public void setTo(String to) {
            this.to = to;
        }
    }
}

package com.quickseriestest.models;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public class VacationSpot {
    private String _id;
    private String slug;
    private String eid;
    private String title;
    private String description;
    private String __v;
    private String category_eid;
    private String photo;
    private boolean _isActive;
    private String created_at;
    private String updated_at;
    private List<Address> addresses;
    private Contact contactInfo;
    private SocialMedia socialMedia;
    private List<FreeText> freeText;

    public VacationSpot() {
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

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
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

    public String get__v() {
        return __v;
    }

    public void set__v(String __v) {
        this.__v = __v;
    }

    public String getCategory_eid() {
        return category_eid;
    }

    public void setCategory_eid(String category_eid) {
        this.category_eid = category_eid;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public boolean is_isActive() {
        return _isActive;
    }

    public void set_isActive(boolean _isActive) {
        this._isActive = _isActive;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    public Contact getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(Contact contactInfo) {
        this.contactInfo = contactInfo;
    }

    public SocialMedia getSocialMedia() {
        return socialMedia;
    }

    public void setSocialMedia(SocialMedia socialMedia) {
        this.socialMedia = socialMedia;
    }

    public List<FreeText> getFreeText() {
        return freeText;
    }

    public void setFreeText(List<FreeText> freeText) {
        this.freeText = freeText;
    }
}

package com.derek.quickseriestest.mobile_test.entities;

import java.util.List;

/**
 * Created by ddibblee on 8/14/2017.
 * Category class to hold all information about a category
 */

public class Category {

    private String id;
    private String updatedAt;
    private String slug;
    private String photo;
    private String customModuleEid;
    private String categoryEid;
    private String eid;
    private String title;
    private String description;
    private Integer v;
    private Boolean active;
    private String createdAt;
    private SocialMedia socialMedia;
    private BizHours bizHours;
    private List<Address> addresses = null;
    private List<FreeText> freeText = null;
    private ContactInfo contactInfo;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getCustomModuleEid() {
        return customModuleEid;
    }

    public void setCustomModuleEid(String customModuleEid) {
        this.customModuleEid = customModuleEid;
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

    public Integer getV() {
        return v;
    }

    public void setV(Integer v) {
        this.v = v;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getCategoryEid() {
        return categoryEid;
    }

    public void setCategoryEid(String categoryEid) {
        this.categoryEid = categoryEid;
    }

    public SocialMedia getSocialMedia() {
        return socialMedia;
    }

    public void setSocialMedia(SocialMedia socialMedia) {
        this.socialMedia = socialMedia;
    }

    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    public List<FreeText> getFreeText() {
        return freeText;
    }

    public void setFreeText(List<FreeText> freeText) {
        this.freeText = freeText;
    }

    public ContactInfo getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(ContactInfo contactInfo) {
        this.contactInfo = contactInfo;
    }

    public BizHours getBizHours() {
        return bizHours;
    }

    public void setBizHours(BizHours bizHours) {
        this.bizHours = bizHours;
    }
}

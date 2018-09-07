package com.books.quickseries.data.model;


import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by zakir on 06/09/2018.
 */


public class Category {

    @SerializedName("_id")
    @Expose
    private String id;

    @SerializedName("updated_at")
    @Expose
    private String updatedAt;

    @SerializedName("slug")
    @Expose
    private String slug;

    @SerializedName("custom_module_eid")
    @Expose
    private String customModuleEid;

    @SerializedName("eid")
    @Expose
    private String eid;

    @SerializedName("title")
    @Expose
    private String title;

    @SerializedName("description")
    @Expose
    private String description;

    @SerializedName("__v")
    @Expose
    private Integer v;

    @SerializedName("_active")
    @Expose
    private Boolean active;

    @SerializedName("created_at")
    @Expose
    private String createdAt;

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

    public class Categories {
        public List<Category> categories;
    }
}

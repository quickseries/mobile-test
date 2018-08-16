package com.quickseriestest.models;

/**
 * Created by Vijen on 2018-08-16.
 */

public class Category {

    private String _id;
    private String eid;
    private String custom_module_eid;
    private String slug;
    private String title;
    private String description;
    private String __v;
    private boolean _isActive;
    private String created_at;
    private String updated_at;

    public Category() {
    }

    public Category(String _id, String eid, String custom_module_eid, String slug, String title, String description, String __v, boolean _isActive, String created_at, String updated_at) {
        this._id = _id;
        this.eid = eid;
        this.custom_module_eid = custom_module_eid;
        this.slug = slug;
        this.title = title;
        this.description = description;
        this.__v = __v;
        this._isActive = _isActive;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getCustom_module_eid() {
        return custom_module_eid;
    }

    public void setCustom_module_eid(String custom_module_eid) {
        this.custom_module_eid = custom_module_eid;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
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
}

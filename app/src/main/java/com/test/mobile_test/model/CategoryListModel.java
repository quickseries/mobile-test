package com.test.mobile_test.model;

import android.os.Parcel;
import android.os.Parcelable;

public class CategoryListModel implements Parcelable {
    private String eid;
    private String updated_at;
    private int __v;
    private String description;
    private String created_at;
    private boolean _active;
    private String _id;
    private String title;
    private String slug;
    private String custom_module_eid;

    public CategoryListModel() {
    }


    public CategoryListModel(String title) {
        this.title = title;
    }

    public CategoryListModel(Parcel in) {
        eid = in.readString();
        updated_at = in.readString();
        __v = in.readInt();
        description = in.readString();
        created_at = in.readString();
        _active = in.readByte() != 0;
        _id = in.readString();
        title = in.readString();
        slug = in.readString();
        custom_module_eid = in.readString();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(eid);
        dest.writeString(updated_at);
        dest.writeInt(__v);
        dest.writeString(description);
        dest.writeString(created_at);
        dest.writeByte((byte) (_active ? 1 : 0));
        dest.writeString(_id);
        dest.writeString(title);
        dest.writeString(slug);
        dest.writeString(custom_module_eid);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<CategoryListModel> CREATOR = new Creator<CategoryListModel>() {
        @Override
        public CategoryListModel createFromParcel(Parcel in) {
            return new CategoryListModel(in);
        }

        @Override
        public CategoryListModel[] newArray(int size) {
            return new CategoryListModel[size];
        }
    };

    public String getEid() {
        return this.eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getUpdated_at() {
        return this.updated_at;
    }

    public void setUpdated_at(String updated_at) {
        this.updated_at = updated_at;
    }

    public int get__v() {
        return this.__v;
    }

    public void set__v(int __v) {
        this.__v = __v;
    }

    public String getDescription() {
        return this.description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreated_at() {
        return this.created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public boolean get_active() {
        return this._active;
    }

    public void set_active(boolean _active) {
        this._active = _active;
    }

    public String get_id() {
        return this._id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSlug() {
        return this.slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }

    public String getCustom_module_eid() {
        return this.custom_module_eid;
    }

    public void setCustom_module_eid(String custom_module_eid) {
        this.custom_module_eid = custom_module_eid;
    }

    @Override
    public String toString() {
        return "Category{" +
                "eid='" + eid + '\'' +
                ", updated_at='" + updated_at + '\'' +
                ", __v=" + __v +
                ", description='" + description + '\'' +
                ", created_at='" + created_at + '\'' +
                ", _active=" + _active +
                ", _id='" + _id + '\'' +
                ", title='" + title + '\'' +
                ", slug='" + slug + '\'' +
                ", custom_module_eid='" + custom_module_eid + '\'' +
                '}';
    }


}

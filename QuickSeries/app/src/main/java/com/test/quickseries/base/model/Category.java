package com.test.quickseries.base.model;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.gson.annotations.SerializedName;

public class Category implements Parcelable {

    @SerializedName("_id")
    private String id;
    @SerializedName("updated_at")
    private String updatedAt;
    @SerializedName("slug")
    private String slug;
    @SerializedName("custom_module_eid")
    private String customModuleEid;
    @SerializedName("eid")
    private String eid;
    @SerializedName("title")
    private String title;
    @SerializedName("description")
    private String description;
    @SerializedName("__v")
    private Integer v;
    @SerializedName("_active")
    private Boolean active;
    @SerializedName("created_at")
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


    protected Category(Parcel in) {
        id = in.readString();
        updatedAt = in.readString();
        slug = in.readString();
        customModuleEid = in.readString();
        eid = in.readString();
        title = in.readString();
        description = in.readString();
        v = in.readByte() == 0x00 ? null : in.readInt();
        byte activeVal = in.readByte();
        active = activeVal == 0x02 ? null : activeVal != 0x00;
        createdAt = in.readString();
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(id);
        dest.writeString(updatedAt);
        dest.writeString(slug);
        dest.writeString(customModuleEid);
        dest.writeString(eid);
        dest.writeString(title);
        dest.writeString(description);
        if (v == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeInt(v);
        }
        if (active == null) {
            dest.writeByte((byte) (0x02));
        } else {
            dest.writeByte((byte) (active ? 0x01 : 0x00));
        }
        dest.writeString(createdAt);
    }

    @SuppressWarnings("unused")
    public static final Parcelable.Creator<Category> CREATOR = new Parcelable.Creator<Category>() {
        @Override
        public Category createFromParcel(Parcel in) {
            return new Category(in);
        }

        @Override
        public Category[] newArray(int size) {
            return new Category[size];
        }
    };
}

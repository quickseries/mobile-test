package com.test.quickseries.base.model;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.List;

public class Resource implements Parcelable {

    @SerializedName("_id")
    private String id;
    @SerializedName("slug")
    private String slug;
    @SerializedName("eid")
    private String eid;
    @SerializedName("title")
    private String title;
    @SerializedName("description")
    private String description;
    @SerializedName("category_eid")
    private String categoryEid;
    @SerializedName("__v")
    private Integer v;
    @SerializedName("photo")
    private String photo;
    @SerializedName("_active")
    private Boolean active;
    @SerializedName("updated_at")
    private String updatedAt;
    @SerializedName("created_at")
    private String createdAt;
    @SerializedName("addresses")
    private List<Address> addresses = null;
    @SerializedName("contactInfo")
    private ContactInfo contactInfo;
    @SerializedName("socialMedia")
    private SocialMedia socialMedia;
    @SerializedName("freeText")
    private List<FreeText> freeText = null;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getCategoryEid() {
        return categoryEid;
    }

    public void setCategoryEid(String categoryEid) {
        this.categoryEid = categoryEid;
    }

    public Integer getV() {
        return v;
    }

    public void setV(Integer v) {
        this.v = v;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public String getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(String updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    public ContactInfo getContactInfo() {
        return contactInfo;
    }

    public void setContactInfo(ContactInfo contactInfo) {
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

    protected Resource(Parcel in) {
        id = in.readString();
        slug = in.readString();
        eid = in.readString();
        title = in.readString();
        description = in.readString();
        categoryEid = in.readString();
        v = in.readByte() == 0x00 ? null : in.readInt();
        photo = in.readString();
        byte activeVal = in.readByte();
        active = activeVal == 0x02 ? null : activeVal != 0x00;
        updatedAt = in.readString();
        createdAt = in.readString();
        if (in.readByte() == 0x01) {
            addresses = new ArrayList<Address>();
            in.readList(addresses, Address.class.getClassLoader());
        } else {
            addresses = null;
        }
        contactInfo = (ContactInfo) in.readValue(ContactInfo.class.getClassLoader());
        socialMedia = (SocialMedia) in.readValue(SocialMedia.class.getClassLoader());
        if (in.readByte() == 0x01) {
            freeText = new ArrayList<FreeText>();
            in.readList(freeText, FreeText.class.getClassLoader());
        } else {
            freeText = null;
        }
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(id);
        dest.writeString(slug);
        dest.writeString(eid);
        dest.writeString(title);
        dest.writeString(description);
        dest.writeString(categoryEid);
        if (v == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeInt(v);
        }
        dest.writeString(photo);
        if (active == null) {
            dest.writeByte((byte) (0x02));
        } else {
            dest.writeByte((byte) (active ? 0x01 : 0x00));
        }
        dest.writeString(updatedAt);
        dest.writeString(createdAt);
        if (addresses == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeList(addresses);
        }
        dest.writeValue(contactInfo);
        dest.writeValue(socialMedia);
        if (freeText == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeList(freeText);
        }
    }

    @SuppressWarnings("unused")
    public static final Parcelable.Creator<Resource> CREATOR = new Parcelable.Creator<Resource>() {
        @Override
        public Resource createFromParcel(Parcel in) {
            return new Resource(in);
        }

        @Override
        public Resource[] newArray(int size) {
            return new Resource[size];
        }
    };

}

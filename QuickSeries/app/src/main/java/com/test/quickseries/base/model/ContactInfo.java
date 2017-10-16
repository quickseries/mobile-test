package com.test.quickseries.base.model;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by elton on 2017-10-14.
 */

public class ContactInfo implements Parcelable {

    @SerializedName("website")
    private List<String> website = null;
    @SerializedName("email")
    private List<String> email = null;
    @SerializedName("phoneNumber")
    private List<String> phoneNumber = null;
    @SerializedName("faxNumber")
    private List<String> faxNumber = null;
    @SerializedName("tollFree")
    private List<String> tollFree = null;

    public List<String> getWebsite() {
        return website;
    }

    public void setWebsite(List<String> website) {
        this.website = website;
    }

    public List<String> getEmail() {
        return email;
    }

    public void setEmail(List<String> email) {
        this.email = email;
    }

    public List<String> getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(List<String> phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public List<String> getFaxNumber() {
        return faxNumber;
    }

    public void setFaxNumber(List<String> faxNumber) {
        this.faxNumber = faxNumber;
    }

    public List<String> getTollFree() {
        return tollFree;
    }

    public void setTollFree(List<String> tollFree) {
        this.tollFree = tollFree;
    }


    protected ContactInfo(Parcel in) {
        if (in.readByte() == 0x01) {
            website = new ArrayList<String>();
            in.readList(website, String.class.getClassLoader());
        } else {
            website = null;
        }
        if (in.readByte() == 0x01) {
            email = new ArrayList<String>();
            in.readList(email, String.class.getClassLoader());
        } else {
            email = null;
        }
        if (in.readByte() == 0x01) {
            phoneNumber = new ArrayList<String>();
            in.readList(phoneNumber, String.class.getClassLoader());
        } else {
            phoneNumber = null;
        }
        if (in.readByte() == 0x01) {
            faxNumber = new ArrayList<String>();
            in.readList(faxNumber, String.class.getClassLoader());
        } else {
            faxNumber = null;
        }
        if (in.readByte() == 0x01) {
            tollFree = new ArrayList<String>();
            in.readList(tollFree, String.class.getClassLoader());
        } else {
            tollFree = null;
        }
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        if (website == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeList(website);
        }
        if (email == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeList(email);
        }
        if (phoneNumber == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeList(phoneNumber);
        }
        if (faxNumber == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeList(faxNumber);
        }
        if (tollFree == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeList(tollFree);
        }
    }

    @SuppressWarnings("unused")
    public static final Parcelable.Creator<ContactInfo> CREATOR = new Parcelable.Creator<ContactInfo>() {
        @Override
        public ContactInfo createFromParcel(Parcel in) {
            return new ContactInfo(in);
        }

        @Override
        public ContactInfo[] newArray(int size) {
            return new ContactInfo[size];
        }
    };

}

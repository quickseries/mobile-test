package com.test.quickseries.base.model;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.gson.annotations.SerializedName;

/**
 * Created by elton on 2017-10-14.
 */

public class Gps implements Parcelable {

    @SerializedName("latitude")
    private String latitude;
    @SerializedName("longitude")
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

    protected Gps(Parcel in) {
        latitude = in.readString();
        longitude = in.readString();
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(latitude);
        dest.writeString(longitude);
    }

    @SuppressWarnings("unused")
    public static final Parcelable.Creator<Gps> CREATOR = new Parcelable.Creator<Gps>() {
        @Override
        public Gps createFromParcel(Parcel in) {
            return new Gps(in);
        }

        @Override
        public Gps[] newArray(int size) {
            return new Gps[size];
        }
    };
}

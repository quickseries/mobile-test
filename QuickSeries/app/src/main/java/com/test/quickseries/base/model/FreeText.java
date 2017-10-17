package com.test.quickseries.base.model;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.gson.annotations.SerializedName;

/**
 * Created by elton on 2017-10-15.
 */

class FreeText implements Parcelable {

    @SerializedName("text")
    private String text;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    protected FreeText(Parcel in) {
        text = in.readString();
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(text);
    }

    @SuppressWarnings("unused")
    public static final Parcelable.Creator<FreeText> CREATOR = new Parcelable.Creator<FreeText>() {
        @Override
        public FreeText createFromParcel(Parcel in) {
            return new FreeText(in);
        }

        @Override
        public FreeText[] newArray(int size) {
            return new FreeText[size];
        }
    };

}

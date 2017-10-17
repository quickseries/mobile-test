package com.test.quickseries.base.model;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.gson.annotations.SerializedName;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by elton on 2017-10-15.
 */

public class SocialMedia implements Parcelable {

    @SerializedName("youtubeChannel")
    private List<String> youtubeChannel = null;
    @SerializedName("twitter")
    private List<String> twitter = null;
    @SerializedName("facebook")
    private List<String> facebook = null;

    public List<String> getYoutubeChannel() {
        return youtubeChannel;
    }

    public void setYoutubeChannel(List<String> youtubeChannel) {
        this.youtubeChannel = youtubeChannel;
    }

    public List<String> getTwitter() {
        return twitter;
    }

    public void setTwitter(List<String> twitter) {
        this.twitter = twitter;
    }

    public List<String> getFacebook() {
        return facebook;
    }

    public void setFacebook(List<String> facebook) {
        this.facebook = facebook;
    }

    protected SocialMedia(Parcel in) {
        if (in.readByte() == 0x01) {
            youtubeChannel = new ArrayList<String>();
            in.readList(youtubeChannel, String.class.getClassLoader());
        } else {
            youtubeChannel = null;
        }
        if (in.readByte() == 0x01) {
            twitter = new ArrayList<String>();
            in.readList(twitter, String.class.getClassLoader());
        } else {
            twitter = null;
        }
        if (in.readByte() == 0x01) {
            facebook = new ArrayList<String>();
            in.readList(facebook, String.class.getClassLoader());
        } else {
            facebook = null;
        }
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        if (youtubeChannel == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeList(youtubeChannel);
        }
        if (twitter == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeList(twitter);
        }
        if (facebook == null) {
            dest.writeByte((byte) (0x00));
        } else {
            dest.writeByte((byte) (0x01));
            dest.writeList(facebook);
        }
    }

    @SuppressWarnings("unused")
    public static final Parcelable.Creator<SocialMedia> CREATOR = new Parcelable.Creator<SocialMedia>() {
        @Override
        public SocialMedia createFromParcel(Parcel in) {
            return new SocialMedia(in);
        }

        @Override
        public SocialMedia[] newArray(int size) {
            return new SocialMedia[size];
        }
    };

}

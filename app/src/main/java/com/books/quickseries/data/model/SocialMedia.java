package com.books.quickseries.data.model;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by zakir on 06/09/2018.
 */

public class SocialMedia {

    @SerializedName("youtubeChannel")
    @Expose
    private List<String> youtubeChannel = null;
    @SerializedName("twitter")
    @Expose
    private List<String> twitter = null;
    @SerializedName("facebook")
    @Expose
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
}

package com.quickseriestest.models;

import java.util.List;

/**
 * Created by Vijen on 2018-08-16.
 */

public class SocialMedia {

    private List<String> youtubeChannel;
    private List<String> twitter;
    private List<String> facebook;

    public SocialMedia() {
    }

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

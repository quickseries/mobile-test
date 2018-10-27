package ca.ivasenko.mobiletest.resources.model;

import java.util.List;

public class SocialMedia
{
    private List<String> youtubeChannel = null;
    private List<String> twitter = null;
    private List<String> facebook = null;

    public SocialMedia()
    {
    }

    public List<String> getYoutubeChannel()
    {
        return youtubeChannel;
    }

    public void setYoutubeChannel(List<String> youtubeChannel)
    {
        this.youtubeChannel = youtubeChannel;
    }

    public List<String> getTwitter()
    {
        return twitter;
    }

    public void setTwitter(List<String> twitter)
    {
        this.twitter = twitter;
    }

    public List<String> getFacebook()
    {
        return facebook;
    }

    public void setFacebook(List<String> facebook)
    {
        this.facebook = facebook;
    }
}

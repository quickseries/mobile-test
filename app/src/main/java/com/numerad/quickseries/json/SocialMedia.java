package com.numerad.quickseries.json;

import com.google.gson.annotations.SerializedName;

import java.util.List;

import javax.annotation.Generated;

@Generated("com.robohorse.robopojogenerator")
public class SocialMedia{

	@SerializedName("twitter")
	private List<String> twitter;

	@SerializedName("youtubeChannel")
	private List<String> youtubeChannel;

	@SerializedName("facebook")
	private List<String> facebook;

	public void setTwitter(List<String> twitter){
		this.twitter = twitter;
	}

	public List<String> getTwitter(){
		return twitter;
	}

	public void setYoutubeChannel(List<String> youtubeChannel){
		this.youtubeChannel = youtubeChannel;
	}

	public List<String> getYoutubeChannel(){
		return youtubeChannel;
	}

	public void setFacebook(List<String> facebook){
		this.facebook = facebook;
	}

	public List<String> getFacebook(){
		return facebook;
	}

	@Override
 	public String toString(){
		return 
			"SocialMedia{" + 
			"twitter = '" + twitter + '\'' + 
			",youtubeChannel = '" + youtubeChannel + '\'' + 
			",facebook = '" + facebook + '\'' + 
			"}";
		}
}
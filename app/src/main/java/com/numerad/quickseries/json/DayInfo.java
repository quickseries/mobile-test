package com.numerad.quickseries.json;

import com.google.gson.annotations.SerializedName;

import javax.annotation.Generated;

@Generated("com.robohorse.robopojogenerator")
public class DayInfo {

	@SerializedName("from")
	private String from;

	@SerializedName("to")
	private String to;

	public void setFrom(String from){
		this.from = from;
	}

	public String getFrom(){
		return from;
	}

	public void setTo(String to){
		this.to = to;
	}

	public String getTo(){
		return to;
	}

	@Override
 	public String toString(){
		return 
			"DayInfo{" +
			"from = '" + from + '\'' + 
			",to = '" + to + '\'' + 
			"}";
		}
}
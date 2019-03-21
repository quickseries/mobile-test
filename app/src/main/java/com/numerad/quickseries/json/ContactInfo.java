package com.numerad.quickseries.json;

import com.google.gson.annotations.SerializedName;

import java.util.List;

import javax.annotation.Generated;

@Generated("com.robohorse.robopojogenerator")
public class ContactInfo{

	@SerializedName("website")
	private List<String> website;

	@SerializedName("phoneNumber")
	private List<String> phoneNumber;

	@SerializedName("faxNumber")
	private List<String> faxNumber;

	@SerializedName("tollFree")
	private List<String> tollFree;

	@SerializedName("email")
	private List<String> email;

	public void setWebsite(List<String> website){
		this.website = website;
	}

	public List<String> getWebsite(){
		return website;
	}

	public void setPhoneNumber(List<String> phoneNumber){
		this.phoneNumber = phoneNumber;
	}

	public List<String> getPhoneNumber(){
		return phoneNumber;
	}

	public void setFaxNumber(List<String> faxNumber){
		this.faxNumber = faxNumber;
	}

	public List<String> getFaxNumber(){
		return faxNumber;
	}

	public void setTollFree(List<String> tollFree){
		this.tollFree = tollFree;
	}

	public List<String> getTollFree(){
		return tollFree;
	}

	public void setEmail(List<String> email){
		this.email = email;
	}

	public List<String> getEmail(){
		return email;
	}

	@Override
 	public String toString(){
		return 
			"ContactInfo{" + 
			"website = '" + website + '\'' + 
			",phoneNumber = '" + phoneNumber + '\'' + 
			",faxNumber = '" + faxNumber + '\'' + 
			",tollFree = '" + tollFree + '\'' + 
			",email = '" + email + '\'' + 
			"}";
		}
}
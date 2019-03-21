package com.numerad.quickseries.json;

import com.google.gson.annotations.SerializedName;

import javax.annotation.Generated;

@Generated("com.robohorse.robopojogenerator")
public class Address{

	@SerializedName("zipCode")
	private String zipCode;

	@SerializedName("country")
	private String country;

	@SerializedName("city")
	private String city;

	@SerializedName("address1")
	private String address1;

	@SerializedName("label")
	private String label;

	@SerializedName("state")
	private String state;

	@SerializedName("gps")
	private Gps gps;

	public void setZipCode(String zipCode){
		this.zipCode = zipCode;
	}

	public String getZipCode(){
		return zipCode;
	}

	public void setCountry(String country){
		this.country = country;
	}

	public String getCountry(){
		return country;
	}

	public void setCity(String city){
		this.city = city;
	}

	public String getCity(){
		return city;
	}

	public void setAddress1(String address1){
		this.address1 = address1;
	}

	public String getAddress1(){
		return address1;
	}

	public void setLabel(String label){
		this.label = label;
	}

	public String getLabel(){
		return label;
	}

	public void setState(String state){
		this.state = state;
	}

	public String getState(){
		return state;
	}

	public void setGps(Gps gps){
		this.gps = gps;
	}

	public Gps getGps(){
		return gps;
	}

	@Override
 	public String toString(){
		return 
			"Address{" + 
			"zipCode = '" + zipCode + '\'' + 
			",country = '" + country + '\'' + 
			",city = '" + city + '\'' + 
			",address1 = '" + address1 + '\'' + 
			",label = '" + label + '\'' + 
			",state = '" + state + '\'' + 
			",gps = '" + gps + '\'' + 
			"}";
		}
}
package com.numerad.quickseries.json;

import com.google.gson.annotations.SerializedName;

import javax.annotation.Generated;

@Generated("com.robohorse.robopojogenerator")
public class Hours {

	@SerializedName("sunday")
	private DayInfo sunday;

	@SerializedName("monday")
	private DayInfo monday;

	@SerializedName("tuesday")
	private DayInfo tuesday;

	@SerializedName("wednesday")
	private DayInfo wednesday;

	@SerializedName("thursday")
	private DayInfo thursday;

	@SerializedName("friday")
	private DayInfo friday;

	@SerializedName("saturday")
	private DayInfo saturday;

	public DayInfo getTuesday() {
		return tuesday;
	}

	public void setTuesday(DayInfo tuesday) {
		this.tuesday = tuesday;
	}

	public DayInfo getWednesday() {
		return wednesday;
	}

	public void setWednesday(DayInfo wednesday) {
		this.wednesday = wednesday;
	}

	public DayInfo getThursday() {
		return thursday;
	}

	public void setThursday(DayInfo thursday) {
		this.thursday = thursday;
	}

	public DayInfo getFriday() {
		return friday;
	}

	public void setFriday(DayInfo friday) {
		this.friday = friday;
	}

	public DayInfo getSaturday() {
		return saturday;
	}

	public void setSaturday(DayInfo saturday) {
		this.saturday = saturday;
	}

	public void setSunday(DayInfo sunday){
		this.sunday = sunday;
	}

	public DayInfo getSunday(){
		return sunday;
	}

	public void setMonday(DayInfo monday){
		this.monday = monday;
	}

	public DayInfo getMonday(){
		return monday;
	}

	@Override
 	public String toString(){
		return 
			"Hours{" +
			",sunday = '" + sunday + '\'' +
			",monday = '" + monday + '\'' + 
			",tueday = '" + tuesday + '\'' +
			",wednesday = '" + wednesday + '\'' +
			",thursday = '" + thursday + '\'' +
			",friday = '" + friday + '\'' +
			",saturday = '" + saturday + '\'' +
			"}";
		}
}